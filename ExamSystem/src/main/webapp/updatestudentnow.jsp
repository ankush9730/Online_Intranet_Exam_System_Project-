<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="oes.model.StudentsDao"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Update Student</title>
</head>
<body> 
    <%    
        String newuserid = request.getParameter("uname");
        String newpassword = request.getParameter("pass");
        String newname = request.getParameter("name");
        String newemail = request.getParameter("email");
        String originaluid = request.getParameter("usernameoriginal");
        int status = StudentsDao.doUpdateNowRecord(originaluid, newuserid, newpassword, newname, newemail);
        if (status > 0) { 
            response.sendRedirect("StudentList.jsp");
        } else if (status == -1) {
            %>
            <p>Error: Failed to update the record in the database.</p>
            <%
        } else {
            %>
            <p>Error: An exception occurred during the update process.</p>
            <%
        }
    %>
</body>
</html>
