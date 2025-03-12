package com.megacitycab.model;

import java.sql.Timestamp;

public class Invoice {
    private int invoiceId;
    private int bookingId;
    private int customerId;
    private int driverId;
    private double totalAmount;
    private Timestamp invoiceDate;

    // Constructor, getters, and setters
    public Invoice(int invoiceId, int bookingId, int customerId, int driverId, double totalAmount, Timestamp invoiceDate) {
        this.invoiceId = invoiceId;
        this.bookingId = bookingId;
        this.customerId = customerId;
        this.driverId = driverId;
        this.totalAmount = totalAmount;
        this.invoiceDate = invoiceDate;
    }

    // Getters and setters for all fields
    public int getInvoiceId() {
        return invoiceId;
    }

    public void setInvoiceId(int invoiceId) {
        this.invoiceId = invoiceId;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getDriverId() {
        return driverId;
    }

    public void setDriverId(int driverId) {
        this.driverId = driverId;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public Timestamp getInvoiceDate() {
        return invoiceDate;
    }

    public void setInvoiceDate(Timestamp invoiceDate) {
        this.invoiceDate = invoiceDate;
    }
}