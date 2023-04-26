#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
clear 
echo -e "\e[36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "          • TROJAN MENU •             "
echo -e "\e[36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e " [\e[36m•1\e[0m] Buat Akun Trojan "
echo -e " [\e[36m•2\e[0m] Trial Akun Trojan "
echo -e " [\e[36m•3\e[0m] Perpanjang Akun Trojan "
echo -e " [\e[36m•4\e[0m] Hapus Akun Trojan "
echo -e " [\e[36m•5\e[0m] Cek User Login Trojan "
echo -e " [\e[36m•6\e[0m] Cek User Trojan Akun "
echo -e ""
echo -e " [\e[31m•0\e[0m] \e[31mBACK TO MENU\033[0m"
echo -e   ""
echo -e   "Press x or [ Ctrl+C ] • To-Exit"
echo ""
echo -e "\e[36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; add-tr ;;
2) clear ; trialtrojan ;;
3) clear ; renew-tr ;;
4) clear ; del-tr ;;
5) clear ; cek-tr ;;
6) clear ; log-trojan ;;
0) clear ; menu ;;
x) exit ;;
*) echo "Tekan Yang Benar Dlogok" ; sleep 1 ; m-trojan ;;
esac
