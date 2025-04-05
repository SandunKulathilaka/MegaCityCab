package com.megacitycab.dao;

import com.megacitycab.model.Booking;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookingDAO {
    private Connection connection;

    public BookingDAO(Connection connection) {
        this.connection = connection;
    }

    // Add a new booking
    public boolean addBooking(Booking booking) {
        String sql = "INSERT INTO bookings (customer_username, customer_email, pickup_location, dropoff_location, distance, fare, ride_date, status) VALUES (?, ?, ?, ?, ?, ?, ?, 'pending')";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, booking.getCustomerUsername());
            stmt.setString(2, booking.getCustomerEmail());
            stmt.setString(3, booking.getPickupLocation());
            stmt.setString(4, booking.getDropoffLocation());
            stmt.setDouble(5, booking.getDistance());
            stmt.setDouble(6, booking.getFare());
            stmt.setTimestamp(7, new Timestamp(booking.getRideDate().getTime()));
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Retrieve all bookings
    public List<Booking> getAllBookings() {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT * FROM bookings";
        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                bookings.add(mapResultSetToBooking(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }

    // Retrieve a single booking by ID
    public Booking getBookingById(int id) {
        String sql = "SELECT * FROM bookings WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToBooking(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Update booking status
    public boolean updateBookingStatus(int id, String status) {
        String sql = "UPDATE bookings SET status = ? WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, status);
            stmt.setInt(2, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Helper method to map ResultSet to Booking object
    private Booking mapResultSetToBooking(ResultSet rs) throws SQLException {
        return new Booking(
                rs.getInt("id"),
                rs.getString("customer_username"),
                rs.getString("customer_email"),
                rs.getString("pickup_location"),
                rs.getString("dropoff_location"),
                rs.getDouble("distance"),
                rs.getDouble("fare"),
                rs.getTimestamp("ride_date"),
                rs.getString("driver_name"),
                rs.getString("driver_email"),
                rs.getString("status"),
                rs.getTimestamp("created_at")
        );
    }
}
