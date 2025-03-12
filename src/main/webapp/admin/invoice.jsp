<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, com.megacitycab.model.Invoice" %>
<%@ page import="com.megacitycab.dao.InvoiceDAO" %>

<%
    // Fetch invoice data from the database
    InvoiceDAO invoiceDAO = new InvoiceDAO();
    List<Invoice> invoiceList = invoiceDAO.getAllInvoices();
    request.setAttribute("invoiceList", invoiceList);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Invoice Management - MegaCityCab Admin</title>
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
                        <a class="nav-link text-white" href="drivers.jsp">Drivers</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white active" href="invoice.jsp">Invoices</a>
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
            <h2 class="mb-4">Invoice Management</h2>

            <!-- Add Invoice Button and Modal Trigger -->
            <button type="button" class="btn btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#addInvoiceModal">
                <i class="fas fa-plus"></i> Add New Invoice
            </button>

            <!-- Invoices Table -->
            <div class="table-responsive">
                <table class="table table-striped table-hover">
                    <thead class="table-dark">
                    <tr>
                        <th>Invoice ID</th>
                        <th>Booking ID</th>
                        <th>Customer ID</th>
                        <th>Driver ID</th>
                        <th>Total Amount</th>
                        <th>Invoice Date</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        if (invoiceList != null && !invoiceList.isEmpty()) {
                            for (Invoice invoice : invoiceList) {
                    %>
                    <tr>
                        <td><%= invoice.getInvoiceId() %></td>
                        <td><%= invoice.getBookingId() %></td>
                        <td><%= invoice.getCustomerId() %></td>
                        <td><%= invoice.getDriverId() %></td>
                        <td><%= invoice.getTotalAmount() %></td>
                        <td><%= invoice.getInvoiceDate() %></td>
                        <td class="action-buttons">
                            <button class="btn btn-sm btn-info" data-bs-toggle="modal" data-bs-target="#viewInvoiceModal"
                                    data-invoice-id="<%= invoice.getInvoiceId() %>">
                                <i class="fas fa-eye"></i> View
                            </button>
                            <button class="btn btn-sm btn-warning" data-bs-toggle="modal" data-bs-target="#editInvoiceModal"
                                    data-invoice-id="<%= invoice.getInvoiceId() %>"
                                    data-booking-id="<%= invoice.getBookingId() %>"
                                    data-customer-id="<%= invoice.getCustomerId() %>"
                                    data-driver-id="<%= invoice.getDriverId() %>"
                                    data-total-amount="<%= invoice.getTotalAmount() %>">
                                <i class="fas fa-edit"></i> Edit
                            </button>
                            <button class="btn btn-sm btn-danger" onclick="deleteInvoice('<%= invoice.getInvoiceId() %>')">
                                <i class="fas fa-trash"></i> Delete
                            </button>
                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="7" class="text-center">No invoices available.</td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- Add Invoice Modal -->
<div class="modal fade" id="addInvoiceModal" tabindex="-1" aria-labelledby="addInvoiceModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addInvoiceModalLabel">Add New Invoice</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/invoice" method="post">
                    <input type="hidden" name="action" value="add">
                    <div class="mb-3">
                        <label for="bookingId" class="form-label">Booking ID</label>
                        <input type="number" class="form-control" id="bookingId" name="bookingId" required>
                    </div>
                    <div class="mb-3">
                        <label for="customerId" class="form-label">Customer ID</label>
                        <input type="number" class="form-control" id="customerId" name="customerId" required>
                    </div>
                    <div class="mb-3">
                        <label for="driverId" class="form-label">Driver ID</label>
                        <input type="number" class="form-control" id="driverId" name="driverId" required>
                    </div>
                    <div class="mb-3">
                        <label for="totalAmount" class="form-label">Total Amount</label>
                        <input type="number" step="0.01" class="form-control" id="totalAmount" name="totalAmount" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Add Invoice</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- View Invoice Modal -->
<div class="modal fade" id="viewInvoiceModal" tabindex="-1" aria-labelledby="viewInvoiceModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="viewInvoiceModalLabel">Invoice Details</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p><strong>Invoice ID:</strong> <span id="viewInvoiceId">4</span></p>
                <p><strong>Booking ID:</strong> <span id="viewBookingId">2</span></p>
                <p><strong>Customer ID:</strong> <span id="viewCustomerId">3</span></p>
                <p><strong>Driver ID:</strong> <span id="viewDriverId">2</span></p>
                <p><strong>Total Amount:</strong> <span id="viewTotalAmount">5.4</span></p>
                <p><strong>Invoice Date:</strong> <span id="viewInvoiceDate">2025/03/13</span></p>
            </div>
        </div>
    </div>
</div>

<!-- Edit Invoice Modal -->
<div class="modal fade" id="editInvoiceModal" tabindex="-1" aria-labelledby="editInvoiceModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editInvoiceModalLabel">Edit Invoice</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/invoice" method="post">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" id="editInvoiceId" name="invoiceId">
                    <div class="mb-3">
                        <label for="editBookingId" class="form-label">Booking ID</label>
                        <input type="number" class="form-control" id="editBookingId" name="bookingId" required>
                    </div>
                    <div class="mb-3">
                        <label for="editCustomerId" class="form-label">Customer ID</label>
                        <input type="number" class="form-control" id="editCustomerId" name="customerId" required>
                    </div>
                    <div class="mb-3">
                        <label for="editDriverId" class="form-label">Driver ID</label>
                        <input type="number" class="form-control" id="editDriverId" name="driverId" required>
                    </div>
                    <div class="mb-3">
                        <label for="editTotalAmount" class="form-label">Total Amount</label>
                        <input type="number" step="0.01" class="form-control" id="editTotalAmount" name="totalAmount" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Update Invoice</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
<script>
    // JavaScript to handle modals and actions
    document.addEventListener("DOMContentLoaded", function () {
        // View Invoice Modal
        const viewInvoiceModal = document.getElementById('viewInvoiceModal');
        viewInvoiceModal.addEventListener('show.bs.modal', function (event) {
            const button = event.relatedTarget;
            const invoiceId = button.getAttribute('data-invoice-id');
            fetch(`invoice?action=view&id=${invoiceId}`)
                .then(response => response.text())
                .then(data => {
                    document.getElementById('viewInvoiceDetails').innerHTML = data;
                });
        });

        // Edit Invoice Modal
        const editInvoiceModal = document.getElementById('editInvoiceModal');
        editInvoiceModal.addEventListener('show.bs.modal', function (event) {
            const button = event.relatedTarget;
            document.getElementById('editInvoiceId').value = button.getAttribute('data-invoice-id');
            document.getElementById('editBookingId').value = button.getAttribute('data-booking-id');
            document.getElementById('editCustomerId').value = button.getAttribute('data-customer-id');
            document.getElementById('editDriverId').value = button.getAttribute('data-driver-id');
            document.getElementById('editTotalAmount').value = button.getAttribute('data-total-amount');
        });

        // Delete Invoice
        window.deleteInvoice = function (invoiceId) {
            if (confirm('Are you sure you want to delete this invoice?')) {
                fetch(`invoice?action=delete&invoiceId=${invoiceId}`, { method: 'POST' })
                    .then(() => window.location.reload());
            }
        };
    });
</script>
</body>
</html>