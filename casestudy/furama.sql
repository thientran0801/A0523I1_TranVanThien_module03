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
service_status bit default 0,
service_id int primary key auto_increment,
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
customer_status bit default 0,
customer_id int primary key auto_increment,
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
employee_status bit default 0,
employee_id int primary key auto_increment,
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

employee_id int,
customer_id int,
service_id int,
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


insert into customer(customer_name, customer_birthday, customer_gender, customer_id_card, customer_phone, customer_address, customer_email, customer_type_id) value
('Nguyễn Thị Hào','1970-11-07',0,'643431213','0945423362','23 Nguyễn Hoàng, Đà Nẵng','thihao07@gmail.com',5),
('Phạm Xuân Diệu','1992-08-08',1,'865342123','0954333333','K77/22 Thái Phiên, Quảng Trị','xuandieu92@gmail.com',3),
('Trương Đình Nghệ','1990-02-27',1,'488645199','0373213122','K323/12 Ông Ích Khiêm, Vinh','nghenhan2702@gmail.com',1),
('Dương Văn Quan','1981-07-08',1,'543432111','0490039241','K453/12 Lê Lợi, Đà Nẵng','duongquan@gmail.com',1),
('Hoàng Trần Nhi Nhi','1995-12-09',0,'795453345','0312345678','224 Lý Thái Tổ, Gia Lai','nhinhi123@gmail.com',4),
('Tôn Nữ Mộc Châu','2005-12-06',0,'732434215','0988888844','37 Yên Thế, Đà Nẵng','tonnuchau@gmail.com',4),
('Nguyễn Mỹ Kim','1984-04-08',0,'856453123','0912345698','K123/45 Lê Lợi, Hồ Chí Minh','kimcuong84@gmail.com',1),
('Nguyễn Thị Hào','1999-04-08',0,'965656433','0763212345','55 Nguyễn Văn Linh, Kon Tum','haohao99@gmail.com',3),
('Trần Đại Danh','1994-07-01',1,'432341235','0643343433','24 Lý Thường Kiệt, Quảng Ngãi','danhhai99@gmail.com',1),
('Nguyễn Tâm Đắc','1989-07-01',1,'344343432','0987654321','22 Ngô Quyền, Đà Nẵng','dactam@gmail.com',2);

insert into rent_type(rent_type_name, rent_type_cost)
values ('year', 0.5), ('month', 0.7),('day', 0.9),('hour', 1.0);

insert into service_type(service_type_name)
values ('Villa'), ('House'),('Room');

-- EMPLOYEE

INSERT INTO user (username, password)
VALUES
  ('User1', 'Password1'),
  ('User2', 'Password2'),
  ('User3', 'Password3'),
  ('User4', 'Password4'),
  ('User5', 'Password5'),
  ('User6', 'Password6'),
  ('User7', 'Password7'),
  ('User8', 'Password8'),
  ('User9', 'Password9'),
  ('User10', 'Password10');
  
insert into `position`(position_name)
values ('lễ tân'), ('phục vụ'),('chuyên viên'),('giám sát'), ('quản lý'), ('giám đốc');
insert into division(division_name)
values ('Sale – Marketing'), ('Hành Chính'),('Phục vụ'), ('Quản lý');
insert into education_degree(education_degree_name)
values ('Trung cấp'), ('Cao đẳng'),('Đại học'), ('sau đại học');
insert into user(username,password )
values ('Villa'), ('House'),('Room');

insert into employee(employee_name, employee_birthday, employee_salary, employee_id_card, employee_phone, employee_email, employee_address, position_id, education_degree_id,division_id, username) value
('Nguyễn Thị Hào','1970-11-07',5000,'643431213','0945423362','thihao07@gmail.com','23 Nguyễn Hoàng, Đà Nẵng',2,2,2,'T1');

