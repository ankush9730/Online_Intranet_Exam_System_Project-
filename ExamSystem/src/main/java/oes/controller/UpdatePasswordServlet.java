//UpdatePasswordServlet
package oes.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import oes.db.Provider;

@WebServlet(name = "UpdatePasswordServlet", urlPatterns = {"/updatePassword"})
public class UpdatePasswordServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email"); // Assuming email is stored in session
        
        String newPassword = request.getParameter("password"); 
        
        int status = doUpdateNowRecord(newPassword, email);
        
        if (status == 1) {
            // Password updated successfully
            response.sendRedirect("StudentLogin.jsp");
        } else {
            // Handle errors
            response.sendRedirect("error.jsp");
        }
    }
    
    public static int doUpdateNowRecord(String newPassword, String email) {
        int status = 0;
        try {
            Connection con = Provider.getOracleConnection();
            String sql = "UPDATE studenttable SET password = ? WHERE emailid = ?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, newPassword);  
            pst.setString(2, email);  // Set email as parameter
             
            int val = pst.executeUpdate();
            if (val > 0) {
                status = 1; // Success
            } else {
                status = -1; // No rows updated
            }
        } catch (SQLException e) {
            status = 2; // Error
            e.printStackTrace();
        }
        return status;
    }
}
