package com.shopme.megacitycab.controller;

import com.shopme.megacitycab.dao.UserDAO;
import com.shopme.megacitycab.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/register")
public class UserController extends HttpServlet {

    public void getUserInfo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("full_name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String password = req.getParameter("password");
        String role = req.getParameter("role");
        String address = req.getParameter("address");

        User user = new User(name, email, phone, password, role, address);

        UserDAO userDAO = new UserDAO();
        userDAO.addUser(user);
        req.getSession().setAttribute("user", user);
        resp.sendRedirect("/user");
    }
}
