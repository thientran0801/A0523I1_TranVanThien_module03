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
e_phonenumber varchar(45) not null,
e_address varchar(45),
e_email varchar(45),
e_salary double not null,

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
s_describe varchar(45),
s_room_standard varchar(45),
s_acreage double,
s_acreage_pool double,
s_price double not null,
s_person int,
s_floor int,

ts_id int,
tr_id int,
foreign key(tr_id) references type_rental(tr_id),
foreign key(ts_id) references type_service(ts_id)
);

-- Bảng hop_dong lưu trữ thông tin khách hàng thực hiện thuê dịch vụ tại resort.
create table contract(
id int primary key auto_increment,
start_day date not null,
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

insert into position_employee(pe_position)
values ('receptionist'), ('staff'),('consultants'),('manager'),('director'),('supervisor');

insert into level_employee(le_level)
values ('intermediate'), ('college'),('university'),('after university');

insert into department_employee(de_department)
values ('sale-marketing'), ('management'),('administrative'),('service staff');

insert into type_customer(tc_type)
values ('diamond'), ('platinum'),('gold'),('silver'),('menber');

insert into service_included(si_name, si_price, si_unit, si_status)
values 
('massage'		,500	,'hour'	,'on'),
('karaoke'		,70		,'hour'	,'on'),
('food'			,50		,'dish'	,'on'),
('drinks'		,20		,'cup'	,'on'),
('car rental'	,20		,'day'	,'on');

insert into type_rental(tr_type)
values ('year'), ('month'),('day'),('hour');

insert into type_service(ts_type)
values ('room'), ('villa'),('house');

insert into employee(e_name, e_dob, e_idcard, e_phonenumber, e_address, e_email, e_salary, pe_id, le_id, de_id)
values
('Lê Chí Thiện','1998-08-01','468521597','0374018686','Đà nẵng','thien0801@gmail.com',9000000,1,4,2),
('Võ Khắc Đoài','1995-08-02','564544464','0374018687','Quảng Trị','doai0802@gmail.com',6500000,2,2,1),
('Thái Sơn','1990-08-03','214645645','0374018688','Quảng Nam','son0803@gmail.com',8000000,3,1,2),
('Phan Nguyễn Anh Thư','1999-08-04','252351312','0374018689','Quảng Nam','thu0804@gmail.com',9500000,4,2,4),
('Nguyễn Quốc Thông','1998-08-05','984164846','0374018690','Quảng Trị','thong0805@gmail.com',9500000,6,4,4),
('Đoàn Đình Vũ','1999-08-06','845512148','0374018691','Quảng Nam','vu0806@gmail.com',4500000,1,4,2),
('Hồ Thị Hải Bích','1995-08-07','654844646','0374018692','Đà nẵng','bich0807@gmail.com',6500000,6,2,1),
('Võ Thị Tường Vy','1990-08-08','654854898','0374018693','Hải Châu','vy0808@gmail.com',8000000,2,1,2),
('Phan Dương Chí Thanh','1998-08-09','656546464','0374018694','Vinh','thanh0809@gmail.com',6500000,1,2,2),
('Tôn Thất Diễn','2005-08-10','465454546','0374018695','Quảng Ngãi','dien0810@gmail.com',9500000,2,2,1),
('Trần Văn Sĩ','1995-08-11','656555565','0374018696','Đà nẵng','si0811@gmail.com',4500000,4,1,1),
('Nguyễn Văn Vũ','1999-08-12','655546464','0374018697','Vinh','vu0812@gmail.com',9500000,6,4,4),
('Phạm Ngọc Tân','2004-08-13','654784561','0374018698','Quảng Trị','tan0813@gmail.com',4500000,2,3,3),
('Trịnh Văn Ban','1992-08-14','456987258','0374018699','Đà nẵng','ban0814@gmail.com',4500000,1,2,2),
('Trần Văn Thiện','1990-01-08','654554646','0374018700','Quảng Trị','thien0108@gmail.com',6500000,6,1,1),
('Ngô Quốc Trung','1992-08-16','654789321','0374018701','Hải Châu','trung0816@gmail.com',9500000,2,2,2),
('Hoàng Gia','1998-08-17','446545144','0374018702','Quảng Ngãi','gia0817@gmail.com',9000000,1,4,4),
('Nhật Long','1995-08-18','654564564','0374018703','Quảng Nam','long0818@gmail.com',9000000,4,4,4),
('Dang Trinh','1999-08-19','544654464','0374018704','Huế','trinh0819@gmail.com',8000000,2,2,2),
('Nguyễn Khánh','1990-08-20','564545446','0374018705','Quảng Ngãi','khanh0820@gmail.com',6500000,6,1,1),
('Trần Tuấn Kiệt','1992-08-21','654564464','0374018706','Vinh','kiet0821@gmail.com',9000000,1,2,2),
('Đoàn Hóa','1998-08-22','115111165','0374018707','Quảng Ngãi','hoa0822@gmail.com',8000000,4,2,1),
('Hoàng Văn Hiệp','1992-08-23','646514654','0374018708','Quảng Ngãi','hiep0823@gmail.com',9000000,2,4,3);


insert into customer(c_name, c_dob, c_gender, c_idcard, c_phonenumber, c_address, c_email, tc_id)
values
('Lê Chí Thiện','1998-08-01',0,'468521597','0374018686','Đà nẵng','thien0801@gmail.com',2),
('Võ Khắc Đoài','1995-08-02',0,'564544464','0374018687','Quảng Trị','doai0802@gmail.com',5),
('Thái Sơn','1990-08-03',0,'214645645','0374018688','Quảng Nam','son0803@gmail.com',2),
('Phan Nguyễn Anh Thư','1999-08-04',1,'252351312','0374018689','Quảng Nam','thu0804@gmail.com',4),
('Nguyễn Quốc Thông','1998-08-05',0,'984164846','0374018690','Quảng Trị','thong0805@gmail.com',4),
('Đoàn Đình Vũ','1999-08-06',0,'845512148','0374018691','Quảng Nam','vu0806@gmail.com',2),
('Hồ Thị Hải Bích','1995-08-07',1,'654844646','0374018692','Đà nẵng','bich0807@gmail.com',2),
('Võ Thị Tường Vy','1990-08-08',1,'654854898','0374018693','Hải Châu','vy0808@gmail.com',5),
('Phan Dương Chí Thanh','1998-08-09',0,'656546464','0374018694','Vinh','thanh0809@gmail.com',2),
('Tôn Thất Diễn','2005-08-10',0,'465454546','0374018695','Quảng Ngãi','dien0810@gmail.com',1),
('Trần Văn Sĩ','1995-08-11',0,'656555565','0374018696','Đà nẵng','si0811@gmail.com',1),
('Nguyễn Văn Vũ','1999-08-12',0,'655546464','0374018697','Vinh','vu0812@gmail.com',5),
('Phạm Ngọc Tân','2004-08-13',0,'654784561','0374018698','Quảng Trị','tan0813@gmail.com',3),
('Trịnh Văn Ban','1992-08-14',0,'456987258','0374018699','Đà nẵng','ban0814@gmail.com',5),
('Trần Văn Thiện','1990-01-08',0,'654554646','0374018700','Quảng Trị','thien0108@gmail.com',2),
('Ngô Quốc Trung','1992-08-16',0,'654789321','0374018701','Hải Châu','trung0816@gmail.com',2),
('Hoàng Gia','1998-08-17',0,'446545144','0374018702','Quảng Ngãi','gia0817@gmail.com',4),
('Nhật Long','1995-08-18',0,'654564564','0374018703','Quảng Nam','long0818@gmail.com',4),
('Dang Trinh','1999-08-19',0,'544654464','0374018704','Huế','trinh0819@gmail.com',2),
('Nguyễn Khánh','1990-08-20',0,'564545446','0374018705','Quảng Ngãi','khanh0820@gmail.com',1),
('Trần Tuấn Kiệt','1992-08-21',0,'654564464','0374018706','Vinh','kiet0821@gmail.com',5),
('Đoàn Hóa','1998-08-22',0,'115111165','0374018707','Quảng Ngãi','hoa0822@gmail.com',1),
('Hoàng Văn Hiệp','1992-08-23',0,'646514654','0374018708','Quảng Ngãi','hiep0823@gmail.com',5);


