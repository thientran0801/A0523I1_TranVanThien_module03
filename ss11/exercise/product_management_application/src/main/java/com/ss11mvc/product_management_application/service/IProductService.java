package com.ss11mvc.product_management_application.service;

import com.ss11mvc.product_management_application.model.Product;

import java.util.List;
import java.util.Map;

public interface IProductService {

/*    Hiển thị danh sách sản phẩm
    Tạo sản phẩm mới
    Cập nhật thông tin sản phẩm
    Xoá một sản phẩm
    Xem chi tiết một sản phẩm
    Tìm kiếm sản phẩm theo tên*/

    List<Product> showList();
    void add(Product product);
    void update(int id, Product product);
    void delete(int id);
    List<Product> findByName(String keyword);

    Product findById(int id);
}
