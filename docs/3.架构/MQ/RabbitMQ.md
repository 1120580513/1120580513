# RabbitMQ

- `Broker`：_消息队列服务进程_
- `vhost`：_虚拟主机，一个 Broker 对应多个 vhost，隔离业务_
- `Exchange`：_交换机，确定消息如何路由到队列_
- `Queue`：_队列_
- `Binding`：_将 Exchange 和 Queue 绑定_
- `Routing Key`：_路由关键字，Exchange 根据这个关键字进行路由_
- `Producer`：_生产者_
- `Consumer`：_消费者_
- `Channel`：_通道，客户端每个连接可建立多个 Channel 一个 Channel 代表一个会话_

## 流程

1. 创建 Client 并打开一个 Channel
2. 声明 Exchange、Queue
3. 使用 Routing Key 并 Binding
4. Producer 发送消息
5. Consumer 消费消息

## Exchange

- `Direct Exchange`：_消息与一个特定的路由键完全匹配_
- `Fanout exchange`：_消息发送到所有队列_
- `Topic Exchange`：_通配符交换机_
  - `*`：_匹配一个单词_
  - `#`：_一个或多个单词_
- `Headers Exchange`：_使用键值进行路由_

## 队列设置

- durable 是否持久化
- exclusive 是否只被一个客户端使用，且连接关闭后删除队列
- audodelete 没有消息者后立即被删除
- arguments
  - x-message-ttl 消息的过期时间，ms
  - x-expires 队列过期时间，多长时间未被访问将删除，ms
  - x-max-length 队列最大长度
  - x-max-length-bytes 消息内容最大内存
  - x-overflow 队列溢出行为
    - drop-head 默认值，抛弃最老的消息
    - reject-publish 拒绝发布
    - reject-publish-dlx
  - x-dead-letter-exchange 死信交换机名称 
  - x-dead-letter-routing-key 死信消息路由键，不设置则使用消息原来的路由键
    - 以下情况会变为死信队列
      - 消息被拒绝（basic.reject/basic.nack），且requeue=false
      - 消息 TTL 过期
      - 队列达到最大长度
  - x-single-active-consumer 为 true 时，只有一个消费者，其他的将被忽略
  - x-max-priority 最大优先级数，未设置时不支持消息优先级
  - x-queue-mode 使用延迟模式，减少内存的使用，在磁盘保留更多信息
  - x-queue-master-locator 集群模式下设置镜像队列的主节点信息
    - 当有死信消息时发送到指定的队列
