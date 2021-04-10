<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<body>
	<jsp:include page="inc/head.jsp"></jsp:include>
	<jsp:include page="inc/header.jsp"></jsp:include>

	<div class="breadcrumb-area mb-50">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="breadcrumb-container">
						<ul>
							<li><a href="index.php"><i class="fa fa-home"></i> Home</a></li>
							<li class="active">Login</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="page-content mb-50">
		<div class="container">
			<div class="row">
				<div class="col-sm-12 col-md-12 col-xs-12 col-lg-10 mb-30">
					<!-- Login Form s-->

					<form action="DatabaseLogin" method="POST">


						<div class="login-form">
							<h4 class="login-title">Login</h4>

							<div class="row">

								<div class="col-md-12 col-12 mb-20">
									<label>Email/Username*</label> <input name="user"
										class="mb-0" placeholder="Username/Email" type="text">
								</div>

								<div class="col-12 mb-20">
									<label>Password</label> <input name="pass" class="mb-0"
										placeholder="Password" type="password">
								</div>

								<div class="col-md-8 d-none">

									<div class="check-box d-inline-block ml-0 ml-md-2 mt-10">
										<input type="checkbox" id="remember_me"> <label
											for="remember_me">Remember me</label>
									</div>

								</div>

								<div class="col-md-12 mt-21 mb-20 text-left text-md-right">
									<a href="forget_password.jsp"> Forgot password?</a>
								</div>

								<div class="col-md-7 col-20 mb-20">
									<button class="register-button mt-30 float-right" name="signin"
										type="submit">Login</button>
								</div>
								
								<div class="col-md-7 col-20 text-right">
									<a href="Register.jsp" >Don't have Account? Create One</a>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="inc/footer.jsp"></jsp:include>
</body>
</html>