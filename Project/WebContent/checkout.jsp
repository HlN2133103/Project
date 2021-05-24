<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.sql.*"%>
<body>
	<%
		session.getAttribute("Username");
	%>
	<sql:setDataSource driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/project" user="root" password="pass@123"
		var="con" />

	<sql:query var="rs" dataSource="${con}">
		select * from cartitems where Username=?
		<sql:param>${Username}</sql:param>
	</sql:query>

	<sql:query var="rs1" dataSource="${con}">
		select * from coupons where status = "Active"
	</sql:query>
	<jsp:include page="inc/head.jsp"></jsp:include>
	<jsp:include page="inc/header.jsp"></jsp:include>
	<div class="breadcrumb-area mb-50">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="breadcrumb-container">
						<ul>
							<li><a href="index.jsp"><i class="fa fa-home"></i> Home</a></li>
							<li class="active">Checkout</li>
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

					<!-- Checkout Form s-->
					<form action="Payment" class="checkout-form" method="GET">
						<div class="row row-40">

							<div class="col-lg-7 mb-20">

								<!-- Billing Address -->
								<div id="billing-form" class="mb-40">
									<h4 class="checkout-title">Billing Address</h4>

									<div class="row">

										<div class="col-md-6 col-12 mb-20">
											<label>First Name*</label> <input type="text" name="fname"
												placeholder="First Name" required>
										</div>

										<div class="col-md-6 col-12 mb-20">
											<label>Last Name*</label> <input type="text" name="lname"
												placeholder="Last Name" required>
										</div>

										<div class="col-md-6 col-12 mb-20">
											<label>Email Address*</label> <input type="email"
												name="email" placeholder="Email Address" required>
										</div>

										<div class="col-md-6 col-12 mb-20">
											<label>Phone no*</label> <input type="text" name="phone"
												placeholder="Phone number" required>
										</div>

										<div class="col-md-12 col-12 mb-20">
											<label>Company Name</label> <input type="text" name="cname"
												placeholder="Company Name">
										</div>


										<div class="col-12 mb-20">
											<label>Address*</label> <input type="text" name="address1"
												placeholder="Address line 1" required> <input
												type="text" name="address2" placeholder="Address line 2">
										</div>


										<div class="col-md-6 col-12 mb-20">
											<label>Town/City*</label> <input type="text" name="city"
												placeholder="Town/City" required>
										</div>

										<div class="col-md-6 col-12 mb-20">
											<label>State*</label> <input type="text" name="state"
												placeholder="State" required>
										</div>
										<div class="col-md-6 col-12 mb-20">
											<label>Pin*</label> <input type="text" name="pincode"
												placeholder="Pincode" required>
										</div>
										<div class="col-md-12 col-12 mb-20">
											<label>Add instructions(optional)</label>
											<textarea type="text" class="checkout-form" name="note"
												placeholder="Write here..." style="width: 95%" cols=""
												rows=""></textarea>
										</div>

									</div>

								</div>
							</div>

							<div class="col-lg-5">
								<div class="row">
								
									<div class="col-12 mb-60">

										<h4 class="checkout-title">Cart Total</h4>

										<div class="checkout-cart-total">

											<h4>
												Product <span>Total</span>
											</h4>

											<ul>

												<li><c:forEach items="${rs.rows}" var="row">
												 	${row.Productname} 
												   
												   x
												     <span> &#x20B9; ${row.Price * row.Quantity}.00 </span>
												   ${row.Quantity} <br>
													</c:forEach></li>

											</ul>


											<p>
												Sub Total <span> &#x20B9; <c:out value="${pprice}.00"></c:out>
												</span>
											</p>
											<p id='dis_price'>
												Discount <span>&#x20B9; <c:out value="${dcoupon}.00"></c:out></span>
											</p>

											<h4 id="g_total">
												Grand Total <span> &#x20B9; <c:out
														value="${pprice}.00"></c:out>
												</span>
											</h4>
											<input type="hidden" name="tprice" id="total_price"
												value="<c:out value="${pprice}.00"></c:out>">
										</div>
					<br>
									<!-- Payment Method -->
									<div class="col-12">

										<h4 class="checkout-title">Payment Method</h4>

										<div class="checkout-payment-method">

											<div class="single-method">
												<input type="radio" id="cash" name="pmethod"
													value="Cash on Delivery" required="required"> <label
													for="cash">Cash on Delivery</label> <br> <input
													type="radio" id="online" name="pmethod" value="Paid Online"
													required="required"> <label for="online">Pay
													Online</label>
											</div>

											<div class="single-method">
												<input type="checkbox" id="accept_terms" required> <label
													for="accept_terms">I have read and accept the terms
													& conditions</label>
											</div>

										</div>
										<input type="text" value="<c:out value="${pprice}"></c:out>"
											id="tprice" name="tprice" hidden>
										<button type="submit" class="place-order" id="accept_terms_s">Place
											order</button>
									</div>

								</div>
							</div>

						</div>
					</form>

				</div>
			</div>
		</div>
	</div>
	<jsp:include page="inc/footer.jsp"></jsp:include>
	<script type="text/javascript">
		$('#accept_terms_s').click(function() {
			if (!$('#accept_terms').is(':checked'))
				alert('Place accept terms and conditions');
		});
	</script>
</body>