package com.module3.userexercise.dao;

import com.module3.userexercise.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserDAO {
    void insertUser(User user);
    User selectById(int id);
    List<User> selectAll();
    boolean delete(int id);
    boolean update(User user);
    List<User> selectByCountry(String country);
    List<User> sortByName();
}
