--新建商品类别表
create table Category(
--列名，数据类型，约束
--primary key主键
--identity(1,1)自动增长
Cid int primary key identity(1,1),
--列名，数据类型，约束
--not null 不允许为空
Cname nvarchar(20) not null unique,
Description nvarchar(20)
)
--unique：定义唯一约束，规定该列的值不能重复。--商品类别：食品类、日化用品、服装类、家电类

--新建商品信息表
create table Ware(
Wid int primary key identity(1,1),
Wnmae varchar(10) not null unique,
Cid int not null foreign key references Category(Cid),
--进价
PurchasePrice decimal(10,2) not null,
--售价
SalesPrice decimal(10,2) not null,--卖出Amount decimal(10,2) not null
)


--新建员工表
create table Employee(
Eid int primary key identity(1001,1),
--姓名
Enmae varchar(50) not null,
--员工密码Epassword varchar(10) check(len(Epassword)>6),--员工备注
Remark varchar(20)
)


--新建销售记录表
create table SalesInfo(
Sid int primary key identity(1,1),
--所销售的商品的编号（外键），必填
Wid int not null foreign key references Ware(Wid),
--销售时间
SalesDate nvarchar(20) not null,
--销售数量
SalesAmount smallint check(len(SalesAmount)>0),--收银员的编号（外键），必填Eid int not null foreign key references Employee(Eid),
)


--删除数据表
drop table Employee

--新建数据表：数据类型, 约束(主键)