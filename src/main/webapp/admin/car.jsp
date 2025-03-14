<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Cars - MegaCityCab Admin</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        .card-img-top {
            height: 200px;
            object-fit: cover;
        }
    </style>
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
                        <a class="nav-link text-white" href="adminDashboard.jsp">Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="users.jsp">Users</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white active" href="manageCars.jsp">Manage Cars</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="invoice.jsp">Earnings</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="#">Manage Cars</a>
                    </li>
                </ul>
            </div>
        </div>

        <!-- Main Content -->
        <div class="col-md-9 col-lg-10 p-4">
            <h2 class="mb-4">Manage Cars</h2>

            <!-- Add Car Form -->
            <div class="card mb-4">
                <div class="card-header bg-primary text-white">
                    <h5 class="card-title mb-0">Add New Car</h5>
                </div>
                <div class="card-body">
                    <form id="addCarForm">
                        <div class="mb-3">
                            <label for="carModel" class="form-label">Car Model</label>
                            <input type="text" class="form-control" id="carModel" name="carModel" required>
                        </div>
                        <div class="mb-3">
                            <label for="registrationNumber" class="form-label">Registration Number</label>
                            <input type="text" class="form-control" id="registrationNumber" name="registrationNumber" required>
                        </div>
                        <div class="mb-3">
                            <label for="carImage" class="form-label">Car Image URL</label>
                            <input type="text" class="form-control" id="carImage" name="carImage" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Add Car</button>
                    </form>
                </div>
            </div>

            <!-- Car List -->
            <h3 class="mb-3">Car List</h3>
            <div class="row" id="carList">
                <!-- Dummy Car Data -->
                <div class="col-md-4 mb-4">
                    <div class="card">
                        <img src="https://as1.ftcdn.net/v2/jpg/09/21/64/04/1000_F_921640420_lwi2OUC5vVdGWEiOcmSk7LGzgKdhP5ZP.webp" class="card-img-top" alt="Car Image">
                        <div class="card-body">
                            <h5 class="card-title">Toyota Prius</h5>
                            <p class="card-text">Registration: ABC-1234</p>
                            <button class="btn btn-warning btn-sm">Edit</button>
                            <button class="btn btn-danger btn-sm">Delete</button>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="card">
                        <img src="https://as1.ftcdn.net/v2/jpg/09/21/64/04/1000_F_921640420_lwi2OUC5vVdGWEiOcmSk7LGzgKdhP5ZP.webp" class="card-img-top" alt="Car Image">
                        <div class="card-body">
                            <h5 class="card-title">Honda Civic</h5>
                            <p class="card-text">Registration: XYZ-5678</p>
                            <button class="btn btn-warning btn-sm">Edit</button>
                            <button class="btn btn-danger btn-sm">Delete</button>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 mb-4">
                    <div class="card">
                        <img src="https://as1.ftcdn.net/v2/jpg/09/21/64/04/1000_F_921640420_lwi2OUC5vVdGWEiOcmSk7LGzgKdhP5ZP.webp" class="card-img-top" alt="Car Image">
                        <div class="card-body">
                            <h5 class="card-title">Ford Focus</h5>
                            <p class="card-text">Registration: LMN-9101</p>
                            <button class="btn btn-warning btn-sm">Edit</button>
                            <button class="btn btn-danger btn-sm">Delete</button>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
<!-- Custom JavaScript -->

</body>
</html>