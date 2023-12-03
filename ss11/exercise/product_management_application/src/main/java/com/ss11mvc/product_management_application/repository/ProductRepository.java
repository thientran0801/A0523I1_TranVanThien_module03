package com.ss11mvc.product_management_application.repository;

import com.ss11mvc.product_management_application.model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductRepository implements IProductRepository {
    private static Map<Integer, Product> productMap;

    static {
        productMap = new HashMap();
        productMap.put(1, new Product(1, "Iphone 12", 15000000, "Hàng likenew 99%", "Apple"));
        productMap.put(2, new Product(2, "Samsung A3", 9990000, "Hàng likenew 99%", "Samsung"));
        productMap.put(3, new Product(3, "Xiaomi redmi note 4 pro", 10500000, "Nguyên seal", "Xiaomi"));
        productMap.put(4, new Product(4, "Iphone 15 promax", 9200000, "Hàng xách tay 99%", "Apple"));
        productMap.put(5, new Product(5, "Iphone 7 plus", 5400000, "Nguyên seal", "Apple"));
        productMap.put(6, new Product(6, "Sony Xperia XA", 20000000, "Hàng likenew 99%", "Sony"));
        productMap.put(7, new Product(7, "Iphone 14 promax", 23550000, "Hàng trưng bày", "Apple"));
        productMap.put(8, new Product(8, "Sony Ultra 10", 5990000, "Nguyên seal%", "Sony"));
        productMap.put(9, new Product(9, "Samsung galaxy Z", 5500000, "Hàng likenew 99%", "Samsung"));
        productMap.put(10, new Product(10, "Iphone 11 pro", 4700000, "Hàng mới 100%", "Apple"));
    }

    @Override
    public List<Product> showList() {
        return new ArrayList<>(productMap.values());
    }

    @Override
    public void add(Product product) {
        productMap.put(product.getId(), product);
    }

    @Override
    public void update(int id, Product product) {
        productMap.put(id, product);
    }

    @Override
    public void delete(int id) {
        productMap.remove(id);
    }
}
