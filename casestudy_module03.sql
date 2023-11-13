create database furama_resort;
use furama_resort;

-- Bảng vi_tri lưu trữ thông tin vị trí làm tại resort của nhân viên.
create table position_employee(
pe_id int primary key auto_increment,
pe_position varchar(45)
);

-- Bảng trinh_do lưu trữ thông tin trình độ của nhân viên.
create table level_employee(
le_id int primary key auto_increment,
le_level varchar(45)
);

-- Bảng bo_phan lưu trữ thông tin nhân viên nào sẽ thuộc phòng ban nào.
create table department_employee(
de_id int primary key auto_increment,
de_department varchar(45)
);

-- Bảng nhan_vien lưu trữ thông tin của nhân viên.
create table employee(
e_id int primary key auto_increment,
e_name varchar(45) not null,
e_dob date not null,
e_idcard varchar(45) not null,
e_salary double not null,
e_phonenumber varchar(45) not null,
e_email varchar(45),
e_address varchar(45),
pe_id int,
le_id int,
de_id int,

foreign key (pe_id) references position_employee(pe_id),
foreign key (le_id) references level_employee(le_id),
foreign key (de_id) references department_employee(de_id)
);

-- Bảng loai_khach lưu trữ thông tin các loại khách hàng.
create table type_customer(
tc_id int primary key auto_increment,
tc_type varchar(45)
);

-- Bảng khach_hang lưu trữ thông tin của khách hàng.
create table customer(
c_id int primary key auto_increment,
c_name varchar(45) not null,
c_dob date not null,
c_gender bit(45) not null,
c_idcard varchar(45) not null,
c_phonenumber varchar(45) not null,
c_email varchar(45),
c_address varchar(45),
tc_id int,
foreign key (tc_id) references type_customer(tc_id)
);

-- Bảng kieu_thue lưu trữ các loại kiểu thuê như: theo giờ, theo ngày, theo tháng, theo năm.
create table type_rental(
tr_id int primary key auto_increment,
tr_type varchar(45)
);

-- Bảng loai_dich_vu lưu trữ các loại dịch vụ ở resort.
create table type_service(
ts_id int primary key auto_increment,
ts_type varchar(45)
);

-- Bảng dich_vu lưu trữ thông tin các dịch vụ mà resort cung cấp.
create table service(
s_id int primary key auto_increment,
s_name varchar(45) not null,
s_acreage double,
s_price double not null,
s_person int,
s_room_standard varchar(45),
s_describe varchar(45),
s_acreage_pool double,
s_floor int,
s_service_free varchar(45),
tr_id int,
ts_id int,
foreign key(tr_id) references type_rental(tr_id),
foreign key(ts_id) references type_service(ts_id)
);

-- Bảng hop_dong lưu trữ thông tin khách hàng thực hiện thuê dịch vụ tại resort.
create table contract(
id int primary key auto_increment,
contract_day date not null,
end_day date not null,
deposit double not null,
e_id int,
c_id int,
s_id int,
foreign key(e_id) references employee(e_id),
foreign key(c_id) references customer(c_id),
foreign key(s_id) references service(s_id)
);

-- Bảng hop_dong_chi_tiet lưu trữ thông tin một khách hàng có thể thuê nhiều dịch vụ đi kèm.
create table contract_detail(
cd_id int primary key auto_increment,
cd_quantity int not null,

contract_id int,
si_id int,
foreign key(contract_id) references contract(id),
foreign key(si_id) references service_included(si_id)
);

-- Bảng dich_vu_di_kem lưu trữ thông tin các dịch vụ đi kèm khi khách hàng thuê Phòng, Villa, House tại resort.
create table service_included(
si_id int primary key auto_increment,
si_name varchar(45) not null,
si_price double not null,
si_unit varchar(45) not null,
si_status varchar(45)
);


--  taske 1


insert into position_employee(pe_position)
values ('Quản lý'), ('Phục vụ'),('Lễ tân'),('Chuyên viên'),('Giám đốc'),('Giám sát');

insert into level_employee(le_level)
values ('Trung cấp'), ('Cao đẳng'),('Đại học'),('Sau đại học');

insert into department_employee(de_department)
values ('Sale-Marketing'), ('Hành chính'),('Phục vụ'),('Quản lý');

