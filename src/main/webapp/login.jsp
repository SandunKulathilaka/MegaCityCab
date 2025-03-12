<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<%
    if (session.getAttribute("username") != null) {
        response.sendRedirect("dashboard.jsp");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .form-container {
            width: 550px; /* Adjusted form width */
            margin: auto;
            margin-top: 50px;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background: #ecf0f1;
            color: black;
        }
        .banner {
            width: 100%;
            height: 40vh;
            display: flex;
            align-items: center;
            justify-content: space-evenly;
            background-color: #ecf0f1;
            color: black;
        }
        .main-section {
            height: 50vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .description {
            width: 50%;
            padding: 20px;
        }
        .footer{
            height: 30vh;
            width: 100vw;
            background-color: black;
            color: white;
        }
    </style>
</head>
<body>

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg bg-body-tertiary bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Mega City Cab</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link active" href="#">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Link</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Dropdown</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Action</a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                </li>
                <li class="nav-item"><a class="nav-link disabled">Disabled</a></li>
            </ul>
            <form class="d-flex">
                <input class="form-control me-2" type="search" placeholder="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>

<div class="banner">
    <div class="banner-text">
        <h1>Log in to access <br>your account</h1>
    </div>
    <div class="banner-img">
        <img src="assets/89y_cdgn4s3fdtm2qc1m-removebg-preview.png" alt="banner-img">
    </div>
</div>

<!-- Main Section -->
<div class="main-section">
    <div class="form-container">
        <h3 class="text-center mb-4">Login</h3>
        <form action="user" method="post">
            <input type="hidden" name="action" value="login">
            <div class="mb-3">
                <label class="form-label" for="email">Username:</label>
                <input class="form-control" type="text" id="email" name="email" required>
            </div>
            <div class="mb-3">
                <label class="form-label" for="password">Password:</label>
                <input class="form-control" type="password" id="password" name="password" required>
            </div>
            <button class="btn btn-danger w-100" type="submit">Login</button>
        </form>
        <p class="text-center mt-3">Don't have an account? <a href="register.jsp">Register</a></p>
    </div>

    <div class="description">
        <h2>Mega City Cab</h2>
        <h6>✔️ 24/7 Availability – Book a ride anytime, anywhere in Colombo</h6>
        <h6>✔️ Affordable Pricing – Transparent fares with no hidden charges</h6>
        <h6>✔️ Professional Drivers – Trained and experienced chauffeurs for a safe journey</h6>
        <h6>✔️ Easy Booking – Hassle-free cab reservations via phone, app, or website</h6>
        <h6>✔️ Comfort & Safety – Well-maintained vehicles with top safety standards</h6>
    </div>
</div>
<div class="footer">
<h1>Footer</h1>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
