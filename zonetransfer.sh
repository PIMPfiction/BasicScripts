#!/bin/bash

path=$(pwd)
echo -e "Domain for zone transfer"
read domain


dig NS $domain | grep $domain. | awk -F" " '{ print $5 }' >> firstdomains

#part2

cat $pwd/firstdomains | while read output 

do dig @"$output" $domain axfr>> zoneoutput
done

#part3
onlydomain=$(echo $domain | awk -F"." {'print $1 '})


cat zoneoutput | grep ".$domain" | awk -F" " '{print $1}' | grep $onlydomain | sort -u | uniq | grep -v "_" >> allsubs.txt

#part4

cat allsubs.txt | while read subdom

do ping -c 1 "$subdom" | awk  '/PING/{print $3 }' >> IPlist

done

#part5


cut -f 2 -d "(" IPlist | cut -f 1 -d ")" | sort -u | uniq >> NmapScan

echo "You need to be Root for UDP scan " 


cat NmapScan| while read nmapscan

do sudo nmap -sT "$nmapscan" >> NmapReport | sudo nmap -sU "$nmapscan" >> NmapReport 

done


