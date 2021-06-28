## Hướng dẫn sử dụng script

### Script cài đặt ELK trên Ubuntu server 20.04

Kiểm tra thời gian của máy chủ.

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

- Nếu giờ chưa đúng theo giờ VN, thực hiện lệnh sau để chỉnh lại.
    ```
    timedatectl set-timezone Asia/Ho_Chi_Minh
    ```

Kiểm tra lại bằng lệnh `timedatectl`

- Đặt hostname
    ```
    hostnamectl set-hostname elkdemo
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

- Vô hiệu hóa IPv6.
    ```
    echo "net.ipv6.conf.all.disable_ipv6 = 1" > /etc/sysctl.conf
    echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf

    sysctl -p
    ```

    ```
    sed -i 's/GRUB_CMDLINE_LINUX=""/GRUB_CMDLINE_LINUX="ipv6.disable=1"/g' /etc/default/grub

    sudo update-grub
    ```

- Khởi động lại OS.

- Login với quyền root.

    ```
    sudo su 
    ```
- Tải script và thực thi.
    ```
    wget https://raw.githubusercontent.com/hocchudong/ghichep-ELK/master/scripts/script-install-ELK.sh
    ```

- Thực thi script
    ```
    chmod +x script-install-ELK.sh

    bash script-install-ELK.sh
    ```

Truy cập vào giao diện của Kibana: `http://IP:5601`
