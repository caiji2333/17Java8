
create database Supermarket on(
name = 'marketmdf',
filename = 'C:\Supermarket.mdf',
size = 3MB,
maxsize = 50MB,
filegrowth = 10MB
)
log on (
name = 'marketldf',
filename = 'C:\Supermarket_log.ldf',
size = 2MB,
maxsize = 50MB,
filegrowth = 10%
)