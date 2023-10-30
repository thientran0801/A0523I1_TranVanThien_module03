create database student_management;
use student_management;
create table class(
id int primary key,
`name` varchar(50)
);
drop table student;
create table teacher(
id int primary key,
`name` varchar(50),
`age` int,
`country` varchar(50)
);
