<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Driver Dashboard - Taxi Service</title>
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
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <nav class="col-md-3 col-lg-2 sidebar p-3">
            <h3 class="text-center">Driver Dashboard</h3>
            <a href="#">Dashboard</a>
            <a href="#">My Rides</a>
            <a href="#">Earnings</a>
            <a href="#">Profile</a>
            <a href="#">Logout</a>
        </nav>

        <!-- Main Content -->
        <main class="col-md-9 col-lg-10 p-4">
            <h2>Upcoming Rides</h2>
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>Ride ID</th>
                    <th>Pickup</th>
                    <th>Drop</th>
                    <th>Fare</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody id="rideTable">
                <tr>
                    <td>101</td>
                    <td>Downtown</td>
                    <td>Airport</td>
                    <td>$25</td>
                    <td><span class="badge bg-warning">Pending</span></td>
                    <td><button class="btn btn-success btn-sm" onclick="completeRide(this)">Complete</button></td>
                </tr>
                <tr>
                    <td>102</td>
                    <td>Central Park</td>
                    <td>Times Square</td>
                    <td>$15</td>
                    <td><span class="badge bg-warning">Pending</span></td>
                    <td><button class="btn btn-success btn-sm" onclick="completeRide(this)">Complete</button></td>
                </tr>
                <tr>
                    <td>103</td>
                    <td>Brooklyn</td>
                    <td>Manhattan</td>
                    <td>$30</td>
                    <td><span class="badge bg-warning">Pending</span></td>
                    <td><button class="btn btn-success btn-sm" onclick="completeRide(this)">Complete</button></td>
                </tr>
                <tr>
                    <td>104</td>
                    <td>Queens</td>
                    <td>JFK Airport</td>
                    <td>$40</td>
                    <td><span class="badge bg-warning">Pending</span></td>
                    <td><button class="btn btn-success btn-sm" onclick="completeRide(this)">Complete</button></td>
                </tr>
                <tr>
                    <td>105</td>
                    <td>Grand Central</td>
                    <td>Empire State Building</td>
                    <td>$20</td>
                    <td><span class="badge bg-warning">Pending</span></td>
                    <td><button class="btn btn-success btn-sm" onclick="completeRide(this)">Complete</button></td>
                </tr>
                <tr>
                    <td>106</td>
                    <td>Harlem</td>
                    <td>Wall Street</td>
                    <td>$35</td>
                    <td><span class="badge bg-warning">Pending</span></td>
                    <td><button class="btn btn-success btn-sm" onclick="completeRide(this)">Complete</button></td>
                </tr>
                <tr>
                    <td>107</td>
                    <td>Battery Park</td>
                    <td>Brooklyn Bridge</td>
                    <td>$18</td>
                    <td><span class="badge bg-warning">Pending</span></td>
                    <td><button class="btn btn-success btn-sm" onclick="completeRide(this)">Complete</button></td>
                </tr>
                <tr>
                    <td>108</td>
                    <td>Chinatown</td>
                    <td>Union Square</td>
                    <td>$22</td>
                    <td><span class="badge bg-warning">Pending</span></td>
                    <td><button class="btn btn-success btn-sm" onclick="completeRide(this)">Complete</button></td>
                </tr>
                <tr>
                    <td>109</td>
                    <td>SoHo</td>
                    <td>Central Park</td>
                    <td>$28</td>
                    <td><span class="badge bg-warning">Pending</span></td>
                    <td><button class="btn btn-success btn-sm" onclick="completeRide(this)">Complete</button></td>
                </tr>

                </tbody>
            </table>
        </main>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function completeRide(button) {
        let row = button.closest('tr');
        row.cells[4].innerHTML = '<span class="badge bg-success">Completed</span>';
        button.remove();
    }
</script>
</body>
</html>
