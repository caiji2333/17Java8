--1.查询库存量低于70的商品信息
   select *from ware where Amount<70
--2.查询显示每件商品的编号,名称,以及利润
   select wid ,wname, SalesPrice- PurchasePrice as  利润
   from  Ware
   order by 利润 desc  

--3.查询销售利润大于3的商品编号,名称,进价,售价,利润
   select wid ,wname,PurchasePrice,SalesPrice,SalesPrice- PurchasePrice
   from ware where SalesPrice- PurchasePrice>3
--4.统计每类商品的销售量,显示商品类别及销售量
  select c.cnam ,sum(s.SalesAmount)
  from Category c,Ware w ,SalesInfo s
  where c.cid =w.cid and w.wid =s.wid  group by cnam
--5.统计每种商品到目前的盈利总额（销售额：（SalesPrice- PurchasePrice）*SalesAmount）
  select w.wname ,sum(s.SalesAmount*(w.SalesPrice- w.PurchasePrice))  as 盈利总额
  from ware w,SalesInfo s
  where w.wid=s.wid group by wname 
--6.统计每件商品的销售量,显示商品名称及销售量,按销售量从高到低排序
  select w.wname,sum(s.salesAmount) as 销售量
  from	ware w,SalesInfo s 
  where w.wid=s.wid group by wname  order by 销售量 desc
--7.
update ware set   Amount=Amount-5 where wid=1
insert into SalesInfo (wid,SalesDate, SalesAmount,eid) values(1,'2018-1-1',1,1001)
--8.查询商品销售量排在前五的商品名称及销量
 select top 5 w.wname ,sum(s.SalesAmount) 销量
 from ware w,SalesInfo s where w.wid = s.sid
 group by w.wname order by 销量 desc
