<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/owl.css">

  </head>
<body>

  <!-- Header -->
  <%
  		session.getAttribute("u");
  %>
           
    <header class="">
        <nav class="navbar navbar-expand-lg">
          <div class="container-fluid">
            <a class="navbar-brand" href="index.jsp"><h2>Store<em> Website</em></h2></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
              <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                  <a class="nav-link" href="index.jsp">Home
                    <span class="sr-only">(current)</span>
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="Cart.jsp">Cart</a>
                </li>

                <li class="nav-item">
                  <a class="nav-link" href="Products.jsp">Products</a>
                </li>
                <li class="nav-item">
                      <a class="nav-link" href="about.asp">About Us</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="contact.asp">Contact Us</a>
                </li>
				
				<c:if test="${u.username==null}">
                <li class="nav-item">
                  <a class="nav-link" href="Option.jsp">Signin/SignUp</a>
                </li>
				</c:if>
				
				 <c:if test="${u.username!=null}">
                <li class="nav-item">
                  <div class="dropdown">
                        <a class="nav-link" data-toggle="dropdown">
                        	<c:out value="${u.getCompany()}"></c:out>
                        </a>
                        <div class="dropdown-menu">
                          <a class="dropdown-item" href="#" style="font-size:20px;">Profile</a>
                           <a class="dropdown-item" href="Logout.jsp" style="font-size:20px;">
                            Log-Out</a>
                        </div>
                      </div>
                 </li>
                 </c:if>	
              </ul>
            </div>
          </div>
        </nav>
      </header>
</body>
</html>