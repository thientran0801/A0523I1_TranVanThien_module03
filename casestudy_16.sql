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

select c.c_id, c.c_name
from customer c join type_customer tc using(tc_id)
join contract co using(c_id)
left join contract_detail cd on co.id = cd.contract_id
left join service_included si using(si_id)
where tc.tc_type = 'Platinum' and year(co.contract_day) = 2021
group by c.c_id


;
select co.c_id, sum(s.s_price) as total
from contract co join service s using(s_id)
where year(co.contract_day) = 2021
group by co.c_id
having total > 10000000


-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).

-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.

-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.

   