# SQL

> [SQL 标准](https://blog.csdn.net/lengye7/article/details/80606489)

> 绝大多数人提起 SQL 标准，涉及的内容其实是`SQL92`里头最基本或者说最核心的一部分。SQL92 本身是分级的，包括`入门级`、`过度级`、`中间级`和`完全级`。为了验证具体的产品对标准的遵从程度，NIST 还曾经专门发起了一个项目，来做标准符合程度的[测试集合](http://itl.nist.gov/div897/ctg/sql_form.htm)。不过，SQL 标准包含的内容实在太多了，而且有很多特性对新的 SQL 产品而言也越来越不重要了。从 SQL99 之后，标准中符合程度的定义就不再分级，而是改成了核心兼容性和特性兼容性；也没有机构来推出权威的 SQL 标准符合程度的测试认证了。

- DCL Data Control 数据控制语言 权限/监视
- DDL Data Definition 数据定义语言 create/drop/alter
- DML Data Manipulation 数据操纵语言 insert/delete/update
- DQL Data Query 数据查询语言 select
- DPL Data Processing 事务控制语言
- CCL Cursor Control 指针控制语言 游标

## SQL 优化

- **对于存储固定长度的字段使用 CHAR 不要使用 VARCHAR**
- **使用 TEXT 存储大块的文本**
- **使用 INT 存储大数字**
- **使用 DECIMAL 存储货币可避免浮点数表示错误**
- **如果字段可以为 NOT NULL，最好设为 NOT NULL**
- **VARCHAR(255)是以 8 位数字存储的最大字符数，在某些 RDBMS 中，可最大限度利用字节**
- **避免高成本的 JOIN 操作**
- **将热点数据拆分到单独的数据表中，有利于缓存**

## 链接/文章

- [十个你认为不可能的 SQL 技巧](https://blog.jooq.org/2016/04/25/10-sql-tricks-that-you-didnt-think-were-possible/?utm_source=dbweekly&utm_medium=email)
