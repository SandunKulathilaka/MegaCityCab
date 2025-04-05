package com.megacitycab.controller;

import com.megacitycab.dao.InvoiceDAO;
import com.megacitycab.model.Invoice;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/invoice") // Base URL for invoice-related actions
public class InvoiceController extends HttpServlet {

    private static final Logger logger = Logger.getLogger(InvoiceController.class.getName());

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action"); // Determine the action (add, update, delete)

        if (action == null || action.isEmpty()) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Action parameter is missing.");
            return;
        }

        try {
            switch (action) {
                case "add":
                    addInvoice(req, resp);
                    break;
                case "update":
                    updateInvoice(req, resp);
                    break;
                case "delete":
                    deleteInvoice(req, resp);
                    break;
                default:
                    resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action: " + action);
            }
        } catch (NumberFormatException e) {
            logger.log(Level.SEVERE, "Invalid number format in request parameters", e);
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid number format in request parameters.");
        } catch (Exception e) {
            logger.log(Level.SEVERE, "An error occurred while processing the request", e);
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing the request.");
        }
    }

    private void addInvoice(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int bookingId = Integer.parseInt(req.getParameter("bookingId"));
            int customerId = Integer.parseInt(req.getParameter("customerId"));
            int driverId = Integer.parseInt(req.getParameter("driverId"));
            double totalAmount = Double.parseDouble(req.getParameter("totalAmount"));

            Invoice invoice = new Invoice(0, bookingId, customerId, driverId, totalAmount, null);

            InvoiceDAO invoiceDAO = new InvoiceDAO();
            boolean isAdded = invoiceDAO.addInvoice(invoice);

            if (isAdded) {
                req.getSession().setAttribute("success", "Invoice added successfully.");
            } else {
                req.getSession().setAttribute("error", "Failed to add invoice.");
            }
        } catch (NumberFormatException e) {
            logger.log(Level.SEVERE, "Invalid number format while adding invoice", e);
            req.getSession().setAttribute("error", "Invalid input. Please check the fields.");
        } catch (Exception e) {
            logger.log(Level.SEVERE, "An error occurred while adding invoice", e);
            req.getSession().setAttribute("error", "An error occurred while adding invoice.");
        }
        resp.sendRedirect("admin/invoice.jsp"); // Redirect to invoice management page
    }

    private void updateInvoice(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int invoiceId = Integer.parseInt(req.getParameter("invoiceId"));
            int bookingId = Integer.parseInt(req.getParameter("bookingId"));
            int customerId = Integer.parseInt(req.getParameter("customerId"));
            int driverId = Integer.parseInt(req.getParameter("driverId"));
            double totalAmount = Double.parseDouble(req.getParameter("totalAmount"));
            System.out.println(invoiceId+ bookingId+customerId+driverId+totalAmount);

            Invoice invoice = new Invoice(invoiceId, bookingId, customerId, driverId, totalAmount, null);

            InvoiceDAO invoiceDAO = new InvoiceDAO();
            boolean isUpdated = invoiceDAO.updateInvoice(invoice);

            if (isUpdated) {
                req.getSession().setAttribute("success", "Invoice updated successfully.");
                System.out.println("Invoice updated successfully.");
            } else {
                req.getSession().setAttribute("error", "Failed to update invoice.");
            }
        } catch (NumberFormatException e) {
            logger.log(Level.SEVERE, "Invalid number format while updating invoice", e);
            req.getSession().setAttribute("error", "Invalid input. Please check the fields.");
        } catch (Exception e) {
            logger.log(Level.SEVERE, "An error occurred while updating invoice", e);
            req.getSession().setAttribute("error", "An error occurred while updating invoice.");
        }
        resp.sendRedirect("/admin/invoice.jsp"); // Redirect to invoice management page
    }

    private void deleteInvoice(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int invoiceId = Integer.parseInt(req.getParameter("invoiceId"));

            InvoiceDAO invoiceDAO = new InvoiceDAO();
            boolean isDeleted = invoiceDAO.deleteInvoice(invoiceId);

            if (isDeleted) {
                req.getSession().setAttribute("success", "Invoice deleted successfully.");
            } else {
                req.getSession().setAttribute("error", "Failed to delete invoice.");
            }
        } catch (NumberFormatException e) {
            logger.log(Level.SEVERE, "Invalid number format while deleting invoice", e);
            req.getSession().setAttribute("error", "Invalid invoice ID.");
        } catch (Exception e) {
            logger.log(Level.SEVERE, "An error occurred while deleting invoice", e);
            req.getSession().setAttribute("error", "An error occurred while deleting invoice.");
        }
        resp.sendRedirect("admin/invoice.jsp"); // Redirect to invoice management page
    }
}