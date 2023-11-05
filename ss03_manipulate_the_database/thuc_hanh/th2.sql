use quanlysinhvien;
select* from student;

SELECT *
FROM Student
WHERE Status = true;

SELECT *
FROM Subject
WHERE Credit < 10;

SELECT S.StudentId, S.StudentName, C.ClassName
FROM Student S join Class C on S.ClassId = C.ClassID;

select s.studentid, s.studentname, c.classname
from student s join class c on s.classid = c. classid
where c.classname = 'A1';

-- Bước 6: Hiển thị điểm môn CF của các học viên
-- Hiển thị tất cả các điểm đang có của học viên

SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM Student S join Mark M on S.StudentId = M.StudentId join Subject Sub on M.SubId = Sub.SubId;
-- Sử dụng câu lệnh Where để hiển thị điểm môn CF của các học viên

SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM Student S join Mark M on S.StudentId = M.StudentId join Subject Sub on M.SubId = Sub.SubId
WHERE Sub.SubName = 'CF';