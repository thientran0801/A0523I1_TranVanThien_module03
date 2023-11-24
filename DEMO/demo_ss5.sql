explain select * from student where name = "le hai chung";

create index index_name on student(name);

drop index index_name on student;

-- đánh index cho name


-- ========== View ==========

-- Tạo view chỉ chứa thông tin id và name của student
create view view_student as
select id,name
from student;

select * from view_student;
drop view view_student;

-- ========== Stored Procedure ==========
-- Java: viết hàm void có tên là findByName, 
-- có tham số truyền vào là name
-- void findByName(String name) {
--   // Body
-- }


-- ========== IN ==========
delimiter //
create procedure find_by_name(search_name varchar(50))
begin
select *
from student
where name = search_name;
end //
delimiter ;

call find_by_name('le hai chung');
call find_by_name('ta dinh huynh');

-- ========== OUT ==========

delimiter //
create procedure find_by_name_out(search_name varchar(50),out count int)
begin
select count(*) into count
from student
where name = search_name;
end //
delimiter ;

call find_by_name('le hai chung',@count);
select @count;


-- ========== INOUT ==========
delimiter //
create procedure find_by_name_in_out(inout search_name varchar(50))
begin
set search_name =(
select count(*)
from student
where name = search_name);
end //
delimiter ;

set @search_name='le hai chung';
select @search_name;
call find_by_name_in_out(@search_name);
select @search_name;


-- 4 viêt 1 function xếp loại học lưc theo point
delimiter //
create function f_xep_loai(diem int)
returns varchar(50)
deterministic
begin
	declare loai varchar(50);
	if diem >= 8 then
	set loai ='giỏi';
	elseif diem >= 7 then
	set loai = 'khá';
	else
	set loai = 'trung bình';
	end if;
	return loai;
end //
delimiter ;
-- sử dụng function
select s.name,s.point, f_xep_loai(s.point) as "loại"
from student s;









-- 5 tạo trigger tự động tạo tài khoản jame trước khi thêm mới một học viên
 select * from student;
 select * from jame;

DELIMITER //
CREATE TRIGGER tr_auto_create_jame 
BEFORE INSERT ON student
FOR EACH ROW
BEGIN
insert into jame(`account`, `password`) values ( new.email, '123');
END //
DELIMITER ;

insert into student(`name`,birthday, email, gender,`point`, class_id,`account`) 
values ('Cánh gà chiên mắm','1995-12-12','ngant@gmail.com',1,8,1,'ngant@gmail.com');
 
 
 
 
 
 
 
 
 
 
 
 