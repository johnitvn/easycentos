#!/bin/sh

VERSION="1.0"
MENU="Easy Centos > Test Tools"
current_dir=$(pwd)

main_menu(){
echo " 1. Test I/O hard disk speed "
echo " 2. Test network speed  "
}

option_1(){
echo "Please wait. We are test with 256.000 times to copy 16k file"
dd if=/dev/zero of=/tmp/testio bs=16k count=256k oflag=direct
rm -rf /tmp/testio
echo "Enter to continue..."   
read
}

option_2(){
python $current_dir/Libraries/speed_test.py --share
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
            clear
            eval ${function_name}                  
            draw_menu
        fi 
        
    done
}

main