insert into type_customer(tc_type)
values ('Diamond'), ('Platinum'),('Gold'),('Silver'),('Menber');

insert into type_rental(tr_type)
values ('year'), ('month'),('day'),('hour');

insert into type_service(ts_type)
values ('Villa'), ('House'),('Room');

insert into service_included(si_name, si_price, si_unit, si_status)
values 
('Karaoke',10000,'giờ','tiện nghi, hiện đại'),
('Thuê xe máy',10000,'chiếc','hỏng 1 xe'),
('Thuê xe đạp',20000,'chiếc','tốt'),
('Buffet buổi sáng',15000,'suất','đầy đủ đồ ăn, tráng miệng'),
('Buffet buổi trưa',90000,'suất','đầy đủ đồ ăn, tráng miệng'),
('Buffet buổi tối',16000,'suất','đầy đủ đồ ăn, tráng miệng');

insert into employee(e_name, e_dob, e_idcard, e_phonenumber, e_address, e_email, e_salary, pe_id, le_id, de_id)
values
('Nguyễn Văn An','1970-11-07','456231786','0901234121','295 Nguyễn Tất Thành, Đà Nẵng','annguyen@gmail.com',10000000,1,3,1),
('Lê Văn Bình','1997-04-09','654231234','0934212314','22 Yên Bái, Đà Nẵng','binhlv@gmail.com',7000000,1,2,2),
('Hồ Thị Yến','1995-12-12','999231723','0412352315','K234/11 Điện Biên Phủ, Gia Lai','thiyen@gmail.com',14000000,1,3,2),
('Võ Công Toản','1980-04-04','123231365','0374443232','77 Hoàng Diệu, Quảng Trị','toan0404@gmail.com',17000000,1,4,4),
('Nguyễn Bỉnh Phát','1999-12-09','454363232','0902341231','43 Yên Bái, Đà Nẵng','phatphat@gmail.com',6000000,2,1,1),
('Khúc Nguyễn An Nghi','2000-11-08','964542311','0978653213','294 Nguyễn Tất Thành, Đà Nẵng','annghi20@gmail.com',7000000,2,2,3),
('Nguyễn Hữu Hà','1993-01-01','534323231','0941234553','4 Nguyễn Chí Thanh, Huế','nhh0101@gmail.com',8000000,2,3,2),
('Nguyễn Hà Đông','1989-09-03','234414123','0642123111','111 Hùng Vương, Hà Nội','donghanguyen@gmail.com',9000000,2,4,4),
('Tòng Hoang','1982-09-03','256781231','0245144444','213 Hàm Nghi, Đà Nẵng','hoangtong@gmail.com',6000000,2,4,4),
('Nguyễn Công Đạo','1994-01-08','755434343','0988767111','6 Hoà Khánh, Đồng Nai','nguyencongdao12@gmail.com',8000000,2,3,2);


insert into customer(c_name, c_dob, c_gender, c_idcard, c_phonenumber, c_address, c_email, tc_id)
values
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

insert into service(s_name, s_acreage,  s_price, s_person, s_room_standard, s_describe, s_acreage_pool, s_floor,s_service_free, tr_id, ts_id)
value
('Villa Beach Front',25000,1000000,10,'vip','Có hồ bơi',500,4,null,3,1),
('House Princess 01',14000,5000000,7,'vip','Có thêm bếp nướng',null,3,null,2,2),
('Room Twin 01',5000,1000000,2,'normal','Có tivi',null,null,'1 Xe máy, 1 Xe đạp',4,3),
('Villa No Beach Front',22000,9000000,8,'normal','Có hồ bơi',300,3,null,3,1),
('House Princess 02',10000,4000000,5,'normal','Có thêm bếp nướng',null,2,null,3,2),
('Room Twin 02',3000,900000,2,'normal','Có tivi',null,null,'1 Xe máy',4,3);

insert into contract(contract_day, end_day, deposit, e_id, c_id, s_id)
values
('2020-12-08','2020-12-08',0,3,1,3),
('2020-07-14','2020-07-21',200000,7,3,1),
('2021-03-15','2021-03-17',50000,3,4,2),
('2021-01-14','2021-01-18',100000,7,5,5),
('2021-07-14','2021-07-15',0,7,2,6),
('2021-06-01','2021-06-03',0,7,7,6),
('2021-09-02','2021-09-05',100000,7,4,4),
('2021-06-17','2021-06-18',150000,3,4,1),
('2020-11-19','2020-11-19',0,3,4,3),
('2021-04-12','2021-04-14',0,10,3,5),
('2021-04-25','2021-04-25',0,2,2,1),
('2021-05-25','2021-05-27',0,7,10,1);

