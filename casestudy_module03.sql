

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

-- select sum(cd.cd_quantity*si.si_price) as total_si, cd.contract_id
-- from contract_detail cd join service_included si on  si.si_id = cd.si_id
-- group by cd.contract_id;

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

select month(contract_day) as `Month`, count(c_id) as `customers number`
from contract co
where year(contract_day) = 2021
group by `Month`
order by `Month` asc;

-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm.
--  Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem
--  (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).

select co.id, co.contract_day, co.end_day, co.deposit, sum(cd.cd_quantity) as quantity_si
from contract co left join contract_detail cd on co.id = cd.contract_id
group by co.id
order by co.id asc;

-- 11.	Hiển thị thông tin các dịch vụ đi kèm 
-- đã được sử dụng bởi những khách hàng 
-- có ten_loai_khach là “Diamond” và 
-- có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.

select si.*
from service_included si join contract_detail cd using(si_id)
join contract co on co.id = cd.contract_id
where co.c_id in (select c.c_id
from customer c join type_customer tc using (tc_id)
where substring_index(c.c_address, ', ',-1) = 'Vinh' or substring_index(c.c_address, ', ',-1) = 'Quảng Ngãi' and tc.tc_type = 'Diamond'
)
order by si.si_id;

-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem
--  (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ 
--  đã từng được khách hàng đặt vào 3 tháng cuối năm 2020
-- nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.

select co.id as contractID, e.e_name, c.c_name, c.c_phonenumber,s.s_id, s.s_name, ifnull(sum(cd.cd_quantity),0) as quantity, co.deposit
from contract co join customer c using (c_id)
join employee e using (e_id)
join service s using (s_id)
left join contract_detail cd on co.id = cd.contract_id
where co.id in (
select id
from contract
where year(contract_day) = 2020 and month(contract_day) between 10 and 12
)
and co.id not in (
select id
from contract
where year(contract_day) = 2021 and month(contract_day) between 1 and 6
)
group by co.id;

-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).

select si.si_id, si.si_name, sum(cd.cd_quantity) as quantity
from contract_detail cd join service_included si using(si_id)
group by si.si_id    
having quantity = 
(
select sum(cd_quantity) as total
from contract_detail
group by si_id
order by total desc
limit 1
);

select si.si_id, si.si_name, sum(cd.cd_quantity) as quantity
from contract_detail cd join service_included si using(si_id)
group by si.si_id    
having quantity >= all 
(
select sum(cd_quantity) as total
from contract_detail
group by si_id
);

-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).

select co.id, s.s_name, si.si_name, sum(cd.cd_quantity) as total
from service_included si join contract_detail cd using(si_id)
join contract co on co.id = cd.contract_id
join service s using(s_id)
group by co.id, s.s_name, si.si_name
having total = 1;


-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm 
-- ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi 
-- mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.

select e.e_id, e.e_name, le.le_level, de.de_department, e.e_phonenumber, e.e_address
from employee e join level_employee le using(le_id)
join department_employee de using(de_id)
where e.e_id in 
(
select  e.e_id
from employee e join contract co using(e_id)
group by e.e_id
having count(e.e_id) between 0 and 3
);


-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021
drop database furama_resort;

-- C1 ----------------------

create temporary table temp_id_e as
select distinct e.e_id
from employee e left join contract co using(e_id)
where co.e_id is null;

delete from employee 
where e_id in
 (
select e_id
from temp_id_e
);

drop temporary table if exists temp_id_e;


-- C2---------------------
set sql_safe_updates = 0;
delete from employee 
where e_id not in
 (
select  e_id
from contract
where year(contract_day) between 2019 and 2021
);
set sql_safe_updates = 1;

-- ------------------------------------
create view temp_view as
select e.e_id
from employee e left join contract co using(e_id)
where co.e_id is null;

delete from employee
where e_id in (select tv.e_id from temp_view tv);

select tv.e_id from temp_view tv;
drop temporary table if exists temp_id_e;

-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond,
-- chỉ cập nhật những khách hàng đã từng đặt phòng với 
-- Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
set sql_safe_updates = 0;

update customer
set tc_id = 1
where c_id in 
(
select c_id 
from (
select c.c_id
from customer c join type_customer tc using(tc_id)
join contract co using(c_id)
join service s using(s_id)
left join contract_detail cd on co.id = cd.contract_id
left join service_included si using(si_id)
where tc.tc_type = 'Platinum' and year(co.contract_day) = 2021
group by c.c_id)
as temp_table
);

set sql_safe_updates = 1;



-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).


-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.

-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.

   
   