#!/bin/sh
VERSION="1.0"
MENU="Easy Centos > Installer Tools"
CURRENT_DIR=`pwd`

main_menu(){
echo "1. Install Ngix and PHP-FPM"
}

option_1(){
rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
rm -rf /etc/yum.repos.d/nginx.repo
cp $CURRENT_DIR/Libraries/nginx_repo > /etc/yum.repos.d/nginx.repo
yum --enablerepo=remi,remi-php56 install nginx php-fpm php-mysql php-common php-mbstring php-mcrypt php-gd
iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT
service iptables save
ervice iptables restart
service nginx start
service php-fpm start
chkconfig php-fpm on
chkconfig nginx on
echo 'Please change user and group in file /etc/php-fpm.d/www.conf for complete installation"
read
}


draw_menu(){   
clear
echo "=========================================================================="
echo "                       MowiCentos - Version ${VERSION}${NORMAL}"
echo "=========================================================================="
echo "${MENU}"
echo ""
main_menu
echo ""
echo "0. Exit"
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