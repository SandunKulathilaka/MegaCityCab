package com.megacitycab.dao;

import com.megacitycab.config.DbConnection;
import com.megacitycab.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    // Add a new user to the database
    public boolean addUser(User user) {
        String sql = "INSERT INTO users (full_name, email, phone, password, role, address) VALUES (?,?,?,?,?,?)";
        try (Connection connection = DbConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, user.getFullName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getPhone());
            preparedStatement.setString(4, user.getPassword());
            preparedStatement.setString(5, user.getRole());
            preparedStatement.setString(6, user.getAddress());

            int rowsInserted = preparedStatement.executeUpdate();
            return rowsInserted > 0; // Return true if the user was added successfully
        } catch (SQLException e) {
            throw new RuntimeException("Error adding user to database", e);
        }
    }

    // Fetch a user by email and password
    public User getUserByEmailAndPassword(String email, String password) {
        String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
        try (Connection connection = DbConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return new User(
                            resultSet.getString("full_name"),
                            resultSet.getString("email"),
                            resultSet.getString("phone"),
                            resultSet.getString("password"),
                            resultSet.getString("role"),
                            resultSet.getString("address")
                    );
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error fetching user from database", e);
        }
        return null; // User not found
    }

    // Fetch all users from the database
    public List<User> getAllUsers() {
        List<User> userList = new ArrayList<>();
        String sql = "SELECT * FROM users";
        try (Connection connection = DbConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                User user = new User(
                        resultSet.getString("full_name"),
                        resultSet.getString("email"),
                        resultSet.getString("phone"),
                        resultSet.getString("password"),
                        resultSet.getString("role"),
                        resultSet.getString("address")
                );
                userList.add(user);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error fetching all users from database", e);
        }
        return userList;
    }

    // Update an existing user in the database
    public boolean updateUser(User user) {
        String sql = "UPDATE users SET full_name = ?, phone = ?, password = ?, role = ?, address = ? WHERE email = ?";
        try (Connection connection = DbConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, user.getFullName());
            preparedStatement.setString(2, user.getPhone());
            preparedStatement.setString(3, user.getPassword());
            preparedStatement.setString(4, user.getRole());
            preparedStatement.setString(5, user.getAddress());
            preparedStatement.setString(6, user.getEmail());

            int rowsUpdated = preparedStatement.executeUpdate();
            return rowsUpdated > 0; // Return true if the user was updated successfully
        } catch (SQLException e) {
            throw new RuntimeException("Error updating user in database", e);
        }
    }

    // Delete a user from the database
    public boolean deleteUser(String email) {
        String sql = "DELETE FROM users WHERE email = ?";
        try (Connection connection = DbConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, email);
            int rowsDeleted = preparedStatement.executeUpdate();
            return rowsDeleted > 0; // Return true if the user was deleted successfully
        } catch (SQLException e) {
            throw new RuntimeException("Error deleting user from database", e);
        }
    }
}