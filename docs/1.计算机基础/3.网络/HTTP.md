# HTTP

## 三次握手

1. 客户端发送一个带 SYN 标志的 TCP 报文到服务器。这是三次握手过程中的报文 1。
2. 服务器端回应客户端的，这是三次握手中的第 2 个报文，这个报文同时带 ACK 标志和 SYN 标志。因此它表示对刚才客户端 SYN 报文的回应；同时又标志 SYN 给客户端，询问客户端是否准备好进行数据通讯。
3. 客户必须再次回应服务段一个 ACK 报文，这是报文段 3。

> **为了防止 ACK 报文的丢失，主动关闭连接的那一方在挥手后会进入 Time_Wait 状态 2MSL，所以会有报文段 3。**

## 四次挥手

1. TCP 客户端发送一个 FIN，用来关闭客户到服务器的数据传送（报文段 4）。
2. 服务器收到这个 FIN，它发回一个 ACK，确认序号为收到的序号加 1（报文段 5）。和 SYN 一样，一个 FIN 将占用一个序号。
3. 服务器关闭客户端的连接，发送一个 FIN 给客户端（报文段 6）。
4. 客户段发回 ACK 报文确认，并将确认序号设置为收到序号加 1（报文段 7）

> **由于 TCP 连接是全双工的，因此每个方向都必须单独进行关闭。这原则是当一方完成它的数据发送任务后就能发送一个 FIN 来终止这个方向的连接。收到一个 FIN 只意味着这一方向上没有数据流动，一个 TCP 连接在收到一个 FIN 后仍能发送数据。首先进行关闭的一方将执行主动关闭，而另一方执行被动关闭。**

## 报文

### Request

```txt
GET https://www.baidu.com/ HTTP/1.1                 请求行
Host: www.baidu.com                                 请求首部Start
Connection: keep-alive
Upgrade-Insecure-Requests: 1
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8
Accept-Encoding: gzip, deflate, br
Accept-Language: zh-CN,zh;q=0.9
Cookie: BD_UPN=12314753; BAIDUID=E0F6577B684DB85DFCFA4261C4651DC7:FG=1; PSTM=1524902996; BIDUPSID=EADC64EBC64ADC032DD507CE9A3B015A; MCITY=-289%3A; ispeed_lsm=2; BDORZ=B490B5EBF6F3CD402E515D22BCDA1598; H_PS_PSSID=1439_26909_21113_26350_26920_22160; BD_CK_SAM=1; PSINO=5; H_PS_645EC=82b7hDUlpHfoKBJnLyG6t8vp5XqjkJBRaGfFLeAWDEASmhHmrTRTNo0LBeY; BDSVRTM=0                                                  请求首部End
                                                    空行(\r\n)
```

### Response

```txt
HTTP/1.1 200 OK                                     状态行
Bdpagetype: 1                                       响应首部Start
Bdqid: 0xa931799600026945
Cache-Control: private
Connection: Keep-Alive
Content-Encoding: gzip
Content-Type: text/html
Cxy_all: baidu+ad08bc06781b921abb5a08650fbbcf58
Date: Fri, 27 Jul 2018 06:24:23 GMT
Expires: Fri, 27 Jul 2018 06:24:14 GMT
Server: BWS/1.1
Set-Cookie: BDSVRTM=0; path=/
Set-Cookie: BD_HOME=0; path=/
Set-Cookie: H_PS_PSSID=1439_26909_21113_26350_26920_22160; path=/; domain=.baidu.com
Strict-Transport-Security: max-age=172800
Vary: Accept-Encoding
X-Ua-Compatible: IE=Edge,chrome=1
Transfer-Encoding: chunked                          响应首部End
                                                    空行(\r\n)
ffa                                                 报文主体Start
        y $ u' 7` Z     B '  W7 h(-23 *   <    k (RÑ 1 ht fe:fM iME f Q     |     = =<  qIC  Ό ۟   {   ^ z  7 

*** FIDDLER: RawDisplay truncated at 128 characters. Right-click to disable truncation. ***                               报文主体End
```

## 动词

- `GET` _获取资源_
- `POST` _传输实体主体_
- `PUT` _传输文件_
- `HEAD` _获得报文首部_
- `DELETE` _删除文件_
- `OPTIONS` _访问支持方法_
- `TRACE` _追踪路径_
- `CONNECT` _要求用隧道协议连接代理_

## HTTP 状态码([详细](http://tool.oschina.net/commons?type=5))

- `203` _非授权信息_
- `301` _永久重定向_
- `302` _暂时重定向_
- `307` _暂时重定向_
- `401` _未授权_
- `408` _请求超时_
- `502` _错误网关_
- `504` _网关超时_

## HTTP版本差异[源](https://www.cnbeta.com/articles/tech/835745.htm)

| HTTP 版本|特点| 缺点|
| :--- | :--- | :--- |
| HTTP/0.9 | 支持 Get 请求，不支持请求头|
| HTTP/1.0  | 支持 POST、HEAD 请求| 连接无法复用(每次都需要重新建立连接)，队头阻塞(下个请求必须在前一个请求返回后才能发出)，协议开销大，安全因素|
| HTTP/1.1  | Keep-Alive，pipeling | 连接无法复用(域名分片时仍需要建立多个连接)，队头阻塞(后面的请求要等到前一个请求处理完才按序返回)，协议开销大，安全因素 |
| HTTP/2| 基于 SPDY3，二进制传输数据，多路复用，header 压缩，服务端预推送 | 如果丢包需要重传效率可能不如 HTTP1.1 |
| HTTP/3| 基于 QUIC(UDP)，原生实现多路复用，加密认证的报文，前向纠错(丢一个包时可通过其他包计算出来) | 丢失多个包时仍需重传|

> HTTP/1 有连接无法复用、队头阻塞、协议开销大和安全因素等多个缺陷

> HTTP/2 通过多路复用、二进制流与 Header 压缩等技术，极大地提高了性能，但是还是存在一些问题

> HTTP/3 抛弃 TCP 协议，以全新的视角重新设计 HTTP。其底层支撑是 QUIC 协议，该协议基于 UDP，有 UDP 特有的优势，同时它又取了 TCP 中的精华，实现了即快又可靠的协议

## HTTPS[源](https://www.cnblogs.com/mddblog/p/6948980.html)

- [HTTPS 交互流程](http://7xs4tc.com1.z0.glb.clouddn.com/httpsCreat.png)

## REST API

| 方法|描述|幂等|
| :--- | :--- | :--- |
| GET | 查询操作 | <input type="checkbox" checked /> |
| POST | 新增操作 | <input type="checkbox" /> |
| PUT | 整体更新 | <input type="checkbox" checked /> |
| PATCH | 部分更新 | <input type="checkbox" /> |
| DELETE | 删除操作 | <input type="checkbox" checked /> |
| HEAD | 获取元数据，或检查API是否健康 | <input type="checkbox" checked /> |
| OPTIONS | 获取API相关信息 | <input type="checkbox" checked /> |
