<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<body>
	<sql:setDataSource driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/project" user="root" password="pass@123"
		var="con" />

	<sql:query var="rs" dataSource="${con}">
		select * from coupons
	</sql:query>
	<div id="preloader">
		<div class="loader"></div>
	</div>

	<div id="main-wrapper">
		<jsp:include page="inc/head.jsp"></jsp:include>
		<jsp:include page="inc/header.jsp"></jsp:include>
		<jsp:include page="inc/sidebar.jsp"></jsp:include>
		<div class="content-body">


			<div class="container-fluid">


				<div class="row">
					<div class="col-12">
						<h3 class="content-heading">Coupons</h3>
					</div>
					<div class="col-12">
						<div
							class="card-footer d-flex justify-content-between align-items-center">
							<div class="vertical-card__menu--location">
								<div class="d-block">All Coupons</div>
							</div>
							<div class="vertical-card__menu--button">
								<a href="add_coupons.jsp"><button
										class="btn btn-primary add_btn" data-id="109">Add
										Coupons</button></a>
							</div>
						</div>
						<div class="card">
							<div class="card-body">
								<div class="table-responsive">
									<table id="example" class="display" style="min-width: 845px">
										<thead>
											<tr>
												<th>Name</th>
												<th>Code</th>
												<th>Amount</th>
												<th>Status</th>
												<th>Created Date</th>
												<th>Action</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${rs.rows}" var="row">
												<tr>
													<td>${row.name}</td>
													<td>${row.code}</td>
													<td>${row.amt}</td>
													<td><c:if test="${row.status == 'Active'}">
															<span style='color: green'>Active</span>
														</c:if> <c:if test="${row.status == 'Deactivate'}">
															<span style='color: red'>Deactivate</span>
														</c:if></td>
													<td>${row.created_at}</td>
													<td><span><a
															href="edit_coupons.jsp?id=${row.id}"
															class="mr-4" data-toggle="tooltip" data-placement="top"
															title="" data-original-title="Edit"><i
																class="fa fa-pencil color-muted"></i> </a><i
															class="fa fa-close color-danger"></i></span></td>
												</tr>
											</c:forEach>

										</tbody>

									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="footer">
			<div class="copyright">
				<p>
					All rights reserved. &copy; 2020 <a target="_blank" href=""></a>
				</p>
			</div>
		</div>


	</div>
	<jsp:include page="inc/footer.jsp"></jsp:include>
</body>
</html>