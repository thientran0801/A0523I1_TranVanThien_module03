create database furama;
use furama;

create table service_type(
service_type_id int primary key auto_increment,
service_type_name varchar(45)
);

create table rent_type(
rent_type_id int primary key auto_increment,
rent_type_name varchar(45),
rent_type_cost double
);

create table service(
service_id varchar(45) primary key,
service_name varchar(45) not null,
service_area double,
service_cost double not null,
service_max_people int,

rent_type_id int not null,
service_type_id int not null,

standard_room varchar(45),
description_other_convenience varchar(45),
pool_area double,
number_of_floors int,

foreign key(rent_type_id) references rent_type(rent_type_id),
foreign key(service_type_id) references service_type(service_type_id)
);

create table customer_type(
customer_type_id int primary key auto_increment,
customer_type_name varchar(45)
);

create table customer(
customer_id varchar(45) primary key,
customer_name varchar(45) not null,
customer_birthday date not null,
customer_gender bit(1) not null,
customer_id_card varchar(45) not null,
customer_phone varchar(45) not null,
customer_email varchar(45),
customer_address varchar(45),

customer_type_id int not null,
foreign key(customer_type_id) references customer_type(customer_type_id)
);

create table `position`(
positione_id int primary key auto_increment,
position_name varchar(45)
);

create table education_degree(
education_degree_id int primary key auto_increment,
education_degree_name varchar(45)
);

create table division(
division_id int primary key auto_increment,
division_name varchar(45)
);

create table `role`(
role_id int primary key auto_increment,
role_name varchar(45)
);

create table `user`(
username varchar(255) primary key,
`password` varchar(255)
);

create table user_role(
role_id int,
username varchar(255),
primary key(role_id, username),
foreign key(role_id) references `role`(role_id),
foreign key(username) references `user`(username)
);

create table employee(
employee_id varchar(45) primary key,
employee_name varchar(45) not null,
employee_birthday date not null,
-- employee_gender bit(1) not null,
employee_salary double not null,
employee_id_card varchar(45) not null,
employee_phone varchar(45) not null,
employee_email varchar(45),
employee_address varchar(45),

positione_id int not null,
education_degree_id int not null,
division_id int not null,
username varchar(255),	
foreign key(positione_id) references `position`(positione_id),
foreign key(education_degree_id) references education_degree(education_degree_id),
foreign key(division_id) references division(division_id),
foreign key(username) references `user`(username)
);

create table attach_service(
attach_service_id int primary key auto_increment,
attach_service_name varchar(45) not null,
attach_service_cost double not null,
attach_service_unit int not null,
attach_service_status varchar(45)
);

create table contract(
contract_id int primary key auto_increment,
contract_start_date datetime not null,
contract_end_date datetime not null,
contract_deposit double not null,
contract_total_money double not null,

employee_id varchar(45),
customer_id varchar(45),
service_id    varchar(45),
foreign key(employee_id) references employee(employee_id),
foreign key(customer_id) references customer(customer_id),
foreign key(service_id) references service(service_id)
);

create table contract_detail(
contract_detail int primary key auto_increment,
quantity int not null,
attach_service_id int,
contract_id int,
foreign key(attach_service_id) references attach_service(attach_service_id),
foreign key(contract_id) references contract(contract_id)
);

select * from customer limit 3 offset 3;


insert into customer_type(customer_type_name) value ('Diamond');
insert into customer_type(customer_type_name) value ('Platinium');
insert into customer_type(customer_type_name) value ('Gold');
insert into customer_type(customer_type_name) value ('Silver');
insert into customer_type(customer_type_name) value ('Member');


insert into customer(customer_id, customer_name, customer_birthday, customer_gender, customer_id_card, customer_phone, customer_address, customer_email, customer_type_id) value
('KH-0001','Nguyễn Thị Hào','1970-11-07',0,'643431213','0945423362','23 Nguyễn Hoàng, Đà Nẵng','thihao07@gmail.com',5),
('KH-0002','Phạm Xuân Diệu','1992-08-08',1,'865342123','0954333333','K77/22 Thái Phiên, Quảng Trị','xuandieu92@gmail.com',3),
('KH-0003','Trương Đình Nghệ','1990-02-27',1,'488645199','0373213122','K323/12 Ông Ích Khiêm, Vinh','nghenhan2702@gmail.com',1),
('KH-0004','Dương Văn Quan','1981-07-08',1,'543432111','0490039241','K453/12 Lê Lợi, Đà Nẵng','duongquan@gmail.com',1),
('KH-0005','Hoàng Trần Nhi Nhi','1995-12-09',0,'795453345','0312345678','224 Lý Thái Tổ, Gia Lai','nhinhi123@gmail.com',4),
('KH-0006','Tôn Nữ Mộc Châu','2005-12-06',0,'732434215','0988888844','37 Yên Thế, Đà Nẵng','tonnuchau@gmail.com',4),
('KH-0007','Nguyễn Mỹ Kim','1984-04-08',0,'856453123','0912345698','K123/45 Lê Lợi, Hồ Chí Minh','kimcuong84@gmail.com',1),
('KH-0008','Nguyễn Thị Hào','1999-04-08',0,'965656433','0763212345','55 Nguyễn Văn Linh, Kon Tum','haohao99@gmail.com',3),
('KH-0009','Trần Đại Danh','1994-07-01',1,'432341235','0643343433','24 Lý Thường Kiệt, Quảng Ngãi','danhhai99@gmail.com',1),
('KH-0010','Nguyễn Tâm Đắc','1989-07-01',1,'344343432','0987654321','22 Ngô Quyền, Đà Nẵng','dactam@gmail.com',2);

insert into rent_type(rent_type_name, rent_type_cost)
values ('year', 0.5), ('month', 0.7),('day', 0.9),('hour', 1.0);

insert into service_type(service_type_name)
values ('Villa'), ('House'),('Room');

insert into service(service_id, service_name, service_area,  service_cost, service_max_people, rent_type_id, service_type_id, standard_room, description_other_convenience,pool_area, number_of_floors)
value ('DV-1234','Villa Beach Front',25000,1000000,10,2,3,'Có hồ bơi','Sang Trong', 25.6, 2);

select * from service_type where service_type_id = 2;
select * from service;

select * from rent_type where rent_type_id = 2;

select * from customer;
select * from customer where customer_id = 'KH-1304';
update customer set customer_name = 'a', customer_birthday = '1998-01-08', customer_gender = 1, customer_id_card = '197412660', customer_phone = '0374058686', customer_address = 'Quang Tri', customer_email= 'abc', customer_type_id = 3 where customer_id = 'KH-1304';
delete from customer where customer_id = 'KH-0002';

select * from customer_type;
select * from customer_type where customer_type_id = 1;
