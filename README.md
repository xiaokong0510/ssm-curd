## 整合SSM

整合SSM的一个小demo，简易的员工信息管理系统，具备基本增删改查功能，功能点包括：

1. 分页展示员工信息
2. 可以对员工信息进行新增、修改、单个删除和批量删除
3. 对输入的信息进行数据校验：JQuery前端校验+JSR303后端校验
4. Rest风格的URI：GET（查询），POST（新增），PUT（修改），DELETE（删除）

参考视频：B站 雷丰阳老师 尚硅谷SSM框架实战，ssm整合教程 https://www.bilibili.com/video/BV17W411g7zP

技术点：

- 基础框架-SSM（SpringMVC+Spring+MyBatis）
- 数据库-MySQL
- 前端框架-BootStrap快速搭建简洁美观的界面
- 异步请求-Ajax
- 分页插件-PageHelper
- 逆向工程-MyBatis Generator

### 配置地狱

Spring人称“配置地狱”，各种xml配置文件，[详细配置文件笔记](https://github.com/xiaokong0510/ssm-curd/blob/master/%E6%95%B4%E5%90%88SSM(%E4%B8%80)--%E9%85%8D%E7%BD%AE%E6%96%87%E4%BB%B6.md)
