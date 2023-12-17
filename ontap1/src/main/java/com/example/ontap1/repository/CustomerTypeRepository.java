package com.example.ontap1.repository;

import com.example.ontap1.model.CustomerType;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerTypeRepository implements IRepositoruSub<CustomerType>{
    private static final String SELECT_ALL = "select * from customer_type;";

    @Override
    public List<CustomerType> showList() {
        List<CustomerType> list = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("customer_type_id");
                String type = resultSet.getString("customer_type_name");
                list.add(new CustomerType(id, type));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
