CREATE DATABASE demo;
USE demo;

create table users (
 id  int(3) NOT NULL AUTO_INCREMENT,
 name varchar(120) NOT NULL,
 email varchar(220) NOT NULL,
 country varchar(120),
 PRIMARY KEY (id)
);


insert into users(name, email, country) values('Minh','minh@codegym.vn','Viet Nam');
insert into users(name, email, country) values('Kante','kante@che.uk','Kenia');
insert into users(name, email, country) values('Nguyen Thien','thientran@che.uk','Russia');
insert into users(name, email, country) values('Tran Van Thien','thienkuto@che.uk','VN');
insert into users(name, email, country) values('Nguyen Van Vu','giaosu@che.uk','Malaysia');
insert into users(name, email, country) values('Hoang Van Hiep','hiep@che.uk','US');
insert into users(name, email, country) values('Ngo Van Thai','thai@che.uk','UK');

select id, name, email, country from users where id = 2;
select id, name, email, country from users where name like '%THIEN';
select * from users;
delete from users where id = 2;
update users set name = 'Thien', email = 'wegraweg', country = 'wegfewg' where id =18;
select id, name, email, country from users where country like '%nam%';

DELIMITER //
CREATE PROCEDURE get_user_by_id(IN user_id INT)
BEGIN
    SELECT name, email, country
    FROM users
    where users.id = user_id;
    END //
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE insert_user(
IN user_name varchar(50),
IN user_email varchar(50),
IN user_country varchar(50)
)
BEGIN
    INSERT INTO users(name, email, country) VALUES(user_name, user_email, user_country);
    END$$
DELIMITER ;

