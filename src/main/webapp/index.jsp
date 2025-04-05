<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Mega City Cab</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom CSS -->
  <style>
    /* Custom Styles */
    .banner {
      background: url('assets/27645153_7376023.jpg') no-repeat center/cover;
      height: 60vh;
      display: flex;
      align-items: center;
      justify-content: center;
      color: white;
      text-align: center;
    }
    .banner h1 {
      font-size: 3.5rem;
      font-weight: bold;
    }
    .banner p {
      font-size: 1.5rem;
    }
    .about, .contact, .reviews {
      padding: 60px 0;
    }
    .review-card {
      margin: 10px;
      padding: 20px;
      border: 1px solid #ddd;
      border-radius: 10px;
      text-align: center;
    }
    .footer {
      background-color: #333;
      color: white;
      padding: 20px 0;
      text-align: center;
    }
  </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Mega City Cab</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item"><a class="nav-link active" href="#home">Home</a></li>
        <li class="nav-item"><a class="nav-link" href="#about">About</a></li>
        <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
        <li class="nav-item"><a class="nav-link" href="#reviews">Reviews</a></li>
      </ul>
      <a href="login.jsp" class="btn btn-outline-light">Login</a>
    </div>
  </div>
</nav>

<!-- Banner Section -->
<section id="home" class="banner">
  <div>
    <h1>Welcome to Mega City Cab</h1>
    <p>Your reliable ride in the city. Book now!</p>
    <a href="booking.jsp" class="btn btn-warning btn-lg">Book a Ride</a>
  </div>
</section>

<!-- About Section -->
<section id="about" class="about">
  <div class="container">
    <h2 class="text-center mb-4">About Us</h2>
    <div class="row">
      <div class="col-md-6">
        <img src="assets/9650584_7747.jpg" alt="About Us" class="img-fluid rounded">
      </div>
      <div class="col-md-6">
        <BR><BR><BR><BR>
        <p>
        <strong>Mega City Cab</strong> is your trusted partner for safe, reliable, and affordable transportation in the city.
        With a fleet of modern, well-maintained vehicles and a team of professional, experienced drivers,
        we are committed to providing you with a comfortable and hassle-free ride every time.
        </p>
        <p>
          Whether you need a ride to the airport, a business meeting, or a night out with friends,
          Mega City Cab is here to meet your transportation needs. Our services are available 24/7,
          ensuring that you can always count on us, no matter the time or destination.
        </p>
      </div>
    </div>
  </div>
</section>

<!-- Contact Us Section -->
<section id="contact" class="contact bg-light">
  <div class="container">
    <h2 class="text-center mb-4">Contact Us</h2>
    <div class="row justify-content-center">
      <div class="col-md-6">
        <form action="contact" method="post">
          <div class="mb-3">
            <label for="name" class="form-label">Name</label>
            <input type="text" class="form-control" id="name" name="name" required>
          </div>
          <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="email" class="form-control" id="email" name="email" required>
          </div>
          <div class="mb-3">
            <label for="message" class="form-label">Message</label>
            <textarea class="form-control" id="message" name="message" rows="5" required></textarea>
          </div>
          <button type="submit" class="btn btn-primary">Submit</button>
        </form>
      </div>
    </div>
  </div>
</section>

<!-- Customer Reviews Carousel -->
<section id="reviews" class="reviews">
  <div class="container">
    <h2 class="text-center mb-4">Customer Reviews</h2>
    <div id="reviewCarousel" class="carousel slide" data-bs-ride="carousel">
      <div class="carousel-inner">
        <!-- Review 1 -->
        <div class="carousel-item active">
          <div class="review-card">
            <img src="assets/145857007_307ce493-b254-4b2d-8ba4-d12c080d6651.jpg" width="50px" height="50px" alt="John Doe" class="rounded-circle mb-3">
            <p>"Great service! The drivers are always on time and very professional."</p>
            <h5>- John Doe</h5>
          </div>
        </div>
        <!-- Review 2 -->
        <div class="carousel-item">
          <div class="review-card">
            <img src="assets/145857007_307ce493-b254-4b2d-8ba4-d12c080d6651.jpg" width="50px" height="50px" alt="Jane Smith" class="rounded-circle mb-3">
            <p>"I love using Mega City Cab. The rides are always comfortable and affordable."</p>
            <h5>- Jane Smith</h5>
          </div>
        </div>
        <!-- Review 3 -->
        <div class="carousel-item">
          <div class="review-card">
            <img src="assets/145857007_307ce493-b254-4b2d-8ba4-d12c080d6651.jpg"  width="50px" height="50px" alt="Mike Johnson" class="rounded-circle mb-3">
            <p>"Highly recommend! The best cab service in the city."</p>
            <h5>- Mike Johnson</h5>
          </div>
        </div>
      </div>
      <!-- Carousel Controls -->
      <button class="carousel-control-prev" type="button" data-bs-target="#reviewCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#reviewCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </div>
  </div>
</section>
<!-- Footer -->
<footer class="footer">
  <div class="container">
    <p>&copy; 2023 Mega City Cab. All rights reserved.</p>
    <p>Contact: info@megacitycab.com | Phone: +123 456 7890</p>
  </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>