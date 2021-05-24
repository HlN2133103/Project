<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<body>
	<div id="main-wrapper">
		<jsp:include page="inc/head.jsp"></jsp:include>
		<jsp:include page="inc/header.jsp"></jsp:include>
		<jsp:include page="inc/sidebar.jsp"></jsp:include>

		<div class="content-body">


			<div class="container-fluid">


				<div class="row">
					<div class="col-12">
						<h3 class="content-heading">Add User</h3>
					</div>
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">
								<div class="form-validation">
		
										<form class="form-valide" action="../AddadminUsers"
											method="post">
											<div class="row">
												<div class="col-xl-12">
													<div class="form-group">
														<label>Name</label> <input type="text"
															class="form-control" name="name"
															required>
													</div>
												</div>

												<div class="col-xl-12">
													<div class="form-group">
														<label>Email</label> <input type="email"
															class="form-control" name="email" 															required>
													</div>
												</div>
												<div class="col-xl-4">
													<div class="form-group">
														<label>Phone</label> <input type="number"
															class="form-control" name="phone"
															 required>
													</div>
												</div>
												<div class="col-xl-4">
													<div class="form-group">
														<label>Username</label> <input type="text"
															class="form-control" name="username"
															required>
													</div>
												</div>
												<div class="col-xl-4">
													<div class="form-group">
														<label>Password</label> <input type="password"
															class="form-control" name="password"
															 required>
													</div>
												</div>
												<div class="col-xl-4">
													<div class="form-group">
														<button type="submit" class="btn btn-success">Add User
															</button>
													</div>
												</div>

											</div>
										</form>
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