package com.example.ontap1.repository;

import com.example.ontap1.model.Customer;
import com.example.ontap1.model.CustomerDTO;

import java.util.List;

public interface ICustomerRepository{
    List<CustomerDTO> showList();
    boolean add(Customer customer);
    boolean delete(int id);
    boolean update(Customer customer);
    CustomerDTO findById(int id);

}
