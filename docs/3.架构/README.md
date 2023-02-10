# 架构

> 架构是为了解决软件复杂试

## 复杂度来源

- 高性能
- 高可用
- 可扩展
- 成本
- 安全
- 规模

## CAP

> 在一个分布式系统（指互相连接并共享数据的节点的集合）中，当涉及读写操作时，只能保证一致性（Consistence）、可用性（Availability）、分区容错性（Partition Tolerance）三者中的两个，另外一个无法保证

> 在分布式环境下，因为网络本身无法做到 100%可靠，所以在发生分区现象时分区容错性（Partition Tolerance）是必选的

### 一致性（Consistency）

> 对某个指定的客户端来说，读操作保证能够返回最新的写操作结果

### 可用性（Availability）

> 非故障的节点在合理的时间内返回合理的响应（不是错误和超时的响应）

### 分区容忍性（Partition Tolerance）

> 当出现网络分区后，系统能够继续 “ 履行职责 ”

## BASE

> 指基本可用（Basically Available）、软状态（Soft State）、最终一致性（Eventual Consistency）

> 核心思想是即使无法做到强一致性（CAP 的一致性就是强一致
> 性），但应用可以采用适合的方式达到最终一致性

### 基本可用（Basically Available）

> 分布式系统在出现故障时，允许损失部分可用性，即保证核心可用

### 软状态（Soft State）

> 允许系统存在中间状态，而该中间状态不会影响系统整体可用性

### 最终一致性（Eventual Consistency）

> 系统中的所有数据副本经过一定时间后，最终能够达到一致的状态

## FMEA
