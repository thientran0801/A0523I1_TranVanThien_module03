package com.casestudy.module2_accountname_wbe.repository.employee;

import com.casestudy.module2_accountname_wbe.model.employee.EducationDegree;
import com.casestudy.module2_accountname_wbe.repository.BaseRepository;
import com.casestudy.module2_accountname_wbe.repository.IRepositorySub;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EducationDegreeRepository implements IRepositorySub<EducationDegree> {
    private static final String SELECT_ALL = "select * from education_degree;";

    @Override
    public List<EducationDegree> showList() {
        List<EducationDegree> list = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("education_degree_id");
                String education_degree_name = resultSet.getString("education_degree_name");
                EducationDegree educationDegree = new EducationDegree(id, education_degree_name);
                list.add(educationDegree);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public EducationDegree findById(int id) {
        return null;
    }
}
