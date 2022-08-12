# NodeJS

## 模块文件

> 每个模块文件，都有 require、exports、module 三个对象

### 模块分析顺序

1. 缓存
2. 核心模块
3. 路径
4. 自定义模块 _通过 module.paths 查找_

### 文件定位

1. .js
2. .node
3. .json

### 编译

- .js：通过 fs 模块读取并编译
- .node：.node 通常是 ccpp 写的扩展文件，通过 dlopen 加载然后编译
- .json：通过 fs 读取，然后通过 JSON.parse 解析并返回结果
  > .node 文件在 window 下为.dll，在\*nix 下是.os 文件

## 包文件

### 结构

- **package.json** _描述文件_
- **bin** _用于存放可执行二进制文件的目录_
- **lib** _用于存放 JavaScript 代码的目录_

### 兼容上下文

```javascript
(function(name, definition) {
  //检查上下文是否为AMD或CMD环境
  var hasDefine = typeof define === "function",
    //检查上下文是否为Node环境
    hasExports = typeof module !== "undefined" && module.exports;

  if (hasDefine) {
    //AMD 或 CMD 环境
    define(definition);
  } else if (hasExports) {
    //Node 环境
    module.exports = definition();
  } else {
    this[name] = definition();
  }
})("hello", function() {
  var hello = function() {
    console.info("hello");
  };
  return hello;
});
```

## AIO

- **process.nextTick** 队列，O(1)，优先级最高
- **setTimeout** 红黑树，O(lg(n))，优先级中等
- **setImmediate** 每次循环执行一个，优先级低

## Npm

```shell
# 安装
npm install package
# cnmp 淘宝镜像
npm install -global cnpm --registry=https://registry.npm.taobao.org
# nodemon、dev-server  监视文件夹，自动重启
cnmp install --save-dev nodemon
# json-server 以json文件开启数据接口服务
cnmp install --save-dev json-server
```
