#!/bin/bash

asfver=$(curl https://github.com/JustArchiNET/ArchiSteamFarm/releases/latest | awk -F "tag/" '{print $2}' | awk -F "\"" '{print $1}')
asfpath=/root/asf
asfrun=/root/asf/ArchiSteamFarm
asfconf=/root/asf/config/$bot.json

yum -y install icu unzip screen

wget https://github.com/JustArchiNET/ArchiSteamFarm/releases/download/$asfver/ASF-linux-x64.zip
unzip -d $asfpath ASF-linux-x64.zip

clear 
read -p "Please name your bot: " bot
read -p "Please input your steam account: " account
read -p "Please input your password: " passwd
echo -e "{" > $asfconf
echo -e "\t\"SteamLogin\": \"$account\"," >> $asfconf
echo -e "\t\"SteamPassword\": \"$passwd\"," >> $asfconf
echo -e "\t\"Enabled\": true," >> $asfconf
echo -e "}" >> $asfconf

chmod +x $asfrun
screen -dmS asf
screen -x -S asf -p 0 -X stuff "$asfrun\n"
screen -r asf
