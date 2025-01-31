
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Create New Account</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="style1.css">
</head>
<body>

<input type= "hidden" id= "status" value="<%= request.getAttribute("status") %>">

	<div class="main">

		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Sign up</h2>
					
						<form method="post" action="oes.controller.StudentInsert" class="register-form"
							id="register-form">
							
							<div class="form-group">
								<label for="User id"><i class="zmdi zmdi-email"></i></label> <input
									type="text" name="name" id="uid" placeholder="Your UserName" required="required" />
							</div>
							<div class="form-group">
								<label for="name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="uname" id="name" placeholder="Your Userid" required="required" />
							</div>
							<div class="form-group">
								<label for="password"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="pass" id="pass" placeholder="Password" required="required" />
							</div>
							<div class="form-group">
								<label for="Email"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="email" name="email" id="email"
									placeholder="your email" required="required"/>
							</div>
							 
							<div class="form-group form-button">
								<input type="submit" id="signup"
									class="form-submit" value="Register" />
							</div>
						</form>
					</div>
					<div class="signup-image">
						<figure>
							<img src="signup-image.jpg" alt="sing up image">
						</figure>
						<a href="StudentLogin.jsp" class="signup-image-link">I am already
							member</a>
					</div>
				</div>
			</div>
		</section>


	</div>
	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="http://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	
	<script type="text/javascript">
	var status =document.getElementById("status").value;
	if(status=="success"){
		swal("Congrats","Account Created Successfully","success");
	}
	
	if(status=="invalidName"){
		swal("Congrats","Please Enter Name","error");
	}
	
	if(status=="invalidEmail"){
		swal("Congrats","Please Enter Email","error");
	}
	
	if(status=="invalidUpwd"){
		swal("Congrats","Please Enter Password","error");
	}
	
	if(status=="invalidConfirmpassword"){
		swal("Congrats","Password do not match","error");
	}
	
	if(status=="invalidMobileNumber"){
		swal("Congrats","Please Enter Mobilenumber","error");
	}
	if(status=="invalidMobileNumberLength"){
		swal("Congrats","Mobilenumber should be of 10 digit","error");
	}
	
	</script>
	



</body>

</html>