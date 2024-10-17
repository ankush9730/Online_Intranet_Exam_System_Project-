package oes.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Provider {

    // Method to establish a connection to the Oracle database
    public static Connection getOracleConnection() {
        Connection con = null;
        try {
            // Load the Oracle JDBC driver
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Define the database connection URL, username, and password
            String url = "jdbc:oracle:thin:@localhost:1521:XE"; // Replace with your database URL
            String username = "system"; // Replace with your database username
            String password = "tiger"; // Replace with your database password
             
            // Establish the database connection
            con = DriverManager.getConnection(url, username, password);

        } catch (Exception e) {
            // Handle any exceptions
            e.printStackTrace();
        }

        return con;
    }

    // Method to send an email
    public static void sendEmail(String to, String subject, String body) {
        final String username = "shindeankush9730@gmail.com"; // Replace with your email username
        final String password = "faizqlnuyiacchbn"; // Replace with your email password

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com"); // Replace with your SMTP host
        props.put("mail.smtp.port", "587"); // Replace with your SMTP port

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject("Password Reset OTP");
            message.setText("Your OTP for Password Reset is :"+body);
 
            Transport.send(message);

            System.out.println("Email sent successfully.");

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
}
