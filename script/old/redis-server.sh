#!/bin/bash
sleep3
echo "###### BAT DAU CAI DAT ######"
sleep 3
echo "###### CAI DAT REDIS-SERVER ######"
sudo apt-get install redis-server -y
sed –i ‘s/bind 127.0.0.1/bind 0.0.0.0/g’/etc/redis/redis.conf
service redis-server restart	
service redis-server restart
sleep 5

echo "###### CAI DAT LOGSTASH ######"
sleep 3
echo 'deb http://packages.elasticsearch.org/logstash/1.4/debian stable main' | sudo tee /etc/apt/sources.list.d/logstash.list
sudo apt-get update
sudo apt-get install -y logstash=1.4.1-1-bd507eb --force-yes 

# Cau hinh losgstash
echo "###### CAU HINH LOGSTASH ######"
echo "###### NHAP PORT ######"
read port
export port=$port
echo "###### NHAP DIA CHI REDIS-SERVER ######"
read ip
export ip=$ip
sudo cat > /etc/logstash/conf.d/lgstash.conf <<EOF
input {
udp {
port => $port
type => syslog
}
tcp {
port => $port
type => syslog
}
}
filter {
grok {
type => "syslog"
add_field => [ "received_at", "%{@timestamp}" ]
add_field => [ "received_from", "%{@source_host}" ]
}
}
output {
redis {
host => "$ip"
data_type => "list"
key => "logstash"
}
}
EOF
service logstash restart
service logstash restart
sleep 5
echo "###### KET THUC CAI DAT TREN REDIS-SERVER ######"
