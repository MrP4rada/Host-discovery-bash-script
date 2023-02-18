#!/bin/bash

function Ctrl-c(){
echo -e "\n\n[+] Exiting...\n"
exit 1
}
#Ctrl-c

trap Ctrl-c INT

thirdip=$(ip addr | grep wlp2s0 | tail -n 1 | awk '{print$2}' | tr "/" " " | awk '{print$1}'| tr "." " "| awk '{print$3}')

for i in $(seq 1 255);do

echo -e "\n[+]This host is active -> $( fping -t10 192.168.$thirdip.$i | grep alive | awk '{print$1}' )" | grep "192" 

done
