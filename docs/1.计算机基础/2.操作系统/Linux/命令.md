# Linux

## 目录

|dirname| |
|---:|:---|
|/bin|命令保存目录（普通用户就可以读取的命令）|
|/boot|启动目录，启动相关文件|
|/dev|设备文件保存目录|
|/etc|配置文件保存目录|
|/home|普通用户的家目录|
|/lib|系统库保存目录|
|/mnt|系统挂载目录|
|/media|挂载目录|
|/root|超级用户的家目录|
|/tmp|临时目录|
|/sbin|命令保存目录（超级用户才能使用的目录）|
|/proc|直接写入内存的|
|/sys|将内核的一些信息映射，可供应用程序所用|
|/usr|系统软件资源目录|
|/usr/bin/|系统命令（普通用户）|
|/usr/sbin/|系统命令（超级用户）|
|/var|系统相关文档内容|
|/var/log/|系统日志位置|
|/var/spool/mail/|系统默认邮箱位置|
|/var/lib/|默认安装的库文件目录|

## 命令

|command|location|e-meaning|cn-meaning|example||
|:---|:---|:---:|:---|:---|:---|
|ls|/bin/ls|list|显示目录文件|ls|显示当前目录下文件|
|||||ls -l|长格式显示文件|
|||||ls -a|显示所有文件|
|||||ls -h|文件大小显示为常见单位|
|||||ls -d|显示目录本身|
|||||ls -lahd|
|cd|shell|change directory|切换所在目录|cd /|进入根目录|
|||||cd ~|进入 Home 目录|
|||||cd -|进入上次目录|
|||||cd ..|进入上一级目录|
|||||cd .|进入当前目录|
|pwd|/bin/pwd|print working directory|显示当前所在目录|pwd|
|mkdir|/bin/mkdir|make directories|建立目录|mkdir test|
|||||mkdir -p test1/test2/test3|递归创建|
|rmdir|/bin/rmdir|remove empty directories|删除空目录|rmdir test|
|touch|/bin/touch||创建空文件 或 修改文件时间|touch test.py|创建空文件，如果文件存在，则修改文件创建时间|
|rm|/bin/rm|remove|删除|rm 文件名|删除文件|
|||||rm -r 目录名|递归删除文件和目录|
|||||rm -f 文件名|强制删除|
|||||rm -rf 目录名|强制删除目录和文件|
|cat|/bin/cat||查看文件所有内容|cat 文件名|查看文件所有内容|
|||||cat -n 文件名|查看文件内容，并列出行号|
|more|/bin/more||分屏显示文件内容|more 文件名|分屏显示文件内容|
|||||空格键|向上翻页|
|||||b键|向下翻页|
|||||q键|退出查看|
|head|/usr/bin/head||显示文件头|head 文件名|显示文件头|
|||||head -n 20 文件名|显示文件前20行|
|||||head -n -20 文件名|显示文件最后20行|
|||||ctrl + c|强制终止查看模式|
|||||ctrl + l|清屏|
|tail|||显示文件的结尾几行|tail 文件名|默认是10行|
|||||tail -n 20 文件名|显示文件最后20行|
|||||tail -f 文件名|显示文件最后20行，每一秒刷新一次|
|ln|/bin/ln|link|链接文件|ln -s 源文件 目标文件|创建链接文件(文件名都必须写绝对路径)|
|cp|/bin/cp|copy|复制文件或目录|cp 源文件 目标位置|复制|
|||||cp 源文件 目标位置/目标名称|复制并改名|
|||||cp -r|复制目录|
|||||cp -p|连带文件属性一起复制|
|||||cp -d|若源文件是链接文件，则复制链接属性|
|||||cp -a|相当于 cp -pdr|
|mv|/bin/mv|move|移动文件|mv /root/test /tmp/|将/root/下的test文件移动到/tmp/目录下|
|||||mv /root/test /root/newtest|将/root/下的test文件改名为newtest|
|chmod|/bin/chmod|change the permissions mode of a file|修改权限|chmod u+x aa|aa文件的属主加上执行权限|
|||||chmod u+x aa|aa文件的属主加上执行权限|
|||||chmod u-x aa|aa文件的属主减去执行权限|
|||||chmod g+w,o+w aa|aa文件的属组和其他人加上写权限|
|||||chmod u=rwx aa|aa文件的用户权限改为所有权限(读+写+执行)|
|||||chmod 755 aa|aa文件的属主权限是rwx，属组和其他人是rx|
|||||chmod 644 aa|aa文件的属主权限是rw，属组和其他人是r|
|chown|/bin/chown|change file ownership|修改文件的属主或属组|chown 用户名 文件名|改变文件属主|
|||||chown user1 aa|user1必须存在|
|||||chown user1:user1 aa|改变属主同时改变属组|
|useradd|||添加用户|useradd 用户名|
|passwd|||设定用户密码|passwd 用户名|
|ping|/bin/ping||测试网络畅通性|ping -c 次数 ip|
|ifconfig|/sbin/ifconfig|interface configure|查询本机网络信息|
|man||manual|查看命令的帮助|
|reboot|/sbin/reboot||关机/重启挂载|
|shutdown|/sbin/shutdown||关机/重启|shutdown -h now|关机|
|||||shutdown -r now|重启|
|--help|||查看命令的帮助|
|whereis|/usr/bin/whereis||查找命令的命令，同时看到帮助文档位置|
|find|/usr/bin/find|find 查找位置 -name 文件名|搜索命令|find / -name aabbcc|查找/目录下名为 aabbcc的文件|
|||||-name|按照文件名查找|
|||||-iname|按照文件名查找，不区分大小写|
|||||-user|按照属主用户名查找文件|
|||||-group|按照属组组名查找文件|
|||||-nouser|找没有属主的文件 (除了这三个文件：/proc、/sys、/mnt/cdrom)|
|||||-size|按照文件大小k M  如：find / -size +50k|
|||||-type|按照文件类型查找(f=普通  d=目录  l=链接)|
|||||-perm|按照权限查找 如：find /root -perm 644|
|grep|/bin/grep||查找符合条件的字串|grep 选项 '字串' 查找路径|
|||||grep -i "root" /etc/passwd|-i 忽略大小写、-v 反向选择|
|||||cat 文件名|grep '字串'|提取含有字符串的行|
|tar|||压缩/解压|tar -zcvf aa.tar.gz aa|-z 识别.gz格式、-c 压缩、-v 显示压缩过程、-f 指定压缩名、-t 只看不解压|
|||||tar -zxvf  压缩文件名|解压缩同时解打包|
|||||tar -jcvf 压缩文件名 源文件|压缩同时打包|
|||||tar -jxvf aa.tar.bz2|解打包同时解压缩|
|||||tar -ztvf aa.tar.gz|查看不解压|
|||||ar -jxvf root.tar.bz2 -C /tmp/|指定解压缩位置|

### ls -a 长格式显示项

|-rw-------|59|root|root|1190|08-10 23:37|filename.conf|
|---|---|---|---|---|---|---|
|权限位|引用计数|属主|属组|大小|最后修改时间|文件名|

#### 权限位

> 共 10 位

|range|example|meaning|example2|example3|
|:---|:---|:---|:---|:---|
|1|-|普通文件|
||d|目录文件|
||l|链接文件|
|2-10|代表各用户的权限|<------->|权限对文件的含义|权限对目录的含义|
|2-4|r 4 读|属主权限u|取文件内容|可以查询目录下文件名|
|5-7|w 2 写|属组权限g|编辑、新增、修改文件内容|具有修改目录结构的权限|
|8-10|x 1 执行|其他人权限o|可执行|可以进入目录|

### man

> man <种类> 命令

#### 种类

1. 可执行程序或 Shell 命令
2. 系统调用
3. 库函数
4. 文件（如/etc/passwd）
5. 特殊文件（如/dev下）
6. 游戏
7. 杂项
8. 系统管理命令（通常只能被root用户使用）
9. 内核子程序