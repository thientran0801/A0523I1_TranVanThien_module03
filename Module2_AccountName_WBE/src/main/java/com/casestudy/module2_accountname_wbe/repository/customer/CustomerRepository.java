package com.casestudy.module2_accountname_wbe.repository.customer;

import com.casestudy.module2_accountname_wbe.model.customer.Customer;
import com.casestudy.module2_accountname_wbe.model.customer.CustomerType;
import com.casestudy.module2_accountname_wbe.repository.BaseRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private static CustomerTypeRepository customerTypeRepository = new CustomerTypeRepository();
    private static final String SELECT_ALL_CUSTOMER = "select * from customer where customer_status = 0;";
    private static final String FIND_BY_NAME = "select * from customer where customer_name like ?;";

    private static final String SELECT_BY_ID = "select * from customer where customer_id = ?;";

//    private static final String DELETE_FROM_CUSTOMER = "delete from customer where customer_id = ? ;";
    private static final String DELETE_FROM_CUSTOMER = "update customer set customer_status = 1 where customer_id = ? ;";
    private static final String INSERT_INTO_CUSTOMER = "insert into customer" +
            "(customer_name, customer_birthday, customer_gender, customer_id_card," +
            " customer_phone, customer_address, customer_email, customer_type_id) " +
            "value (?, ?, ?, ?, ?, ?, ?, ?)";
    
    private static final String UPDATE_CUSTOMER = "update customer" +
            " set customer_name = ?, customer_birthday = ?, " +
            "customer_gender = ?, customer_id_card = ?," +
            " customer_phone = ?, customer_address = ?, " +
            "customer_email= ?, customer_type_id = ? " +
            "where customer_id = ?;";

    @Override
    public List<Customer> showList() {
        List<Customer> list = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMER);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("customer_id");
                String name = resultSet.getString("customer_name");
                String birthday = resultSet.getString("customer_birthday");
                boolean gender = resultSet.getBoolean("customer_gender");
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
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_CUSTOMER);
//            preparedStatement.setString(1, customer.getId());
            preparedStatement.setString(1, customer.getName());
            preparedStatement.setString(2, customer.getBirthday());
            preparedStatement.setBoolean(3, customer.getGender());
            preparedStatement.setString(4, customer.getIdCard());
            preparedStatement.setString(5, customer.getPhone());
            preparedStatement.setString(6, customer.getAddress());
            preparedStatement.setString(7, customer.getEmail());
            preparedStatement.setInt(8, customer.getCustomerType().getId());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void edit(Customer customer) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CUSTOMER);
            preparedStatement.setString(1, customer.getName());
            preparedStatement.setString(2, customer.getBirthday());
            preparedStatement.setBoolean(3, customer.getGender());
            preparedStatement.setString(4, customer.getIdCard());
            preparedStatement.setString(5, customer.getPhone());
            preparedStatement.setString(6, customer.getAddress());
            preparedStatement.setString(7, customer.getEmail());
            preparedStatement.setInt(8, customer.getCustomerType().getId());
            preparedStatement.setInt(9, customer.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_FROM_CUSTOMER);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Customer findById(int id) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID);

            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("customer_name");
                String birthday = resultSet.getString("customer_birthday");
                boolean gender = resultSet.getBoolean("customer_gender");
                String idCard = resultSet.getString("customer_id_card");
                String phone = resultSet.getString("customer_phone");
                String email = resultSet.getString("customer_email");
                String address = resultSet.getString("customer_address");
                int typeId = resultSet.getInt("customer_type_id");
                CustomerType customerType = customerTypeRepository.findById(typeId);
                Customer customer = new Customer(id, customerType, name, birthday, gender, idCard, phone, email, address);
                return customer;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Customer> findByName(String keyword) {
        List<Customer> list = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_NAME);
            preparedStatement.setString(1,"%" + keyword + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("customer_id");
                String name = resultSet.getString("customer_name");
                String birthday = resultSet.getString("customer_birthday");
                boolean gender = resultSet.getBoolean("customer_gender");
                String idCard = resultSet.getString("customer_id_card");
                String phone = resultSet.getString("customer_phone");
                String email = resultSet.getString("customer_email");
                String address = resultSet.getString("customer_address");
                int typeId = resultSet.getInt("customer_type_id");
                System.out.println(id + name + gender + typeId);
                CustomerType customerType = customerTypeRepository.findById(typeId);

                Customer customer = new Customer(id, customerType, name, birthday, gender, idCard, phone, email, address);
                list.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
