<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Contact Form</title>
  </head>
  <body>

  <sql:setDataSource driver="com.mysql.jdbc.Driver"
					   url="jdbc:mysql://localhost:3306/project"
					   user="root"
					   password="pass@123"
					   var="con"/>
					   
  <sql:query var="rs" dataSource="${con}">
		select * from contacts
	</sql:query>
	
  <jsp:include page="inc/head.jsp"></jsp:include>

       <div id="main-wrapper">
         <jsp:include page="inc/header.jsp"></jsp:include>
   <jsp:include page="inc/sidebar.jsp"></jsp:include>
            <div class="content-body">
                <div class="container-fluid">


                    <div class="row">
                        <div class="col-12">
                            <h3 class="content-heading">Contacts</h3>
                        </div>
                        <div class="col-12">
                            <div class="card-footer d-flex justify-content-between align-items-center">
                                <div class="vertical-card__menu--location">
                                    <div class="d-block">
                                        Contacts Form
                                    </div>
                                </div>
                            </div>
                             <div class="card-body">
                                    <div class="table-responsive">
                                        <table id="example" class="display" style="min-width: 845px">
                                            <thead>
                                                <tr>
                                                    <th>Id</th>
												<th>Name</th>
												<th>Email</th>
												<th>Subject</th>
												<th>Message</th>
												<th>Created Date</th>
												<th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${rs.rows}" var="row">  
                                                    <tr>
                                                       <td>${row.id}</td>
													<td>${row.name}</td>
													<td>${row.email}</td>
													<td>${row.subject}</td>
													<td>${row.message}</td>
													<td>${row.created_at}</td>
													<td><span><a href="mailto:${row.email}"
															class="mr-4"><button class="btn btn-success">Reply</button></a></span>
													</td>
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
   <jsp:include page="inc/footer.jsp"></jsp:include>
  </body>
</html>
