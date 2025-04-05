<%@ page import="com.megacitycab.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile - Mega City Cab</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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
        .profile-card {
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .profile-header {
            background: linear-gradient(135deg, #6e8efb, #a777e3);
            color: white;
            border-radius: 15px 15px 0 0;
        }
        .profile-pic {
            width: 150px;
            height: 150px;
            object-fit: cover;
            border: 5px solid white;
        }
        .info-item {
            margin-bottom: 15px;
            border-bottom: 1px solid #eee;
            padding-bottom: 10px;
        }
        .info-item:last-child {
            border-bottom: none;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar - Same as dashboard -->
        <nav class="col-md-3 col-lg-2 sidebar p-3">
            <h3 class="text-center">Driver Dashboard</h3>
            <a href="dashboard.jsp">Dashboard</a>
            <a href="rides.jsp">My Rides</a>
            <a href="earnings.jsp">Earnings</a>
            <a href="profile.jsp" class="active">Profile</a>
            <a href="logout.jsp">Logout</a>
        </nav>

        <!-- Main Content -->
        <main class="col-md-9 col-lg-10 p-4">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="card profile-card">
                        <div class="card-header profile-header text-center py-4">
                            <%
                                User user = (User) session.getAttribute("user");
                                if (user != null) {
                            %>
                            <img src="https://ui-avatars.com/api/?name=<%= user.getFullName() %>&background=random"
                                 alt="Profile Picture" class="profile-pic rounded-circle mb-3">
                            <h3><%= user.getFullName() %></h3>
                            <p class="mb-0"><%= user.getRole().toUpperCase() %></p>
                        </div>
                        <div class="card-body p-4">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="info-item">
                                        <h6><i class="fas fa-user me-2"></i> Full Name</h6>
                                        <p class="text-muted"><%= user.getFullName() %></p>
                                    </div>
                                    <div class="info-item">
                                        <h6><i class="fas fa-envelope me-2"></i> Email</h6>
                                        <p class="text-muted"><%= user.getEmail() %></p>
                                    </div>
                                    <div class="info-item">
                                        <h6><i class="fas fa-phone me-2"></i> Phone</h6>
                                        <p class="text-muted"><%= user.getPhone() %></p>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="info-item">
                                        <h6><i class="fas fa-key me-2"></i> Password</h6>
                                        <p class="text-muted">••••••••</p>
                                    </div>
                                    <div class="info-item">
                                        <h6><i class="fas fa-user-tag me-2"></i> Role</h6>
                                        <p class="text-muted"><%= user.getRole() %></p>
                                    </div>
                                    <div class="info-item">
                                        <h6><i class="fas fa-map-marker-alt me-2"></i> Address</h6>
                                        <p class="text-muted"><%= user.getAddress() %></p>
                                    </div>
                                </div>
                            </div>
                            <div class="text-center mt-4">
                                <a href="edit-profile.jsp" class="btn btn-primary px-4">
                                    <i class="fas fa-edit me-2"></i>Edit Profile
                                </a>
                            </div>
                            <%
                            } else {
                            %>
                            <div class="alert alert-warning text-center">
                                <h4>No user logged in</h4>
                                <p>Please login to view your profile</p>
                                <a href="login.jsp" class="btn btn-primary">Login</a>
                            </div>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

<!-- Bootstrap JS Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>