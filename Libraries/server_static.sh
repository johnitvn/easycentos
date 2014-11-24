#!/bin/sh

VERSION="1.0"
MENU="Main Menu > Server Static"

main_menu(){
echo " 1. Server uptime "
echo " 2. Get Free RAM "
echo " 3. Get Free Disk"
echo " 4. Show who is logged on"

}

option_1(){
    uptime
    echo "Enter to continue..."   
    read
}
option_2(){
    free
    echo "Enter to continue..."   
    read
}

option_3(){
    df
    echo "Enter to continue..."   
    read
}

option_4(){
    df
    echo "Enter to continue..."   
    read
}


draw_menu(){   
clear
echo "=========================================================================="
echo "                       MowiCentos - Version ${VERSION}"
echo "=========================================================================="
echo " ${MENU}"
echo ""
main_menu
echo ""
echo " 0) Exit"
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


