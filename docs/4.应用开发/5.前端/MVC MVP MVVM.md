# MVC MVP MVVM

> 常见的软件架构设计模式，抽象为 视图、逻辑、数据

## MVC

- Model 数据层
- View 视图
- Controller 逻辑

> 逻辑的代码各自汇聚，各层之间通信没有严格限制，实际中各有实现

## MVP

- Presenter 其实就是 Controller 只是为了与 MVC 区分开

> 在 MVC 的基础上限制了通信方式，Model 和 View 之间不直接通信，都通过 Presenter

## MVVM

- VM ViewModel 视图模型

> VM 自动同步数据到视图，解决 MVP 中需要手动同步的问题