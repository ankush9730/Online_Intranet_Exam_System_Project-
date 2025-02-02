
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>StudentLogin</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="style1.css">
</head>
<body>

<input type= "hidden" id= "status" value="<%=request.getAttribute("status") %>">

	<div class="main">

		<!-- Sing in  Form -->
		<section class="sign-in">
			<div class="container">
				<div class="signin-content">
					<div class="signin-image">
						<figure>
							<img src="signin-image.jpg" alt="sing up image">
						</figure>
						<a href="AddStudent.jsp" class="signup-image-link">Create an
							account?</a>
					</div>

					<div class="signin-form">
						<h2 class="form-title">Sign in</h2>
						<form method="post" action="oes.controller.ValidateStudent" class="register-form"
							id="login-form">
							<div class="form-group">
								<label for="username"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="uname" id="username"
									placeholder="Your Userid"  required="required" />
							</div>
							<div class="form-group">
								<label for="password"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="pass" id="password"
									placeholder="Password" required="required" />
							</div>
							<div class="form-group">
								<a href="StudentForgotPassword.jsp"> Forgot Password?</a>
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signin" id="signin"
									class="form-submit" value="Log in" />
							</div>
						</form>
						<div class="social-login">
							<span class="social-label">Or login with</span>
							<ul class="socials">
								<li><a href="#"><i
										class="display-flex-center zmdi zmdi-facebook"></i></a></li>
								<li><a href="#"><i
										class="display-flex-center zmdi zmdi-twitter"></i></a></li>
								<li><a href="#"><i
										class="display-flex-center zmdi zmdi-google"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</section>

	</div>

	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="main.js"></script>
	<script src="http://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="sweetalert.css">
	
	<script type="text/javascript">
	var status =document.getElementById("status").value;
	if(status=="failed"){
		swal("Sorry","Wrong uname or pass","error");
	}
	
	else if(status=="invalidEmail"){
		swal("Sorry","Please Enter Username","error");
	}
	
	
	else if(status=="invalidupwd"){
		swal("Sorry","Please Enter Password","error");
	}
	else if(status=="resetSuccess"){
		swal("Congrats","Password Reset Successful","success");
	}
	else if(status=="resetFailed"){
		swal("Sorry","Password Reset Failed","error");
	}
	
	
	
	</script>
</body>

</html>