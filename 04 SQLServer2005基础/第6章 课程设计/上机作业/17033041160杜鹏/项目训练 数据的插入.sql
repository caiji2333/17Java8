--查询
select*from  Category
select*from  Ware
select*from  Employee
select*from  SalesInfo 
--添加商品类别
insert into Category (Cname,Description) values('食品类','香辣豆干、大米、小米、辣条')
insert into Category (Cname,Description) values('日化用品：','牙膏、牙刷、香皂、洗面奶')
insert into Category (Cname,Description) values('服装类：','上衣、卫衣、棉拖')
insert into Category (Cname,Description) values('家电类：','冰箱、洗衣机、电视机、电脑')
insert into Category  values('冷饮类：','冰淇淋、雪碧、可乐、果汁')

--添加商品信息
insert into Ware (Wname,Cid,PurchasePrice,SalesPrice,Amount) values('香辣豆干',1,5,8,500)
insert into Ware (Wname,Cid,PurchasePrice,SalesPrice,Amount) values('大米',1,6,7,1000)
insert into Ware (Wname,Cid,PurchasePrice,SalesPrice,Amount) values('小米',1,5,6,600)
insert into Ware (Wname,Cid,PurchasePrice,SalesPrice,Amount) values('辣条',1,4,6,500)
insert into Ware (Wname,Cid,PurchasePrice,SalesPrice,Amount) values('牙膏',2,2,3,500)
insert into Ware (Wname,Cid,PurchasePrice,SalesPrice,Amount) values('牙刷',2,2,3,500)
insert into Ware (Wname,Cid,PurchasePrice,SalesPrice,Amount) values('香皂',2,3,3.5,500)
insert into Ware (Wname,Cid,PurchasePrice,SalesPrice,Amount) values('洗面奶',2,10,15,500)
insert into Ware (Wname,Cid,PurchasePrice,SalesPrice,Amount) values('上衣',3,500,700,50)
insert into Ware (Wname,Cid,PurchasePrice,SalesPrice,Amount) values('卫衣',3,50,60,50)
insert into Ware (Wname,Cid,PurchasePrice,SalesPrice,Amount) values('棉拖',3,20,25,100)
insert into Ware (Wname,Cid,PurchasePrice,SalesPrice,Amount) values('冰箱',4,5000,6000,50)
insert into Ware (Wname,Cid,PurchasePrice,SalesPrice,Amount) values('洗衣机',4,1200,1500,60)
insert into Ware (Wname,Cid,PurchasePrice,SalesPrice,Amount) values('电视',4,5200,6000,20)
insert into Ware (Wname,Cid,PurchasePrice,SalesPrice,Amount) values('电脑',4,7000,8000,50)

--添加员工表
insert into Employee (Ename,Epassword,Remark) values('白龙飞',7777777,'')
insert into Employee (Ename,Epassword,Remark) values('范本领',8888888,'')
insert into Employee (Ename,Epassword,Remark) values('丁耀伟',9999999,'')
insert into Employee (Ename,Epassword,Remark) values('李新阳',1111111,'')
insert into Employee (Ename,Epassword,Remark) values('赵耀春',2222222,'')

--添加销售记录表
Update Ware set Amount=Amount-1 where wname ='香辣豆干'

 insert into SalesInfo (Wid,SalesDate,SalesAmount,Eid) values(2,'2017-11-12',1,1002)