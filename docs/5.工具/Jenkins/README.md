# Jenkins

## Pipeline

- node/agent 节点，一个机器，可以是 master 节点也可以是 slave 节点
  - 运行 pipeline 的脚本参数
    - any 可以在任何机器上执行
    - none 没有指定 agent 时默认
    - label 在指定标签上的节点上运行
- stage 阶段，定义流水线任务的概念性的不同阶段
- step 步骤，每个阶段要执行的步骤
- post 根据流水线的阶段的完成情况而运行一个或多个 stage
  - always 无论结果如何都执行
  - changed 阶段的完成状态与它之前的运行不同时执行
  - failure 失败后执行
  - success 成功后执行
  - unstable 构建不稳定时执行，通常在测试失败，代码违规时执行
  - aborted 取消后执行
- 指令
  - environment 定义环境变量
  - options 运行选项
    - buildDiscarder 为最近的水母运行的特定数量保存组件和控制台输出
    - disableConcurrentBuilds 不允许同时执行流水线
    - overrideIndexTriggers 允许覆盖分支索引触发器
    - skipDefaultCheckout 跳过从源代码控制中检出代码的默认情况
    - checkoutToSubdirectory 在工作空间的子目录中自动执行源代码控制检出
    - timeout 设置超时时间，超时后将中止
    - retry 指定重试次数
    - timestamps 预谋让控制台的输出与流水线发出的时间一致
  - parameters 提供给用户在触发水母时应该的参数列表
  - targgers 触发器，定义流水线的自动触发
    - cron 指定时间间隔
    - pollSCM 指定固定间隔，如果代码更新则触发
    - upstream 指定流（多个作业）和阀值，当任一达到阀值时触发
  - tools 指定构建工具
  - input 交互
    - message 显示的消息
    - id 可选，默认为 stage 名称
    - ok 指定表单ok按钮的文本
    - submitter 可选，逗号分割的用户列表或允许提交的外部组名
    - parameters 显示的可选的参数列表
  - when 条件执行
    - branch 指定分支
    - environment 当环境变量是给定值时
    - expression Groovy 表达式
    - not
    - allOf 所有条件都为真
    - anyOf 至少一个为真
  - parallel 并行
  - script 脚本

## 资料

- Jenkins 文档 <https://jenkins.io/doc/>
- Jenkins Pipeline 文档 <https://jenkins.io/doc/book/pipeline/>
