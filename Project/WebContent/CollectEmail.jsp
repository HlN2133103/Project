<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function(){
		$("#ForgotPassword").modal('show');
	});
</script>
<style>
  			label
  			{
  				font-size:20px;
  			}
  </style>
</head>
<body>
<div class="modal fade" id="ForgotPassword" role="dialog">
         <div class="modal-dialog">  
            <div class="modal-content">
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">×</button>
                  <h4 class="modal-title">Verify Email</h4>
               </div>
               <div class="modal-body">
                  <form action="OTP" method="post">
                     <div class="form-group">
                        <label >Email address</label>
                        <input type="email" name="email" class="form-control input-lg" id="email" placeholder="Enter email">                        
                     </div>
                     <div class="modal-footer">
                     <button type="submit" class="btn btn-primary" > Check Email</button>
                     </div>
                  </form>
               </div>
            </div>
         </div>
      </div>

</body>
</html>