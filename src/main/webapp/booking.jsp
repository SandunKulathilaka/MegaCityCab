<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="com.megacitycab.model.User" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Book a Ride</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        .container { max-width: 400px; margin: auto; padding: 20px; border: 1px solid #ddd; border-radius: 8px; background: #f9f9f9; }
        input, select { width: 100%; padding: 8px; margin: 10px 0; }
        button { background: #28a745; color: white; padding: 10px; border: none; cursor: pointer; }
        button:hover { background: #218838; }
        input[readonly] { background: #e9ecef; cursor: not-allowed; }
    </style>
</head>
<body>
<%
    // Retrieve user details from session
    User user = (User) session.getAttribute("user");
    String name = user.getFullName();
    String email = user.getEmail();

    // Redirect to login if session data is missing
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<div class="container">
    <h2>Book a Ride</h2>
    <form action="${pageContext.request.contextPath}booking" method="post">

    <label for="customerUsername">Username:</label>
        <input type="text" id="customerUsername" name="customerUsername" value="<%= name %>" readonly>

        <label for="customerEmail">Email:</label>
        <input type="email" id="customerEmail" name="customerEmail" value="<%= email %>" readonly>

        <label for="pickupLocation">Pickup Location:</label>
        <input type="text" id="pickupLocation" name="pickupLocation" required>

        <label for="dropoffLocation">Drop-off Location:</label>
        <input type="text" id="dropoffLocation" name="dropoffLocation" required>

        <label for="distance">Distance (km):</label>
        <input type="number" step="0.1" id="distance" name="distance" required>

        <label for="fare">Estimated Fare ($):</label>
        <input type="number" step="0.1" id="fare" name="fare" required>

        <label for="rideDate">Ride Date & Time:</label>
        <input type="datetime-local" id="rideDate" name="rideDate" required>

        <button type="submit">Confirm Booking</button>
    </form>
</div>
</body>
</html>
