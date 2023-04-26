#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
CEKEXPIRED () {
    today=$(date -d +1day +%Y-%m-%d)
    Exp1=$(curl -sS https://raw.githubusercontent.com/sreyaeve/IP-Register/main/ip | grep $MYIP | awk '{print $3}')
    if [[ $today < $Exp1 ]]; then
    echo -e "\e[32mSTATUS SCRIPT AKTIF...\e[0m"
    else
    echo -e "\e[31mSCRIPT ANDA EXPIRED!\e[0m";
    exit 0
fi
}
IZIN=$(curl -sS https://raw.githubusercontent.com/sreyaeve/IP-Register/main/ip | awk '{print $4}' | grep $MYIP)
if [ $MYIP = $IZIN ]; then
echo -e "\e[32mPermission Accepted...\e[0m"
CEKEXPIRED
else
echo -e "\e[31mPermission Denied!\e[0m";
exit 0
fi
clear 
echo -e "\e[32m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "        • Backup & Restore •         "
echo -e "\e[32m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "" 
echo -e " [\e[36m•1\e[0m] Backup VPS Data"
echo -e " [\e[36m•2\e[0m] Restore VPS Data"
echo -e "" 
echo -e " [\e[31m•0\e[0m] \e[31mBack To Menu\033[0m"
echo -e "" 
echo -e "\e[32m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p " Select menu :  "  opt
echo -e   ""
case $opt in
01 | 1) clear ; backup ;;
02 | 2) clear ; restore ;;
00 | 0) clear ; menu ;;
*) clear ; menu-backup ;;
esac
