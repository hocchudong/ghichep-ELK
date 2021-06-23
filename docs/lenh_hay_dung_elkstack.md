# Ghi chép các lệnh hay dùng với ELK

- Kiểm tra trạng thái của các dịch vụ
    ```
    systemctl status logstash
    ```

    ```
    systemctl status kibana
    ```

    ```
    systemctl status elasticsearch
    ```

- Kiểm tra port các dịch vụ
    ```
    ss -lan | egrep '9200|9300|5601|5044'
    ```

- Lệnh sử dụng để test file cấu hình logstash trước khi áp dụng, mục tiêu xem file đó có cấu hình đúng hay chưa.
    ```
    /usr/share/logstash/bin/logstash  -f /etc/logstash/conf.d/TEN_FILE_LOGSTASH --config.test_and_exit
    ```