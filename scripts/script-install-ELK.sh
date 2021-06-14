#!/bin/bash
### 16.04.2021
### CongTO
##########################################
echo "SCRIPT CAI DAT ELK "
sleep 3

### THIET LAP BIEN
# Lay IP cua may chu
ipa=`ip route get 8.8.8.8 | sed -n '/src/{s/.*src *\([^ ]*\).*/\1/p;q}'`

###CAI DAT ELASTIC
sudo apt-get update
apt-get -y install apt-transport-https vim git wget gnupg
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-7.x.list

apt-get -y update
apt-get -y install openjdk-8-jre-headless 
apt-get -y install elasticsearch 

sed -i 's/#cluster.name: my-application/cluster.name: my-application/g' /etc/elasticsearch/elasticsearch.yml
sed -i 's/#network.host: 192.168.0.1/network.host: X.Y.Z.W/g' /etc/elasticsearch/elasticsearch.yml
sed -i 's/#http.port: 9200/http.port: 9200/g' /etc/elasticsearch/elasticsearch.yml
echo "discovery.type: single-node" >> /etc/elasticsearch/elasticsearch.yml
cp /etc/elasticsearch/jvm.options /etc/elasticsearch/jvm.options.bka
echo "-Xms512m" >> /etc/elasticsearch/jvm.options
echo "-Xmx512m" >> /etc/elasticsearch/jvm.options
sed -i "s/X.Y.Z.W/$ipa/g" /etc/elasticsearch/elasticsearch.yml

systemctl enable elasticsearch.service
systemctl start elasticsearch.service

###CAI DAT LOGSTASH
apt-get -y install logstash
systemctl enable logstash.service
systemctl start logstash.service

### CAI DAT & CAU HINH KIBANA
apt-get -y install kibana

sed -i 's/#server.port: 5601/server.port: 5601/g' /etc/kibana/kibana.yml
sed -i 's/#server.host: "localhost"/server.host: "X.Y.Z.W"/'g /etc/kibana/kibana.yml
sed -i 's/#elasticsearch.hosts: \["http:\/\/localhost:9200"\]/elasticsearch.hosts: ["http:\/\/X.Y.Z.W:9200"]/g' /etc/kibana/kibana.yml

sed -i "s/X.Y.Z.W/$ipa/g" /etc/kibana/kibana.yml

sudo systemctl enable kibana.service
sudo systemctl start kibana.service

echo "DA CA DAT XONG"
