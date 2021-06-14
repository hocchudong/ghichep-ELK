## Hướng dẫn sử dụng script

### Script cài đặt ELK trên Ubuntu server 20.04

Cập nhật OS và tải các phần mềm cần thiết. 

```
apt update 
apt install wget vim git
```

Tải script 

```
wget https://raw.githubusercontent.com/hocchudong/ghichep-ELK/master/scripts/script-install-ELK.sh
```

Thực thi script

```
chmod +x script-install-ELK.sh

bash script-install-ELK.sh
```

Truy cập vào giao diện của Kibana: `http://IP:5601`
