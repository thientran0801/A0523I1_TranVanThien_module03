package com.casestudy.module2_accountname_wbe.repository;

import com.casestudy.module2_accountname_wbe.model.customer.CustomerType;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerTypeRepository implements IRepositorySub<CustomerType> {
    private static final String SELECT_ALL = "select * from customer_type;";
    private static final String FIND_BY_ID = "select * from customer_type where customer_type_id = ?;";

    @Override
    public List<CustomerType> showList() {
        List<CustomerType> list = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("customer_type_id");
                String type = rs.getString("customer_type_name");
                list.add(new CustomerType(id, type));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public CustomerType findById(int id) {
        CustomerType customerType = null;
        try {
            Connection connection = BaseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int idType = rs.getInt("customer_type_id");
                String type = rs.getString("customer_type_name");
                customerType = new CustomerType(idType, type);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerType;
    }

    public static void main(String[] args) {
        CustomerTypeRepository customerTypeRepository = new CustomerTypeRepository();
        System.out.println(customerTypeRepository.findById(2).getCustomerType());
    }
}
