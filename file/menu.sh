#!/bin/bash
MYIP=$(curl -sS ipv4.icanhazip.com)
echo "Checking VPS"
#########################
IZIN=$(curl -sS https://raw.githubusercontent.com/sreyaeve/IP-Register/main/ip | awk '{print $4}' | grep $MYIP)
if [ $MYIP = $IZIN ]; then
echo -e "\e[32mWelcome To Zen Area\e[0m"
else
echo -e "\e[31mPermission Denied!\e[0m";
exit 0
fi
#EXPIRED
expired=$(curl -sS https://raw.githubusercontent.com/sreyaeve/IP-Register/main/ip | grep $MYIP | awk '{print $3}')
echo $expired > /root/expired.txt
today=$(date -d +1day +%Y-%m-%d)
while read expired
do
	exp=$(echo $expired | curl -sS https://raw.githubusercontent.com/sreyaeve/IP-Register/main/ip | grep $MYIP | awk '{print $3}')
	if [[ $exp < $today ]]; then
		Exp2="\033[1;31mExpired\033[0m"
        else
        Exp2=$(curl -sS https://raw.githubusercontent.com/sreyaeve/IP-Register/main/ip | grep $MYIP | awk '{print $3}')
	fi
done < /root/expired.txt
rm /root/expired.txt
Name=$(curl -sS https://raw.githubusercontent.com/sreyaeve/IP-Register/main/ip | grep $MYIP | awk '{print $2}')
lisensi=$(</dev/urandom tr -dc A-Z0-9 | head -c12)
# Color Validation
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
red='\e[31m'
green='\e[32m'
blue='\e[34m'
PURPLE='\e[35m'
cyan='\e[36m'
Lred='\e[91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'
# VPS Information
#Domain
domain=$(cat /etc/xray/domain)
#Status certificate
modifyTime=$(stat $HOME/.acme.sh/${domain}_ecc/${domain}.key | sed -n '7,6p' | awk '{print $2" "$3" "$4" "$5}')
modifyTime1=$(date +%s -d "${modifyTime}")
currentTime=$(date +%s)
stampDiff=$(expr ${currentTime} - ${modifyTime1})
days=$(expr ${stampDiff} / 86400)
remainingDays=$(expr 90 - ${days})
tlsStatus=${remainingDays}
if [[ ${remainingDays} -le 0 ]]; then
	tlsStatus="expired"
fi
DATE=$(date +'%Y-%m-%d')
datediff() {
    d1=$(date -d "$1" +%s)
    d2=$(date -d "$2" +%s)
    echo -e "$COLOR1 $NC Expiry In   : $(( (d1 - d2) / 86400 )) Days"
}
mai="datediff "$Exp" "$DATE""

today=`date -d "0 days" +"%Y-%m-%d"`

# CERTIFICATE STATUS
d1=$(date -d "$exp" +%s)
d2=$(date -d "$today" +%s)
certificate=$(( (d1 - d2) / 86400 ))
# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"
# Download
vnstat_profile=$(vnstat | sed -n '3p' | awk '{print $1}' | grep -o '[^:]*')
vnstat -i ${vnstat_profile} >/root/t1
bulan=$(date +%b)
today=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $8}')
todayd=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $8}')
today_v=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $9}')
today_rx=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $2}')
today_rxv=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $3}')
today_tx=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $5}')
today_txv=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $6}')
dmon="$(vnstat -m | grep `date +%G-%m` | awk '{print $2" "substr ($3, 1 ,3)}')"
umon="$(vnstat -m | grep `date +%G-%m` | awk '{print $5" "substr ($6, 1 ,3)}')"
tmon="$(vnstat -m | grep `date +%G-%m` | awk '{print $8" "substr ($9, 1 ,3)}')"
# Getting CPU Information
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
cpu_usage+=" %"
ISP=$(cat /usr/local/etc/xray/org)
WKT=$(cat /usr/local/etc/xray/timezone)
DAY=$(date +%A)
DATE=$(date +%m/%d/%Y)
DATE2=$(date -R | cut -d " " -f -5)
IPVPS=$(curl -s ipinfo.io/ip )
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
tram=$( free -m | awk 'NR==2 {print $2}' )
uram=$( free -m | awk 'NR==2 {print $3}' )
fram=$( free -m | awk 'NR==2 {print $4}' )
clear 
echo -e "\e[32m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "               • SERVER INFORMATION •                 "
echo -e "\e[32m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[32m OS            \e[0m:  "`hostnamectl | grep "Operating System" | cut -d ' ' -f5-`
echo -e "\e[32m ISP           \e[0m:  $ISP"	
echo -e "\e[32m IP VPS        \e[0m:  $IPVPS"
echo -e "\e[32m Domain        \e[0m:  $domain"	
echo -e "\e[32m Region        \e[0m:  $WKT"	
echo -e "\e[32m Kernel        \e[0m:  $(uname -r)"
echo -e "\e[32m System Uptime \e[0m:  $uptime"			
echo -e "\e[32m Waktu         \e[0m:  $DATE2"	
echo -e "\e[32m RAM Usage     \e[0m:  $uram MB | $tram MB"	
echo -e "\e[32m CPU Info      \e[0m:  $cpu_usage ($cname Processor @ $freq MHz)"
echo -e "\e[32m Bandwidth     \e[0m:  \e[32m$todayd\e[0m \e[32m$today_v\e[0m (Hari Ini) \e[32m$month\e[0m \e[32m$month_v\e[0m (Bulan Ini)"
echo -e "\e[32m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "                • MENU SSH | XRAY •                 "
echo -e "\e[32m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e   ""
echo -e " [\e[36m 01 \e[0m] Menu SSH Websocket |[\e[36m 08 \e[0m] Clear RAM Cache"
echo -e " [\e[36m 02 \e[0m] Menu XRAY Vmess    |[\e[36m 09 \e[0m] Monitoring System"
echo -e " [\e[36m 03 \e[0m] Menu XRAY Vless    |[\e[36m 10 \e[0m] Info Bandwidth"
echo -e " [\e[36m 04 \e[0m] Menu XRAY Trojan   |[\e[36m 11 \e[0m] Backup dan Restore Data"
echo -e " [\e[36m 05 \e[0m] Menu Shadowsocks   |[\e[36m 12 \e[0m] Change Banner SSH"
echo -e " [\e[36m 06 \e[0m] Menu VPS & System  |[\e[36m 13 \e[0m] Clear Log XRAY"
echo -e " [\e[36m 07 \e[0m] Status Running     |[\e[36m 14 \e[0m] Reboot VPS"

