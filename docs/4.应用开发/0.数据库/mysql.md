# MySQL

## 缓存

1. SQL 语句缓存，根据 SQL 语句字节和结果以 K-V 形式缓存，条件苛刻，程序员不可控，线上一般关闭此功能
2. Innodb Buffer Poll，缓存磁盘的分页数据
