create database salesmanagement;
use salesmanagement;

create table customer(
c_id int primary key auto_increment,
c_name varchar(255) not null,
c_age int not null check (c_age between 0 and 100)
);

create table product(
p_id int auto_increment primary key,
p_name varchar(255) not null,
p_price int not null check ( p_price >0)
);

create table `order`(
o_id int primary key auto_increment,
c_id int,
o_date date,
o_totalprice int,
foreign key(c_id) references customer(c_id)
);

create table oder_detail(
od_id int,
p_id int,
o_id int,
od_qty int,
primary key( p_id, o_id),
foreign key(p_id) references product(p_id),
foreign key(o_id) references `order`(o_id)
);
alter table oder_detail
rename to  order_detail;
alter table order_detail
drop  od_id; 

insert into customer(c_name, c_age)
value('Minh Quan', 10),
('Ngoc Oanh',20),
('Hong Ha', 50);

insert into `order`(c_id, o_date)
value(1,'2006-03-21'),
(2,'2006-03-23'),
(1,'2006-03-16');

insert into product(p_name, p_price)
value('May Giat', 3),
('Tu Lanh',5),
('Dieu Hoa',7),
('Quat',1),
('Bep Dien', 2);

insert into order_detail(o_id, p_id, od_qty) 
values(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);


-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order

select o_id, o_date, o_totalprice
from `order`;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách

select c.c_name, p.p_name
from customer c join `order` o on c.c_id = o.c_id 
join order_detail od on o.o_id = od.o_id
join product p on p.p_id = od.p_id;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào

select c.c_name
from customer c left join `order` o on c.c_id = o.c_id
where o.c_id is null;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. 
-- Giá bán của từng loại được tính = odQTY*pPrice)

select o.o_id, o.o_date, sum(p.p_price*od_qty) as 'price_total'
from `order` o join order_detail od on o.o_id = od.o_id
join product p on p.p_id = od.p_id
group by o.o_id;






