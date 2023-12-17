package com.example.ontap1.repository;

import com.example.ontap1.model.Customer;
import com.example.ontap1.model.CustomerDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private static final String SHOW_LIST_CUSTOMER_DTO = "select c.*, t.customer_type_name as typeName " +
            "from customer c join customer_type t on c.customer_type_id = t.customer_type_id where c.customer_status = 0 order by c.customer_id;";
    private static final String ADD_CUSTOMER = "insert into customer" +
            "(customer_name, customer_birthday, customer_gender, customer_id_card, customer_phone," +
            " customer_email, customer_address, customer_type_id) " +
            "value(?,?,?,?,?,?,?,?)";
    private static final String FIND_BY_ID = "select c.*, t.customer_type_name as typeName " +
            "from customer c join customer_type t on c.customer_type_id = t.customer_type_id where c.customer_id = ?;";

    private static final String UPDATE_CUSTOMER = "update customer set customer_name =?, customer_birthday=?" +
            ", customer_gender=?, customer_id_card=?, customer_phone = ?," +
            " customer_email = ?, customer_address = ?, customer_type_id = ? where customer_id = ?";

    private static final String DELETE_CUSTOMER = "delete from customer where customer_id = ?";

    @Override
    public List<CustomerDTO> showList() {
        List<CustomerDTO> list = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SHOW_LIST_CUSTOMER_DTO);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("customer_id");
                String name = resultSet.getString("customer_name");
                String type = resultSet.getString("typeName");
                String dob = resultSet.getString("customer_birthday");
                Boolean gender = resultSet.getBoolean("customer_gender");
                String idCard = resultSet.getString("customer_id_card");
                String phone = resultSet.getString("customer_phone");
                String email = resultSet.getString("customer_email");
                String address = resultSet.getString("customer_address");
                list.add(new CustomerDTO(id, name, type, dob, gender, idCard, phone, email, address));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public boolean add(Customer customer) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(ADD_CUSTOMER);
            preparedStatement.setString(1, customer.getName());
            preparedStatement.setString(2, customer.getDob());
            preparedStatement.setBoolean(3, customer.getGender());
            preparedStatement.setString(4, customer.getIdCard());
            preparedStatement.setString(5, customer.getPhone());
            preparedStatement.setString(6, customer.getEmail());
            preparedStatement.setString(7, customer.getAddress());
            preparedStatement.setInt(8, customer.getType());
            preparedStatement.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CUSTOMER);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean update(Customer customer) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CUSTOMER);
            preparedStatement.setString(1, customer.getName());
            preparedStatement.setString(2, customer.getDob());
            preparedStatement.setBoolean(3, customer.getGender());
            preparedStatement.setString(4, customer.getIdCard());
            preparedStatement.setString(5, customer.getPhone());
            preparedStatement.setString(6, customer.getEmail());
            preparedStatement.setString(7, customer.getAddress());
            preparedStatement.setInt(8, customer.getType());
            preparedStatement.setInt(9, customer.getId());
            preparedStatement.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public CustomerDTO findById(int id) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int customer_id = resultSet.getInt("customer_id");
                String name = resultSet.getString("customer_name");
                String type = resultSet.getString("typeName");
                String dob = resultSet.getString("customer_birthday");
                Boolean gender = resultSet.getBoolean("customer_gender");
                String idCard = resultSet.getString("customer_id_card");
                String phone = resultSet.getString("customer_phone");
                String email = resultSet.getString("customer_email");
                String address = resultSet.getString("customer_address");
                return new CustomerDTO(customer_id, name, type, dob, gender, idCard, phone, email, address);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