echo -e   ""
echo -e   " Press x or [ Ctrl+C ] • To-Exit-Script"
echo -e   ""
echo -e "\e[32m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "             • INFORMASI CLIENT & AUTHOR •                 "
echo -e "\e[32m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " \e[32mClient Name     \e[0m: $Name"
echo -e " \e[32mExpired         \e[0m: $Exp2 | $certificate Hari"
echo -e " \e[32mLicense Status  \e[0m: [\e[36m $Name \e[0m] Client IP Registered"
echo -e " \e[32mVersion         \e[0m: Last And Finally"
echo -e " \e[32mAuthor          \e[0m: ZenVPN"
echo -e " \e[32mWhatsapp        \e[0m: 081977814343"
echo -e " \e[32mTelegram        \e[0m: t.me/zenvio"
echo -e "\e[32m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e   ""
read -p " Select menu :  "  opt
echo -e   ""
case $opt in
1) clear ; m-sshovpn ;;
2) clear ; m-vmess ;;
3) clear ; m-vless ;;
4) clear ; m-trojan ;;
5) clear ; m-ssws ;;
6) clear ; m-system ;;
7) clear ; running ;;
8) clear ; clearcache ;;
9) clear ; gotop ;;
10) clear ; vnstat ;;
11) clear ; menu-backup ;;
12) clear ; nano /etc/issue.net ;;
13) clear ; cleaner ;;
14) clear ; reboot ;;
x) exit ;;
*) echo "Tekan Yang Bener Dlogok " ; sleep 1 ; menu ;;
esac