insert into contract_detail(cd_quantity, contract_id, si_id)
values(5,2,4),(8,2,5),(15,2,6),(1,3,1),(11,3,2),(1,1,3),(2,1,2),(2,12,2);


--  taske 2 : Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.

select * from employee
where 
substring_index(e_name, ' ', -1) like 'H%' or
substring_index(e_name, ' ', -1) like 'T%' or
substring_index(e_name, ' ', -1) like 'K%' and
length(substring_index(e_name, ' ', -1)) <= 15;

select *, length(e_name) as long_name
 from employee
where 
e_name like 'H%' or
e_name like 'T%' or
e_name like 'K%' and
length(e_name) <= 15;

-- task 3. Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select * from customer
where year(curdate()) - year(c_dob) between 18 and 50 
and (substring_index(c_address, ', ', -1 ) = 'Đà Nẵng' or substring_index(c_address, ', ', -1 ) = 'Quảng Trị');

-- task 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.

select c.*, count(co.id) as count, t.tc_type as type_customer
from customer c join contract co on c.c_id = co.c_id join type_customer t on t.tc_id = c.tc_id
where t.tc_type = 'Diamond'
group by c.c_id
order by count asc;

-- task 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
-- cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
-- (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) 

select c.c_id, c_name, t.tc_type, co.id as contractID, s.s_name, co.contract_day, co.end_day, (s.s_price + sum(ifnull(cd.cd_quantity*si.si_price, 0))) as total
from customer c join type_customer t on c.tc_id = t.tc_id
left join contract co on co.c_id = c.c_id
left join service s on s.s_id = co.s_id
left join contract_detail cd on cd.contract_id = co.id
left join service_included si on  si.si_id = cd.si_id
group by c.c_id, c.c_name, t.tc_type, contractID
order by c.c_id;


select c.c_id, c_name, t.tc_type, co.id as contractID, s.s_name, co.contract_day, co.end_day, sum(s.s_price + (ifnull(cd.cd_quantity*si.si_price, 0))) as total
from customer c join type_customer t on c.tc_id = t.tc_id
left join contract co on co.c_id = c.c_id
left join service s on s.s_id = co.s_id
left join contract_detail cd on cd.contract_id = co.id
left join service_included si on  si.si_id = cd.si_id
group by c.c_id, c.c_name, t.tc_type, contractID, s_name, contract_day, end_day
order by c.c_id;

select sum(cd.cd_quantity*si.si_price) as total_si, cd.contract_id
from contract_detail cd join service_included si on  si.si_id = cd.si_id
group by cd.contract_id;


-- select @@sql_mode;
-- SET sql_mode = 'ONLY_FULL_GROUP_BY';

-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu 
-- của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3)

select s.s_id, s.s_name, s.s_acreage, s.s_price, ts.ts_type
from service s join type_service ts on ts.ts_id = s.ts_id
where s.s_id not in (
select s.s_id
from service s join contract co on s.s_id = co.s_id
where year(co.contract_day) = 2021 and month(co.contract_day) between 1 and 3);

-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu 
-- của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 
-- nhưng chưa từng được khách hàng đặt phòng trong năm 2021.

select s.s_id, s.s_name, s.s_acreage, s.s_person, s.s_price, ts.ts_type
from service s join type_service ts on ts.ts_id = s.ts_id
where s.s_id in (
select s.s_id
from service s join contract co on s.s_id = co.s_id
where year(co.contract_day) = 2020
)
and 
s.s_id not in (
select s.s_id
from service s join contract co on s.s_id = co.s_id
where year(co.contract_day) = 2021
);

-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
select c_name
from customer c
group by c_name
having count(c_name) >= 2;

select c1.c_name
from customer c1
join customer c2 
on c1.c_name = c2.c_name and c1.c_id <> c2.c_id
group by c1.c_name;




-- 9.	Thực hiện thống kê doanh thu theo tháng,
--  nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.



-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm.
--  Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem
--  (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).


   