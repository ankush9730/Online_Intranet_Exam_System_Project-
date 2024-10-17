<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <link href="bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <style>
        body {
            background-image: url('your-background-image.jpg');
            background-size: cover;
            background-position: center;
            height: 100vh;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        #login-box {
            background-color: #fff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
            border-top: 5px solid #007bff;
            border-bottom: 5px solid #28a745;
            margin-top: 100px;
            width: 300px;
        }
        #login-box h1 {
            text-align: center;
            color: #333;
        }
        .form-control {
            margin-bottom: 10px;
            font-size: 16px; /* Increased font size */
        }
        .form-control-label {
            font-size: 18px; /* Increased font size for labels */
        }
        .btn-login {
            width: 100%;
        }
        .btn-exit {
            background-color: #dc3545;
            border-color: #dc3545;
        }
        .btn-exit:hover {
            background-color: #c82333;
            border-color: #bd2130;
        }
    </style>
</head>
<body>
    <div id="login-box">
        <h1>Admin Login</h1>
        <form action="oes.controller.ValidateAdmin" method="post">
            <div class="form-group">
                <label for="uname" class="form-control-label">Username:</label>
                <input type="text" class="form-control" id="uname" name="uname" required>
            </div>
            <div class="form-group">
                <label for="pass" class="form-control-label">Password:</label>
                <input type="password" class="form-control" id="pass" name="pass" required>
            </div>
            <button type="submit" class="btn btn-primary btn-login">Login</button>
            <button type="button" class="btn btn-exit btn-login" onclick="location.href='index.html'">Exit</button>
        </form>
    </div>
</body>
</html>
