-- Create Database
CREATE DATABASE MegaCityCab;
USE MegaCityCab;

-- Users Table (Handles Customers, Drivers, and Admins)
CREATE TABLE Users (
                       user_id         INT PRIMARY KEY AUTO_INCREMENT,
                       full_name       VARCHAR(100) NOT NULL,
                       email           VARCHAR(100) UNIQUE NOT NULL,
                       phone           VARCHAR(15) UNIQUE NOT NULL,
                       password        VARCHAR(255) NOT NULL,
                       role            ENUM('Customer', 'Driver', 'Admin') NOT NULL,
                       profile_picture VARCHAR(255),
                       address         TEXT,
                       created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert Dummy Users
INSERT INTO Users (full_name, email, phone, password, role, address) VALUES
                                                                         ('Alice Johnson', 'alice@example.com', '1234567890', 'hashedpassword1', 'Customer', '123 Main St'),
                                                                         ('Bob Smith', 'bob@example.com', '0987654321', 'hashedpassword2', 'Driver', '456 Oak St'),
                                                                         ('Charlie Brown', 'charlie@example.com', '1122334455', 'hashedpassword3', 'Admin', '789 Pine St');

-- Drivers Table (Specific details for drivers)
CREATE TABLE Drivers (
                         driver_id       INT PRIMARY KEY AUTO_INCREMENT,
                         user_id         INT UNIQUE,
                         license_number  VARCHAR(50) UNIQUE NOT NULL,
                         vehicle_id      INT,
                         rating          DECIMAL(3,2) DEFAULT 5.00,
                         status          ENUM('Available', 'On Trip', 'Inactive') DEFAULT 'Available',
                         FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Insert Dummy Drivers
INSERT INTO Drivers (user_id, license_number, status) VALUES
                                                          (2, 'LIC12345', 'Available'),
                                                          (3, 'LIC67890', 'On Trip'),
                                                          (1, 'LIC54321', 'Inactive');

-- Vehicles Table
CREATE TABLE Vehicles (
                          vehicle_id      INT PRIMARY KEY AUTO_INCREMENT,
                          driver_id       INT UNIQUE,
                          vehicle_type    ENUM('Car', 'SUV', 'Van', 'Bike') NOT NULL,
                          make_model      VARCHAR(100) NOT NULL,
                          plate_number    VARCHAR(20) UNIQUE NOT NULL,
                          year            INT NOT NULL,
                          color           VARCHAR(30),
                          status          ENUM('Active', 'Inactive', 'Under Maintenance') DEFAULT 'Active',
                          FOREIGN KEY (driver_id) REFERENCES Drivers(driver_id)
);

-- Insert Dummy Vehicles
INSERT INTO Vehicles (driver_id, vehicle_type, make_model, plate_number, year, color, status) VALUES
                                                                                                  (1, 'Car', 'Toyota Prius', 'XYZ123', 2019, 'Blue', 'Active'),
                                                                                                  (2, 'SUV', 'Honda CR-V', 'ABC456', 2021, 'Black', 'Under Maintenance'),
                                                                                                  (3, 'Van', 'Ford Transit', 'LMN789', 2018, 'White', 'Active');

-- Bookings Table
CREATE TABLE Bookings (
                          booking_id      INT PRIMARY KEY AUTO_INCREMENT,
                          customer_id     INT NOT NULL,
                          driver_id       INT,
                          pickup_location TEXT NOT NULL,
                          dropoff_location TEXT NOT NULL,
                          pickup_time     DATETIME NOT NULL,
                          status          ENUM('Pending', 'Accepted', 'Completed', 'Cancelled') DEFAULT 'Pending',
                          fare            DECIMAL(8,2) NOT NULL,
                          payment_status  ENUM('Pending', 'Paid', 'Failed') DEFAULT 'Pending',
                          created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                          FOREIGN KEY (customer_id) REFERENCES Users(user_id),
                          FOREIGN KEY (driver_id) REFERENCES Drivers(driver_id)
);

-- Insert Dummy Bookings
INSERT INTO Bookings (customer_id, driver_id, pickup_location, dropoff_location, pickup_time, status, fare, payment_status) VALUES
                                                                                                                                (1, 1, 'Downtown', 'Airport', '2025-02-25 10:00:00', 'Completed', 25.50, 'Paid'),
                                                                                                                                (1, 2, 'City Mall', 'Central Park', '2025-02-25 12:30:00', 'Pending', 15.00, 'Pending'),
                                                                                                                                (1, 3, 'Train Station', 'Hotel Plaza', '2025-02-25 15:00:00', 'Accepted', 30.75, 'Paid');

-- Payments Table
CREATE TABLE Payments (
                          payment_id      INT PRIMARY KEY AUTO_INCREMENT,
                          booking_id      INT NOT NULL,
                          amount          DECIMAL(8,2) NOT NULL,
                          payment_method  ENUM('Cash', 'Card', 'Wallet', 'UPI') NOT NULL,
                          transaction_id  VARCHAR(50) UNIQUE,
                          payment_status  ENUM('Successful', 'Failed', 'Refunded') DEFAULT 'Successful',
                          paid_at         TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                          FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);

-- Insert Dummy Payments
INSERT INTO Payments (booking_id, amount, payment_method, transaction_id, payment_status) VALUES
                                                                                              (1, 25.50, 'Card', 'TXN12345', 'Successful'),
                                                                                              (2, 15.00, 'Cash', NULL, 'Successful'),
                                                                                              (3, 30.75, 'Wallet', 'TXN67890', 'Successful');

-- Invoices Table
CREATE TABLE Invoices (
                          invoice_id      INT PRIMARY KEY AUTO_INCREMENT,
                          booking_id      INT UNIQUE NOT NULL,
                          customer_id     INT NOT NULL,
                          driver_id       INT NOT NULL,
                          total_amount    DECIMAL(8,2) NOT NULL,
                          invoice_date    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                          FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id),
                          FOREIGN KEY (customer_id) REFERENCES Users(user_id),
                          FOREIGN KEY (driver_id) REFERENCES Drivers(driver_id)
);

-- Insert Dummy Invoices
INSERT INTO Invoices (booking_id, customer_id, driver_id, total_amount) VALUES
                                                                            (1, 1, 1, 25.50),
                                                                            (2, 1, 2, 15.00),
                                                                            (3, 1, 3, 30.75);

-- Ratings Table
CREATE TABLE Ratings (
                         rating_id       INT PRIMARY KEY AUTO_INCREMENT,
                         booking_id      INT UNIQUE NOT NULL,
                         customer_id     INT NOT NULL,
                         driver_id       INT NOT NULL,
                         rating          DECIMAL(3,2) CHECK (rating BETWEEN 1.00 AND 5.00),
                         review          TEXT,
                         created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                         FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id),
                         FOREIGN KEY (customer_id) REFERENCES Users(user_id),
                         FOREIGN KEY (driver_id) REFERENCES Drivers(driver_id)
);

-- Insert Dummy Ratings
INSERT INTO Ratings (booking_id, customer_id, driver_id, rating, review) VALUES
                                                                             (1, 1, 1, 4.5, 'Great service!'),
                                                                             (2, 1, 2, 3.8, 'Driver was okay but late'),
                                                                             (3, 1, 3, 5.0, 'Perfect ride!');
