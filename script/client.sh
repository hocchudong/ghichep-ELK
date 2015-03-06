#!/bin/bash
echo "###### NHAP IP VA PORT CUA LOG STASH CAI TREN REDIS-SERVER, VI DU: 10.145.37.37:9000 #######"
read iplogsv
export iplogsv=$iplogsv 
sudo echo "*.*         @@$iplogsv" >> /etc/rsyslog.d/50-default.conf
sudo echo "*.*         @$iplogsv" >> /etc/rsyslog.d/50-default.conf
sudo service rsyslog restart 
sudo service rsyslog restart
sleep 3
echo "###### KET THUC QUA TRINH CAI DAT ######"
