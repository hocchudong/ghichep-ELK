# ELK-REDIS-su-dung-rsyslog

Sử dụng srcript cài đặt trên các node triển khai ***log tập trung*** sử dụng ***ELK + REDIS***, các máy Client sử dụng ***syslog*** làm "shipper"
Tất cả các node đều sử dụng OS Ubuntu-14.04.1

---

####MÔ HÌNH CÀI ĐẶT
<img src="http://i.imgur.com/V7n23DY.jpg">

---

####Data Flow

Gọi 
- Logstash của REDIS-SERVER là **LS1**
- Logstash của ELK-SERVER là **LS2**

Luồng dữ liệu như sau:

1. Các Client sẽ sử dụng **rsyslog** để đẩy log đến **LS1**
2. **LS1** tiếp tục đẩy log đến **REDIS** có vai trò là **broker**
3. **REDIS** sau đó tiếp tục đẩy log đến **LS2**
4. **LS2** đẩy log đến **ELASTICHSEARCH**

---

####CÁC BƯỚC CÀI ĐẶT

1. Chạy script `redis-server.sh` trên REDIS-SERVER
2. Chạy scrtip `elk-server.sh` trên ELK-SERVER
3. Chạy script `client.sh` trên các máy client

---

Tham khảo 
- http://viisix.com/tich-hop-redis-vao-he-thong-elk
- http://openstack.prov12n.com/openstack-lumberjack-part-3-logstash-and-kibana/
