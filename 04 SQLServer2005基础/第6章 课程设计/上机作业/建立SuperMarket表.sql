--创建商品类别表
create table Category(
--类别主键
Cid int primary key identity(1,1),
--类别名称，不能为空是not null,不能重复是unique
--unique：定义唯一约束，规定该列的值不能重复
Cname nvarchar(10) not null unique,
Description nvarchar(20)
)

--创建商品信息表
create table Ware(
--商品的编号
Wid int primary key identity(1,1),
--商品的名称
Wname nvarchar(10)not null unique,
--商品的类别，与类别表建立关系，用Ware表中的cid设置外键连接到Category类别表中
Cid int not null foreign key references Category(Cid),
--商品的进价，必须大于0，用decimal（10,2）not null
PurchasePrice decimal(10,2) not null,
--商品售价
SalesPrice decimal(10,2) not null,
--商品库存量
Amount int not null
)

--创建员工表
create table Employee(
--员工编号
Eid int primary key identity(1001,1),
--员工姓名
Ename nvarchar(10) not null,
--员工密码
Epassword nvarchar(10) check(len(Epassword)>6),
--备注
Remark nvarchar(10)
)

--销售记录表
create table SalesInfo(
--主键，自动增长，从1开始
    Sid int primary key identity(1,1),
--所销售的商品的编号（外键），必填
    Wid  int not null foreign key references ware(Wid),
--商品销售的时间，必填
    SalesDate nvarchar(20) not null,--商品销售的数量，必填且必须大于0    SalesAmount int not null default 1,--收银员的编号（外键），必填    Eid int not null foreign key references Employee(Eid)
)