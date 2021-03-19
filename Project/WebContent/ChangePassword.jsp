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
		$("#ChangePassword").modal('show');
	});
</script>
</head>
<body>
<div class="modal fade" id="ChangePassword" role="dialog">
         <div class="modal-dialog">  
            <div class="modal-content">
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">×</button>
                  <h4 class="modal-title">Change Password</h4>
               </div>
               <div class="modal-body">
                  <form action="ChangePassword" method="post">
        					           <div class="form-group">
										<label>Enter Password</label>
										<input type="text" name="password" placeholder="Enter Password" class="form-control input-lg"/>
										</div>
										<div class="form-group">
										<label>Enter ConfirmPassword</label>
										<input type="text" name="confirmpassword" placeholder="Enter ConfirmPassword" class="form-control input-lg"/>
									</div>
                     <div class="modal-footer">
                     <input type="submit" value="ChangePassword" class="btn btn-warning"/>
					  <input type="reset" value="Reset" class="btn btn-danger"/>
                     </div>
                  </form>
               </div>
            </div>
         </div>
         </div>
</body>
</html>