<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	session.getAttribute("u");
%>
<header>
	<div class="header-bottom header-bottom-one header-sticky">
		<div class="container">
			<div class="row">
				<div
					class="col-md-3 col-sm-12 col-xs-12 text-lg-left text-md-center text-sm-center">
					<!-- logo -->
					<div class="logo mt-15 mb-15">
						<a href="index.php"> <img src="assets/images/logo.png"
							class="img-fluid" style="width: 152px; margin-top: 10px;" alt="">
						</a>
					</div>
					<!-- end of logo -->
				</div>
				<div class="col-md-9 col-sm-12 col-xs-12">
					<div
						class="menubar-top d-flex justify-content-between align-items-center flex-sm-wrap flex-md-wrap flex-lg-nowrap mt-sm-15">
						<!-- header phone number -->
						<div class="header-contact d-flex">
							<div class="phone-icon">
								<img src="assets/images/icon-phone.png" class="img-fluid" alt="">
							</div>
							<div class="phone-number">
								Phone: <span class="number">+91 1111111111</span>
							</div>
						</div>
						<!-- end of header phone number -->
						<!-- search bar -->
						<div class="header-advance-search">
							<form action="shop.php" method="GET">
								<input type="text" name="p_name"
									placeholder="Search your product" required>
								<button>
									<span class="icon_search"></span>
								</button>
							</form>
						</div>

						<!-- end of search bar -->
						<!-- shopping cart -->
						<div class="shopping-cart" id="shopping-cart">
								<div class="cart-icon d-inline-block">
									<a href="Cart.jsp"><span class="icon_bag_alt"></span><span
										class="badge badge-danger" style="font-size: 12px;">
											
									</span></a>
								</div>
								<div class="cart-info d-inline-block">
									<p>
										<c:if test="${u.username==null}">
											<a href="Login.jsp"><h4>Login</h4></a>
										</c:if>
										<c:if test="${u.username!=null}">
											<div class="dropdown">
												<a class="mb-0" data-toggle="dropdown"> <c:out
														value="${u.name}"></c:out>
												</a>
												<div class="dropdown-menu">
													<li><a class="dropdown-item mb-0"
														href="my_account.jsp"><p>My account</p></a></li>
													<li><a class="dropdown-item mb-0" href="Logout.jsp"><p>Logout</p></a></li>
												</div>
											</div>
										</c:if>

									</p>
								</div>
							</a>
							<!-- end of shopping cart -->
						</div>
					</div>

					<!-- navigation section -->
					<div class="main-menu">
						<nav>
							<ul>
								<li><a href="index.jsp">Home</a></li>
								<li><a href="Products.jsp">Products</a></li>
								<li><a href="contact.jsp">Contact</a></li>
								<c:if test="${u.username!=null}">
									<li><a href="Cart.jsp">Cart</a></li>
								</c:if>

								<!-- <li><a href="checkout.php">CheckOut</a></li> -->
							</ul>
						</nav>
					</div>
				</div>
				<div class="col-12">
					<!-- Mobile Menu -->
					<div class="mobile-menu d-block d-lg-none"></div>
				</div>
			</div>
		</div>
	</div>
</header>