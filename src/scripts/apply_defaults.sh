#!/bin/bash
#set -e
##################################################################################################################
# Written to be used on 64 bits computers
# Author 	: 	DarkXero
# Website 	: 	http://xerolinux.xyz
##################################################################################################################
tput setaf 1
echo "###############################################################################"
echo "#                         !!! XeroLinux Reset Tool !!!                        #"
echo "#                                                                             #"
echo "#              Having Issues With Messed Up Layout or Settings ?              #"
echo "#                                                                             #"
echo "# This Will Apply Stock Defaults. Layout WILL BE RESET, Your Settings UNDONE! #"
echo "###############################################################################"
tput sgr0
echo
echo "Please Select Which Defaults you want to apply..."
echo
echo "1.  Apply Latest Defaults. (Current)"
echo "2.  Apply Previous Defaults. (Latte + KDE Panel)"
echo
echo "3.  Exit"
echo
echo "Please Select an Option..."
echo

read CHOICE

case $CHOICE in

    1 )
      echo "Creating Backups of ~/.config folder"
      echo "#####################################"
      cp -Rf ~/.config ~/.config-backup-$(date +%Y.%m.%d-%H.%M.%S)
      rm -Rf ~/.local/share/plasma/
      sleep 2
      echo "###################################"
      echo "Applying latest XeroLinux defaults "
      echo "###################################"
      sleep 2
      sudo pacman -Rdd kde-rice --noconfirm
      sudo pacman -Rdd kvantum --noconfirm
      sudo pacman -S xero-kde-config lightly-git latte-dock-git --noconfirm --needed
      cp -rf /etc/skel/. ~
      sudo sed -i "s/Current=.*/Current=XeroDark/" /etc/sddm.conf.d/kde_settings.conf
      cd ~ && git clone https://github.com/xerolinux/default-grub.git
      cd ~/default-grub/ && sudo ./install.sh
      rm -rf ~/default-grub
      sleep 2
      echo "#################################"
      echo "Done! Rebooting to Apply Settings"
      echo "#################################"
      sleep 2
      reboot

      ;;

    2 )
      echo "Creating Backups of ~/.config folder"
      echo "#####################################"
      cp -Rf ~/.config ~/.config-backup-$(date +%Y.%m.%d-%H.%M.%S)
      rm -Rf ~/.local/share/plasma/
      sleep 2
      echo "#################################"
      echo "Restoring default settings"
      echo "#################################"
      sleep 2
      sudo pacman -Rdd xero-kde-config --noconfirm
      sudo pacman -Rdd lightly-git --noconfirm
      sudo pacman -S kde-rice kvantum kvantum-theme-layan-git --noconfirm --needed
      cp -rf /etc/skel/. ~
      sudo sed -i "s/Current=.*/Current=XeroDark/" /etc/sddm.conf.d/kde_settings.conf
      cd ~ && git clone https://github.com/xerolinux/default-grub.git
      cd ~/default-grub/ && sudo ./install.sh
      rm -rf ~/default-grub
      sleep 2
      echo "#################################"
      echo "Done! Rebooting to Apply Settings"
      echo "#################################"
      sleep 2
      reboot

      ;;

    3 )
      echo
      echo "########################################"
      echo " Ok Sir, You can close this window now  "
      echo "########################################"
      ;;

    * )
      echo "#################################"
      echo "Choose the correct number"
      echo "#################################"
      ;;
esac
