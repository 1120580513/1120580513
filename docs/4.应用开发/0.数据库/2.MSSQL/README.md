# MSSQL

## 系统数据库

- master 记录所有系统级信息
- msdb 用于代理计划警报和作业 
  - 维护完整的联机备份和还原历史记录
- model，模板数据库，修改后将应用到后续创建的数据库
- Resource(mssqlsystemresource) 只读数据库（隐藏的），保存系统对象，逻辑上显示在每个数据库的 sys 中
- tempdb 保存临时对象或中间结果集
  - 显示创建的临时用户对象，全局或局部临时表及索引、临时存储过程、表变量、表值函数返回的表或游标
  - tempdb 的操作是最小日志记录操作，以便回滚事务
  - 每次启动 SQL Server 时会重新创建 tempdb，断开连接后会自动删除临时表和存储过程
  - 数据库引擎创建的内部对象
    - 用于假脱机、游标、排序和临时大型对象存储的中间结果的工作表
    - 用于哈希联接或哈希聚合操作的工作文件
    - 创建或重新生成索引等操作的中间排序结果，或 GROUP BY/ORDER BY/UNION 查询的中间排序结果
    - 版本存储区，数据页的集合
      - 由版本控制隔离或快照隔离事务使用 READ COMMITED 的数据修改事务生成的行版本
      - 由数据修改事务为实现联机索引操作、多重活动结果集、AFTER 触发器等功能而生成的行版本

## 锁

- `HOLDLOCK`：_在该表上保持共享锁，直到整个事务结束，而不是在语句执行完立即释放所添加的锁_
- `NOLOCK`：_不添加共享锁和排它锁，当这个选项生效后，可能读到未提交读的数据或“脏数据”，这个选项仅仅应用于SELECT语句_
- `PAGLOCK`：_指定添加页锁（否则通常可能添加表锁）_
- `READCOMMITTED`：_用与运行在提交读隔离级别的事务相同的锁语义执行扫描。默认情况下，SQL Server 2000 在此隔离级别上操作_
- `READPAST`：_跳过已经加锁的数据行，这个选项将使事务读取数据时跳过那些已经被其他事务锁定的数据行，而不是阻塞直到其他事务释放锁，READPAST仅仅应用于READ COMMITTED隔离性级别下事务操作中的SELECT语句操作_
- `READUNCOMMITTED`：_等同于NOLOCK_
- `REPEATABLEREAD`：_设置事务为可重复读隔离性级别_
- `ROWLOCK`：_使用行级锁，而不使用粒度更粗的页级锁和表级锁_
- `SERIALIZABLE`：_用与运行在可串行读隔离级别的事务相同的锁语义执行扫描。等同于 HOLDLOCK_
- `TABLOCK`：_指定使用表级锁，而不是使用行级或页面级的锁，SQL Server在该语句执行完后释放这个锁，而如果同时指定了HOLDLOCK，该锁一直保持到这个事务结束_
- `TABLOCKX `：_指定在表上使用排它锁，这个锁可以阻止其他事务读或更新这个表的数据，直到这个语句或整个事务结束_
- `UPDLOCK `：_指定在读表中数据时设置更新 锁（update lock）而不是设置共享锁，该锁一直保持到这个语句或整个事务结束，使用UPDLOCK的作用是允许用户先读取数据（而且不阻塞其他用户读数据），并且保证在后来再更新数据时，这一段时间内这些数据没有被其他用户修改_

## 其他功能

- hierarchyid 层次结构数据，用于表示层次结构数据

## 文章/链接

- [SQL Server 不按预期工作的 10 件事](http://blog.jobbole.com/44050/)
- [Microsoft Sql Server Doc](https://docs.microsoft.com/zh-cn/sql/relational-databases/hierarchical-data-sql-server?view=sql-server-ver15)