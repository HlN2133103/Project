<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<body>

	<sql:setDataSource driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/project" user="root" password="pass@123"
		var="con" />

	<sql:query var="rs" dataSource="${con}">
		select * from products where Id = ?
		<sql:param>
			<%= request.getParameter("Id")%>
		</sql:param>
	</sql:query>


	<div id="main-wrapper">
		<jsp:include page="inc/head.jsp"></jsp:include>
		<jsp:include page="inc/header.jsp"></jsp:include>
		<jsp:include page="inc/sidebar.jsp"></jsp:include>

		<div class="content-body">


			<div class="container-fluid">


				<div class="row">
					<div class="col-12">
						<h3 class="content-heading">Update Product</h3>
					</div>
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">
								<div class="form-validation">
									<c:forEach items="${rs.rows}" var="row">
										<form class="form-valide" action="../UpdateProducts"
											method="post">
											<div class="row">
												<div class="col-xl-12">
													<div class="form-group">
														<label>Product Name</label> <input type="text"
															class="form-control" name="pname"
															value="${row.Productname}" required>
													</div>
												</div>

												<div class="col-xl-12">
													<div class="form-group">
														<label>Brand</label> <input type="text"
															class="form-control" name="brand" value="${row.Brand}"
															required>
													</div>
												</div>
												<div class="col-xl-4">
													<div class="form-group">
														<label>MRP Price</label> <input type="text"
															class="form-control" name="mrp_price"
															value="${row.MRP_Price}" required>
													</div>
												</div>
												<div class="col-xl-4">
													<div class="form-group">
														<label>Cost Price</label> <input type="text"
															class="form-control" name="c_price"
															value="${row.C_Price}" required>
													</div>
												</div>
												<div class="col-xl-4">
													<div class="form-group">
														<label>Selling Price</label> <input type="text"
															class="form-control" name="s_price"
															value="${row.S_Price}" required>
													</div>
												</div>
												<!--<div class="col-xl-12">
                                      <div class="form-group">
                                          <label>Image</label>
                                          <input type="file" class="form-control" name="f_image" required>
                                      </div>
                                  </div>-->
												<div class="col-xl-4">
													<div class="form-group">
														<label>Quantity</label> <input type="number"
															class="form-control" name="quantity"
															value="${row.Quantity}" required>
													</div>
												</div>
												<div class="col-xl-4">
													<div class="form-group">
														<label>Weight</label> <input type="text"
															class="form-control" name="weight" value="${row.Weight}"
															required>
													</div>
												</div>
												<div class="col-xl-4">
													<div class="form-group">
														<label>Margin</label> <input type="text"
															class="form-control" name="margin"
															value="${row.Margin}  %" disabled="disabled">
													</div>
												</div>

												<div class="col-xl-12">
													<div class="form-group">
														<label>Description</label>
														<textarea class="form-control" name="description" cols=""
															rows="">${row.description}</textarea>
													</div>
												</div>
												<div class="col-xl-4">
													<input type="number" class="form-control" name="ids"
														value="${row.Id}" hidden>
												</div>
												<div class="col-xl-4">
													<div class="form-group">
														<button type="submit" class="btn btn-warning">Update
															Product</button>
													</div>
												</div>

											</div>
										</form>
									</c:forEach>
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