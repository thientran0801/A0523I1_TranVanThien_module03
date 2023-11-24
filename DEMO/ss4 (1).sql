-- 1. Hiển thị danh sách các lớp có học viên theo học và 
-- số lượng học viên của mỗi lớp 
select c.name, count(s.class_id) as "quanlity"
from class c
join student s
on c.id = s.class_id
group by c.name;

-- 2. Tính điểm lớn nhất của mỗi các lớp
select c.name, max(s.point) as "max point"
from class c
join student s 
on c.id = s.class_id
group by c.name;

-- 3. Tình điểm trung bình của từng lớp 

select c.name, avg(s.point) as "max point"
from class c
join student s 
on c.id = s.class_id
group by c.name;

-- 4. Lấy ra toàn bộ tên và ngày sinh các instructor và student ở CodeGym. 
-- Sử dụng union

select i.name, i.birthday
from instructor i
union all
select s.name, s.birthday
from student s;

select * 
from student s
left join class c on s.class_id = c.id
union
select * 
from student s
right join class c on s.class_id = c.id;


-- 5. Lấy ra top 3 học viên có điểm cao nhất của trung tâm.

select name, point
from student
order by point desc
limit 3,2;

select name, point
from student
order by point desc
limit 2 offset 3;



-- 6. Lấy ra các học viên có điểm số là cao nhất của trung tâm. 

select max(point)
from student;

select name, point
from student
where point in (
				select name, max(point)
				from student
);


select year('2023-9-3');







