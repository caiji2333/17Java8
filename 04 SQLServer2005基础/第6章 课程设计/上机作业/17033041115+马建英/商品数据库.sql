--新建数据库
create database SuperMarket on(
name='SuperMarket',
filename='D:\SuperMarket',
size=3MB,
maxsize=20,
filegrowth=3MB
)
--新建日志文件
log on(
name='SuperMarket_log',
filename='D:\SuperMarket_log.mdf',
size=3MB,
maxsize=20,
filegrowth=10%
)
--删除数据库
drop database SuperMarket