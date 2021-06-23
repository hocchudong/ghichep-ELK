# Hướng dẫn cài đặt ELK

Chuẩn bị môi trường cài đặt ELK để thực hành.
- Hệ điều hành: Ubuntu Server 20.04 64 bit.
- ELK Stack: Phiên bản 7.10.x trở lên.
- Cài đặt ELK theo phương án manual hoặc trong môi trường container.

# Các bước cài đặt
- Cài đặt máy chủ với OS là Ubuntu Server 20.04 64 bit.
- Thiết lập IP, Hostname.
- Cấu hình NTP và kiểm tra thời gian cho phù hợp giờ VN.

Lựa chọn một trong hai phương án cài đặt sau:
- Cài bằng docker-compose hoặc cài theo kiểu manual.
- Đọc hướng dẫn dưới và lựa chọn một trong 2 phương án.

## Phương án 1: Cài bằng docker-compose.

Sử dụng docker-compose sẽ giúp linh hoạt, nhanh chóng có một môi trường ELK để thực hành.

- [Xem hướng dẫn tại](https://github.com/hocchudong/ghichep-ELK/tree/master/elk-docker)

## Phương án 2: Cài manual.

Với cách cài này, có thể tăng tốc thời gian bằng việc sử dụng script cài đặt.

- [Sử dụng script cài đặt ELK tại](https://github.com/hocchudong/ghichep-ELK/blob/master/scripts/readme.md)

Sau khi cài đặt xong, kiểm tra trên CLI hoặc vào web để xem ELK hoạt động hay chưa.

CLI: Sử dụng lệnh CURL để kiểm tra hoạt động của elasticsearch
    ```
    root@ubuntu20-04:~/ghichep-ELK/elk-docker# curl http://172.16.70.137:9200
    {
    "name" : "hcd-demo-es",
    "cluster_name" : "es-docker-cluster",
    "cluster_uuid" : "kYU922NfRSeTkfzGaHz1tg",
    "version" : {
        "number" : "7.13.2",
        "build_flavor" : "default",
        "build_type" : "docker",
        "build_hash" : "4d960a0733be83dd2543ca018aa4ddc42e956800",
        "build_date" : "2021-06-10T21:01:55.251515791Z",
        "build_snapshot" : false,
        "lucene_version" : "8.8.2",
        "minimum_wire_compatibility_version" : "6.8.0",
        "minimum_index_compatibility_version" : "6.0.0-beta1"
    },
    "tagline" : "You Know, for Search"
    }
    root@ubuntu20-04:~/ghichep-ELK/elk-docker#
    ```

Web: Truy cập vào web với địa chỉ: http://IP_ADD:9200 để xem trạng thái của elasticsearch.
    ```
    [Anh](https://image.prntscr.com/image/m9fYZ77LT8msu1xXCPyNIQ.png)
    ```