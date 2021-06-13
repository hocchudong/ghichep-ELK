!#/bin/bash

#### Cai dat va cau hinh logstash tren server su dung rsyslog #####

echo "#### BAT DAU CAI DAT####"
sleep 3

#Cai dat JAVA
echo "#### CAI DAT JAVA"
sleep 3
sudo apt-get install python-software-properties software-properties-common -y
sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get update
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
sudo apt-get -q -y install oracle-java7-installer
sudo bash -c "echo JAVA_HOME=/usr/lib/jvm/java-7-oracle/ >> /etc/environment"
sleep 3
echo "#### Kiem tra lai ####"
java -version

sleep 5

#Cai dat Elasticsearch
echo "#### CAI DAT ELASTICSEARCH #####"
sleep 3
wget -O - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | sudo apt-key add -
echo 'deb http://packages.elasticsearch.org/elasticsearch/1.1/debian stable main' | sudo tee /etc/apt/sources.list.d/elasticsearch.list
sudo apt-get update
sudo apt-get install -y elasticsearch=1.1.1
sudo service elasticsearch start
sudo update-rc.d elasticsearch defaults 95 10
sleep 5

#Cai dat apache2
echo "#### CAI DAT APACHE2"
sudo apt-get install apache2 -y
sudo service apache2 restart
sudo service apache2 restart

#Cai dat Kibana
echo "#### CAI DAT KIBANA ####"
sleep 3
apt-get install unzip -y
cd ~; wget http://download.elasticsearch.org/kibana/kibana/kibana-latest.zip
unzip kibana-latest.zip
sudo mkdir -p /var/www/kibana
sudo cp -R ~/kibana-latest/* /var/www/kibana/
sudo cat > /etc/apache2/conf-enabled/kibana.conf <<EOF
Alias /kibana /var/www/kibana
<Directory /var/www/kibana>
  Order allow,deny
  Allow from all
</Directory>
EOF
sudo service apache2 restart

sleep 5

#Cai dat logstash
echo "#### CAI DAT LOGSTASH####"
sleep 3
echo 'deb http://packages.elasticsearch.org/logstash/1.4/debian stable main' | sudo tee /etc/apt/sources.list.d/logstash.list
sudo apt-get update
sudo apt-get install -y logstash=1.4.1-1-bd507eb
#Cau hinh
echo "####### BAT DAU CAU HINH ######"
echo "####### NHAP IP REDIS-SERVER ######"
read iprd
export iprd=$iprd
echo "####### NHAP IP ELK-SERVER ######"
red ipelk
export ipelk=$ipelk
sleep 3
sudo cat > /etc/logstash/conf.d/10-syslog.conf <<EOF
input {
redis {
host => "$iprd" # server redis
type => "syslog"
data_type => "list"
key => "logstash"
}
}
output {
elasticsearch {
host => "$ipelk"
}
stdout { codec => rubydebug }
}
EOF
service logstash restart
service logstash restart
echo "###### KET THUC CAI DAT TREN ELK-SERVER ######" 

sleep 5

