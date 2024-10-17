<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Admin Panel</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        body {
            background-color: #f8f9fa;
            padding-top: 20px;
        }
        .container {
            margin-bottom: 20px;
        }
        .btn-container {
            display: flex;
            justify-content: center;
        }
        .btn-custom {
            margin: 0 10px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="jumbotron">
        <h1 class="display-4">Admin Panel</h1>
        <hr class="my-4">
        <p class="lead">Welcome, <%= session.getAttribute("username") %></p>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Manage Students</h5>
                    <p class="card-text">Add, update, or delete student records.</p>
                    <a href="StudentList.jsp" class="btn btn-primary btn-custom">View Students</a>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Manage Instructions</h5>
                    <p class="card-text">Add, update, or delete instructions.</p>
                    <a href="InstructionList.jsp" class="btn btn-primary btn-custom">View Instructions</a>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Manage Questions</h5>
                    <p class="card-text">Add, update, or delete questions.</p>
                    <a href="QuestionList.jsp" class="btn btn-primary btn-custom">View Questions</a>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Logout</h5>
                    <p class="card-text">Logout from the admin panel.</p>
                    <a href="oes.controller.LogoutAdmin" class="btn btn-danger btn-custom">Logout</a>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
