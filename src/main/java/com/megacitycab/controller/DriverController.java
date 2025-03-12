package com.megacitycab.controller;

import com.megacitycab.dao.DriverDAO;
import com.megacitycab.model.Driver;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/driver")
public class DriverController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action"); // Determine the action (add, update, delete)

        switch (action) {
            case "add":
                addDriver(req, resp);
                break;
            case "update":
                updateDriver(req, resp);
                break;
            case "delete":
                deleteDriver(req, resp);
                break;
            default:
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
        }
    }

    private void addDriver(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userId = req.getParameter("userId");
        String licenseNumber = req.getParameter("licenseNumber");
        String vehicleId = req.getParameter("vehicleId");
        double rating = Double.parseDouble(req.getParameter("rating"));
        String status = req.getParameter("status");

        Driver driver = new Driver(null, userId, licenseNumber, vehicleId, rating, status);

        DriverDAO driverDAO = new DriverDAO();
        boolean isAdded = driverDAO.addDriver(driver);

        if (isAdded) {
            resp.sendRedirect("drivers.jsp?success=Driver added successfully.");
        } else {
            resp.sendRedirect("drivers.jsp?error=Failed to add driver.");
        }
    }

    private void updateDriver(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String driverId = req.getParameter("driverId");
        String userId = req.getParameter("userId");
        String licenseNumber = req.getParameter("licenseNumber");
        String vehicleId = req.getParameter("vehicleId");
        double rating = Double.parseDouble(req.getParameter("rating"));
        String status = req.getParameter("status");

        Driver driver = new Driver(driverId, userId, licenseNumber, vehicleId, rating, status);

        DriverDAO driverDAO = new DriverDAO();
        boolean isUpdated = driverDAO.updateDriver(driver);

        if (isUpdated) {
            resp.sendRedirect("drivers.jsp?success=Driver updated successfully.");
        } else {
            resp.sendRedirect("drivers.jsp?error=Failed to update driver.");
        }
    }

    private void deleteDriver(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String driverId = req.getParameter("driverId");

        DriverDAO driverDAO = new DriverDAO();
        boolean isDeleted = driverDAO.deleteDriver(driverId);

        if (isDeleted) {
            resp.sendRedirect("drivers.jsp?success=Driver deleted successfully.");
        } else {
            resp.sendRedirect("drivers.jsp?error=Failed to delete driver.");
        }
    }
}