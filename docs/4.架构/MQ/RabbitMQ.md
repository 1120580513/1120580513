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

  Headers Exchange