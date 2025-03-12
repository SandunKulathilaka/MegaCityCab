package com.megacitycab.controller;

import com.megacitycab.dao.UserDAO;
import com.megacitycab.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/user") // Base URL for user-related actions
public class UserController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action"); // Determine the action (register, login, add, update, delete)

        switch (action) {
            case "register":
                registerUser(req, resp);
                break;
            case "login":
                loginUser(req, resp);
                break;
            case "add":
                addUser(req, resp);
                break;
            case "update":
                updateUser(req, resp);
                break;
            case "delete":
                deleteUser(req, resp);
                break;
            default:
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
        }
    }

    private void registerUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("full_name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String password = req.getParameter("password");
        String role = req.getParameter("role");
        String address = req.getParameter("address");

        // Validate role
        if (!isValidRole(role)) {
            req.setAttribute("error", "Invalid role selected.");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
            return;
        }

        User user = new User(name, email, phone, password, role, address);

        UserDAO userDAO = new UserDAO();
        userDAO.addUser(user);

        req.getSession().setAttribute("user", user);
        resp.sendRedirect("user.jsp"); // Redirect to a user page
    }

    private void loginUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        UserDAO userDAO = new UserDAO();
        User user = userDAO.getUserByEmailAndPassword(email, password);

        if (user != null) {
            // Login successful
            HttpSession session = req.getSession();
            session.setAttribute("user", user);
            resp.sendRedirect("admin/dashboard.jsp"); // Redirect to dashboard or home page
        } else {
            // Login failed
            req.setAttribute("error", "Invalid email or password.");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }

    private void addUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("full_name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String password = req.getParameter("password");
        String role = req.getParameter("role");
        String address = req.getParameter("address");

        // Validate role
        if (!isValidRole(role)) {
            req.setAttribute("error", "Invalid role selected.");
            req.getRequestDispatcher("addUser.jsp").forward(req, resp);
            return;
        }

        User user = new User(name, email, phone, password, role, address);

        UserDAO userDAO = new UserDAO();
        boolean isAdded = userDAO.addUser(user);

        if (isAdded) {
            req.setAttribute("success", "User added successfully.");
        } else {
            req.setAttribute("error", "Failed to add user.");
        }
        resp.sendRedirect("admin/users.jsp"); // Redirect to user management page
    }

    private void updateUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("full_name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String password = req.getParameter("password");
        String role = req.getParameter("role");
        String address = req.getParameter("address");

        // Validate role
        if (!isValidRole(role)) {
            req.setAttribute("error", "Invalid role selected.");
            req.getRequestDispatcher("editUser.jsp").forward(req, resp);
            return;
        }

        User user = new User(name, email, phone, password, role, address);

        UserDAO userDAO = new UserDAO();
        boolean isUpdated = userDAO.updateUser(user);

        if (isUpdated) {
            req.setAttribute("success", "User updated successfully.");
        } else {
            req.setAttribute("error", "Failed to update user.");
        }
        resp.sendRedirect("admin/users.jsp"); // Redirect to user management page
    }

    private void deleteUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");

        UserDAO userDAO = new UserDAO();
        boolean isDeleted = userDAO.deleteUser(email);

        if (isDeleted) {
            req.setAttribute("success", "User deleted successfully.");
        } else {
            req.setAttribute("error", "Failed to delete user.");
        }
        resp.sendRedirect("admin/users.jsp"); // Redirect to user management page
    }

    private boolean isValidRole(String role) {
        return role != null && (role.equals("Customer") || role.equals("Driver") || role.equals("Admin"));
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "GET method is not supported.");
    }
}