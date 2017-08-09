#!/bin/bash
wifichip=$(sudo airmon-ng | grep -v Driver | awk -F" " {'print $2'})
echo -e "Your avaible wifi card here,select one for start process"
echo -e " $wifichip "
read interface
sudo airmon-ng start $interface
if sudo airmon-ng | grep mon
then
	echo "MONITORING NOW XD"
else	
	echo "Not in monitor mode"
fi
monitor=$(sudo airmon-ng | grep "phy" | awk -F" " {' print $2 '})
echo -e "Specify a output file name(not important, just write something)"
read output
sudo airodump-ng $monitor --write $output
sudo mv $output-01.csv $output.csv
sudo rm -f $output-01*
sudo grep PSK $output.csv | while read line ; do
BSSID=$(echo $line | awk -F"," {' print $1 '})
NAME=$(echo $line | awk -F"," {' print $14 '})
CH=$(echo $line | awk -F"," {' print $4 '})
ENC=$(echo $line | awk -F"," {' print $6 '})
echo " $NAME , $BSSID  , $CH  , $ENC "
done

