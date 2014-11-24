#!/bin/sh
VERSION="1.0"
MENU="Easy Centos > Main Menu"
CURRENT_DIR=`pwd`
main_menu(){
echo "1) SELinux status ${NORMAL}"
echo "2) Disbale SELinux Temporarily"
echo "3) Enable SELinux Temporarily"
echo "4) Disbale SELinux Permanently"
echo "5) Enable SELinux Permanently"
}

option_1(){
    sestatus
    echo "Enter to continue..."   
    read
}

option_2(){
    echo 0 > /selinux/enforce
    echo "Enter to continue..."   
    read
}

option_3(){
    echo 1 > /selinux/enforce
    echo "Enter to continue..."   
    read
}

option_4(){
    while true; do
    read -p "System need reboot for finish this process. Do you want to continue[Y/N]?" yn
    case $yn in
        [Yy]* ) 
            rm -rf /etc/selinux/config    
            cp $CURRENT_DIR/Libraries/disable_selinux /etc/selinux/config 
            echo "Press enter to reboot..."   
            read
            reboot
        break;;
        [Nn]* )
        break;;
        * ) echo "Please answer yes or no.";;
    esac
    done
}

option_5(){
    while true; do
    read -p "System need reboot for finish this process. Do you want to continue[Y/N]?" yn
    case $yn in
        [Yy]* ) 
            rm -rf /etc/selinux/config    
            cp $CURRENT_DIR/Libraries/enable_selinux /etc/selinux/config 
            echo "Press enter to reboot..."   
            read
            reboot
        break;;
        [Nn]* ) 
        break;;
        * ) echo "Please answer yes or no.";;
    esac
    done
}

draw_menu(){   
clear
echo "=========================================================================="
echo "${RED}                       MowiCentos - Version ${VERSION}${NORMAL}"
echo "=========================================================================="
echo "${YELLOW} ${MENU}${NORMAL}"
echo ""
main_menu
echo ""
echo " 0) Exit${NORMAL}"
echo "=========================================================================="
echo "Please enter a menu option."
read opt
}

main(){
    draw_menu
    while [ true ]
    do      
        if [ $opt = "0" ]
        then 
            clear
            exit
        else      
            function_name="option_${opt}"
            eval ${function_name}                  
            draw_menu
        fi 
        
    done
}

main


