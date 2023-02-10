# ABP

## 基础 

- 模块化
  - AbpModule
  - 依赖注入
    - 生命周期接口
      - ITransientDependency 
      - ISingletonDependency  
      - IScopedDependency  
    - DependencyAttribute
    - ExposeServices 指定公开接口
- 异常
  - RemoteServiceErrorResponse
    - IHasErrorCode
    - IHasErrorDetails
    - IHasValidationErrors
    - IHasLogLevel
  - BusinessException
  - IUserFriendlyException
- 权限
  - PermissionDefinitionProvider 
- 缓存
  - IDistributedCache\<TCacheItem>
  - IDistributedCache\<TCacheItem, TCacheKey>
- 设置管理
  - SettingDefinitionProvider 
  - ISettingProvider

## 基础设施

- 后台服务
  - IBackgroundWorker
  - IBackgroundJob\<TArgs>
  - IBackgroundJobManager
- 事件总线
  - ILocalEventBus
  - ILoaclEventHandler\<TEvent> 
- 分布式锁
  - IAbpDistributedLock.TryAcquireAsync()
- 虚拟文件
  - AbpVirtualFileSystemOptions
  - IVirtualFileProvider
- 数据过滤
  - ISoftDelete
  - IMultiTenant
- 当前用户
  - ICurrentUser
- 对象映射
  - ObjectMapper
- GUID 生成
  - IGuidGenerator
- 时钟
  - IClock

## 架构

- 模块化
  - AbpModule 应用程序模块
    - PreConfigureServices()  
    - ConfigureServices()
    - PostConfigureServices()
    - OnPreApplicationIniatialization() 
    - OnApplicationIniatialization() 构建管道
    - OnPostApplicationIniatialization() 
    - OnApplicationShutdown
  - DependsOn
- DDD
  - Entity
    - override GetKeys() 声明复合键
    - EntityEquals() 检查实体对象是否相等
  - ObjectValue
    - override GetAtomicValues() 必须实现来返
    回原始值
    - ValueEquals() 检测两个值是否相等
  - DomainService
    - 使用 Manager/Service 后缀
    - 
- 最佳实践
  - 实体
    - 定义 protected 的无参构造函数兼容 ORM
    - 非私有的属性与方法定义为 virtual，预留代理的可能
    - 聚合根
      - AggregateRoot\<TKey>
      - CreationAuditedAggregateRoot\<TKey>
      - AuditedAggregatieRoot\<TKey>
  - 仓储
    - 接口定义在领域层中
    - 针对每个聚合根定义仓储接口
    - 每个异步仓储接口增加 cancellationToken
    - 返回单个实体的方法添加 includeDetails = true
  - 应用程序服务
    - 在 Application.Contracts 中为每个应用服务定义接口
    - 名称后缀使用 AppService，且类名不包含实体名称
    - 方法的请求和返回均使用 DTO，且返回定义基础和详细 DTO
    - GetAsync/GetListAsync/Create/Update/Delete/Upsert 做常用实体操作命名
    - 总是先获取实体再进行操作
    - DTO
      - 在 Application.Contracts 中定义
      - 标识为 Serializable
      - 可从预构建的类继承
        - ExtensibleAuditedEntityDto\<TKey>
        - EntiyDto\<TKey>
        - CreationAuditedEntityDto\<TKey>
        - AuditedEntityDto\<TKey>
        - FullAuditedEntityDto\<TKey>