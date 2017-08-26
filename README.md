# SimpleScripts


Just simple scripts for your simple works, automated commands and outputting.You can inspect scripts for learning basic bash scripting.


1.   Wifi.sh
	
Automated commands for getting information about multiple wireless AP's.Result will
include broadcast channel,encryption type of security password, ssid, bssid  of multiple  wireless AP's in your local area.It 
will be searching until ctrl+c. After ctrl+c that means wireless broadcast searching will stop and it will give you an output on
both terminal and in file.
	
2.   Zonetransfer.sh

Automated commands for makig zone transfer on target domain,you can easily get all 
subdomains of your target.After getting all subdomains via dns zone transfer it will make
nmap Tcp and Udp scan.This script requires sudo to run.You can inspect the code and may
learn how to zone transfer from used commands.

	
3. LogSender.sh
	
Automated linux commands for sending server logs to Log Management programs, some of LogManagement programs handling sended logs 
automatically like ELK stack, some of them need to be configured for listening tcp/udp ports(splunk).This script sends log file
then copies it to another file,checks log file for new logs while sending current logs.LogManagement app ip and destination port
will take value from user,if you want to automate this log sending script via watch command in linux you should give values to 
arguments in script.
