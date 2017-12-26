--新建数据库
create database Supermarket on(
name='supermarket_dmf',
filename='D:\supermarket_dmf.mdf',
size=4MB,
maxsize=80MB,
filegrowth=2MB
)
--新建数据库日志文件
log on(
name='supermarket_log',
filename='C:\supermarket_log.ldf',
size=2MB,
maxsize=50MB,
filegrowth=10%
)
