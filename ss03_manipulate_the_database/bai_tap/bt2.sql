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
