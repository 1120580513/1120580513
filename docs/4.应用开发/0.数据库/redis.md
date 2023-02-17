# Redis

## 常用缩写

|  |  |
| :-----| :---- |
| X | Exists |
| NX | if Not Exists |
| XX | 仅当键存在时才操作 |
| HX | 仅当key存在并且是命令对应的类型 |
| E | Expire |
| EX | 同时设置过期时间(秒)，如果存在则覆盖 |
| P[command]EX | 同时设置过期时间(毫秒)，如果存在则覆盖 |
| RANGE | 指定部分 |
| BY | 指定值 |
| M | 多个 |
| INCR | 增加 |
| DECR | 减少 |
| FLOAT | 小数 |
| SCAN | incrementally iterate 增量迭代 |
| B | blocking 阻塞式 |
| CARD | 基数 |
| INTER | intersection 交集 |
| UNION | 并集 |
| DIFF | difference 差集 |
| REV | reverse 逆序 |

## 数据库

|  |  |
| :-----| :---- |
| EXISTS key |  |
| TYPE key |  |
| RENAME key newkey |  |
| RENAMENX key newkey |  |
| MOVE key db |  |
| DEL key [key …] |  |
| RANDOMKEY | 从当前数据库随机返回一个key |
| DBSIZE | 返回当前库的key的数量 |
| KEYS pattern |  |
| SCAN cursor [MATCH pattern] [COUNT count] |  |
| SORT key [BY pattern] [LIMIT offset count] [GET pattern [GET pattern …]] [ASC | DESC] [ALPHA] [STORE destination] | 返回或保存给定列表、集合、有序集合 key 中经过排序的元素 |
| FLUSHDB | 清空所有key |
| FLUSHALL | 删除所有数据库的所有key |
| SELECT index | 切换到指定数据库 |
| SWAPDB db1 db2 | 交换两个数据库的数据 |

### 过期

|  |  |
| :-----| :---- |
| EXPIRE key seconds | 设置过期时间(秒) |
| PEXPIRE key milliseconds | 设置过期时间（毫秒） |
| EXPIREAT key timestamp | 设置过期时间，指定UNIX时间戳（秒） |
| PEXPIREAT key milliseconds-timestamp | 设置过期时间，指定UNIX时间戳（毫秒） |
| TTL key | 剩余生存时间（秒） |
| PTTL key | 剩余生存时间（毫秒） |
| PERSIST key | 转换为永不过期的key |

## 字符串

> 二进制安全，最大为 512MB，可存储图片或序列化的对象

|  |  |
| :-----| :---- |
| SET key value [EX seconds] [PX milliseconds] [NX\|XX] |  | 
| SETNX key value |  | 
| SETEX key seconds value |  | 
| PSETEX key milliseconds value |  | 
| GET key |  | 
| GETSET key value | 设置并返回旧值 | 
| STRLEN key |  | 
| APPEND key value | 追加 | 
| SETRANGE key offset value | 从偏移量开始覆盖原值 | 
| GETRANGE key start end |  | 
| INCR key | 增加1 | 
| INCRBY key increment |  | 
| INCRBYFLOAT key increment |  | 
| DECR key | 减少 | 
| DECRBY key decrement |  | 
| MSET key value [key value …] |  | 
| MSETNX key value [key value …] |  | 
| MGET key [key …] |  | 

## 哈希表:H

> 可用来存储对象

|  |  |
| :-----| :---- |
| HSET hash field value |  | 
| HSETNX hash field value |  | 
| HGET hash field |  | 
| HEXISTS hash field |  | 
| HDEL key field [field …] |  | 
| HLEN key | 返回哈希表的长度 | 
| HSTRLEN key field | 返回哈希表字段的长度 | 
| HINCRBY key field increment |  | 
| HINCRBYFLOAT key field increment |  | 
| HMSET key field value [field value …] |  | 
| HMGET key field [field …] |  | 
| HKEYS key | 获取所有键 | 
| HVALS key | 获取所有值 | 
| HGETALL key | 获取所有键和值 | 
| HSCAN key cursor [MATCH pattern] [COUNT count] |  | 

