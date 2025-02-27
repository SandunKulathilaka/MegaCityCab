package com.shopme.megacitycab.dao;

import com.shopme.megacitycab.config.DbConnection;
import com.shopme.megacitycab.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UserDAO {
    public  void addUser(User user){
        String sql = "INSERT INTO users (full_name, email, phone, password, role, address) VALUES  (?,?,?,?,?,?)";
        try {
            Connection connection = DbConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, user.getFullName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getPhone());
            preparedStatement.setString(4, user.getPassword());
            preparedStatement.setString(5, user.getRole());
            preparedStatement.setString(6, user.getAddress());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
