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
Chờ các image được tải về và tạo ra các container. Ta sẽ thấy quá trình tải các image về như sau

![Anh1](https://image.prntscr.com/image/SY8J22jCS0ClHGmJlEVPPQ.png)

 Sau đó kiểm tra bằng lệnh `docker ps` ta sẽ thấy trạng thái của các container. Kết quả của lệnh `docker ps`

 ![anh2](https://image.prntscr.com/image/AgDis4MjR_eeoQ7Mpxb_8w.png)

Truy cập vào địa chỉ sau:
  - Kibana: `http://172.16.70.201:5601/`
  - Elastic: `http://172.16.70.201:9200`

Giao diện Kibana

![Anh3](https://image.prntscr.com/image/hDSb0UMnQhqeQwbFPeFLIA.png)

Trong repo này có sử dụng các file log mẫu của apache và nginx, hãy khai báo index cho kibana để quan sát log.



