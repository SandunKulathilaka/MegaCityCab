package com.megacitycab.model;

import java.sql.Timestamp;
import java.util.Date;

public class Booking {
    private int id;
    private String customerUsername;
    private String customerEmail;
    private String pickupLocation;
    private String dropoffLocation;
    private double distance;
    private double fare;
    private Date rideDate;
    private String driverName;
    private String driverEmail;
    private String status;
    private Timestamp createdAt;

    // Constructors
    public Booking() {}

    public Booking(int id, String customerUsername, String customerEmail, String pickupLocation,
                   String dropoffLocation, double distance, double fare, Date rideDate,
                   String driverName, String driverEmail, String status, Timestamp createdAt) {
        this.id = id;
        this.customerUsername = customerUsername;
        this.customerEmail = customerEmail;
        this.pickupLocation = pickupLocation;
        this.dropoffLocation = dropoffLocation;
        this.distance = distance;
        this.fare = fare;
        this.rideDate = rideDate;
        this.driverName = driverName;
        this.driverEmail = driverEmail;
        this.status = status;
        this.createdAt = createdAt;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getCustomerUsername() { return customerUsername; }
    public void setCustomerUsername(String customerUsername) { this.customerUsername = customerUsername; }

    public String getCustomerEmail() { return customerEmail; }
    public void setCustomerEmail(String customerEmail) { this.customerEmail = customerEmail; }

    public String getPickupLocation() { return pickupLocation; }
    public void setPickupLocation(String pickupLocation) { this.pickupLocation = pickupLocation; }

    public String getDropoffLocation() { return dropoffLocation; }
    public void setDropoffLocation(String dropoffLocation) { this.dropoffLocation = dropoffLocation; }

    public double getDistance() { return distance; }
    public void setDistance(double distance) { this.distance = distance; }

    public double getFare() { return fare; }
    public void setFare(double fare) { this.fare = fare; }

    public Date getRideDate() { return rideDate; }
    public void setRideDate(Date rideDate) { this.rideDate = rideDate; }

    public String getDriverName() { return driverName; }
    public void setDriverName(String driverName) { this.driverName = driverName; }

    public String getDriverEmail() { return driverEmail; }
    public void setDriverEmail(String driverEmail) { this.driverEmail = driverEmail; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }
}
