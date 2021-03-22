<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function(){
		$("#placeordermodal").modal('show');
	});
</script>
</head>
<body>
<div class="container">

  <div class="modal fade" id="placeordermodal">
    <div class="modal-dialog">
      <div class="modal-content">
     
        <div class="modal-header">
          <h4 class="modal-title">Confirm Place Order</h4>
        </div>
        
        <div class="modal-footer">
        <form action="PlaceOrder" method="post">
        <input type="text" value="<%=session.getAttribute("pname")%>" hidden name="pname">
        <input type="text" value="<%=session.getAttribute("price")%>" hidden name="Price">
        <input type="text" value="<%=session.getAttribute("name")%>" hidden name="name">
        <input type="text" value="<%=session.getAttribute("phone")%>" hidden name="phone">
        <input type="text" value="<%=session.getAttribute("email")%>" hidden name="email">
        <input text="text" value="<%=session.getAttribute("qty")%>" hidden name="qty">
        <input type="submit" class="btn btn-primary" value="Place Order">
          </form>
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>