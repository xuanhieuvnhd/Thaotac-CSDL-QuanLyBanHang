create database Quanlybanhang;
use Quanlybanhang;

create table customer(
  cID int auto_increment primary key ,
  cName varchar(50),
  cAge int
);
/*Thêm tên tuổi khách hàng vào bảng*/
select * from customer;
insert into customer(cname, cage)
values ('Minh Quan', 18),
		('Ngoc Oanh', 20),
        ('Hong Ha', 50);	
create table orders(
    oID int auto_increment primary key ,
    cID int,
    foreign key (cID) references customer(cID) ,
    oDate datetime,
    oTotalPrice double
);
/*Thêm đơn đặt hàng vào bảng*/
select * from orders;
insert into orders(cid, odate)
values (1, '2006-03-21'),
		(2, '2006-03-23'),
        (1, '2006-03-16');
create table product(
    pID int auto_increment primary key ,
    pName varchar(30),
    pPrice double
);
/*Thêm sản phẩm vào bảng*/
select * from product;
insert into product value(1,'May Giat',3);
insert into product value(2,'Tu Lanh',5);
insert into product value(3,'Dieu Hoa',7);
insert into product value(4,'Quat',1);
insert into product value(5,'Bep Dien',2);
create table orderDetail(
    oID int,
    pID int,
    odQTY int,
    foreign key (oID) references orders(oID),
    foreign key (pID) references product(pID)
);
/*Thêm chi tiết hoá đơn thanh toán*/
select * from orderdetail;
alter table orderdetail modify odqty int;
insert into orderdetail(oid,pid,odqty)
values (1,1,3),
		(1,3,7),
        (1,4,2),
		(2,1,1),
        (3,1,8),
		(2,5,4),
        (2,3,3);
/*Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order*/
select oid, odate, ototalprice
from orders;
/*Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách*/
select c.cid, c.cname, p.pname, ordt.odqty
from customer c join orders ord on c.cid = ord.cid join orderdetail ordt on ord.oid = ordt.oid join product p on ordt.pid = p.pid;
/*Hiển thị những khách hàng không mua sản phẩm nào*/
select c.cid, c.cname
from customer c
where c.cid not in (select orders.cid from orders);
/*Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn*/
select  o.oid, o.odate, sum(p.pprice * ord.odqty) "oTotalPrice"
from orders o join product p join orderdetail ord
where o.oid = ord.oid and ord.pid = p.pid
/*sắp xếp danh sách theo ID*/
group by oid;

