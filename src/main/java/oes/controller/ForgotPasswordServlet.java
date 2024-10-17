package oes.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date; // Import Date class for time calculation

import oes.db.Provider; // Import the Provider class
 
@WebServlet(name = "ForgotPasswordServlet", urlPatterns = {"/forgotPassword"})
public class ForgotPasswordServlet extends HttpServlet { 

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");

        // Generate and send OTP to user's email (not implemented here)
        String otp = generateOTP();
        // Assuming you have a Provider class with a method sendEmail(String to, String otp)
        Provider.sendEmail(email, otp, otp); // Use the static method sendEmail from Provider class

        // Save OTP and OTP creation time in session
        HttpSession session = request.getSession();
        session.setAttribute("otp", otp);
        session.setAttribute("email", email); 
        session.setAttribute("otpCreationTime", new Date().getTime()); // Set OTP creation time

        // Forward to OTP verification page
        request.getRequestDispatcher("verifyOTP.jsp").forward(request, response);
    }

    private String generateOTP() {
        // Generate random 6-digit OTP
        return String.valueOf((int) ((Math.random() * (999999 - 100000)) + 100000));
    }
}
