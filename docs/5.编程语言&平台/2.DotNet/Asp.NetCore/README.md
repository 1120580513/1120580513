# [Asp.Net Core](https://learn.microsoft.com/zh-cn/aspnet/core/fundamentals/host/generic-host?view=aspnetcore-6.0)

## Host

- Host.CreateDefaultBuilder 创建 `IHostBuilder`
  - 设置 `ContentRoot` = `GetCurrentDirectory`
  - 载入 Host 配置（环境变量 `DOTNET_`）
  - 载入应用配置（环境变量 `DOTNET_`）
    - appsettings.json
    - appsettings.{Environment}.json
    - 当 `Development` 环境时载入 UserSecrets
  - 添加日志支持者
    - Console
    - Debug
    - EventSource
    - EventLog（仅 Windows）
  - 当 `Development` 环境时，启用 Scope Validation 和 Dependency Validation（范围验证和依赖验证）
- ConfigureWebHostDefaults（配置 Web）（环境变量 `ASPNETCORE_`）
  - 设置 `Kestrel` 为服务器
  - 添加 `Host Filtering` 中间件
  - 如果指定了变量 `ASPNETCORE_FORWARDEDHEADERS_ENABLED`, 那么回启动forwarded headers中间件
  - 启用IIS集成
- ConfigureHostConfiguration（配置 Host）
- ConfigureAppConfiguration（配置 Host 会替代 ConfigureHostConfiguration（配置）

### 框架自动注册的服务

- `IHostApplicationLifetime`：Host 实现变化时的订阅
- `IHostLifetime`：Host 启动和停止
- `IHostEnvironment`
  - ApplicationName
  - EnvironmentName
  - ContentRootPath
- `IWebHostEnvironment : IHostEnvironment`
  - WebRootPath

## Startup.cs

- ConfigureService()
  - 在 Configure 前调用此方法
  - 注册服务
  - 绑定配置到 IOptions
- Configure()
  - 注册中间件以构成管道

## DI -> IoC

> 使用 `DI(依赖注入)` 达到 `IoC(控制反转)` 以使将流程委托给应用程序

- `Transient`：每次请求均会创建新的
- `Scoped`：每个请求会创建新的
- `Singleton`：单例

> 可以从 `HttpContext.RequestService` 获取 `Scoped` 范围的服务

> 不要在Singleton范围内调用scoped或者transient范围的服务， 无论是直接调用还是间接调用

> 保持创建服务的工厂方法快而且简单

> 避免使用类似GetService来取得服务，而是通过DI

## Middleware

- `Run扩展方法`：短路中间件，无法执行下一个中间件，一般放最后一个
- `Use扩展方法`：把中间件连接，一般使用这个
- `UseWhen`：给定条件是否要执行某个分支，执行后回到主线
- `Map扩展方法`：需要符合路径则执行
- `MapWhen`：给定条件是否要执行某个分支，执行后不回到主线
- `UseMiddleware<T>`：自定义中间件

<img src="/img/middleware-pipeline.svg" />

## Options Pattern

- IConfiguration.GetSection("Position").Bind(optionObj)
- IConfiguration.GetSection("Position").Get\<OptionType\>()
- DI
  - 配置 IServiceCollection.Configure\<OptionType\>(IConfiguration.GetSection("Position")) 
  - 使用
    - IOptions Singleton 不可感知配置变化
    - IOptionSnapshot Scope 可感知配置变化
    - IOptionsMonitor 可感知配置变化，同时支持命名选项

## 扩展

### IHostingStartup

> 从外部库添加功能或配置

- 定义
  - 无入口
  - 实现 IHostingStartup
  - assembly: HostingStartup(typeof(namespace.className))
- 使用
  1. 设置环境变量 `ASPNETCORE_HOSTINGSTARTUPASSEMBLIES` 指定程序集
  2. 通过 `IWebBuilder` 的 `UseSetting` 指定程序集

### IStartupFilter

> 构建配置管道的管道（`Configure`），在 `IHostBuilder` 的 `Build()` 时执行

- 定义
  - 实现 IStartupFilter
- 使用 
  - 在 `ConfigureService` 中注册

### ApplicationPart

> 动态加载外部页面
