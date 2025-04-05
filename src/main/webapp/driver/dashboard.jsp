<%@ page import="java.sql.*" %>
<%@ page import="com.megacitycab.dao.DriverDAO" %>
<%@ page import="com.megacitycab.model.Driver" %>
<%@ page import="java.util.List" %>
<%@ page import="com.megacitycab.dao.BookingDAO" %>
<%@ page import="com.megacitycab.model.Booking" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Driver Dashboard - Mega City Cab</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .sidebar {
            min-height: 100vh;
            background: #343a40;
            color: white;
        }
        .sidebar a {
            color: white;
            text-decoration: none;
            display: block;
            padding: 10px;
        }
        .sidebar a:hover {
            background: #495057;
        }
        .ride-card {
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s, box-shadow 0.2s;
        }
        .ride-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }
        .ride-card h5 {
            margin-bottom: 15px;
            font-size: 1.25rem;
            color: #333;
        }
        .ride-card p {
            margin: 5px 0;
            color: #555;
        }
        .ride-card .badge {
            font-size: 0.9rem;
        }
        .ride-card .btn {
            width: 100%;
            margin-top: 10px;
        }
    </style>
    <%
        // First get a database connection (you might have a connection pool or utility class for this)
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/MegaCityCab?useSSL=false&allowPublicKeyRetrieval=true","root","");

// Then create BookingDAO with the connection
        BookingDAO bookingDAO = new BookingDAO(connection);
        List<Booking> bookingList = bookingDAO.getAllBookings();
        request.setAttribute("bookingList", bookingList);

// Don't forget to close the connection when done (better to use try-with-resources)
        connection.close();
    %>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <nav class="col-md-3 col-lg-2 sidebar p-3">
            <h3 class="text-center">Driver Dashboard</h3>
            <a href="#">Dashboard</a>
            <a href="#">My Rides</a>
            <a href="earnings.jsp">Earnings</a>
            <a href="profile.jsp">Profile</a>
            <a href="logout.jsp">Logout</a>
        </nav>

        <!-- Main Content -->
        <main class="col-md-9 col-lg-10 p-4">
            <h2>Your Rides</h2>

                <%
                    if (bookingList != null && !bookingList.isEmpty()) {
                        for (Booking booking : bookingList) {
                %>
                <div class="col-md-4">
                    <div class="ride-card">
                        <h5>Customer: <%= booking.getCustomerUsername() %></h5>
                        <p><strong>Pickup:</strong> <%= booking.getPickupLocation() %></p>
                        <p><strong>Drop-off:</strong> <%= booking.getDropoffLocation() %></p>
                        <p><strong>Distance:</strong> <%= booking.getDistance() %> km</p>
                        <p><strong>Fare:</strong> $<%= booking.getFare() %></p>
                        <p><strong>Date & Time:</strong> <%= booking.getRideDate() %></p>
                        <p><strong>Status:</strong>
                            <span class="badge bg-<%=
                    booking.getStatus().equals("pending") ? "warning" :
                    booking.getStatus().equals("accepted") ? "success" :
                    booking.getStatus().equals("completed") ? "primary" : "danger"
                %>">
                    <%= booking.getStatus() %>
                </span>
                        </p>
                        <% if (booking.getStatus().equals("pending")) { %>
                        <button class="btn btn-success" onclick="acceptRide(<%= booking.getId() %>)">Accept Ride</button>
                        <% } else if (booking.getStatus().equals("accepted")) { %>
                        <button class="btn btn-danger" onclick="cancelRide(<%= booking.getId() %>)">Cancel Ride</button>
                        <button class="btn btn-primary" onclick="completeRide(<%= booking.getId() %>)">Complete Ride</button>
                        <% } %>
                    </div>
                </div>
                <%
                    }
                } else {
                %>
                <div class="col-12">
                    <div class="alert alert-info">No rides found</div>
                </div>
                <%
                    }
                %>
            </div>
        </main>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function acceptRide(rideId) {
        if (confirm("Are you sure you want to accept this ride?")) {
            // Send an AJAX request to update the ride status to 'accepted'
            fetch(`/acceptRide?id=${rideId}`, { method: 'POST' })
                .then(response => {
                    if (response.ok) {
                        alert("Ride accepted successfully!");
                        location.reload(); // Refresh the page to reflect changes
                    } else {
                        alert("Failed to accept the ride.");
                    }
                });
        }
    }

    function cancelRide(rideId) {
        if (confirm("Are you sure you want to cancel this ride?")) {
            // Send an AJAX request to update the ride status to 'canceled'
            fetch(`/cancelRide?id=${rideId}`, { method: 'POST' })
                .then(response => {
                    if (response.ok) {
                        alert("Ride canceled successfully!");
                        location.reload(); // Refresh the page to reflect changes
                    } else {
                        alert("Failed to cancel the ride.");
                    }
                });
        }
    }

    function completeRide(rideId) {
        if (confirm("Are you sure you want to complete this ride?")) {
            // Send an AJAX request to update the ride status to 'completed'
            fetch(`/completeRide?id=${rideId}`, { method: 'POST' })
                .then(response => {
                    if (response.ok) {
                        alert("Ride completed successfully!");
                        location.reload(); // Refresh the page to reflect changes
                    } else {
                        alert("Failed to complete the ride.");
                    }
                });
        }
    }
</script>
</body>
</html>