rm result.txt
gcc dsp_cali.c -o dsp_cali.out
gcc sender.c -o sender.out 
g++ reciver.c -o reciver -lpthread
gcc error-rate.c -o error-rate.out
./dsp_cali.out

send_bits=10000
sample_rate=100

for i in {7500..2000..-500}; do
    echo send_time/bit: $i us  >> result.txt
    rm receive_signal
    ./sender.out $send_bits $i &  
    (time ./reciver $send_bits $i $sample_rate) 2>> result.txt 
    ./error-rate.out $send_bits >> result.txt  
    sleep 8s
done