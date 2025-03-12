package com.megacitycab.model;
import java.sql.Timestamp;

public class Booking {
    private int bookingId;
    private String customerName;
    private String driverName;
    private String pickupLocation;
    private String dropoffLocation;
    private double fare;
    private String bookingStatus;
    private Timestamp bookingTime;

    // Constructors
    public Booking() {}

    public Booking(int bookingId, String customerName, String driverName, String pickupLocation,
                   String dropoffLocation, double fare, String bookingStatus, Timestamp bookingTime) {
        this.bookingId = bookingId;
        this.customerName = customerName;
        this.driverName = driverName;
        this.pickupLocation = pickupLocation;
        this.dropoffLocation = dropoffLocation;
        this.fare = fare;
        this.bookingStatus = bookingStatus;
        this.bookingTime = bookingTime;
    }

    // Getters and Setters
    public int getBookingId() { return bookingId; }
    public void setBookingId(int bookingId) { this.bookingId = bookingId; }

    public String getCustomerName() { return customerName; }
    public void setCustomerName(String customerName) { this.customerName = customerName; }

    public String getDriverName() { return driverName; }
    public void setDriverName(String driverName) { this.driverName = driverName; }

    public String getPickupLocation() { return pickupLocation; }
    public void setPickupLocation(String pickupLocation) { this.pickupLocation = pickupLocation; }

    public String getDropoffLocation() { return dropoffLocation; }
    public void setDropoffLocation(String dropoffLocation) { this.dropoffLocation = dropoffLocation; }

    public double getFare() { return fare; }
    public void setFare(double fare) { this.fare = fare; }

    public String getBookingStatus() { return bookingStatus; }
    public void setBookingStatus(String bookingStatus) { this.bookingStatus = bookingStatus; }

    public Timestamp getBookingTime() { return bookingTime; }
    public void setBookingTime(Timestamp bookingTime) { this.bookingTime = bookingTime; }
}
