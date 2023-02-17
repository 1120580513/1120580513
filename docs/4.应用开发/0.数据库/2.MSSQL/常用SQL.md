# 常用 SQL

## 临时表

```sql
--局部临时表
SELECT * INTO #t FROM (VALUES(1,2,3),(4,5,6)) AS t(a,b,c)
--全局临时表
SELECT * INTO ##t2 FROM (VALUES(1,2,3),(4,5,6)) AS t(a,b,c)
```

## Select Remote DB

```sql
exec sp_addlinkedserver 'ITSV', ' ', 'SQLOLEDB', '远程服务器名或ip地址'
exec sp_addlinkedsrvlogin 'ITSV', 'false ',null, '用户名', '密码'
select * from ITSV.数据库名.dbo.表名
exec sp_dropserver 'ITSV ', 'droplogins'
```

## BULK 行集提供程序([官方文档](https://docs.microsoft.com/zh-cn/sql/relational-databases/import-export/use-a-format-file-to-bulk-import-data-sql-server?view=sql-server-2014))

```sql
SELECT * FROM OPENROWSET(BULK 'C:\WeekSpace\a.txt',FORMATFILE = 'C:\WeekSpace\a.fmt') AS x
```

`a.txt：`

```txt
a,b,c,d
x,y,z,c
q,w,e,r
u,i,y,p
```

`a.fmt：`

```fmt
9.0
4
1 SQLCHAR 0 100 "," 1 Col1 ""
2 SQLCHAR 0 100 "," 2 Col2 SQL_Latin1_General_CP1_CI_AS
3 SQLCHAR 0 100 "," 3 Col3 SQL_Latin1_General_CP1_CI_AS
4 SQLCHAR 0 100 "\r\n" 4 Col4 SQL_Latin1_General_CP1_CI_AS
```

## FOR XML

```sql
SELECT * FROM (VALUES(1)) AS t(n) FOR XML PATH('')
```

## 常用查询

```sql
SELECT * FROM sys.objects WHERE type = 'u'
SELECT * FROM sys.tables
SELECT * FROM sys.columns
SELECT * FROM sys.views
SELECT * FROM sys.procedures
SELECT * FROM sys.dm_exec_background_job_queue
-------------
SELECT * FROM sys.all_objects
SELECT * FROM sys.all_parameters
SELECT * FROM sys.all_columns
SELECT * FROM sys.all_views
SELECT * FROM sys.all_sql_modules
-------------
SELECT * FROM sys.sysprocesses--进程相关
SELECT * FROM sys.sysusers--用户相关
SELECT * FROM sys.dm_exec_connections--连接情况
SELECT session_id,status,login_name,login_time,* FROM sys.dm_exec_sessions--会话相关
SELECT sql_handle,* FROM sys.dm_exec_requests--请求相关
-------------
SELECT * FROM INFORMATION_SCHEMA.TABLES
SELECT * FROM INFORMATION_SCHEMA.VIEWS
SELECT * FROM INFORMATION_SCHEMA.COLUMNS
-------------
EXEC sys.sp_help
EXEC sys.sp_helpdb
EXEC sys.sp_helplogins
EXEC sys.sp_helpfile
-------------
exec sp_helpserver
SELECT * FROM OPENQUERY (
    [157], 
    'SELECT top 10 * FROM [DataBase].dbo.[Table]')
```

### 查询所有表和列和说明

```sql
SELECT
表名 = case when a.colorder=1 then d.name else '' end,
字段序号 = a.colorder,
字段名 = a.name,
标识 = case when COLUMNPROPERTY( a.id,a.name,'IsIdentity')=1 then '√'else '' end,
主键 = case when exists(SELECT 1 FROM sysobjects where xtype='PK' and parent_obj=a.id and name in (
SELECT name FROM sysindexes WHERE indid in( SELECT indid FROM sysindexkeys WHERE id = a.id AND colid=a.colid))) then '√' else '' end,
类型 = b.name,
占用字节数 = a.length,
长度 = COLUMNPROPERTY(a.id,a.name,'PRECISION'),
小数位数 = isnull(COLUMNPROPERTY(a.id,a.name,'Scale'),0),
允许空 = case when a.isnullable=1 then '√'else '' end,
默认值 = isnull(e.text,''),
字段说明 = isnull(g.[value],'')
FROM
syscolumns a
left join
systypes b
on
a.xusertype=b.xusertype
inner join
sysobjects d
on
a.id=d.id and d.xtype='U' and d.name<>'dtproperties'
left join
syscomments e
on
a.cdefault=e.id
left join
sys.extended_properties g
on
a.id=G.major_id and a.colid=g.minor_id
left join
sys.extended_properties f
on
d.id=f.major_id and f.minor_id=0
where
d.name='table_name' --如果只查询指定表,加上此红色where条件，tablename是要查询的表名；去除红色where条件查询说有的表信息
order by
a.id,a.colorder
```

