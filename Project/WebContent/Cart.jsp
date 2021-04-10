<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
<%
session.getAttribute("u");
%>
	<jsp:include page="inc/head.jsp"></jsp:include>
	<jsp:include page="inc/header.jsp"></jsp:include>
	
<sql:setDataSource driver="com.mysql.jdbc.Driver"
					   url="jdbc:mysql://localhost:3306/project"
					   user="root"
					   password="root"
					   var="con"/>
					 
	<sql:query var="rs" dataSource="${con}">
		select * from cartitems where Username=?
		<sql:param>${u.username}</sql:param>
	</sql:query>
	
	<div class="breadcrumb-area mb-50">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="breadcrumb-container">
						<ul>
							<li><a href="index.jsp"><i class="fa fa-home"></i> Home</a></li>
							<li class="active">Cart</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="page-section section mb-50">
		<div class="container">
			<div class="row">
				<div class="col-12">

					<div class="cart-table table-responsive mb-40">
						<table class="table">
							<thead>
								<tr>
									<th class="pro-thumbnail">Image</th>
									<th class="pro-title">Product</th>
									<th class="pro-price">Price</th>
									<th class="pro-quantity">Quantity</th>
									<th class="pro-subtotal">Total</th>
									<th class="pro-remove">Remove</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${rs.rows}" var="rs1">
								<c:if test="${rs1 == null}">
								<tr>
									<td colspan="6">No Product added ->
										<button class="btn btn-success" style="">
											<a href="Products.jsp">Continue Shopping</a>
										</button>
									</td>
									
								</tr>
								</c:if>
								</c:forEach>
								<c:forEach items="${rs.rows}" var="row">
								<tr>
									<td class="pro-thumbnail"><a href="#"><img src="ImageServlet?id=${row.Id}"
											class="img-fluid" alt="Product"></a></td>
									<td class="pro-title"><a href="#"></a>${row.Productname}</td>
									<td class="pro-price"><span>&#x20B9; ${row.Price}</span></td>
									<td class="pro-quantity">${row.Quantity}</td>
									<td class="pro-subtotal"><span> &#x20B9; ${row.Quantity * row.Price}</span></td>
									<td class="pro-remove"><span style="cursor: pointer;"
										id="delete_cart_p" ct_id=""><i class="fa fa-trash-o"></i></span></td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>

					<div class="row">

						<div class="col-lg-6 col-12">
							<div class="discount-coupon d-none">
								<h4>Discount Coupon Code</h4>
								<form action="#">
									<div class="row">
										<div class="col-md-6 col-12 mb-25">
											<input type="text" placeholder="Coupon Code">
										</div>
										<div class="col-md-6 col-12 mb-25">
											<input type="submit" value="Apply Code">
										</div>
									</div>
								</form>
							</div>

							<!--=======  End of Discount Coupon  =======-->

						</div>


						<div class="col-lg-6 col-12 d-flex">
							<!--=======  Cart summery  =======-->
							<sql:query var="rs2" dataSource="${con}">
							Select SUM(Price) as Price from cartitems where Username = ?
							<sql:param>${u.username}</sql:param>
							</sql:query>
						<c:forEach items="${rs2.rows}" var="row">
							<div class="cart-summary">
								<div class="cart-summary-wrap">
									<h4>Cart Summary</h4>
									<p>
										Sub Total <span> &#x20B9; ${row.Price}
										</span>
									</p>
									<h2>
										Grand Total <span> &#x20B9; ${row.Price}
										</span>
									</h2>
								</div>
								<div class="cart-summary-button">
									<a href="checkout.php"><button class="checkout-btn">Checkout</button></a>
									<!-- <button class="update-btn">Update Cart</button> -->
								</div>
							</div>
							</c:forEach>


						</div>

					</div>

				</div>
			</div>
		</div>
	</div>
