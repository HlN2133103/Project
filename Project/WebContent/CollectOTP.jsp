<html>
<body class="account-page">
	<jsp:include page="inc/head.jsp"></jsp:include>
	<div class="page-content mb-50">
		<div class="container text-center">
			<div class=" row">
				<div class="col-sm-12 col-md-12 col-xs-12 col-lg-6 mb-30 mx-auto login-form">

					<div class="container">

						<!-- Account Logo -->
						<div class="account-logo">
							<a href="index.jsp">One Stop Supply</a>
						</div>
						<!-- /Account Logo -->

						<div class="account-box">
							<div class="account-wrapper">
								<h3 class="account-title">Verify OTP</h3>

								<p class="account-subtitle">Enter OTP to reset password</p>
								
								<!-- Account Form -->
								<form method="post" action="CheckOTP" name="reset">

									<div class="form-group">
										<label>Enter OTP</label>
										<input class="form-control" type="text" name="otp" placeholder="Enter OTP" required>
									</div>
									<div class="form-group text-center">
										<input class="btn btn-primary account-btn" type="submit" value="Verify OTP"/>
										<!-- <button  type="submit">Reset Password</button> -->
									</div>
									<div class="account-footer">
										<div class="text-muted">

											<p>All rights reserved. &copy; 
											<h6 class="text-muted" style="font-size: 12px;">Version : 1.1</h6>


											<div class="text-danger" style="font-size:.9375rem;">Incase mail not recieved <a href="mailto:support@jkithub.in">Contact Us</a></div>
										</div>
									</div>
								</form>
								<!-- /Account Form -->
							</div>
						</div>
					</div>
					<!-- /Main Wrapper -->
				</div>
			</div>
		</div>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>


	<br /><br />


	<?php include('inc/footer.php'); ?>
