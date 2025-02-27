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
    <title>Register - Mega City Cab</title>

    <style>
        .main-section {
            display: flex;
            align-items: center;
            justify-content: space-around;
            padding: 20px;
            gap: 20px;
        }

        .image01{
            width: 40%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .image01 img{
            max-width: 100%;
            height: auto;
            object-fit: cover;
        }

        .form-container {
            width: 60%;
            padding: 30px;
            border-radius: 10px;
        }

        .form-container form {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
        }

        .form-container .full-width {
            grid-column: span 2;
        }

        .btn-submit {
            width: 100%;
            grid-column: span 2;
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
        .footer{
            height: 30vh;
            width: 100vw;
            background-color: black;
            color: white;
        }
    </style>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Mega City Cab</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto">
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
            </ul>
            <form class="d-flex">
                <input class="form-control me-2" type="search" placeholder="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>

<div class="banner">
    <div class="banner-img">
        <img src="assets/654.png">
    </div>
    <div class="banner-text">
        <h1>Register in to Explore <br>MegaCity Cab</h1>
    </div>
</div>

<div class="main-section">

    <div class="form-container">
        <h3 class="text-center mb-4">Register</h3>
        <form action="register" method="post">
            <div>
                <label class="form-label" for="name">Full Name:</label>
                <input class="form-control" type="text" id="name" name="full_name" required>
            </div>
            <div>
                <label class="form-label" for="username">Role:</label>
                <input class="form-control" type="text" id="username" name="role" required>
            </div>
            <div>
                <label class="form-label" for="email">Email:</label>
                <input class="form-control" type="email" id="email" name="email" required>
            </div>
            <div>
                <label class="form-label" for="dob">Date of Birth:</label>
                <input class="form-control" type="date" id="dob" name="dob" required>
            </div>
            <div>
                <label class="form-label" for="phone">Phone Number:</label>
                <input class="form-control" type="text" id="phone" name="phone" required>
            </div>
            <div>
                <label class="form-label" for="city">City:</label>
                <input class="form-control" type="text" id="city" name="city" required>
            </div>
            <div>
                <label class="form-label" for="gender">Gender:</label>
                <select class="form-control" id="gender" name="gender" required>
                    <option value="" disabled selected>Select Gender</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select>
            </div>
            <div>
                <label class="form-label" for="vehicle_type">Vehicle Type:</label>
                <select class="form-control" id="vehicle_type" name="vehicle_type">
                    <option value="" disabled selected>Select Vehicle</option>
                    <option value="Car">Car</option>
                    <option value="Motorbike">Motorbike</option>
                    <option value="Van">Van</option>
                </select>
            </div>
            <div>
                <label class="form-label" for="password">Password:</label>
                <input class="form-control" type="password" id="password" name="password" required>
            </div>
            <div>
                <label class="form-label" for="confirm_password">Confirm Password:</label>
                <input class="form-control" type="password" id="confirm_password" name="confirm_password" required>
            </div>
            <div class="full-width">
                <label class="form-label" for="address">Address:</label>user
                <input class="form-control" type="text" id="address" name="address" required>
            </div>
            <button class="btn btn-danger btn-submit" type="submit">Register</button>
        </form>
        <p class="text-center mt-3">Already have an account? <a href="login.jsp">Login</a></p>
    </div>

    <div class="image01">
        <img src="assets/654.png" alt="">
    </div>
</div>

<div class="footer">
    <h1>Footer</h1>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
