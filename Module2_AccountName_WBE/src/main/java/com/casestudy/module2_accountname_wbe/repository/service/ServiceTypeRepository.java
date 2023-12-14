package com.casestudy.module2_accountname_wbe.repository.service;

import com.casestudy.module2_accountname_wbe.model.service.ServiceType;
import com.casestudy.module2_accountname_wbe.repository.BaseRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ServiceTypeRepository {
    private static final String FIND_SERVICE_TYPE = "select * from service_type where service_type_id = ?;";
    public ServiceType findById(int id) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_SERVICE_TYPE);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int idType = resultSet.getInt("service_type_id");
                String name = resultSet.getString("service_type_name");
                return new ServiceType(idType, name);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
