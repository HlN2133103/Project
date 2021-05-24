<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
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
							<li><a href="index.jsp"><i class="fa fa-home"></i> Home</a></li>
							<li class="active">Register</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="page-content mb-50">
		<div class="container">
			<div class="row">
				<div class="col-sm-30 col-md-20 col-xs-12 col-lg-10">
					<form action="AddUser" method="POST" enctype="multipart/form-data">
						<div class="login-form">
							<h4 class="login-title">Register</h4>
							<div class="row">
								<div class="col-md-6 col-12 mb-20">
									<label>Name</label> <input type="text" name="name"
										class="mb-20" placeholder="Name">
								</div>

								<div class="col-md-6 col-12 mb-20">
									<label>Username</label> <input type="text" class="mb-0"
										placeholder="Username" name="username">
								</div>

								<div class="col-md-6 col-12 mb-20">
									<label>Email</label> <input type="email" class="mb-0"
										placeholder="Email" name="email">
								</div>

								<div class="col-md-6 col-12 mb-20">
									<label>Contact</label> <input type="text" class="mb-0"
										placeholder="Contact No" name="phone">

								</div>

								<div class="col-md-6 col-12 mb-20">
									<label>Company Name</label> <input type="text" class="mb-0"
										placeholder="Username" name="c_name">

								</div>

								<div class="col-md-6 col-12 mb-20">
									<label>Select License Type</label> 
									<select name="l_type" class="mb-02">
										<option selected>Open this select menu</option>
										<option value="GST">GST</option>
										<option value="FSSAI">FSSAI</option>
										<option value="SHOP AND ESTABLISHMENT">SHOP AND ESTABLISHMENT</option>
										<option value="PAN CARD">PAN CARD</option>
									</select>
								</div>

								<div class="col-md-12 col-20 mb-20">
									<label>Enter License Image</label> <input type="file"
										name="l_image" class="mb-0" placeholder="Select Image">
								</div>

								<div class="col-md-12 col-20 mb-20">
									<label>Enter Shop Image</label> <input type="file"
										name="shop_image" class="mb-0" placeholder="Enter Shop Image">
								</div>

								<div class="col-md-12 col-20 mb-20">
									<label>Enter Address</label> <input type="text" name="address"
										class="mb-0" placeholder="Enter Address">
								</div>

								<div class="col-md-6 col-12 mb-20">
									<label>Password</label> <input type="password" name="password"
										class="mb-0" placeholder="Password">
								</div>

								<div class="col-md-6 col-12 mb-20">
									<label>Confirm Password</label> <input type="password"
										name="cpassword" class="mb-0"
										placeholder="Confirm password">
								</div>

								<div class="col-md-7 col-20 mb-20">
									<button class="register-button mt-30 float-right" name="signup"
										type="submit">Register</button>
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
<!--    if(empty($data['name_error']) && empty($data['email_error']) && empty($data['r_password_error']) && empty($data['confirm_error']) && empty($data['surname_error']) && empty($data['contact_error']) && empty($data['user_level_error']) && empty($data['username_error'])){

   	$password = password_hash($data['password'], PASSWORD_DEFAULT);

   	if($source->Query("INSERT INTO dbm_users(name,surname,email,contact,username,password,user_level) VALUES (?,?,?,?,?,?,?)", [$data['name'], $data['surname'], $data['email'],$data['contact'],$data['username'], $password,$data['user_level']])){

   		$output='<p>Dear Reader,</p>';
   		$output.='<p>New user name is  : '.$data['name'].' '.$data['surname'].'</p>';
   		$output.='<p>contact is  : '.$data['contact'].'</p>';

   		$output.='<p>Thanks,</p>';
   		$output.='<p>Test Team</p>';
   		$body = $output; 
   		$subject = "New User Register - DBM";
   		$email_to = 'kamatanand3@gmail.com';
   		$fromserver = "Kamatanand9@gmail.com"; 
   		require("admin/PHPMailer/PHPMailerAutoload.php");
   		$mail = new PHPMailer();
        //$mail->IsSMTP();
        $mail->Host = 'smtp.gmail.com';     //Sets the SMTP hosts of your Email hosting, this for Godaddy
        $mail->Port = '587';                                //Sets the default SMTP server port
        $mail->SMTPAuth = true;                         //Sets SMTP authentication. Utilizes the Username and Password variables
        $mail->Username = 'aacs0878@gmail.com';                 //Sets SMTP username
        $mail->Password = 'L1m1tl3ss1!';                    //Sets SMTP password
        //$mail->SMTPSecure = 'tls';    
        $mail->IsHTML(true);
        $mail->From = "Kamatanand9@gmail.com";
        $mail->FromName = "Kamatanand9";
        $mail->Sender = $fromserver; // indicates ReturnPath header
        $mail->Subject = $subject;
        $mail->Body = $body;
        $mail->AddAddress($email_to);
        if(!$mail->Send()){
        	echo "Mailer Error: " . $mail->ErrorInfo;
        }else{

        	$_SESSION['account_created'] = "Your account is successfully created";

        	echo '<script>window.location = "login_register.php";</script>';


        }



    }



}
//    else
// {
// 	
// }

}

?>-->