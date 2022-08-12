# Docker

## Install & Config

```shell
# 由于apt官方库里的docker版本可能比较旧，所以先卸载可能存在的旧版本：
$ sudo apt-get remove docker docker-engine docker.io
# 更新apt包索引
$ sudo apt-get update
# 安装以下包以使apt可以通过HTTPS使用存储库
$ sudo apt-get install \
      apt-transport-https \
      ca-certificates \
      curl \
      software-properties-common
# 添加Docker官方的GPG密钥
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# 设置stable存储库
$ sudo add-apt-repository \
     "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
     $(lsb_release -cs) \
     stable"
# 更新一下apt包索引
$ sudo apt-get update
# 最新版本的Docker CE
$ sudo apt-get install docker-ce=17.03.2~ce-0~ubuntu-xenial
# 添加docker用户组，可能已存在
$ sudo groupadd docker
# 将登陆用户加入到docker用户组中
$ sudo gpasswd -a $USER docker
# 更新用户组
$ newgrp docker
# 启动服务
$ sudo service docker start
# 测试 docker 是否可以正常使用
$ docker ps
```

## 常用命令

- `docker ps [-a]` --查看容器列表 -a 显示全部(包括未运行)
- `docker run <parameter> <image>:<tag>`
  - 常用参数
    - `--rm` --容器停止后自动删除
    - `--name <name>` --指定容器名
    - `-d` --后台运行容器
    - `-e <envName>:<envValue>` --设置容器内环境变量  
       e.g.:
      - `-e ASPNETCORE_URLS=http://*:80`
    - `-p <localPort>:<containerPort>` --容器内端口映射到主机端口  
       e.g.:
      - `-p 8080:80` --容器 80 端口映射到本机 8080 端口
      - `-p 8080` --容器 8080 端口映射到本机 8080 端口
      - `-p 127.0.0.1:80:8080` --容器 8080 端口映射到本机 127.0.0.1:80
    - `-v <local>:<container>` --挂载本地目录至容器内,可追加`--read-only`参数设为只读
  - e.g.:
    - `docker run -d redis`==`docker run -d redis:latest` --后台启动 redis 容器
    - `docker run --rm -v /root/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d -p 3307:3306 --name testmysql mysql:5.7` --后台启动 mysql 数据库,将 mysql 目录挂载至/root/MySQL 目录,并将容器 3306 端口映射到主机 3307 端口
- `docker logs <container>`
  - 常用参数
    - `-f` --跟踪日志输出
    - `--tail <num>` --显示最后 n 条
    - `-t` --显示时间戳
  - e.g.:
    - `docker logs --tail 100 tj.centanet.com`
- `docker start <container>` --启动容器
- `docker stop <container>` --停止容器
- `docker restart <container>` --重启容器
- `docker stats` --容器占用资源统计
- `docker top <container>` --容器中运行的进程信息
- `docker exec`
  - e.g.:
    - `docker exec -it tj.centanetn.com /bin/bash` --分配一个交互终端 并执行/bin/bash 命令
- `docker login -u <username> -p <password> <server>` --登录仓库
- `docker logout <server>` --登出
- `docker pull <image>:<tag>` --拉取远程镜像至本地
- `docker push <repository>/<image>:<tag>` --将本地镜像推至远程

## Dockerfile

```Dockerfile
  FROM microsoft/dotnet:2.1-sdk AS build
  WORKDIR /src
  COPY ./centanet.com ./centanet.com
  COPY ./Centanet.Common ./Centanet.Common
  COPY ./Centanet.Configuration ./Centanet.Configuration
  COPY ./Centanet.Domain ./Centanet.Domain
  WORKDIR "/src/centanet.com"
  RUN dotnet publish "centanet.com.csproj" -c Release -o /app

  FROM microsoft/dotnet:2.1-aspnetcore-runtime AS runtime
  ENV TZ=Asia/Shanghai
  RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /  etc/timezone
  WORKDIR /app
  COPY --from=build /app .
  ENTRYPOINT ["dotnet", "centanet.com.dll"]
```

## 资料

- Docker — 从入门到实践
  <https://yeasy.gitbooks.io/docker_practice/>
- Docker 官方文档 <https://docs.docker.com/>
