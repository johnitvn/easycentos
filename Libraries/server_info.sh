#!/bin/sh
VERSION="1.0"
MENU="Easy Centos > Server Infomation"

main_menu(){
echo " 1. Information about the CPU Architect"    
echo " 2. Information about detail of CPU Cores"
echo " 3. Information about detail of the MEMORY"
echo " 4. Information about IO ports"
echo " 5. Information about interrupts"
echo " 6. Information about kernel version"
echo " 7. Information about kernel"
echo " 8. Information about Centos Version"
echo " 9. The System Date "
echo " 10. Hostname"
}

option_1(){
    clear
    lscpu
    echo "Enter to continue..."   
    read
}

option_2(){
    clear
    less /proc/cpuinfo
    echo "Enter to continue..."   
    read
}

option_3(){
    clear
    less /proc/meminfo
    echo "Enter to continue..."   
    read
}

option_4(){
    clear
    less /proc/ioports
    echo "Enter to continue..."   
    read
}

option_5(){
    clear
    less /proc/interrupts
    echo "Enter to continue..."   
    read
}

option_6(){
    clear
    less /proc/version
    echo "Enter to continue..."   
    read
}

option_7(){
    clear
    uname -a
    echo "Enter to continue..."   
    read
}

option_8(){
    clear
    cat /etc/centos-release
    echo "Enter to continue..."   
    read
}

option_9(){
    clear
    date
    echo "Enter to continue..."   
    read
}

option_10(){
    clear
    hostname
    echo "Enter to continue..."   
    read
}


draw_menu(){   
clear
echo "=========================================================================="
echo "                       MowiCentos - Version ${VERSION}"
echo "=========================================================================="
echo "${MENU}"
echo ""
main_menu
echo ""
echo " 0. Exit"
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
            exit
        else      
            function_name="option_${opt}"           
            eval ${function_name}           
            draw_menu
        fi 
        
    done
}

main


