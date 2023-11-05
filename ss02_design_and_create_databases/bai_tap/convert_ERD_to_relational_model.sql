create database material_management;
use material_management;

create table phieuxuat(
sopx int primary key auto_increment,
ngayxuat date
);

create table vattu(
mavt int primary key auto_increment,
tenvt varchar(255)
);

create table chitietpx(
idpx int,
dgxuat int,
slxuat int,
mavt int,
sopx int,
primary key(mavt, sopx),
foreign key(mavt) references vattu(mavt), 
foreign key(sopx) references phieuxuat(sopx)
);

create table phieunhap(
sopn int primary key auto_increment,
ngaynhap date
);

create table chitietpn(
idpn int,
dgnhap int,
slnhap int,
mavt int,
sopn int,
primary key(mavt, sopn),
foreign key(mavt) references vattu(mavt), 
foreign key(sopn) references phieunhap(sopn)
);

create table nhacc(
mancc int primary key auto_increment,
tenncc varchar(255),
diachi varchar(255)
);

create table dondh(
sodh int primary key auto_increment,
ngaydh date,
mancc int,
foreign key(mancc) references nhacc(mancc)
);

create table chitietdh(
iddh int,
mavt int,
sodh int,
primary key(mavt, sodh),
foreign key(mavt) references vattu(mavt), 
foreign key(sodh) references dondh(sodh)
);

create table sodienthoai(
sdtid int primary key auto_increment,
sdt varchar(10),
mancc int unique,
foreign key(mancc) references nhacc(mancc)
);