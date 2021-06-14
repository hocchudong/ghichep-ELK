# Hướng dẫn sử dụng curl để làm việc với ELK Stack
Tài liệu này ghi chép lại các bước thực hành CURL với ELK Stack. Ta có thể sử dụng  lệnh curl tương tác với API mà Elastic cung cấp để :
- Tạo index 
- Chèn dữ liệu.
- Truy vấn dữ liệu.
- Cập nhật dữ liệu.

Để hoàn thành các bài này, cần có hệ thống ELK đã được cài đặt. Hãy tham khảo tài liệu hướng dẫn cài đặt ELK bằng Script:`https://github.com/hocchudong/ghichep-ELK/tree/master/scripts`.

- Trong hướng dẫn này thực hành trên ELK Stack version 7.13.1

### Tạo index

- Tạo một index có tên là `articles`
```
curl -XPUT '172.16.71.141:9200/articles?&pretty'
```

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


curl -XGET '192.168.101.100:9200/articles/_doc/1?pretty'
