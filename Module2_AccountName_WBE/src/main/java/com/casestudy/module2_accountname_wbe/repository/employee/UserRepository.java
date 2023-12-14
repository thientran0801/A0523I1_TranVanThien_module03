package com.casestudy.module2_accountname_wbe.repository.employee;

import com.casestudy.module2_accountname_wbe.model.employee.Division;
import com.casestudy.module2_accountname_wbe.model.employee.User;
import com.casestudy.module2_accountname_wbe.repository.BaseRepository;
import com.casestudy.module2_accountname_wbe.repository.IRepositorySub;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IRepositorySub<User> {
    private static final String INSERT_USER = "insert into user(username,password) value(?, ?);";
    private static final String SELECT_ALL = "seletc * from user;";
    @Override
    public List<User> showList() {
        List<User> list = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String username = resultSet.getString("username");
                String password = resultSet.getString("password");
                User user = new User(username, password);
                list.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public User findById(int id) {
        return null;
    }

    public void addUser(User user) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER);
            preparedStatement.setString(1, user.getUseName());
            preparedStatement.setString(2, user.getPassWord());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
