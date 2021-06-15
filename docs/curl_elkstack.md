# Hướng dẫn sử dụng curl để làm việc với ELK Stack


Tài liệu này ghi chép lại các bước thực hành CURL với ELK Stack. Ta có thể sử dụng  lệnh curl tương tác với API mà Elastic cung cấp để tương tác với `index` và `document` :
- Tạo  - CREATE 
- Đọc  - READ
- Cập nhật - UPDATE
- Xóa - DELETE

Một số tài liệu sẽ gọi là CURD có nghĩa là: Create, Update, Read, Delete
 
Để hoàn thành các bài này, cần có hệ thống ELK đã được cài đặt. Hãy tham khảo tài liệu hướng dẫn cài đặt ELK bằng Script:`https://github.com/hocchudong/ghichep-ELK/tree/master/scripts`.

- Trong hướng dẫn này thực hành trên ELK Stack version 7.13.1

## CREATE

### Tạo index

- Tạo một index có tên là `articles`
```
curl -XPUT '172.16.71.141:9200/articles?&pretty'
```

## Chèn dữ liệu vào index

Dữ liệu trong elastic được gọi là `documents`.

Có 02 cách để chèn dữ liệu vào trong elastic, bao gồm: 
- Cách sử dụng POST. Khi sử dụng phương thức POST để chèn dữ liệu thì có thể không cần khai báo ID.
- Cách sử dụng PUT. Khi sử dụng phương thức PUT để chén thì bắt buộc phải có ID trong quá trình truyền.

### Sử dụng POST để chèn dữ liệu.

Đối với POST, bạn có thể khai báo ID hoặc không cần.

- Chèn dữ liệu có định dạng là json vào index vừa tạo ở bên trên. Lựa chọn `id` là `1`.
  ``` 
  curl -XPOST '172.16.71.141:9200/articles/_doc/1?pretty' -d '{"topic":"python","title": "python tuples","description": "practical operations with python tuples","author": "santosh","date": "1-1-2019","views" : "100"}' -H 'Content-Type: application/json'
  ```

-  Tới đây, muốn quan sát dữ liệu trên Kibana thì cần khai báo tên index. Bước này làm trên giao diện (tìm hiểu thêm các tạo index để hiển thị trên kibana)

- Tạo index mà không chỉ ra ID, lúc này ID sẽ được sinh tự động.
  ```
  curl -XPOST '172.16.71.141:9200/articles/_doc/?pretty' -d '{"topic":"java","title": "java interger","description": "practical operations with java interger","author": "Smith","date": "19-2-2020","views" : "150"}' -H 'Content-Type: application/json'
  ```

- Kết quả của lệnh trên sẽ hiển thị như bên dưới, trong đó dòng `"_id" : "xBDhCnoBAbSlHfTyy76L",` sẽ được sinh tự động. 
  ```
  {
    "_index" : "articles",
    "_type" : "_doc",
    "_id" : "xBDhCnoBAbSlHfTyy76L",
    "_version" : 1,
    "result" : "created",
    "_shards" : {
      "total" : 2,
      "successful" : 1,
      "failed" : 0
    },
    "_seq_no" : 1,
    "_primary_term" : 1
  }
  ```

### Sử dụng PUT để chèn dữ liệu.

Khi sử dụng PUT để chèn dữ liệu vào index, bạn bắt buộc phải khai báo ID của  dữ liệu.
  ```
  curl -XPUT '172.16.71.141:9200/articles/_doc/9?pretty' -d '{"topic":"NodeJS","title": "NodeJS if else","description": "NodeJS Basic","author": "Tien","date": "9-6-2018","views" : "250"}' -H 'Content-Type: application/json'
  ```

## READ 

Đọc dữ liệu từ index và đọc các dữ liệu trong index sẽ thực hiện qua phương thức GET.

- Truy vấn dữ liệu có `id là 1` trong index `articles` bằng cách chèn giá trị của id `1?pretty`.
  ```
  curl -XGET '172.16.71.141:9200/articles/_doc/1?pretty'
  ```

Kết quả của dữ liệu có ID bằng 1
  ```
  {
    "_index" : "articles",
    "_type" : "_doc",
    "_id" : "1",
    "_version" : 1,
    "_seq_no" : 0,
    "_primary_term" : 1,
    "found" : true,
    "_source" : {
      "topic" : "python",
      "title" : "python tuples",
      "description" : "practical operations with python tuples",
      "author" : "santosh",
      "date" : "1-1-2019",
      "views" : "100"
    }
  }
  ```
- Tra cứu dữ liệu có id là `xBDhCnoBAbSlHfTyy76L`
  ```
  curl -XGET '172.16.71.141:9200/articles/_doc/xBDhCnoBAbSlHfTyy76L?pretty'
  ```

- Tra cứu dữ liệu có ID là `9`
  ```
  curl -XGET '172.16.71.141:9200/articles/_doc/9?pretty'
  ```

### Kiểm tra thông tin của các Index.

Sử dụng curl để kiểm tra toàn bộ các index

- Sử dụng CURL
  ```
  curl -XGET '172.16.71.141:9200/_cat/indices?v'
  ```
Kết quả bằng CURL
![A1](https://image.prntscr.com/image/EIZRcwnDTSW4MprTbG32cQ.png)

- Sử dụng Dev tools
  ```
  GET /_cat/indices?v'
  ```

Kết quả bằng Dev tools
![A2](https://image.prntscr.com/image/9aGV4y5pTvKhn3lHngLqdA.png)


Tham khảo thêm tại: https://www.thegeekstuff.com/2019/05/elasticsearch-curd-examples/
