--商品类别表
create table Category(
cid int primary key identity(1,1),
--定义名字不为空
cname nvarchar(10)not null unique,
--类别描述，可以为空
Description nvarchar(10) null
)
--商品信息表
create table Ware(
wid int primary key identity(1,1),
--定义商品名字不为空且不重复
Wnam nvarchar(10)not null unique,
--定义外键与表一连接
Cid int foreign key references Category(cid),
--定义商品进价，必须大于0
PurchasePrice decimal(10,2) not null,--定义商品售价，必须大于0SalesPrice decimal(10,2) not null,
--定义商品库存量，必须大于0Amount decimal(10,2)not null
)
--员工表
create table Employee(
Eid int primary key identity(1001,1),
--定义员工名字不为空
Ename nvarchar(10)not null,
--定义员工密码，不少于六位(长度)
Epassword varchar(10) check(len(Epassword)>6),--备注Remark nvarchar(10) null
)
--销售记录表
create table SalesInfo(
Sid int primary key identity(1,1),
--所销售的商品的编号wid int foreign key references Ware(Wid),--商品销售的时间SalesDate nvarchar(10)not null,--商品销售的数量，必填且必须大于0SalesAmount decimal(10,2)not null ,--收银员的编号（外键）eid int foreign key references Employee(Eid),
)
--删除
drop table Category
drop table Ware
drop table Employee
drop table SalesInfo
