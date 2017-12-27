--新建数据库
create database Supermarket on(
             --定义数据库主文件名
              name = 'Supermarket',
             --定义数据库主文件路径
             filename = 'd:\Supermarket.mdf',
             --定义初始容量
             size = 3MB,
             --定义最大容量
             maxsize = 50MB,
             --定义增长容量
             filegrowth = 2MB
)
--新建日志文件
log on(
             --定义日志文件名
             name = 'Supermarket_log',
             --定义日志文件路径
             filename = 'd:\Supermarket_log.ldf',
             --定义初始容量
             size = 2MB,
             --定义最大容量
             maxsize = 50MB,
             --定义增长容量
             filegrowth = 10%
)
--删除数据库
drop database Supermarket