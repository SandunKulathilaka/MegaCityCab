<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, com.megacitycab.model.Booking" %>
<%@ page import="com.megacitycab.dao.BookingDAO" %>

<%
    // Fetch booking data from database
    BookingDAO bookingDAO = new BookingDAO();
    List<Booking> bookingList = bookingDAO.getAllBookings();
    request.setAttribute("bookingList", bookingList);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MegaCityCab Admin</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-3 col-lg-2 bg-dark text-white min-vh-100">
            <div class="p-3">
                <h2 class="text-center mb-4">MegaCityCab Admin</h2>
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link text-white" href="#">Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="users.jsp">Users</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="driver.jsp">Drivers</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="invoice.jsp">Earnings</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="car.jsp">Manage Cars</a>
                    </li>
                </ul>
            </div>
        </div>

        <!-- Main Content -->
        <div class="col-md-9 col-lg-10 p-4">
            <h2 class="mb-4">Admin Dashboard</h2>

            <!-- Cards Section -->
            <div class="row mb-4">
                <div class="col-md-3">
                    <div class="card bg-primary text-white">
                        <div class="card-body">
                            <h5 class="card-title">Total Rides</h5>
                            <p class="card-text">1200</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card bg-success text-white">
                        <div class="card-body">
                            <h5 class="card-title">Active Drivers</h5>
                            <p class="card-text">45</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card bg-warning text-white">
                        <div class="card-body">
                            <h5 class="card-title">Total Revenue</h5>
                            <p class="card-text">$25,000</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card bg-danger text-white">
                        <div class="card-body">
                            <h5 class="card-title">Pending Requests</h5>
                            <p class="card-text">8</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Recent Bookings Table -->
            <h3 class="mb-3">Recent Bookings</h3>
            <div class="table-responsive">
                <table class="table table-striped table-hover">
                    <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Customer</th>
                        <th>Driver</th>
                        <th>Pickup</th>
                        <th>Dropoff</th>
                        <th>Fare ($)</th>
                        <th>Status</th>
                        <th>Time</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        if (bookingList != null && !bookingList.isEmpty()) {
                            for (int i = 0; i < bookingList.size(); i++) {
                                Booking booking = bookingList.get(i);
                    %>
                    <tr>
                        <td><%= booking.getBookingId() %></td>
                        <td><%= booking.getCustomerName() %></td>
                        <td><%= booking.getDriverName() %></td>
                        <td><%= booking.getPickupLocation() %></td>
                        <td><%= booking.getDropoffLocation() %></td>
                        <td><%= booking.getFare() %></td>
                        <td><span class="badge bg-<%= booking.getBookingStatus().equals("Completed") ? "success" : "warning" %>"><%= booking.getBookingStatus() %></span></td>
                        <td><%= booking.getBookingTime() %></td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="8" class="text-center">No bookings available.</td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
<!-- Custom JS -->
<script>
    // Example: Toggle sidebar on smaller screens
    document.addEventListener("DOMContentLoaded", function () {
        const sidebar = document.querySelector(".col-md-3");
        const toggleButton = document.createElement("button");
        toggleButton.className = "btn btn-dark d-md-none mb-3";
        toggleButton.textContent = "Toggle Sidebar";
        document.querySelector(".main-content").prepend(toggleButton);

        toggleButton.addEventListener("click", function () {
            sidebar.classList.toggle("d-none");
        });
    });
</script>
</body>
</html>