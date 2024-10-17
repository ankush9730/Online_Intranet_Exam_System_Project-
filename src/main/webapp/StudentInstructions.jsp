<%@page import="oes.model.StudentsDao"%>
<%@page import="oes.model.InstructionsDao"%>
<%@page import="oes.db.Instructions"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Instructions</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- Google Fonts - Merriweather -->
    <link href="https://fonts.googleapis.com/css?family=Merriweather&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Merriweather', serif;
            background-color: #f8f9fa; /* Light gray background */
            padding-top: 50px; /* Add space from top for fixed navbar */
        }
        .jumbotron {
            background-color: #ffffff; /* White background for jumbotron */
            border-radius: 15px; /* Rounded corners */
            padding: 20px; /* Padding inside jumbotron */
            margin-bottom: 30px; /* Add margin at the bottom */
            box-shadow: 0 4px 6px rgba(0,0,0,0.1); /* Soft shadow */
        }
        .btn-custom {
            margin-top: 20px; /* Add space at the top of buttons */
        }
        .instruction-text {
            font-weight: bold;
            color: #007bff; /* Blue color for instruction text */
            font-size: 16px; /* Decreased font size for student name */
        }
    </style>
</head>
<body>
<%
    String name = "";
    Object username = session.getAttribute("username");
    if (username != null) {
        name = StudentsDao.getStudentName(username.toString());
    }
%> 
<div class="container">
    <div class="jumbotron text-center">
        <h2 class="display-4"><font color="green">Welcome <%= name %></font></h2>
    </div>
    <div class="row justify-content-center">
        <div class="col-md-8">
            <button type="button" class="btn btn-primary btn-lg btn-block" onclick="location.href='oes.controller.LogoutStudent'">Logout</button>
            <button type="button" class="btn btn-primary btn-lg btn-block btn-custom" onclick="location.href='Exam.jsp'">Start Test</button>
        </div>
    </div>
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">
                    <h3 class="text-center text-danger">Instructions to Students</h3>
                </div>
                <div class="card-body">
                    <div class="list-group">
                        <%
                            ArrayList<Instructions> allinsts = InstructionsDao.getAllRecords();
                            for (Instructions e : allinsts) {   
                        %>
                        <div class="list-group-item">
                            <span class="instruction-text"><%= e.getInstruction() %></span>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
