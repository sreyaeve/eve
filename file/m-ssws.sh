#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
##################
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
clear 
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "      • Shadowsocks Account •         "
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e " [\e[36m•1\e[0m] Buat Akun Shadowsocks "
echo -e " [\e[36m•2\e[0m] Trial Akun Shadowsocks "
echo -e " [\e[36m•3\e[0m] Perpanjang Akun Shadowsocks "
echo -e " [\e[36m•4\e[0m] Hapus Akun Shadowsocks "
echo -e " [\e[36m•5\e[0m] Cek User Login Shadowsocks "
echo -e " [\e[36m•6\e[0m] Cek User Shadowsocks Akun "
echo -e ""
echo -e " [\e[31m•0\e[0m] \e[31mBACK TO MENU\033[0m"
echo -e   ""
echo -e   "Press x or [ Ctrl+C ] • To-Exit"
echo ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; add-ssws ;;
2) clear ; trialssws ;;
3) clear ; renew-ssws ;;
4) clear ; del-ssws ;;
5) clear ; cek-ss ;;
6) clear ; log-ss ;;
0) clear ; menu ;;
x) exit ;;
*) echo "Tekan Yang Bener Dlogok" ; sleep 1 ; m-ssws ;;
esac
