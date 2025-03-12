package com.megacitycab.controller;
import com.megacitycab.dao.BookingDAO;
import com.megacitycab.model.Booking;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/BookingServlet")
public class BookingController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookingDAO bookingDAO;

    public void init() {
        bookingDAO = new BookingDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Booking> bookingList = bookingDAO.getAllBookings();
        request.setAttribute("bookingList", bookingList);
        request.getRequestDispatcher("admin_dashboard.jsp").forward(request, response);
    }
}

