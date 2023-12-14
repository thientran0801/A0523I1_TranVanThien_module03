package com.casestudy.module2_accountname_wbe.repository.service;

import com.casestudy.module2_accountname_wbe.model.service.RentType;
import com.casestudy.module2_accountname_wbe.model.service.ServiceType;
import com.casestudy.module2_accountname_wbe.repository.BaseRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RentTypeRepository {
    private static final String FIND_RENT_TYPE = "select * from rent_type where rent_type_id = ?;";
   public RentType findById(int id) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_RENT_TYPE);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int idType = resultSet.getInt("rent_type_id");
                String name = resultSet.getString("rent_type_name");
                double typeCost = resultSet.getDouble("rent_type_cost");
                RentType rentType = new RentType(idType,name, typeCost);
                return rentType;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
