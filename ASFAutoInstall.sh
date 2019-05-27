#!/bin/bash

asfpath=/root/asf

yum -y install icu unzip

wget https://github.com/JustArchiNET/ArchiSteamFarm/releases/download/4.0.1.9/ASF-linux-x64.zip
unzip -d $asfpath ASF-linux-x64.zip

clear
read -p "Please input your steam account: " account
read -p "Please input your password: " passwd
echo -e "{" > $asfpath/config/$account.json
echo -e "\t\"SteamLogin\": \"$account\"," >> $asfpath/config/$account.json
echo -e "\t\"SteamPassword\": \"$passwd\"," >> $asfpath/config/$account.json
echo -e "\t\"Enabled\": true," >> $asfpath/config/$account.json
echo -e "}" >> $asfpath/config/$account.json

chmod +x $asfpath/ArchiSteamFarm
$asfpath/ArchiSteamFarm
