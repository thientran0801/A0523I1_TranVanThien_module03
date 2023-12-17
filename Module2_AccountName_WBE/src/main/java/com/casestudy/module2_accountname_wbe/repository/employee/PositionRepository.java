package com.casestudy.module2_accountname_wbe.repository.employee;

import com.casestudy.module2_accountname_wbe.model.employee.Division;
import com.casestudy.module2_accountname_wbe.model.employee.Position;
import com.casestudy.module2_accountname_wbe.repository.BaseRepository;
import com.casestudy.module2_accountname_wbe.repository.IRepositorySub;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PositionRepository implements IRepositorySub<Position> {
    private static final String SELECT_ALL = "select * from position;";

    @Override
    public List<Position> showList() {
        List<Position> list = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("position_id");
                String position_name = resultSet.getString("position_name");

                Position position = new Position(id, position_name);
                list.add(position);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public Position findById(int id) {
        return null;
    }
}
