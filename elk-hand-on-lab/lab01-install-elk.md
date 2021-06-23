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

### Bước 1: Cài đặt docker và docker compose.

Sử dụng docker-compose sẽ giúp linh hoạt, nhanh chóng có một môi trường ELK để thực hành.

- [Xem hướng dẫn tại](https://github.com/hocchudong/ghichep-ELK/tree/master/elk-docker)

## Phương án 2: Cài manual.

Với cách cài này, có thể tăng tốc thời gian bằng việc sử dụng script cài đặt.

- [Sử dụng script cài đặt ELK tại](https://github.com/hocchudong/ghichep-ELK/blob/master/scripts/readme.md)

