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
echo -e "\e[32m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ \033[0m"
echo -e "             • SSH MENU •               "
echo -e "\e[32m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ \033[0m"
echo -e ""
echo -e " [\e[36m•1\e[0m] Buat Akun SSH WS "
echo -e " [\e[36m•2\e[0m] Trial Akun SSH WS "
echo -e " [\e[36m•3\e[0m] Perpanjang Akun SSH "
echo -e " [\e[36m•4\e[0m] Hapus Akun SSH "
echo -e " [\e[36m•5\e[0m] Cek User Login SSH "
echo -e " [\e[36m•6\e[0m] List Member SSH "
echo -e " [\e[36m•7\e[0m] Hapus User SSH Yang Sudah Expired "
echo -e " [\e[36m•8\e[0m] Set Up Autokill SSH "
echo -e " [\e[36m•9\e[0m] Cek User Yang Melakukan MULTILOGIN"
echo -e ""
echo -e " [\e[31m•0\e[0m] \e[31mBACK TO MENU\033[0m"
echo -e ""
echo -e   "Press x or [ Ctrl+C ] • To-Exit"
echo ""
echo -e "\e[32m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p " Select menu :  "  opt
echo -e ""
case $opt in
1) clear ; usernew ; exit ;;
2) clear ; trial ; exit ;;
3) clear ; renew ; exit ;;
4) clear ; hapus ; exit ;;
5) clear ; cek ; exit ;;
6) clear ; member ; exit ;;
7) clear ; delete ; exit ;;
8) clear ; autokill ; exit ;;
9) clear ; ceklim ; exit ;;
0) clear ; menu ; exit ;;
x) exit ;;
*) echo "Anda salah tekan " ; sleep 1 ; m-sshovpn ;;
esac
