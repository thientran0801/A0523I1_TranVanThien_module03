package com.ss11mvc.product_management_application.service;

import com.ss11mvc.product_management_application.model.Product;
import com.ss11mvc.product_management_application.repository.IProductRepository;
import com.ss11mvc.product_management_application.repository.ProductRepository;

import java.util.List;

public class ProductService implements IProductService {
    private IProductRepository iProductRepository = new ProductRepository();

    @Override
    public List<Product> showList() {
        return iProductRepository.showList();
    }

    @Override
    public void add(Product product) {
        iProductRepository.add(product);
    }

    @Override
    public void update(int id, Product product) {
        iProductRepository.update(id, product);
    }

    @Override
    public void delete(int id) {
        iProductRepository.delete(id);
    }

    @Override
    public List<Product> findByName(String keyword) {
        List<Product> productList = iProductRepository.showList();
        for (Product p : productList) {
            String name = p.getName().toLowerCase();
            if (!name.contains(keyword.toLowerCase())) {
                productList.remove(p);
            }
        }
        return productList;
    }

    @Override
    public Product findById(int id) {
        List<Product> productList = iProductRepository.showList();
        for (Product p : productList) {
            if (p.getId() == id) {
                return p;
            }
        }
        return null;
    }

}
