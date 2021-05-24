<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.Sample.Project.Password"%>
<html>
<body>
	<%
		session.getAttribute("Username");
	%>
	<sql:setDataSource driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/project" user="root" password="pass@123"
		var="con" />

	<sql:query var="rs" dataSource="${con}">
					   		select * from user where Username = ?
					   		<sql:param>${Username}</sql:param>
	</sql:query>

	<sql:query var="rs1" dataSource="${con}">
					   		select * from ordertable where Username = ?
					   		<sql:param>${Username}</sql:param>
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
							<li class="active">My Account</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="my-account-section section position-relative mb-50 fix">
		<div class="container">
			<div class="row">
				<div class="col-12">

					<div class="row">

						<!-- My Account Tab Menu Start -->
						<div class="col-lg-3 col-12">
							<div class="myaccount-tab-menu nav" role="tablist">

								<a href="#orders" data-toggle="tab"><i
									class="fa fa-cart-arrow-down"></i> Orders</a> <a
									href="#address-edit" data-toggle="tab"><i
									class="fa fa-map-marker"></i> address</a> <a href="#account-info"
									data-toggle="tab"><i class="fa fa-user"></i> Account
									Details</a> <a href="Logout.jsp"><i class="fa fa-sign-out"></i>
									Logout</a>
							</div>
						</div>

						<div class="col-lg-9 col-12">
							<div class="tab-content" id="myaccountContent">
								<!-- Single Tab Content Start -->
								<c:forEach items="${rs.rows}" var="row">
									<div class="tab-pane fade show active" id="dashboad"
										role="tabpanel">
										<div class="myaccount-content">
											<h3>Dashboard</h3>

											<div class="welcome">
												<p>
													Hello, <strong>${row.Name}</strong>
												</p>
											</div>

											<p class="mb-0">From your account dashboard. you can
												easily check &amp; view your recent orders, manage your
												shipping and billing addresses and edit your password and
												account details.</p>
										</div>
									</div>
								</c:forEach>


								

									<div class="tab-pane fade" id="orders" role="tabpanel">
										<div class="myaccount-content">
											<h3>My Orders</h3>

											<div class="myaccount-table table-responsive text-center">
												<table class="table table-bordered">
													<thead class="thead-light">
														<tr>
															<th>OrderId</th>
															<th>Name</th>
															<th>Date</th>
															<th>Payment Method</th>
															<th>Status</th>
															<th>Refund Status</th>
															<th>Total</th>
															<th>Action</th>
														</tr>
													</thead>

													<tbody>
													<c:forEach items="${rs1.rows}" var="row">
														<tr>
															<td>${row.OrderId}</td>
															<td>${row.Name}</td>
															<td>${row.Orderdate}</td>
															<td>${row.Paymentmethod}</td>
															<td>${row.Status}</td>
															<c:if test="${row.RefundStatus.equals('Refunded')}">
															<td>${row.RefundStatus}</td>
															</c:if>
															<c:if test="${row.RefundStatus == null}">
															<td>none</td>
															</c:if>
															<td>${row.TotalAmount}</td>
															<td><c:if test="${row.Status.equals('Pending')}">
																	<a href="cancel_order_form.jsp?Orderid=${row.OrderId}"
																		class="btn btn-danger"> Cancel </a>
																</c:if> 
																
																<c:if test="${row.Status.equals('Accepted')}">
																	<a href="cancel_order_form.jsp?Orderid=${row.OrderId}"
																		class="btn btn-danger"> Cancel </a>
																</c:if> 
																<c:if
																
																	test="${row.Status.equals('Prepare for Dispatch')}">
																	<a href="cancel_order_form.jsp?Orderid=${row.OrderId}"
																		class="btn btn-danger"> Cancel </a>
																</c:if> 
																
																<c:if test="${row.Status.equals('Dispatched')}">
																	<a href="cancel_order_form.jsp?Orderid=${row.OrderId}"
																		class="btn btn-danger"> Cancel </a>
																</c:if>
																
																<c:if test="${row.PaymentStatus.equals('Credit') && row.Status.equals('Cancelled')}">
																	<c:if test="${row.RefundStatus == null}">
																	<a href="RefundPayment?PaymentId=${row.PaymentId}&Amount=${row.TotalAmount}&orderid=${row.OrderId}"
																		class="btn btn-warning">Refund</a>
																		</c:if>
																</c:if>
																</td>
														</tr>
															</c:forEach>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								

								<c:forEach items="${rs.rows}" var="row">
									<div class="tab-pane fade" id="address-edit" role="tabpanel">
										<div class="myaccount-content">
											<h3>Billing Address</h3>

											<address>
												<p>
													<strong>${row.Name}</strong>
												</p>
												<p>${row.Address}</p>
												<p>Mobile: ${row.Phone_no}</p>
											</address>

											<a href="#" class="btn d-inline-block edit-address-btn"><i
												class="fa fa-edit"></i>Edit Address</a>
										</div>
									</div>
								</c:forEach>

								<c:forEach items="${rs.rows}" var="row">
									<div class="tab-pane fade" id="account-info" role="tabpanel">
										<div class="myaccount-content">
											<h3>Account Details</h3>

											<div class="account-details-form">
												<form action="#">
													<div class="row">
														<div class="col-lg-6 col-12 mb-30">
															<label>Name</label> <input name="name" placeholder="Name"
																type="text" value="${row.Name}">
														</div>

														<div class="col-lg-6 col-12 mb-30">
															<label>Username</label> <input name="username"
																placeholder="username" type="text"
																value="${row.Username}">
														</div>

														<div class="col-lg-6 col-12 mb-30">
															<label>Email</label> <input name="email"
																placeholder="Email Address" type="email"
																value="${row.Email}">
														</div>

														<div class="col-lg-6 col-12 mb-30">
															<label>Phone</label> <input name="phone"
																placeholder="Phone no" type="text"
																value="${row.Phone_no}">
														</div>

														<div class="col-12 mb-30">
															<label>Company</label> <input name="company-name"
																placeholder="Company Name" type="text"
																value="${row.Company_name}">
														</div>

														<div class="col-12">
															<button class="save-change-btn">Save Changes</button>
														</div>

													</div>
												</form>
											</div>
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

	<jsp:include page="inc/footer.jsp"></jsp:include></body>
</html>