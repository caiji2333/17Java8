--商品类别添加
insert into Category (Cname,Description) values ('食品类','葡萄')
insert into Category (Cname,Description) values ('日化用品','')
insert into Category (Cname,Description) values ('服装类','')
insert into Category (Cname,Description) values ('家电类','')
select*from Category

--商品信息添加
insert into Ware(Wnmae,Cid,PurchasePrice,SalesPrice,Amount) values ('棒棒糖',1,'1','2','200')
insert into Ware(Wnmae,Cid,PurchasePrice,SalesPrice,Amount) values ('薯片',1,'1','2','150')
insert into Ware(Wnmae,Cid,PurchasePrice,SalesPrice,Amount) values ('面包',1,'1.5','3','200')
insert into Ware(Wnmae,Cid,PurchasePrice,SalesPrice,Amount) values ('纳爱斯牙膏',2,'6','10','20')
insert into Ware(Wnmae,Cid,PurchasePrice,SalesPrice,Amount) values ('黑猫牙膏',2,'10','20','30')
insert into Ware(Wnmae,Cid,PurchasePrice,SalesPrice,Amount) values ('去屑洗发水',2,'12','18','30')
insert into Ware(Wnmae,Cid,PurchasePrice,SalesPrice,Amount) values ('风衣',3,'70','200','200')
insert into Ware(Wnmae,Cid,PurchasePrice,SalesPrice,Amount) values ('棉袄',3,'80','230','150')
insert into Ware(Wnmae,Cid,PurchasePrice,SalesPrice,Amount) values ('保暖裤',3,'10','60','200')
insert into Ware(Wnmae,Cid,PurchasePrice,SalesPrice,Amount) values ('冰箱',4,'2000','3000','20')
insert into Ware(Wnmae,Cid,PurchasePrice,SalesPrice,Amount) values ('液晶电视',4,'1500','3000','20')
insert into Ware(Wnmae,Cid,PurchasePrice,SalesPrice,Amount) values ('电脑',4,'1600','4000','20')
select*from Ware
delete from Employee

--员工信息添加
insert into Employee(Enmae,Epassword,Remark) values ('临摹','12345678','暂无')
insert into Employee(Enmae,Epassword,Remark) values (' 林磊','11122212','暂无')
insert into Employee(Enmae,Epassword,Remark) values ('孙率','87654321','暂无')
insert into Employee(Enmae,Epassword,Remark) values ('周璐','123123123','暂无')
select*from Employee

--商品销售添加(Wid是商品编号,Eid是员工编号)(SalesDate销售时间,SalesAmount销售数量)
insert into SalesInfo(Wid,SalesDate,SalesAmount,Eid) values (2,'2017-01-24','5','1001')
insert into SalesInfo(Wid,SalesDate,SalesAmount,Eid) values (5,'2017-01-23','6','1002')
insert into SalesInfo(Wid,SalesDate,SalesAmount,Eid) values (6,'2017-01-22','8','1004')
insert into SalesInfo(Wid,SalesDate,SalesAmount,Eid) values (11,'2017-01-24','10','1002')
insert into SalesInfo(Wid,SalesDate,SalesAmount,Eid) values (7,'2017-01-25','11','1003')
insert into SalesInfo(Wid,SalesDate,SalesAmount,Eid) values (9,'2017-01-19','5','1001')
select*from SalesInfo

--查询每件商品的编号,名称,单品利润，并按照单品利润排序
select wid as 编号,Wnmae as 商品名称,SalesPrice-PurchasePrice as 利润 
from Ware order by 利润 desc

--统计每件商品的销售量,显示商品名称及销售量,按销售量从高到低排序
select w.wnmae as 商品名称,sum(s.SalesAmount) as 销售量 
from  ,SalesInfo s where w.wid=s.Wid  
group by wnmae order by 销售量 desc

--统计每类商品的销售量,显示商品类别及销售量
select c.Cname as 商品类别,sum(s.SalesAmount) as 销售量 
from Category c,Ware w,SalesInfo s 
where c.cid=w.cid and w.wid=s.wid group by cname


--统计每种商品到目前的盈利总额
select w.wnmae as 商品名称,sum((w.SalesPrice-w.PurchasePrice)*s.SalesAmount) as盈利总额 
from Ware w,SalesInfo s 
where w.wid=s.wid 
group by wnmae

--收银员2号销售5件1号商品
update ware set Amount=Amount-5 where wid=1
insert into SalesInfo(wid,SalesDate,SalesAmount,Eid) values (1,2012-06-30,5,1002)
select*from SalesInfo


--按照销售总额对收银员排序
select e.Enmae as 员工名称,sum((w.SalesPrice-w.PurchasePrice)*s.SalesAmount) as 销售总额 
from Employee e,Ware w,SalesInfo s 
where e.eid=s.eid and w.wid=s.wid 
group by e.Enmae order by 销售总额 desc


--查询商品销售量排在前五名的商品名称及销量(从高到底排成销量所以用desc)
select top 5 w.wnmae as 商品名称, sum(s.SalesAmount) as 销量 
from Ware w,SalesInfo s where w.wid=s.wid
group by w.wnmae order by 销量 desc

--统计2017年的商品销售量排在前五名的商品的名称及销量(注意时间的格式yyyy-xx-tt)
select top 5 w.wnmae as 商品名称, sum(s.SalesAmount) as 销量 
from Ware w,SalesInfo s where w.wid=s.wid and s.SalesDate between '2017-01-01' and '2017-12-31'
group by w.wnmae order by 销量 desc

--统计每个员工在2017年的销量，显示员工名称及销售数量
select  e.enmae as 员工名称, sum(s.SalesAmount) 销量 
from Employee e,SalesInfo s where e.eid=s.eid and s.SalesDate between '2017-01-01' and '2017-12-31'
group by e.enmae order by 销量 desc

--统计2010年的总利润
select sum((w.SalesPrice-w.PurchasePrice)*s.SalesAmount) as 总利润
from Ware w,SalesInfo s where w.wid=s.wid  and s.SalesDate between '2017-01-01' and '2017-12-31'
