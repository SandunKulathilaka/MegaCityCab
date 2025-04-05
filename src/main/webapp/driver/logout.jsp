<%@ page import="com.megacitycab.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Invalidate the current session
    session.invalidate();

    // Alternative way to remove specific attributes if needed
    // session.removeAttribute("user");
    // session.removeAttribute("otherAttributes");

    // Set cache control headers to prevent back button access
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies

    // Redirect to login page after logout
    response.sendRedirect("../login.jsp");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logging Out - Mega City Cab</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .logout-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f8f9fa;
        }
        .logout-card {
            width: 100%;
            max-width: 400px;
            padding: 2rem;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .spinner {
            width: 3rem;
            height: 3rem;
            margin: 0 auto 1rem;
        }
    </style>
</head>
<body>
<div class="logout-container">
    <div class="card logout-card">
        <div class="spinner-border text-primary" role="status">
            <span class="visually-hidden">Loading...</span>
        </div>
        <h4>Logging you out...</h4>
        <p class="text-muted">Please wait while we securely end your session</p>
        <div class="progress mt-3">
            <div class="progress-bar progress-bar-striped progress-bar-animated" style="width: 100%"></div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<!-- JavaScript redirect as fallback -->
<script>
    // Fallback redirect in case the server-side redirect fails
    setTimeout(function() {
        window.location.replace("../login.jsp");
    }, 3000);
</script>
</body>
</html>