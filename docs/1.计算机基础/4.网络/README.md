# 网络

<img src="/img/network_structure.png" />

<img src="/img/network_full.png" />


## Socket

1. 服务器建立一个 ServerSocket，并定义监听端口
2. 服务器开始监听指定端口，并阻塞
3. 客户端建立 ClientSocket，指定服务端 ip 和端口
4. 客户端发送连接请求，建立连接
5. 进行通信
