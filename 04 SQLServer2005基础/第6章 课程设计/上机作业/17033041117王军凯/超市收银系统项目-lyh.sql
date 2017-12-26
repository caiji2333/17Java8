--创建商品类别表 （Category）
create table Category(
Cid int primary key identity(1,1),
Cname nvarchar(20) unique not null,
Description nvarchar(25) null 
)
--创建商品信息表 （Ware）
create table Ware(
Wid int primary key,
Wname nvarchar(30) unique not null,
Cid int not null foreign key references Category(Cid),
PurchasePrice decimal(10,2) not null,
SalesPrice decimal(10,2) not null,
Amount decimal(10,2) not null
)

--创建员工表 （Employee）
create table Employee(
Eid int primary key identity(1001,1),
Ename nvarchar(4) not null,
Epassword nvarchar(10) check(len(Epassword)>6),
Remark nvarchar(50)
)

--创建销售记录表 （Salesinfo）
create table Salesinfo(
Sid int primary key identity(1,1),
Wid int foreign key references Ware(Wid) not null,
SalesDate datetime not null,
SalesAmount decimal(10,2) not null,
Eid int not null foreign key references Employee(Eid)
)

--添加数据于 商品类别表（Category）
insert into Category(cname,description) values('食品类','可食用')
insert into Category(cname,description) values('日化类','可使用')
insert into Category(cname,description) values('服装类','可穿着')
insert into Category(cname,description) values('家电类','可摆设')

--添加数据于 商品信息表 （Ware）
insert into Ware(Wid,Wname,Cid,PurchasePrice,SalesPrice,Amount)values('61601','康帅傅方便面',1,'3.8','5','500')
insert into Ware(Wid,Wname,Cid,PurchasePrice,SalesPrice,Amount)values('61602','农夫三泉矿泉水',1,'0.1','2','6000')
insert into Ware(Wid,Wname,Cid,PurchasePrice,SalesPrice,Amount)values('61603','嘿人牙膏',2,'2.3','6','2333')
insert into Ware(Wid,Wname,Cid,PurchasePrice,SalesPrice,Amount)values('61604','瓢柔洗发露',2,'10','18','2333')
insert into Ware(Wid,Wname,Cid,PurchasePrice,SalesPrice,Amount)values('61605','adivas运动服',3,'50','388','200')
insert into Ware(Wid,Wname,Cid,PurchasePrice,SalesPrice,Amount)values('61606','HIKE运动鞋',3,'20','288','150')
insert into Ware(Wid,Wname,Cid,PurchasePrice,SalesPrice,Amount)values('61607','美 白勺 电风扇',4,'100','258','100')
insert into Ware(Wid,Wname,Cid,PurchasePrice,SalesPrice,Amount)values('61608','老 木反 抽油烟机',4,'1500','3000','50')

--添加数据于 员工表 （Employee）
insert into Employee(Ename,Epassword)values('王哥','1234567896')
insert into Employee(Ename,Epassword)values('马云','1234567897')
insert into Employee(Ename,Epassword)values('李嘉诚','1234567898')
insert into Employee(Ename,Epassword)values('刘东强','1234567899')

--添加数据于 销售记录表 （Salesinfo）
update Ware set Amount=Amount-1 where Wname='嘿人牙膏'
insert into Salesinfo(Wid,SalesDate,SalesAmount,Eid)values('61603','2017-12-03','1',1001)

update Ware set Amount=Amount-20 where Wname='农夫三泉矿泉水'
insert into Salesinfo(Wid,SalesDate,SalesAmount,Eid)values('61602','2017-12-19','1',1002)

update ware set Amount=Amount-1 where Wname='瓢柔洗发露'
insert into Salesinfo(Wid,SalesDate,SalesAmount,Eid)values('61604','2017-12-03','6',1003)

update ware set Amount=Amount-1 where Wname='老 木反 抽油烟机'
insert into Salesinfo(Wid,SalesDate,SalesAmount,Eid)values('61608','2017-12-03','18',1004)

--1.--查询显示每件商品的编号、名称以及利润，按利润从高到低进行排序select wid,Wname,SalesPrice-PurchasePrice As '利润'from Ware order by SalesPrice-PurchasePrice desc
--2.--统计每件商品的销售量，显示商品名称及销售量，按销售量从高到低排序select Wname,sum(SalesAmount)As '销售量'from Ware W, Salesinfo S 
where w.wid=s.wid group by Wname
--3.--统计每类商品的销售量，显示商品类别及销售量，按销售量从高到低排序select Cname,sum(SalesAmount) as '销售量'from Category c,Ware w,SalesInfo swhere c.Cid=w.Cid and w.Wid=s.Wid group by Cname
--4.--统计每种商品到目前的盈利总额select Wname,sum((SalesPrice-PurchasePrice)*SalesAmount)AS '盈利总额' from Ware W,Salesinfo S
where W.wid=S.wid group by Wname
--查询商品销售量
--查询表
--商品类查询
select*from Category
--商品信息查询
select*from Ware
--员工信息查询
select*from Employee
--销售记录查询
select*from Salesinfo

--5.--按照销售总额对收银员排序
select Ename, sum((salesprice-purchaseprice)*salesamount)as '销售总额'from employee E,salesinfo S,ware W
where w.wid=s.wid and e.eid=s.eid
group by Ename order by '销售总额' desc
--6.--查询商品销售量排在前五名的商品名称及销量
select top 5 Wname ,sum(s.salesamount)as '销售量'from Ware w,Salesinfo swhere w.wid=s.widgroup by w.wname order by '销售量' desc--7.--统计2010年的商品销售量排在前五名的商品名称及销售量select top 5 w.Wname ,sum(salesamount)as '销售量'from Ware w,Salesinfo swhere w.wid=s.wid and s.SalesDate  between'2015-01-01'and'2019-12-31'group by w.wname order by '销售量' desc--8.--统技每个员工在2010年的销售量，显示员工名称及销售数量select wname ,sum(salesamount)as '销售量'from ware w,salesinfo swhere w.wid=s.wid and s.SalesDate between '2016-01-01'and'2019-12-31'group by w.wname order by '销售量' desc--9.--统计2010年的总利润select sum((w.salesprice-w.purchaseprice)*salesamount)总利润from ware w,Salesinfo swhere w.wid = s.wid and s.SalesDate between'2016-01-01'and'2018-12-31'