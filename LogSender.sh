#Author: Goktug Cetin
#ShellScript (bash)
#!/bin/bash

echo -e " Address for send logs to"
read address
echo -e " Port of Log listener"
read port
echo -e "Log file or full directory"
read logfile

echo -e "Log Sending process has started" 

nc -w 5 $address $port < $logfile

cat $logfile >> ./sended"$logfile"

echo " " > $logfile

sleep 5

if grep -Fxq "GET" $logfile
then
	echo "New requests are handling now,they will be sending soon."
else
	echo " No Request Yet" 
	sleep 5
fi