insert into employee(employee_name, employee_birthday,employee_id_card, employee_phone, employee_address , employee_email, employee_salary, position_id, education_degree_id,division_id, username) value
('Nguyễn Văn An','1970-11-07','456231786','0901234121','295 Nguyễn Tất Thành, Đà Nẵng','annguyen@gmail.com',10000000,1,3,1,'User1'),
('Lê Văn Bình','1997-04-09','654231234','0934212314','22 Yên Bái, Đà Nẵng','binhlv@gmail.com',7000000,1,2,2,'User2'),
('Hồ Thị Yến','1995-12-12','999231723','0412352315','K234/11 Điện Biên Phủ, Gia Lai','thiyen@gmail.com',14000000,1,3,2,'User3'),
('Võ Công Toản','1980-04-04','123231365','0374443232','77 Hoàng Diệu, Quảng Trị','toan0404@gmail.com',17000000,1,4,4,'User4'),
('Nguyễn Bỉnh Phát','1999-12-09','454363232','0902341231','43 Yên Bái, Đà Nẵng','phatphat@gmail.com',6000000,2,1,1,'User5'),
('Khúc Nguyễn An Nghi','2000-11-08','964542311','0978653213','294 Nguyễn Tất Thành, Đà Nẵng','annghi20@gmail.com',7000000,2,2,3,'User6'),
('Nguyễn Hữu Hà','1993-01-01','534323231','0941234553','4 Nguyễn Chí Thanh, Huế','nhh0101@gmail.com',8000000,2,3,2,'User7'),
('Nguyễn Hà Đông','1989-09-03','234414123','0642123111','111 Hùng Vương, Hà Nội','donghanguyen@gmail.com',9000000,2,4,4,'User8'),
('Tòng Hoang','1982-09-03','256781231','0245144444','213 Hàm Nghi, Đà Nẵng','hoangtong@gmail.com',6000000,2,4,4,'User9'),
('Nguyễn Công Đạo','1994-01-08','755434343','0988767111','6 Hoà Khánh, Đồng Nai','nguyencongdao12@gmail.com',8000000,2,3,2,'User10');

UPDATE `furama`.`employee` SET `employee_name` = 'AAAAA', `employee_salary` = '444444', `employee_id_card` = '555', `employee_phone` = '6564666' WHERE (`employee_id` = '1');

 select * from employee where employee_id = 3;
insert into user(username,password) value('T1', '111'),('T2','222'),('T3','333'),('T4', '444'),('T5','555'),('T6','666'),('T7', '777');

insert into user_role(username,role_id) value('T1', 1),('T2',2),('T3',3),('T4', 4),('T5',4),('T6',1),('T7', 2);

insert into service(service_name, service_area,  service_cost, service_max_people, rent_type_id,
 service_type_id, standard_room, description_other_convenience,pool_area, number_of_floors)
value ('Villa Beach Front',25000,1000000,10,2,3,'Có hồ bơi','Sang Trong', 25.6,3 );

select e.* , p.position_name as position, d.division_name as division, ed.education_degree_name as education
from employee e 
join position p on e.position_id = p.position_id
join division d on e.division_id = d.division_id
join education_degree ed on ed.education_degree_id = e.education_degree_id 
where employee_status = 0;


insert into role(role_name) value('admin'),('manager'),('tutor'),('leader'),('contractor');

select * from service_type where service_type_id = 2;
select * from service;

select * from rent_type where rent_type_id = 2;

select * from customer;
select * from customer where customer_id = 'KH-1304';
update customer set customer_name = 'a', customer_birthday = '1998-01-08', customer_gender = 1, customer_id_card = '197412660', customer_phone = '0374058686', customer_address = 'Quang Tri', customer_email= 'abc', customer_type_id = 3 where customer_id = 'KH-1304';
delete from customer where customer_id = 'KH-0002';

select * from customer_type;
select * from customer_type where customer_type_id = 1;

UPDATE `employee` SET `employee_status` = 1 WHERE (`employee_id` = 2);

