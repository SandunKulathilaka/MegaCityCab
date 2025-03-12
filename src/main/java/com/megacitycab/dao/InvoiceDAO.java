package com.megacitycab.dao;

import com.megacitycab.config.DbConnection;
import com.megacitycab.model.Invoice;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class InvoiceDAO {

    // Add a new invoice to the database
    public boolean addInvoice(Invoice invoice) {
        String sql = "INSERT INTO Invoices (booking_id, customer_id, driver_id, total_amount) VALUES (?,?,?,?)";
        try (Connection connection = DbConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, invoice.getBookingId());
            preparedStatement.setInt(2, invoice.getCustomerId());
            preparedStatement.setInt(3, invoice.getDriverId());
            preparedStatement.setDouble(4, invoice.getTotalAmount());

            int rowsInserted = preparedStatement.executeUpdate();
            return rowsInserted > 0; // Return true if the invoice was added successfully
        } catch (SQLException e) {
            throw new RuntimeException("Error adding invoice to database", e);
        }
    }

    // Fetch all invoices from the database
    public List<Invoice> getAllInvoices() {
        List<Invoice> invoiceList = new ArrayList<>();
        String sql = "SELECT * FROM Invoices";
        try (Connection connection = DbConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                Invoice invoice = new Invoice(
                        resultSet.getInt("invoice_id"),
                        resultSet.getInt("booking_id"),
                        resultSet.getInt("customer_id"),
                        resultSet.getInt("driver_id"),
                        resultSet.getDouble("total_amount"),
                        resultSet.getTimestamp("invoice_date")
                );
                invoiceList.add(invoice);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error fetching all invoices from database", e);
        }
        return invoiceList;
    }

    // Update an existing invoice in the database
    public boolean updateInvoice(Invoice invoice) {
        String sql = "UPDATE Invoices SET booking_id = ?, customer_id = ?, driver_id = ?, total_amount = ? WHERE invoice_id = ?";
        try (Connection connection = DbConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, invoice.getBookingId());
            preparedStatement.setInt(2, invoice.getCustomerId());
            preparedStatement.setInt(3, invoice.getDriverId());
            preparedStatement.setDouble(4, invoice.getTotalAmount());
            preparedStatement.setInt(5, invoice.getInvoiceId());

            int rowsUpdated = preparedStatement.executeUpdate();
            return rowsUpdated > 0; // Return true if the invoice was updated successfully
        } catch (SQLException e) {
            throw new RuntimeException("Error updating invoice in database", e);
        }
    }

    // Delete an invoice from the database
    public boolean deleteInvoice(int invoiceId) {
        String sql = "DELETE FROM Invoices WHERE invoice_id = ?";
        try (Connection connection = DbConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, invoiceId);
            int rowsDeleted = preparedStatement.executeUpdate();
            return rowsDeleted > 0; // Return true if the invoice was deleted successfully
        } catch (SQLException e) {
            throw new RuntimeException("Error deleting invoice from database", e);
        }
    }

    // Fetch an invoice by ID
    public Invoice getInvoiceById(int invoiceId) {
        String sql = "SELECT * FROM Invoices WHERE invoice_id = ?";
        try (Connection connection = DbConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, invoiceId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return new Invoice(
                            resultSet.getInt("invoice_id"),
                            resultSet.getInt("booking_id"),
                            resultSet.getInt("customer_id"),
                            resultSet.getInt("driver_id"),
                            resultSet.getDouble("total_amount"),
                            resultSet.getTimestamp("invoice_date")
                    );
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error fetching invoice by ID", e);
        }
        return null; // Invoice not found
    }
}