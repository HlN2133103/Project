<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Additional CSS Files -->
<link rel="stylesheet" href="assets/css/fontawesome.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/owl.css">
</head>
<body>

<%
	session.getAttribute("u");
%>
<jsp:include page="Header.jsp"></jsp:include>
<br><br>
<sql:setDataSource driver="com.mysql.jdbc.Driver"
					   url="jdbc:mysql://localhost:3306/project"
					   user="root"
					   password="root"
					   var="con"/>
					 
	<sql:query var="rs" dataSource="${con}">
		select * from cartitems where username=?
		<sql:param>${u.username}</sql:param>
	</sql:query>
	
<div id="shopping-cart">
<table class="tbl-cart" cellpadding="80" cellspacing="3">
<tbody>
<tr>
<th style="text-align:left;">Product Image</th>    
<th style="text-align:left;">Product Name</th>
<th style="text-align:left;">Product Quantity</th>
<th style="text-align:left;">Product Price</th>
<th style="text-align:left;">Total Price</th>
</tr>

	<c:forEach items="${rs.rows}" var="cartdetails">
	
	<sql:query var="rs2" dataSource="${con}">
		select * from products where Id=?
		<sql:param>${cartdetails.ProductId}</sql:param>
	</sql:query>
<tr>  
<c:forEach items="${rs2.rows}" var="row">  
    <td> 
        <a href="product-details.jsp?Id=${row.Id}"> <img src="ImageServlet?id=${row.Id}" alt="" style="height:230px; width:360px;" class="img-responsive">
    </td> 
</c:forEach>
<c:forEach items="${rs.rows}" var="row">
<td align="center"><c:out value="${row.Brand} ${row.Productname}"></c:out></td>
<td align="center"><c:out value="${row.Quantity}"></c:out> </td>
<td align="center"><c:out value="${row.Price}"></c:out></td>
<td align="center"><c:out value="${row.Quantity*row.Price}"></c:out></td>
</c:forEach>
<td> 
    <!--<form action="pay.php" method="POST">
                  <div class="col-lg-12">
                  <div class="form-group">
                      <input type="text" value="<?php echo $Phonename;?> " hidden name="pname">
                      <input type="text" value="<?php echo $Brand;?> " hidden name="brand">
                      <input type="text" value="<?php echo $Total;?> " hidden name="Price">
                      <input type="text" value="<?php echo str_replace("+"," ",$Name); ?> " hidden name="name">
                      <input type="text" value="<?php echo $Phone; ?> " hidden name="phone">
                      <input type="text" value="<?php echo $Email; ?> " hidden name="email">

                     <button type="submit" class="btn btn-round btn-block" style="background:#a4c639;color: #fff;
                      font-size: 13px;
                      text-transform: uppercase;
                      font-weight: 700;
                      padding: 12px 30px;
                      border-radius: 30px;
                      display: inline-block;
                      transition: all 0.3s;">
                      Buy Now</button>


                </div></div>
        </form> -->
        <c:forEach items="${rs.rows}" var="row1"> 
        <form action="RemoveFromCart" method="POST">
                  <div class="col-lg-12">
                  <div class="form-group">
                    <input type="text" name="Id" value="${row1.Id}" hidden>
                     <button type="submit" class="btn btn-round btn-block" style="background:#a4c639;color: #fff;
                      font-size: 13px;
                      text-transform: uppercase;
                      font-weight: 700;
                      padding: 12px 30px;
                      border-radius: 30px;
                      display: inline-block;
                      transition: all 0.3s;" align="center">
                      Remove</button>

                </div></div>
        </form> 
        </c:forEach>  
</td>
</tr>
</c:forEach>
</tbody>
</table>
</div>
</body>
</html>