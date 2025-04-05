<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Driver Earnings - Mega City Cab</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
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
        .sidebar a.active {
            background: #007bff;
        }
        .earnings-card {
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            transition: transform 0.3s;
            margin-bottom: 20px;
        }
        .earnings-card:hover {
            transform: translateY(-5px);
        }
        .card-header {
            border-radius: 10px 10px 0 0 !important;
        }
        .progress {
            height: 10px;
        }
        .last-trip-card {
            border-left: 4px solid #007bff;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <nav class="col-md-3 col-lg-2 sidebar p-3">
            <h3 class="text-center">Driver Dashboard</h3>
            <a href="dashboard.jsp"><i class="fas fa-tachometer-alt me-2"></i>Dashboard</a>
            <a href="rides.jsp"><i class="fas fa-car me-2"></i>My Rides</a>
            <a href="earnings.jsp" class="active"><i class="fas fa-money-bill-wave me-2"></i>Earnings</a>
            <a href="profile.jsp"><i class="fas fa-user me-2"></i>Profile</a>
            <a href="logout.jsp"><i class="fas fa-sign-out-alt me-2"></i>Logout</a>
        </nav>

        <!-- Main Content -->
        <main class="col-md-9 col-lg-10 p-4">
            <h2><i class="fas fa-money-bill-wave me-2"></i> Earnings Summary</h2>

            <!-- Earnings Overview Cards -->
            <div class="row mt-4">
                <div class="col-md-4">
                    <div class="card earnings-card bg-primary text-white">
                        <div class="card-body">
                            <h5 class="card-title">Today's Earnings</h5>
                            <h2 id="todayEarnings">$0.00</h2>
                            <p class="card-text"><span id="todayTrips">0</span> trips completed</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card earnings-card bg-success text-white">
                        <div class="card-body">
                            <h5 class="card-title">Weekly Earnings</h5>
                            <h2 id="weeklyEarnings">$0.00</h2>
                            <p class="card-text"><span id="weeklyTrips">0</span> trips this week</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card earnings-card bg-info text-white">
                        <div class="card-body">
                            <h5 class="card-title">Monthly Earnings</h5>
                            <h2 id="monthlyEarnings">$0.00</h2>
                            <p class="card-text"><span id="monthlyTrips">0</span> trips this month</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Last Trip and Service Fee -->
            <div class="row mt-4">
                <div class="col-md-6">
                    <div class="card last-trip-card">
                        <div class="card-header bg-white">
                            <h5><i class="fas fa-clock me-2"></i> Last Trip Details</h5>
                        </div>
                        <div class="card-body">
                            <div id="lastTripDetails">
                            </div>
                        </div>

                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header bg-white">
                            <h5><i class="fas fa-percentage me-2"></i> Service Fees</h5>
                        </div>
                        <div class="card-body">
                            <div class="mb-3">
                                <label>Today's Service Fee (20%)</label>
                                <h4 id="todayServiceFee">$20.00</h4>
                                <div class="progress">
                                    <div class="progress-bar bg-warning" id="serviceFeeProgress" style="width: 20%"></div>
                                </div>
                            </div>
                            <div>
                                <label>Your Net Earnings Today</label>
                                <h3 id="netEarnings">$100.00</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Earnings Chart (Placeholder) -->
            <div class="row mt-4">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h5><i class="fas fa-chart-line me-2"></i> Earnings Trend</h5>
                        </div>
                        <div class="card-body">
                            <div id="earningsChart" style="height: 300px; background-color: #f8f9fa; display: flex; justify-content: center; align-items: center;">
                                <p class="text-muted">Chart will be displayed here</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<script>
    // Generate random earnings data
    function generateRandomData() {
        // Today's data
        const todayTrips = Math.floor(Math.random() * 10) + 1;
        const todayEarnings = (Math.random() * 200 + 50).toFixed(2);
        const todayServiceFee = (todayEarnings * 0.20).toFixed(2);
        const netEarnings = (todayEarnings - todayServiceFee).toFixed(2);

        // Weekly data
        const weeklyTrips = Math.floor(Math.random() * 50) + 10;
        const weeklyEarnings = (Math.random() * 1500 + 500).toFixed(2);

        // Monthly data
        const monthlyTrips = Math.floor(Math.random() * 200) + 50;
        const monthlyEarnings = (Math.random() * 6000 + 2000).toFixed(2);

        // Last trip details - FIXED: Ensure we always have different pickup/dropoff locations
        const locations = ["Downtown", "Airport", "Mall", "University", "Hospital", "Train Station", "Business District"];
        let fromIndex = Math.floor(Math.random() * locations.length);
        let toIndex;

        // Make sure pickup and dropoff locations are different
        do {
            toIndex = Math.floor(Math.random() * locations.length);
        } while (toIndex === fromIndex);

        const lastTrip = {
            time: new Date().toLocaleTimeString([], {hour: '2-digit', minute:'2-digit'}),
            date: new Date().toLocaleDateString(),
            from: locations[fromIndex],
            to: locations[toIndex],
            fare: (Math.random() * 50 + 10).toFixed(2),
            distance: (Math.random() * 20 + 3).toFixed(1)
        };

        return {
            todayTrips,
            todayEarnings,
            todayServiceFee,
            netEarnings,
            weeklyTrips,
            weeklyEarnings,
            monthlyTrips,
            monthlyEarnings,
            lastTrip
        };
    }

    // Update the UI with data - FIXED: Properly format the last trip HTML
    function updateEarningsData() {
        const data = generateRandomData();

        // Update today's earnings
        document.getElementById('todayEarnings').textContent = `$${data.todayEarnings}`;
        document.getElementById('todayTrips').textContent = data.todayTrips;

        // Update weekly earnings
        document.getElementById('weeklyEarnings').textContent = `$${data.weeklyEarnings}`;
        document.getElementById('weeklyTrips').textContent = data.weeklyTrips;

        // Update monthly earnings
        document.getElementById('monthlyEarnings').textContent = `$${data.monthlyEarnings}`;
        document.getElementById('monthlyTrips').textContent = data.monthlyTrips;

        // Update last trip details - FIXED: Proper HTML structure
        const lastTripHTML = `
            <div class="mb-2">
                <strong><i class="fas fa-clock me-1"></i> Time: </strong>
                <span>${data.lastTrip.time} on ${data.lastTrip.date}</span>
            </div>
            <div class="mb-2">
                <strong><i class="fas fa-map-marker-alt me-1"></i> From: </strong>
                <span>${data.lastTrip.from}</span>
            </div>
            <div class="mb-2">
                <strong><i class="fas fa-flag-checkered me-1"></i> To: </strong>
                <span>${data.lastTrip.to}</span>
            </div>
            <div class="mb-2">
                <strong><i class="fas fa-money-bill-wave me-1"></i> Fare: </strong>
                <span>$${data.lastTrip.fare}</span>
            </div>
            <div>
                <strong><i class="fas fa-road me-1"></i> Distance: </strong>
                <span>${data.lastTrip.distance} km</span>
            </div>
        `;
        document.getElementById('lastTripDetails').innerHTML = lastTripHTML;

        // Update service fee and net earnings
        document.getElementById('todayServiceFee').textContent = `$${data.todayServiceFee}`;
        document.getElementById('netEarnings').textContent = `$${data.netEarnings}`;
    }

    // Initialize data when page loads
    document.addEventListener('DOMContentLoaded', function() {
        updateEarningsData();

        // Update data every 5 seconds (simulate real-time updates)
        setInterval(updateEarningsData, 5000);
    });
</script>
</body>
</html>