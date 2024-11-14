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

#define Xil_In32(Addr)  (*(volatile u32 *)(Addr))

#define Xil_Out32(Addr, Value)  (*(volatile u32 *)((Addr)) = (Value))

#define ReadReg(addr, offset)  Xil_In32((addr) + (offset))

#define WriteReg(addr, offset, data) Xil_Out32((addr) + (offset), (data))

typedef uint32_t u32;

int trace[10000000];

volatile int end = 1;

#define CORE_ATTACKER 1

u32 count_one(u32 x) {
    x = (x & (0x55555555)) + ((x >> 1) & (0x55555555));
    x = (x & (0x33333333)) + ((x >> 2) & (0x33333333));
    x = (x & (0x0f0f0f0f)) + ((x >> 4) & (0x0f0f0f0f));
    x = (x & (0x00ff00ff)) + ((x >> 8) & (0x00ff00ff));
    x = (x & (0x0000ffff)) + ((x >> 16) & (0x0000ffff));
    return x;
}


void pin_to_core(int core)
{
    cpu_set_t cpuset;
    pthread_t thread;

    thread = pthread_self();

    CPU_ZERO(&cpuset);
    CPU_SET(core, &cpuset);

    pthread_setaffinity_np(thread, sizeof(cpu_set_t), &cpuset);
}

int lock = 1;
void sigterm(int sig, siginfo_t *siginfo_t, void *context)
{
    lock = 0;
    return;
}

int set_signal(void)
{
    struct sigaction act;
    act.sa_sigaction = sigterm;
    act.sa_flags = SA_SIGINFO;
    return sigaction(SIGTERM, &act, NULL);
}

int main(int argc, char *argv[])
{
   if (argc < 4)
   {
      fprintf(stderr, "Usage: %s <send bits> <send time> <sampling interval us>\n", argv[0]);
      return 1;
   }
   
   int cycles = atol(argv[1]);
   int send_time = atol(argv[2]);  // us
   int sampling_interval_us = atol(argv[3]);

   pin_to_core(CORE_ATTACKER);

   int HW;
   if ((HW = open("/dev/mem", O_RDWR)) < 0) 
   {
      perror("open");
      return EXIT_FAILURE;
   }   
   long prePAddr  = (long)mmap(NULL, 16 * sysconf(_SC_PAGESIZE), PROT_READ | PROT_WRITE, MAP_SHARED, HW, 0x80003000);  

   set_signal();
   FILE *fp; 
   fp = fopen("trace.txt", "w");
   if (fp == NULL)                  
   {
      perror("File open failed!\n");
   }
   struct timespec starttime, endtime;
   while (lock)
   {
   };
   clock_gettime(CLOCK_MONOTONIC, &starttime);
   int samples_per_bit = send_time/sampling_interval_us;
   for (long i = 0; i < cycles * samples_per_bit; i++)
    {
        u32 preP = ReadReg(prePAddr, DATA_OFFSET);
        trace[i] = count_one(preP);
        clock_gettime(CLOCK_MONOTONIC, &endtime);
        while ((endtime.tv_sec - starttime.tv_sec) * 1000000L + (endtime.tv_nsec - starttime.tv_nsec) / 1000 < sampling_interval_us)
        {
            clock_gettime(CLOCK_MONOTONIC, &endtime);
        }
        starttime.tv_nsec += sampling_interval_us * 1000;
        if (starttime.tv_nsec >= 1000000000)
        {
            starttime.tv_sec += 1;
            starttime.tv_nsec -= 1000000000;
        }
    }
   int total = cycles * samples_per_bit;
   for(int num = 0;num<total;num++){
       fprintf(fp,"%d\n", trace[num]);
   }
   FILE *fp1; 
   fp1 = fopen("receive_signal", "w"); 
   double decode[cycles+1];
   double sum = 0;
   double thresh = 0;
   int index = 0;
   for(int i=0;i<total;i++){
      sum+=trace[i];
      if((i+1)%samples_per_bit==0){
         decode[index] = sum/samples_per_bit;
         thresh += decode[index];
         sum = 0;
         index++;
      }
   }
   thresh /= cycles;
   printf("thresh is %lf",thresh);
   FILE *fp2;
   fp2 = fopen("decode_raw", "w");
   for(int num = 0;num<cycles;num++){
      fprintf(fp1,"%d", decode[num]>thresh?0:1);
      fprintf(fp2,"%lf\n",decode[num]);
   }

   munmap((void *)prePAddr, 16 * sysconf(_SC_PAGESIZE));
   close(HW);
   fclose(fp);
   fclose(fp1);
   fclose(fp2);
   return 0;
}
