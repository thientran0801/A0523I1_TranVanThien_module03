create database ss1;
use ss1;
CREATE TABLE student (
    id INT PRIMARY KEY,
    `name` VARCHAR(50),
    birthday DATE
);

drop table student;

SELECT 
    id, `name`
FROM
    student;

SELECT 
    *
FROM
    student;

insert into student(id, `name`,birthday)
values 
		(1, 'Nguyenvana','2000-10-10'),
		(2, 'Nguyenvanb','2001-10-10'),
		(3, 'Nguyenvanc','2002-10-10');

SET SQL_SAFE_UPDATES = 0;-- false
UPDATE student 
SET 
    `name` = 'nguyenvand'
WHERE
    id = 1;
SET SQL_SAFE_UPDATES = 1;-- true

DELETE FROM student 
WHERE
    id = 1;


