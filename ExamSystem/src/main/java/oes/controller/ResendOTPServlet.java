package oes.controller;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

@WebServlet(name = "ResendOTPServlet", urlPatterns = {"/resendOTP"})
public class ResendOTPServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Retrieve email from session
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");

        // Check if OTP has already been generated for this session
        String otp = (String) session.getAttribute("otp");
        if (otp == null) {
            // Generate and send OTP to user's email
            otp = generateOTP();
            sendEmail(email, otp); // Send email with OTP to the user

            // Update session with new OTP and OTP creation time
            session.setAttribute("otp", otp);
            session.setAttribute("otpCreationTime", System.currentTimeMillis());
        }

        // Redirect to the same page or any other page as needed
        response.sendRedirect("#");
    }

    private String generateOTP() {
        // Generate random 6-digit OTP
        return String.valueOf((int) ((Math.random() * (999999 - 100000)) + 100000));
    }

    private void sendEmail(String recipient, String otp) {
        // Sender's email address and password
        final String senderEmail = "shindeankush9730@gmail.com"; // Change this to your email address
        final String password = "faizqlnuyiacchbn"; // Change this to your email password

        // SMTP server configuration (e.g., for Gmail)
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        // Create a session with the email server
        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(senderEmail, password);
                    }
                });

        try {
            // Create a message
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(senderEmail)); // Set sender's email address
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipient)); // Set recipient's email address
            message.setSubject("OTP for account verification"); // Set email subject
            message.setText("Your OTP for account verification is: " + otp); // Set email content

            // Send the message
            Transport.send(message);

            System.out.println("Email sent successfully!");
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
}
