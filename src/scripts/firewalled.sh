#!/bin/bash
#set -e
##################################################################################################################
# Written to be used on 64 bits computers
# Author 	: 	DarkXero
# Website 	: 	http://xerolinux.xyz
##################################################################################################################
echo
tput setaf 3
echo "###############################################################################"
echo "#                         XeroLinux Firewall Enabler                          #"
echo "###############################################################################"
tput sgr0
echo
echo "Select which Edition you on."
echo
echo "########## Edition Selection ##########"
echo
echo "1.  XeroLinux KDE Plasma."
echo "2.  XeroLinux GNOME (XeroG)."
echo
echo "Type Your Selection. To Exit, just close Window."
echo

while :; do

read CHOICE

case $CHOICE in

    1 )
      echo
      echo "###########################################"
      echo "         Adding/Enabling Firewalld         "
      echo "###########################################"
			sleep 3
			sudo pacman -S --noconfirm plasma-firewall firewalld
			sudo systemctl enable --now firewalld
			sleep 3
      echo "###########################################"
      echo "   Done ! Check Status from KDE Settings   "
      echo "###########################################"
      sleep 6
      ;;

    2 )
      echo
      echo "############################################"
      echo "       Installing FireJail for Gnome        "
      echo "############################################"
			sleep 3
			sudo pacman -S --noconfirm firejail firetools
			sleep 3
      echo "###############################################"
      echo "Done ! Configure Firewall From The FireJail App"
      echo "###############################################"
      sleep 6
      ;;

    * )
      echo "#################################"
      echo "    Choose the correct number    "
      echo "#################################"
      ;;
esac
done




#!/usr/bin/bash
#set -e

echo "#######################################"
echo "#  Installing/Enabling Plasma Firewall  "
echo "#######################################"
echo
echo " Step 1 - Installing Plasma Firewall  "
echo "######################################"
sudo pacman -S --noconfirm plasma-firewall firewalld
sleep 3
echo
echo "  Step 2 - Enabling Firewall Service  "
echo "######################################"
sudo systemctl enable --now firewalld
sleep 3
echo "#################################"
echo "      Updating Done! Exit Me     "
echo "#################################"
