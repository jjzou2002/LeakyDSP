#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>

#define DATA_OFFSET 0x00

#define Xil_In32(Addr)  (*(volatile u32 *)(Addr))

#define Xil_Out32(Addr, Value)  (*(volatile u32 *)((Addr)) = (Value))

#define ReadReg(addr, offset)  Xil_In32((addr) + (offset))

#define WriteReg(addr, offset, data) Xil_Out32((addr) + (offset), (data))

typedef uint32_t u32;

int count_one(u32 value){
    int count = 0;
    while(value){
	count += value&1;
	value >>= 1;
    }
    return count;
}

int main(){
	int HW;
    if ((HW = open("/dev/mem", O_RDWR)) < 0) 
    {
        perror("open");
        return EXIT_FAILURE;
    }   

    long rstAddr    = (long)mmap(NULL, 16 * sysconf(_SC_PAGESIZE), PROT_READ | PROT_WRITE, MAP_SHARED, HW, 0x80000000);
    long tapsClkAddr = (long)mmap(NULL, 16 * sysconf(_SC_PAGESIZE), PROT_READ | PROT_WRITE, MAP_SHARED, HW, 0x80001000);    
    long tapsAAddr   = (long)mmap(NULL, 16 * sysconf(_SC_PAGESIZE), PROT_READ | PROT_WRITE, MAP_SHARED, HW, 0x80002000);   
    long prePAddr    = (long)mmap(NULL, 16 * sysconf(_SC_PAGESIZE), PROT_READ | PROT_WRITE, MAP_SHARED, HW, 0x80003000);   
    long virusAddr    = (long)mmap(NULL, 16 * sysconf(_SC_PAGESIZE), PROT_READ | PROT_WRITE, MAP_SHARED, HW, 0x80004000);
    // cancel reset
    WriteReg(rstAddr, DATA_OFFSET, 0);
    // write taps_clk
    WriteReg(tapsClkAddr, DATA_OFFSET, 0);
    // write taps_A
    WriteReg(tapsAAddr, DATA_OFFSET, 0);     

    printf("start calibration \n");

    int phase_zero = 0;
    int phase_FF = 0;

    for (int idf = 0; idf < 1024; idf++) {
        int idf_clk, idf_A;
        if (idf < 512) {
            idf_clk = idf;
            idf_A = 0;
        } else {
            idf_clk = 0;
            idf_A = 1023 - idf;
        }

        WriteReg(tapsClkAddr, DATA_OFFSET, idf_clk);
        WriteReg(tapsAAddr, DATA_OFFSET, idf_A);        

        printf("idf_clk,idf_A: %d,%d\n", idf_clk, idf_A);
        u32 preP = ReadReg(prePAddr, DATA_OFFSET);

        printf("preP: 0x%08X, hammingP: %u\n", preP, count_one(preP));

        int current = count_one((preP >> 8) & 0xFFFFFF); 

        if (!phase_zero && current < 4) {
            phase_zero = 1;
            continue;
        }

        if (phase_zero && !phase_FF && current > 16) {
            phase_FF = 1;
            printf("best idf found idf_clk:%d idf_A:%d\n", idf_clk, idf_A);
            break;
        }
    }
	
    // Cleanup
    munmap((void *)rstAddr, 16 * sysconf(_SC_PAGESIZE));
    munmap((void *)tapsClkAddr, 16 * sysconf(_SC_PAGESIZE));
    munmap((void *)tapsAAddr, 16 * sysconf(_SC_PAGESIZE));
    munmap((void *)prePAddr, 16 * sysconf(_SC_PAGESIZE));
    munmap((void *)virusAddr, 16 * sysconf(_SC_PAGESIZE));
    close(HW);
    return 0;
}
