#!/bin/bash
# My Telegram : https://t.me/zenvio
# ==========================================
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
# Getting
clear
IP=$(wget -qO- ipinfo.io/ip);
date=$(date +"%Y-%m-%d")
domain=$(cat /etc/xray/domain)
clear
email="kontol@gmail.com"
clear
echo -e "${GREEN}┌─────────────────────────────────────────────────┐${NC}"
echo -e "${GREEN}│${NC} ${COLBG1}             • BACKUP PANEL MENU •             ${NC} ${GREEN}│$NC"
echo -e "${GREEN}└─────────────────────────────────────────────────┘${NC}"
echo ""
echo "Mohon Menunggu , Proses Backup sedang berlangsung !!"
rm -rf /root/backup
mkdir /root/backup
cp -r /root/.acme.sh /root/backup/ &> /dev/null
cp /etc/passwd /root/backup/ &> /dev/null
cp /etc/group /root/backup/ &> /dev/null
cp /etc/shadow /root/backup/ &> /dev/null
cp /etc/gshadow /root/backup/ &> /dev/null
cp /etc/ppp/chap-secrets /root/backup/chap-secrets &> /dev/null
cp -r /var/lib/zenhost/ /root/backup/zenhost &> /dev/null
cp -r /etc/xray /root/backup/xray &> /dev/null
cp -r /home/vps/public_html /root/backup/public_html &> /dev/null
cp -r /etc/cron.d /root/backup/cron.d &> /dev/null
cp /etc/crontab /root/backup/crontab &> /dev/null
cp /etc/xraylog /root/backup/xraylog &> /dev/null
cd /root
zip -r $IP-$date.zip backup > /dev/null 2>&1
rclone copy /root/$IP-$date.zip dr:backup/
url=$(rclone link dr:backup/$IP-$date.zip)
id=(`echo $url | grep '^https' | cut -d'=' -f2`)
link="https://drive.google.com/u/4/uc?id=${id}&export=download"
echo -e "Detail Backup
 "${RED}┌───────────────────────────────────────┐${NC}"
    IP VPS        : $IP
    Domain        : $domain
    Link Backup   : $link
    Tanggal       : $date
 "${RED}└───────────────────────────────────────┘${NC}"
" mail -s "Backup Data" $email
rm -rf /root/backup
rm -r /root/$IP-$date.zip
clear
echo -e "Detail Backup
 "${RED}┌───────────────────────────────────────┐${NC}"
    IP VPS        : $IP
    Domain        : $domain
    Link Backup   : $link
    Tanggal       : $date
 "${RED}└───────────────────────────────────────┘${NC}" 
"
echo "Silahkan copy Link dan restore di VPS baru"
echo "Terimkasih sudah menggunakan layanan ZenVPN"
