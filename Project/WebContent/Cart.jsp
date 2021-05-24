<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java"  import="java.sql.*"%>
<body>
<%
	session.getAttribute("Username");
%>
	<jsp:include page="inc/head.jsp"></jsp:include>
	<jsp:include page="inc/header.jsp"></jsp:include>
	
<sql:setDataSource driver="com.mysql.jdbc.Driver"
					   url="jdbc:mysql://localhost:3306/project"
					   user="root"
					   password="pass@123"
					   var="con"/>
					 
	<sql:query var="rs" dataSource="${con}">
		select * from cartitems where Username=?
		<sql:param>${Username}</sql:param>
	</sql:query>
	
		<sql:query var="rs4" dataSource="${con}">
		select * from coupons where status = "Active"
	</sql:query>
	
	<sql:query var="rs3" dataSource="${con}">
			Select * from products
	</sql:query>
	
	<sql:query var="rs2" dataSource="${con}">
		    Select SUM(Price*Quantity) as Price from cartitems where Username = ?			
			<sql:param>${Username}</sql:param>
	</sql:query>
							
	<sql:query dataSource="${con}" var="rs6">
			select * from coupons where code = ?
			<sql:param>${param.coupon_code}</sql:param>
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
									<td class="pro-thumbnail"><a href="product-details.jsp?Id=${row.ProductId}"><img src="ImageServlet?id=${row.ProductId}"
									class="img-fluid" alt="Product"></a></td>
									<td class="pro-title"><a href="#"></a>${row.Productname}</td>
									<td class="pro-price"><span>&#x20B9; ${row.Price}</span></td>
									<td class="pro-quantity">${row.Quantity}</td>
									<td class="pro-subtotal"><span> &#x20B9; ${row.Quantity * row.Price}</span></td>
									<td class="pro-remove"><span style="cursor: pointer;"
										id="delete_cart_p"><a href="RemoveFromCart?Id=${row.Id}"><i class="fa fa-trash-o"></i></a></span></td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>


						
						<div class="row">
						<div class="col-lg-6 col-12 d-flex">
						<div class="discount-coupon mt-2">
											<div class="checkout-cart-total">

												<h4>
													Coupon Code <span>Amount</span>
												</h4>

												<ul>
													<c:forEach items="${rs4.rows}" var="row">
														<li>${row.code}<span> &#x20B9; ${row.amt} </span>
														</li>
													</c:forEach>

												</ul>
											</div>
											<br>
											<form action="Cart.jsp" method="POST">
											<div class="row">
												
													<div class="col-md-6 col-12 mb-25">
														<input type="text" name="coupon_code" id="coupon_code" placeholder="Coupon Code">
													</div>
													<div class="col-md-6 col-12 mb-25">
														<button class="place-order" style="margin-top: 0px;float: right;height: 45px;" id="Apply_coupon">Apply Code</button>
														
														</div>
											</div>
											</form>

										</div>
										</div>
						<div class="col-lg-6 col-12 d-flex">		
						<c:forEach items="${rs2.rows}" var="row">
						
							<div class="cart-summary">
								<div class="cart-summary-wrap">
									<h4>Cart Summary</h4>
									<p>
										Sub Total <span> &#x20B9; ${row.Price}.00
										</span>
									</p>
									
									<p>
										Coupon Discount <span> &#x20B9;
											<c:forEach items="${rs6.rows}" var="row1">
											<c:set value="${row1.amt}" var="coupon"></c:set>
											${row1.amt}.00
											</c:forEach>
										</span>
									</p>
									
									<h2>
										Grand Total <span> &#x20B9; ${row.Price - coupon}.00
										</span>
									</h2>
								</div>
								<div class="cart-summary-button">
								
								<form action="checkout.jsp" method="post">
									<c:set scope="session" value="${row.Price - coupon}" var="pprice"></c:set>
									<c:set scope="session" value="${coupon}" var="dcoupon"></c:set>
									<button type="submit" class="checkout-btn">Checkout</button>
								</form>	
								</div>
							</div>
							
							</c:forEach>
							
						</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
