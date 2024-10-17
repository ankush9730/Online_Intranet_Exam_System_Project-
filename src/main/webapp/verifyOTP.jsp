<%@ page import="java.util.Date" %>
<%@ page import="java.util.concurrent.TimeUnit" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Locale" %>

<html>
<head>

<link
    href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
    rel="stylesheet" id="bootstrap-css">
<script
    src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

<style type="text/css">
.form-gap {
    padding-top: 70px;
}
.time-remaining {
    color: red; /* Initial color */
}
.time-expired {
    color: red; /* Color for expired time */
}
</style>
</head>

<body>
    <div class="form-gap"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="text-center">
                            <h3>
                                <i class="fa fa-lock fa-4x"></i>
                            </h3>
                            <h2 class="text-center">Enter OTP</h2>
                            <% if(request.getAttribute("message")!=null) { %>
                                <p class='text-danger ml-1'><%= request.getAttribute("message") %></p>
                            <% } %>
                            <div class="panel-body">
                                <form id="register-form" action="verifyOTP" role="form" autocomplete="off" class="form" method="post">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-envelope color-blue"></i></span>
                                            <input id="opt" name="otp" placeholder="Enter OTP" class="form-control" type="text" required="required">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <input name="recover-submit" class="btn btn-lg btn-primary btn-block" value="Reset Password" type="submit">
                                    </div>
                                    <input type="hidden" class="hide" name="token" id="token" value="">
                                </form>
                                <p class="time-remaining" id="time-remaining"></p> <!-- Display remaining time here -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
     <script>
    // Calculate and display remaining time for OTP validity
    var otpCreationTime = <%= session.getAttribute("otpCreationTime") %>;
    var otpValidityMinutes = 1;
    var otpValidityMillis = otpValidityMinutes * 60 * 1000;
    
    setInterval(function() {
        var currentTime = new Date().getTime();
        var timeElapsed = currentTime - otpCreationTime;
        var timeRemaining = otpValidityMillis - timeElapsed;
        var seconds = Math.floor((timeRemaining % (1000 * 60)) / 1000);
        var minutes = Math.floor((timeRemaining % (1000 * 60 * 60)) / (1000 * 60));
        var remainingTimeMsg = "Remaining time: " + minutes + "m " + seconds + "s";
        
        if (timeRemaining <= 0) {
            remainingTimeMsg = "OTP expired! <a href='StudentForgotPassword.jsp'>request a new OTP</a>.";
            document.getElementById("time-remaining").classList.remove('time-remaining'); // Remove the class for normal time display
            document.getElementById("time-remaining").classList.add('time-expired'); // Add the class for expired time display
        }
        
        document.getElementById("time-remaining").innerHTML = remainingTimeMsg;
    }, 1000);
</script>

</body>
</html>
