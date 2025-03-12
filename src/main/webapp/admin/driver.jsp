<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, com.megacitycab.model.Driver" %>
<%@ page import="com.megacitycab.dao.DriverDAO" %>

<%
    // Fetch driver data from database
    DriverDAO driverDAO = new DriverDAO();
    List<Driver> driverList = driverDAO.getAllDrivers();
    request.setAttribute("driverList", driverList);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Driver Management - MegaCityCab Admin</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        .action-buttons .btn {
            margin: 2px;
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
                        <a class="nav-link text-white" href="admin.jsp">Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white active" href="drivers.jsp">Drivers</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="#">Vehicles</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="#">Earnings</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="#">Ride History</a>
                    </li>
                </ul>
            </div>
        </div>

        <!-- Main Content -->
        <div class="col-md-9 col-lg-10 p-4">
            <h2 class="mb-4">Driver Management</h2>

            <!-- Add Driver Button and Modal Trigger -->
            <button type="button" class="btn btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#addDriverModal">
                <i class="fas fa-plus"></i> Add New Driver
            </button>

            <!-- Drivers Table -->
            <div class="table-responsive">
                <table class="table table-striped table-hover">
                    <thead class="table-dark">
                    <tr>
                        <th>Driver ID</th>
                        <th>User ID</th>
                        <th>License Number</th>
                        <th>Vehicle ID</th>
                        <th>Rating</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        if (driverList != null && !driverList.isEmpty()) {
                            for (Driver driver : driverList) {
                    %>
                    <tr>
                        <td><%= driver.getDriverId() %></td>
                        <td><%= driver.getUserId() %></td>
                        <td><%= driver.getLicenseNumber() %></td>
                        <td><%= driver.getVehicleId() %></td>
                        <td><%= String.format("%.1f", driver.getRating()) %></td>
                        <td><%= driver.getStatus() %></td>
                        <td class="action-buttons">
                            <button class="btn btn-sm btn-warning" data-bs-toggle="modal" data-bs-target="#editDriverModal"
                                    data-driver-id="<%= driver.getDriverId() %>"
                                    data-user-id="<%= driver.getUserId() %>"
                                    data-license-number="<%= driver.getLicenseNumber() %>"
                                    data-vehicle-id="<%= driver.getVehicleId() %>"
                                    data-rating="<%= driver.getRating() %>"
                                    data-status="<%= driver.getStatus() %>">
                                <i class="fas fa-edit"></i> Edit
                            </button>
                            <button class="btn btn-sm btn-danger" onclick="deleteDriver('<%= driver.getDriverId() %>')">
                                <i class="fas fa-trash"></i> Delete
                            </button>
                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="7" class="text-center">No drivers available.</td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- Add Driver Modal -->
<div class="modal fade" id="addDriverModal" tabindex="-1" aria-labelledby="addDriverModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addDriverModalLabel">Add New Driver</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/driver" method="post">
                    <input type="hidden" name="action" value="add">
                    <div class="mb-3">
                        <label for="userId" class="form-label">User ID</label>
                        <input type="text" class="form-control" id="userId" name="userId" required>
                    </div>
                    <div class="mb-3">
                        <label for="licenseNumber" class="form-label">License Number</label>
                        <input type="text" class="form-control" id="licenseNumber" name="licenseNumber" required>
                    </div>
                    <div class="mb-3">
                        <label for="vehicleId" class="form-label">Vehicle ID</label>
                        <input type="text" class="form-control" id="vehicleId" name="vehicleId" required>
                    </div>
                    <div class="mb-3">
                        <label for="rating" class="form-label">Rating</label>
                        <input type="number" step="0.1" class="form-control" id="rating" name="rating" required>
                    </div>
                    <div class="mb-3">
                        <label for="status" class="form-label">Status</label>
                        <select class="form-select" id="status" name="status" required>
                            <option value="Available">Available</option>
                            <option value="On Trip">On Trip</option>
                            <option value="Inactive">Inactive</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">Add Driver</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Edit Driver Modal -->
<div class="modal fade" id="editDriverModal" tabindex="-1" aria-labelledby="editDriverModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editDriverModalLabel">Edit Driver</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/driver" method="post">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" id="editDriverId" name="driverId">
                    <div class="mb-3">
                        <label for="editUserId" class="form-label">User ID</label>
                        <input type="text" class="form-control" id="editUserId" name="userId" required>
                    </div>
                    <div class="mb-3">
                        <label for="editLicenseNumber" class="form-label">License Number</label>
                        <input type="text" class="form-control" id="editLicenseNumber" name="licenseNumber" required>
                    </div>
                    <div class="mb-3">
                        <label for="editVehicleId" class="form-label">Vehicle ID</label>
                        <input type="text" class="form-control" id="editVehicleId" name="vehicleId" required>
                    </div>
                    <div class="mb-3">
                        <label for="editRating" class="form-label">Rating</label>
                        <input type="number" step="0.1" class="form-control" id="editRating" name="rating" required>
                    </div>
                    <div class="mb-3">
                        <label for="editStatus" class="form-label">Status</label>
                        <select class="form-select" id="editStatus" name="status" required>
                            <option value="Available">Available</option>
                            <option value="On Trip">On Trip</option>
                            <option value="Inactive">Inactive</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-warning">Update Driver</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
<!-- Custom JS -->
<script>
    // Populate Edit Modal with Driver Data
    const editDriverModal = document.getElementById('editDriverModal');
    editDriverModal.addEventListener('show.bs.modal', function (event) {
        const button = event.relatedTarget; // Button that triggered the modal
        const driverId = button.getAttribute('data-driver-id');
        const userId = button.getAttribute('data-user-id');
        const licenseNumber = button.getAttribute('data-license-number');
        const vehicleId = button.getAttribute('data-vehicle-id');
        const rating = button.getAttribute('data-rating');
        const status = button.getAttribute('data-status');

        // Update Modal Fields
        document.getElementById('editDriverId').value = driverId;
        document.getElementById('editUserId').value = userId;
        document.getElementById('editLicenseNumber').value = licenseNumber;
        document.getElementById('editVehicleId').value = vehicleId;
        document.getElementById('editRating').value = rating;
        document.getElementById('editStatus').value = status;
    });

    // Delete Driver
    function deleteDriver(driverId) {
        if (confirm('Are you sure you want to delete this driver?')) {
            const form = document.createElement('form');
            form.method = 'post';
            form.action = '${pageContext.request.contextPath}/driver';

            const actionInput = document.createElement('input');
            actionInput.type = 'hidden';
            actionInput.name = 'action';
            actionInput.value = 'delete';
            form.appendChild(actionInput);

            const driverIdInput = document.createElement('input');
            driverIdInput.type = 'hidden';
            driverIdInput.name = 'driver_id';
            driverIdInput.value = driverId;
            form.appendChild(driverIdInput);

            document.body.appendChild(form);
            form.submit();
        }
    }
</script>
</body>
</html>