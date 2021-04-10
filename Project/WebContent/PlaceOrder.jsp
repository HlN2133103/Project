<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
         <c:set var="pname" scope="session" value="session.getAttribute('pname')"></c:set>
         <c:set var="Price" scope="session" value="session.getAttribute('price')"></c:set>
         <c:set var="name" scope="session" value="session.getAttribute('name')"></c:set>
         <c:set var="phone" scope="session" value="session.getAttribute('phone')"></c:set>
         <c:set var="email" scope="session" value="session.getAttribute('email')"></c:set>
         <c:set var="qty" scope="session" value="session.getAttribute('qty')"></c:set>
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