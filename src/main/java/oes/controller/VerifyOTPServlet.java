package oes.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "VerifyOTPServlet", urlPatterns = {"/verifyOTP"})
public class VerifyOTPServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // Retrieve OTP entered by the user
        String enteredOTP = request.getParameter("otp");

        // Retrieve OTP and its creation time from session
        HttpSession session = request.getSession();
        String storedOTP = (String) session.getAttribute("otp");
        Long otpCreationTime = (Long) session.getAttribute("otpCreationTime");

        if (storedOTP != null && otpCreationTime != null) {
            // Calculate OTP validity duration (e.g., 2 minutes)
            long otpValidityMillis = 1 * 60 * 1000; // 2 minutes validity

            // Calculate current time
            long currentTime = System.currentTimeMillis();

            // Calculate time elapsed since OTP creation
            long timeElapsed = currentTime - otpCreationTime;

            // Check if OTP has expired
            if (timeElapsed > otpValidityMillis) {
                // OTP has expired
                session.removeAttribute("otp"); // Remove expired OTP from session
                session.removeAttribute("otpCreationTime"); // Remove OTP creation time from session
                request.setAttribute("message", "OTP has expired. Please <a href='StudentForgotPassword.jsp'>request a new OTP</a>."); // Set error message
                request.getRequestDispatcher("verifyOTP.jsp").forward(request, response); // Forward to verification page
            } else {
                // OTP is still valid, proceed with verification
                if (storedOTP.equals(enteredOTP)) {
                    // OTP is correct
                    // Proceed with your verification logic here
                    // For example, mark the user as verified, redirect to a success page, etc.
                    response.sendRedirect("newPasswordForm.jsp");
                } else {
                    // OTP is incorrect
                    request.setAttribute("message", "Incorrect OTP. Please try again."); // Set error message
                    request.getRequestDispatcher("verifyOTP.jsp").forward(request, response); // Forward to verification page
                }
            }
        } else {
            // OTP not found in session, or session expired
            request.setAttribute("message", "OTP not found or expired. Please <a href='StudentForgotPassword.jsp'>request a new OTP</a>."); // Set error message
            request.getRequestDispatcher("verifyOTP.jsp").forward(request, response); // Forward to verification page
        }
    }
}
