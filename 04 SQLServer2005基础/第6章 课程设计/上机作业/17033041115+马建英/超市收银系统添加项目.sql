--查询商品类别
Select*from Category
--查询商品信息
Select*from Ware
--查询员工信息
Select*from Employee
--查询销售记录
Select*from SalesInfo

--添加商品类别表
insert into Category(Cname)values('服装类')
insert into Category(Cname)values('食品类')
insert into Category(Cname)values('日化类')
insert into Category(Cname)values('家电类')

--添加商品信息表(Cid表示类型)
insert into Ware(Wnam,Cid,PurchasePrice,SalesPrice,Amount)values('帆布鞋',1,'10','19','50')
insert into Ware(Wnam,Cid,PurchasePrice,SalesPrice,Amount)values('羽绒服',1,'100','199','50')
insert into Ware(Wnam,Cid,PurchasePrice,SalesPrice,Amount)values('薯片',2,'2','3.5','30')
insert into Ware(Wnam,Cid,PurchasePrice,SalesPrice,Amount)values('一箱苹果',2,'40','60','20')
insert into Ware(Wnam,Cid,PurchasePrice,SalesPrice,Amount)values('黑妹牙膏',3,'5','7','20')
insert into Ware(Wnam,Cid,PurchasePrice,SalesPrice,Amount)values('海飞丝洗发水',3,'20','30','30')
insert into Ware(Wnam,Cid,PurchasePrice,SalesPrice,Amount)values('冰箱',4,'1000','1700','10')
insert into Ware(Wnam,Cid,PurchasePrice,SalesPrice,Amount)values('洗衣机',4,'1500','2100','10')

--添加员工信息表（Employee）
insert into Employee(Ename,Epassword)values('张三','11100011')
insert into Employee(Ename,Epassword)values('李四','10101010')
insert into Employee(Ename,Epassword)values('贾海宁','10110111')
insert into Employee(Ename,Epassword)values('福飞路','10102131')

--销售记录表
update Ware set Amount=Amount-1 where Wnam='帆布鞋'
insert into SalesInfo(wid,SalesDate,SalesAmount,eid)values(1,'2017-01-02','2','1001')
update Ware set Amount=Amount-1 where Wnam='薯片'
insert into SalesInfo(wid,SalesDate,SalesAmount,eid)values(3,'2017-02-03','10','1002')
update Ware set Amount=Amount-1 where Wnam='黑妹牙膏'
insert into SalesInfo(wid,SalesDate,SalesAmount,eid)values(5,'2017-05-06','10','1003')
update Ware set Amount=Amount-1 where Wnam='洗衣机'
insert into SalesInfo(wid,SalesDate,SalesAmount,eid)values(8,'2017-06-02','5','1004')


--查询显示每件商品的编号，名称，利润(利润=售价-进价)，按利润从高到低排序
select wid,Wnam,SalesPrice-PurchasePrice as利润 from Ware order by SalesPrice-PurchasePrice desc
--统计每件商品的销售量，显示商品名称及销售量，按销售量从高到低排序
--商品名称在Ware表中，销售量在SalesInfo表中，所以首先需在这两个表中进行连接查询，然后再分组统计
select a.Wnam,sum(b.SalesAmount)as销售量from Ware a,SalesInfo bwhere a.wid=b.wid group by Wnam order by sum(b.SalesAmount) desc
--统计每类商品的销售量，显示商品类别及销售量
--该问题涉及到Category、Ware、SalesInfo三个表，先连接再分组统计
select C.cname,sum(b.SalesAmount)as 销售量from Category C,Ware a,SalesInfo bwhere C.cid=a.cid and a.wid=b.wid group by cname
--统计每种商品到目前的盈利总额--先连接Ware和SalesInfo表，从中得到商品名称、进价、售价及销售数量，
--结果中每条记录的销售额应表示为：
SalesPrice-PurchasePrice)*SalesAmount
--最后分组统计
select Wnam,sum(SalesAmount*( SalesPrice-PurchasePrice)) as 盈利总额from Ware a,SalesInfo bwhere a.wid=b.wid group by Wnam