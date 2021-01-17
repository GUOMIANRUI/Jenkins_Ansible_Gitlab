# 基于Jenkins集成Ansible与Gitlab实现Wordpress的自动化部署

## 简介

通过Jenkins下Pipeline Job实现Nginx+MySQL+PHP+Wordpress自动化部署交付

## 项目环境

|    服务器IP    |    系统版本     |      功能       |                           演示地址                           |
| :------------: | :-------------: | :-------------: | :----------------------------------------------------------: |
| 49.234.26.139  | CentOS 7.5 64位 | Jenkins+Ansible | http://49.234.26.139:8081/login?from=%2F <br />admin  |
| 49.232.126.90  | CentOS 7.5 64位 |     Gitlab      |        http://49.232.126.90:8091/ <br />root         |
| 180.163.84.151 | CentOS 7.5 64位 |    交付对象     |                 http://180.163.84.151:8092/                  |

## 最终效果

### Jenkins

http://49.234.26.139:8081/login?from=%2F  admin

![](https://img.imgdb.cn/item/6002c3fa3ffa7d37b3efd321.png)

### Gitlab

http://49.232.126.90:8091/    root

![](https://img.imgdb.cn/item/6002c60e3ffa7d37b3f0d795.png)

### Wordpress

http://180.163.84.151:8092/

![](https://img.imgdb.cn/item/6002c65a3ffa7d37b3f0feb6.png)