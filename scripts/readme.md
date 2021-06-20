## Hướng dẫn sử dụng script

### Script cài đặt ELK trên Ubuntu server 20.04

Kiểm tra thời gian xem chuẩn chưa, để thời gian theo giờ Việt Nam để sau này nhận log cho chính xác. Nếu chưa biết thì google để tìm cách đặt thời gian nhé.

- Kiểm tra thời gian của máy chủ bằng lệnh `timedatectl`. Ta có kết quả như sau là OK.
    ```
    root@ubuntu:~# timedatectl
                Local time: Sun 2021-06-20 10:44:54 UTC
            Universal time: Sun 2021-06-20 10:44:54 UTC
                    RTC time: Sun 2021-06-20 10:44:55
                    Time zone: Etc/UTC (UTC, +0000)
    System clock synchronized: yes
                NTP service: active
            RTC in local TZ: no
    ```

- Đặt hostname
    ```
    hostname-ctl set-hostname elkdemo
    bash
    ```
- Khai báo file host.
    ```
    echo "127.0.0.1 `hostname`" > /etc/hosts
    echo "127.0.0.1 localhost" >> /etc/hosts
    ```



- Cập nhật OS và tải các phần mềm cần thiết. 
    ```
    apt-get -y update 
    apt-get -y install wget vim git
    ```

- Tải script 
    ```
    wget https://raw.githubusercontent.com/hocchudong/ghichep-ELK/master/scripts/script-install-ELK.sh
    ```

- Thực thi script
    ```
    chmod +x script-install-ELK.sh

    bash script-install-ELK.sh
    ```

Truy cập vào giao diện của Kibana: `http://IP:5601`