### 查询阻塞与被阻塞[源](http://blog.itpub.net/29371470/viewspace-2128282)

```sql
SELECT
bl.spid blocking_session,bl.blocked blocked_session,st.text blockedtext,sb.text blockingtext
FROM(
	SELECT spid ,blocked
	FROM (SELECT * FROM sys.sysprocesses WHERE blocked>0 ) a
	WHERE NOT EXISTS(
		SELECT * FROM (SELECT * FROM sys.sysprocesses WHERE blocked>0 ) b WHERE a.blocked=spid)
	UNION
	SELECT spid,blocked FROM sys.sysprocesses WHERE blocked>0
) bl,(
    SELECT t.text ,c.session_id
    FROM sys.dm_exec_connections c
    CROSS APPLY sys.dm_exec_sql_text (c.most_recent_sql_handle) t
) st,(
    SELECT t.text ,c.session_id
    FROM sys.dm_exec_connections c
    CROSS APPLY sys.dm_exec_sql_text (c.most_recent_sql_handle) t
) sb
WHERE bl.blocked = st.session_id and bl.spid = sb.session_id
```

### 查询死锁[源](http://blog.itpub.net/29371470/viewspace-2128282)

```sql
SELECT * FROM master..SysProcesses
WHERE db_Name(dbID) = '数据库名'
AND spId <> @@SpId
AND dbID <> 0
AND blocked >0;
```

## 备份

```sql
*** 创建 备份数据的 device
USE master
EXEC sp_addumpdevice 'disk', 'testBack', 'c:\ \ mssql7backup\ \ MyNwind_1.
dat'
*** 开始 备份
BACKUP DATABASE pubs TO testBack
**分离
EXECUTE sp_detach_db ElmahLog
**附加
EXECUTE sp_attach_db 'C:/...'
**重命名
EXECUTE sp_renamedb 'old_name', 'new_name'
**删除
DROP DATABASE TestDB
```

## CREATE TABLE

```sql
USE [TripOrderDB]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF EXISTS(SELECT 1 FROM sys.tables WHERE object_id=OBJECT_ID('Order'))
DROP TABLE Order
GO
CREATE TABLE [dbo].[Order](
[OrderID] [bigint] IDENTITY(1,1) NOT NULL,
[OrderStateID] [int] NOT NULL DEFAULT (0),
[Amount] [money] NULL DEFAULT (0) CHECK(Amount>=0),
[ProductID] [int] NOT NULL DEFAULT (0),
[OrderCreatedTime] [datetime] NOT NULL DEFAULT(GETDATE()),
CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED
(
[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
,CONSTRAINT [FK_Outer] FOREIGN KEY (OrderStatuId) REFERENCES OrderStatus(Id)
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
--添加注释
EXECUTE sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单ID号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order', @level2type=N'COLUMN',@level2name=N'OrderID'
GO
EXECUTE sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order'
GO
```

## T-SQL

### 用户定义函数

```sql
----------标量函数
CREATE FUNCTION dbo.fn_sum(
@nbr INT
) RETURNS INT
AS
BEGIN
    RETURN @nbr * 2
END
GO
PRINT dbo.fn_sum(3)
----------表值函数
CREATE FUNCTION dbo.fn_rang(
@nbr INT
) RETURNS TABLE
AS
RETURN
WITH a AS(
SELECT 1 n
UNION ALL
SELECT 1 n FROM a
),t AS(
SELECT TOP 100 ROW_NUMBER() OVER(ORDER BY n) AS n FROM a
)
SELECT * FROM t WHERE n <= @nbr
GO
SELECT * FROM dbo.fn_rang(10)
```

### 存储过程

```sql
CREATE PROCEDURE dbo.proc_print(
@nbr INT
)AS
PRINT @nbr
GO
CREATE PROCEDURE dbo.#proc_print(
@nbr INT
)AS
PRINT @nbr
GO
CREATE PROCEDURE dbo.##proc_print(
@nbr INT
)AS
PRINT @nbr
GO
CREATE PROCEDURE dbo.proc_select(
@nbr INT,
@outnbr INT OUTPUT
)AS
BEGIN
    SET @outnbr = @nbr
  SELECT @nbr
END
GO
EXEC dbo.proc_print 1
EXEC dbo.#proc_print 1
EXEC dbo.##proc_print 1
GO
DECLARE @i INT
EXEC dbo.proc_select 1,@i OUTPUT
SELECT @i
```

### 错误处理

```sql
BEGIN TRY
SELECT 3/0
END TRY
BEGIN CATCH
SELECT ERROR_NUMBER(),ERROR_SEVERITY(),ERROR_STATE(),ERROR_PROCEDURE(),ERROR_LINE(),ERROR_MESSAGE()
END CATCH
```