## 列表:L、R

> 双向链表，最大容量为 2^32-1 个，如实现消息队列，关注列表功能等

|  |  |
| :-----| :---- |
| LPUSH key value [value …] |  | 
| LPUSHX key value |  | 
| RPUSH key value [value …] |  | 
| RPUSHX key value |  | 
| LPOP key | 移除并返回头元素 | 
| RPOP key | 移除并返回尾元素 | 
| RPOPLPUSH source destination | source弹出并返回尾元素，且将其插入到destinaction的头 | 
| LREM key count value | 移除和value相等的元素 | 
| LLEN key |  | 
| LINDEX key index |  | 
| LINSERT key BEFORE|AFTER pivot value | 将value插入到pivot之前或之后 | 
| LSET key index value |  | 
| LRANGE key start stop |  | 
| LTRIM key start stop | 修剪 | 
| BLPOP key [key …] timeout |  | 
| BRPOP key [key …] timeout |  | 
| BRPOPLPUSH source destination timeout |  | 

## 集合:S

> set，不会重复，最大容量为 2^32-1，可求交集并集，如共同关注功能等

|  |  |
| :-----| :---- |
| SADD key member [member …] |  | 
| SISMEMBER key member | member是否是集合的成员 | 
| SPOP key | 移除并返回集合中的一个随机元素 | 
| SRANDMEMBER key [count] | 返回集合中的一个随机元素 | 
| SREM key member [member …] |  | 
| SMOVE source destination member |  | 
| SCARD key | 返回集合中元素的数量 | 
| SMEMBERS key | 返回所有成员 | 
| SSCAN key cursor [MATCH pattern] [COUNT count] |  | 
| SINTER key [key …] | 返回多个集合的交集 | 
| SINTERSTORE destination key [key …] | ，将结果保存到destination | 
| SUNION key [key …] | 并集 | 
| SUNIONSTORE destination key [key …] |  | 
| SDIFF key [key …] | 差集 | 
| SDIFFSTORE destination key [key …] |  | 

## 有序集合:Z

> 自动排序且可指定 double 类型的权重

|  |  |
| :-----| :---- |
| ZADD key score member [[score member] [score member] …] |  | 
| ZSCORE key member  | 返回score | 
| ZINCRBY key increment member  | 为score增加increment | 
| ZCARD key |  | 
| ZCOUNT key min max | score在min和max的数量 | 
| ZRANGE key start stop [WITHSCORES] | 通过下标返回元素 | 
| ZREVRANGE key start stop [WITHSCORES] | 通过下标返回元素，倒序 | 
| ZRANGEBYSCORE key min max [WITHSCORES] [LIMIT offset count] |  | 
| ZRANK key member | 排名 | 
| ZREVRANK key member |  | 
| ZREM key member [member …] |  | 
| ZREMRANGEBYRANK key start stop |  | 
| ZREMRANGEBYSCORE key min max |  | 
| ZRANGEBYLEX key min max [LIMIT offset count] | 逐字节比对 | 
| ZLEXCOUNT key min max |  | 
| ZREMRANGEBYLEX key min max |  | 
| ZSCAN key cursor [MATCH pattern] [COUNT count] |  | 
| ZUNIONSTORE destination numkeys key [key …] [WEIGHTS weight [weight …]] [AGGREGATE SUM|MIN|MAX] | 将多个集合求并集然后存至destination | 
| ZINTERSTORE destination numkeys key [key …] [WEIGHTS weight [weight …]] [AGGREGATE SUM|MIN|MAX] |  | 

## SCAN

- SCAN 是一个基于游标的迭代器（cursor based iterator）
- 每次调用后都会返回一个新的游标，下次要使用新的游标做为参数
- 新的游标为0时表示迭代已结束

## Client 常用命令

- redis-cli -c -h [host] -p [port] -a [password]

## 链接

- [Redis Doc](http://redisdoc.com/)
- [Try Redis](https://try.redis.io/)