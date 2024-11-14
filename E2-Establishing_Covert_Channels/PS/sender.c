#include <pthread.h>
#include <sched.h>
#include <signal.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <sys/time.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <time.h>
#include <string.h>

#define DATA_OFFSET 0x00

#define virus_ADDR 0x80004000

typedef uint32_t u32;

#define Xil_Out32(Addr, Value) (*(volatile u32 *)((Addr)) = (Value))
#define WriteReg(addr, offset, data) Xil_Out32((addr) + (offset), (data))

int main(int argc, char *argv[])
{
    // argv[1] send bits
    // argv[2] send_time/bit    (us)
    if (argc < 2)
    {
        return 1;
    }
    int hw;
    int send_bits = atol(argv[1]);
    int send_time = atol(argv[2]); // us
    int cycles = send_bits;
    if ((hw = open("/dev/mem", O_RDWR)) < 0)
    {
        perror("open failed\n");
        return 1;
    }

    long virus = (long)mmap(NULL, 16 * sysconf(_SC_PAGESIZE), PROT_READ | PROT_WRITE, MAP_SHARED, hw, virus_ADDR);

    int str[send_bits + 1];
    memset(str, 0, cycles);

    int i;

    for (i = 0; i < cycles; i++)
    {
        str[i] = rand() % 2;
    }

    unsigned int virus_value = 0;
    struct timespec start, end;
    system("pkill -15 reciver");
    clock_gettime(CLOCK_MONOTONIC, &start);
    for (i = 0; i < cycles; i++)
    {
        clock_gettime(CLOCK_MONOTONIC, &end);
        if (str[i] == 1)
        {
            virus_value = 0x00;
            WriteReg(virus, DATA_OFFSET, virus_value);
            printf("i=%d,send 1! \n", i);
            while ((end.tv_sec - start.tv_sec) * 1000000 + (end.tv_nsec - start.tv_nsec) / 1000 < send_time)
            {
                clock_gettime(CLOCK_MONOTONIC, &end);
            }
        }
        else if (str[i] == 0)
        {
            virus_value = 0xFF;
            WriteReg(virus, DATA_OFFSET, virus_value);
            printf("i=%d,send 0! \n", i);
            while ((end.tv_sec - start.tv_sec) * 1000000 + (end.tv_nsec - start.tv_nsec) / 1000 < send_time)
            {
                clock_gettime(CLOCK_MONOTONIC, &end);
            }
        }
        start.tv_nsec += (send_time * 1000);
        if (start.tv_nsec >= 1000000000)
        {
            start.tv_sec += 1;
            start.tv_nsec -= 1000000000;
        }
    }
    virus_value = 0x00;
    WriteReg(virus, DATA_OFFSET, virus_value);
    FILE *fp_write = fopen("./send_signal", "w");
    for (i = 0; i < cycles; i++)
    {
        fprintf(fp_write, "%d", str[i]);
    }
    fclose(fp_write);

    return 0;
}
