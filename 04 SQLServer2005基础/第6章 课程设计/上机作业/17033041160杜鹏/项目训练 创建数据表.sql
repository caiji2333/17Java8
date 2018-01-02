--新建商品类别表Category
create table Category(
--类别主键
Cid int primary key identity(1,1),
--类别名称，not null,不能重复
Cname nvarchar(20)not null unique,
--类别描述
Description nvarchar(20)
)


--新建商品信息表Ware
create table Ware(
--商品编号
Wid int primary key identity(1,1),
--商品名称
Wname nvarchar(20)not null unique,
--商品所属类别
Cid int not null foreign key references Category(Cid),
--商品进价
PurchasePrice decimal(10,2) not null,
--商品售价
SalesPrice decimal(10,2) not null,
--商品库存
Amount int not null,
)


--新建员工表Employee
create table Employee(
--类别主键
Eid int primary key identity(1001,1),
--员工姓名
Ename nvarchar(20)not null unique,
--员工密码
Epassword varchar(10) check(len(Epassword)>6),--备注
Remark nvarchar(20),
)


--新建销售记录表SalesInfo
create table SalesInfo(
--主键
Sid int primary key identity(1,1),
--所销售的商品的编号
Ｗid int not null foreign key references Ware(Wid),
--商品销售的时间 
SalesDate datetime not null,--商品销售的数量SalesAmount int not null unique,--收银员的编号Eid int not null foreign key references Employee(Eid),)--删除数据表--删除商品类别表drop table Category--删除商品信息表drop table Ware--删除员工表drop table Employee--删除商品销售记录表drop table SalesInfo