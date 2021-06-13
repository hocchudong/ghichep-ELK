## Cài đặt ELK 7.x bằng docker-compose

### Cài đặt cơ bản

Lưu ý: Thực hiện cài đặt manual docker, docker-compose hoặc dùng script cài đặt docker tại bài này: 

```
https://hocchudong.com/scrip-cai-dat-docker-docker-compose-tren-ubuntu-centos/
```

Thực hiện tải git và clone repo về.

- Đối với Ubuntu: 

    ```
    apt update 
    apt install git -y

    git clone https://github.com/hocchudong/ghichep-ELK.git
    ```

- Đối với CentOS:

    ```
    yum update -y
    yum install git -y

    git clone https://github.com/hocchudong/ghichep-ELK.git
    ```

### Thưc thi file docker-compose

Sau khi clone thư mục chứa file docker-compose về, ta sẽ bắt đầu thực thi file docker compose

- Di chuyển vào thư mục chưa file docker-compose dành cho ELK.

```
cd ghichep-ELK/elk-docker/
```

Ngoài file docker-compose là file chính, thư mục này còn chứa các file cấu hình mẫu, file log mẫu để sau này elastic, logstash, kibana sử dụng.

- Tiếp tục thực hiện lệnh dưới để tạo các container.

```
docker-compose up -d
```

Chờ các image được tải về và tạo ra các container. Sau đó kiểm tra bằng lệnh `docker ps` ta sẽ thấy trạng thái của các container.



