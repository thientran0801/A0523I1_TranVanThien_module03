package com.casestudy.module2_accountname_wbe.repository;

import com.casestudy.module2_accountname_wbe.model.customer.Customer;
import com.casestudy.module2_accountname_wbe.model.customer.CustomerType;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository{
    private static CustomerTypeRepository customerTypeRepository = new CustomerTypeRepository();
    private static final String SELECT_ALL_CUSTOMER = "select * from customer;";
/*    private static final String DELETE_FROM_CUSTOMER = "delete from customer where customer_id = ? ;";
    private static final String INSERT_INTO_CUSTOMER = "insert into customer" +
            "(customer_id, customer_name, customer_birthday, customer_gender, customer_id_card," +
            " customer_phone, customer_address, customer_email, customer_type_id) " +
            "value (?, ?, ?, ?, ?, ?, ?, ?, ?)";*/
    @Override
    public List<Customer> showList() {
        System.out.println("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
        List<Customer> list = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMER);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String id = resultSet.getString("customer_id");
                String name = resultSet.getString("customer_name");
                String birthday = resultSet.getString("customer_birthday");
                String gender;
                if (resultSet.getInt("customer_gender") == 0) {
                    gender = "Nam";
                }else {
                    gender = "Nữ";
                }
                String idCard = resultSet.getString("customer_id_card");
                String phone = resultSet.getString("customer_phone");
                String email = resultSet.getString("customer_email");
                String address = resultSet.getString("customer_address");
                int typeId = resultSet.getInt("customer_type_id");
                CustomerType customerType = customerTypeRepository.findById(typeId);

                Customer customer = new Customer(id, customerType, name, birthday, gender, idCard, phone, email, address);
                list.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public void add(Customer customer) {

    }

    @Override
    public void edit(Customer customer) {

    }

    @Override
    public void delete(String id) {

    }

    @Override
    public Customer findById(String id) {
        return null;
    }
}
