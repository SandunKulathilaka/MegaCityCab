package com.megacitycab.dao;

import com.megacitycab.config.DbConnection;
import com.megacitycab.model.Driver;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DriverDAO {

    // Add a new driver to the database
    public boolean addDriver(Driver driver) {
        String sql = "INSERT INTO Drivers (user_id, license_number, vehicle_id, rating, status) VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = DbConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, driver.getUserId());
            preparedStatement.setString(2, driver.getLicenseNumber());
            preparedStatement.setString(3, driver.getVehicleId());
            preparedStatement.setDouble(4, driver.getRating());
            preparedStatement.setString(5, driver.getStatus());

            int rowsInserted = preparedStatement.executeUpdate();
            return rowsInserted > 0; // Return true if the driver was added successfully
        } catch (SQLException e) {
            throw new RuntimeException("Error adding driver to database", e);
        }
    }

    // Fetch all drivers from the database
    public List<Driver> getAllDrivers() {
        List<Driver> driverList = new ArrayList<>();
        String sql = "SELECT * FROM Drivers";
        try (Connection connection = DbConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                Driver driver = new Driver(
                        resultSet.getString("driver_id"),
                        resultSet.getString("user_id"),
                        resultSet.getString("license_number"),
                        resultSet.getString("vehicle_id"),
                        resultSet.getDouble("rating"),
                        resultSet.getString("status")
                );
                driverList.add(driver);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error fetching all drivers from database", e);
        }
        return driverList;
    }

    // Update an existing driver in the database
    public boolean updateDriver(Driver driver) {
        String sql = "UPDATE Drivers SET user_id = ?, license_number = ?, vehicle_id = ?, rating = ?, status = ? WHERE driver_id = ?";
        try (Connection connection = DbConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, driver.getUserId());
            preparedStatement.setString(2, driver.getLicenseNumber());
            preparedStatement.setString(3, driver.getVehicleId());
            preparedStatement.setDouble(4, driver.getRating());
            preparedStatement.setString(5, driver.getStatus());
            preparedStatement.setString(6, driver.getDriverId());

            int rowsUpdated = preparedStatement.executeUpdate();
            return rowsUpdated > 0; // Return true if the driver was updated successfully
        } catch (SQLException e) {
            throw new RuntimeException("Error updating driver in database", e);
        }
    }

    // Delete a driver from the database
    public boolean deleteDriver(String driverId) {
        // Step 1: Set driver_id to NULL in Bookings
        String updateBookingsSql = "UPDATE Bookings SET driver_id = NULL WHERE driver_id = ?";
        try (Connection connection = DbConnection.getConnection();
             PreparedStatement updateBookingsStatement = connection.prepareStatement(updateBookingsSql)) {

            updateBookingsStatement.setString(1, driverId);
            updateBookingsStatement.executeUpdate();

            // Step 2: Delete the driver
            String deleteDriverSql = "DELETE FROM Drivers WHERE driver_id = ?";
            try (PreparedStatement deleteDriverStatement = connection.prepareStatement(deleteDriverSql)) {

                deleteDriverStatement.setString(1, driverId);
                int rowsDeleted = deleteDriverStatement.executeUpdate();
                return rowsDeleted > 0; // Return true if the driver was deleted successfully
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error deleting driver from database", e);
        }
    }
}