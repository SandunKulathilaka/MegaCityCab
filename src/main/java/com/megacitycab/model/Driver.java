package com.megacitycab.model;

public class Driver {
    private String driverId;
    private String userId;
    private String licenseNumber;
    private String vehicleId;
    private double rating;
    private String status;

    // Constructor
    public Driver(String driverId, String userId, String licenseNumber, String vehicleId, double rating, String status) {
        this.driverId = driverId;
        this.userId = userId;
        this.licenseNumber = licenseNumber;
        this.vehicleId = vehicleId;
        this.rating = rating;
        this.status = status;
    }

    public Driver() {
    }

    // Getters and Setters
    public String getDriverId() {
        return driverId;
    }

    public void setDriverId(String driverId) {
        this.driverId = driverId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getLicenseNumber() {
        return licenseNumber;
    }

    public void setLicenseNumber(String licenseNumber) {
        this.licenseNumber = licenseNumber;
    }

    public String getVehicleId() {
        return vehicleId;
    }

    public void setVehicleId(String vehicleId) {
        this.vehicleId = vehicleId;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}