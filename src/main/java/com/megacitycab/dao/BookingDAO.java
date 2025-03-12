package com.megacitycab.dao;

import com.megacitycab.config.DbConnection;
import com.megacitycab.model.Booking;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookingDAO {

    // Updated SQL query to join Bookings, Users (for customer), and Users (for driver) tables
    private static final String SELECT_ALL_BOOKINGS =
            "SELECT b.booking_id, " +
                    "       cu.full_name AS customer_name, " +
                    "       du.full_name AS driver_name, " +
                    "       b.pickup_location, " +
                    "       b.dropoff_location, " +
                    "       b.fare, " +
                    "       b.status AS booking_status, " +
                    "       b.pickup_time AS booking_time " +
                    "FROM Bookings b " +
                    "JOIN Users cu ON b.customer_id = cu.user_id " + // Join for customer name
                    "LEFT JOIN Drivers d ON b.driver_id = d.driver_id " + // Join for driver details
                    "LEFT JOIN Users du ON d.user_id = du.user_id"; // Join for driver name

    // Use DbConnection to get the connection
    protected Connection getConnection() {
        try {
            return DbConnection.getConnection(); // Use the DbConnection class to get the connection
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Fetch all bookings
    public List<Booking> getAllBookings() {
        List<Booking> bookings = new ArrayList<>();
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(SELECT_ALL_BOOKINGS);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                bookings.add(new Booking(
                        rs.getInt("booking_id"),
                        rs.getString("customer_name"),
                        rs.getString("driver_name"),
                        rs.getString("pickup_location"),
                        rs.getString("dropoff_location"),
                        rs.getDouble("fare"),
                        rs.getString("booking_status"),
                        rs.getTimestamp("booking_time")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }
}