# PowerDesigner

## Model 模型

- CDM Conceptual Data Model 概念模型 `数据库的全部逻辑关系，与任何软件和具体数据库无关`
- PDM Physical Data Model 物理模型 `数据库的物理实现`
- OOM Object Oriented Model 面对对象模型
- BPM Business Process Model 业务程序模型

## 常用流程

1. 创建 CDM
2. 生成 PDM(tools -> Generate Physical Data Model)
3. 生成数据库(Database–>Generate Database)
  - 勾选 Automatic archive
4. 生成数据库脚本(Database–>Apple Model Change to Database)
  - Get database schema 选择 Using an archive model 并指定步骤 3 生成的文件

### 从数据库生成 PDM

1. Database -> Configure Connections
2. Database -> Update Model from Database
