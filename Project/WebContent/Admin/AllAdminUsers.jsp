<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>All Users</title>
  </head>
  <body>

  <sql:setDataSource driver="com.mysql.jdbc.Driver"
					   url="jdbc:mysql://localhost:3306/project"
					   user="root"
					   password="pass@123"
					   var="con"/>
					   
  <sql:query var="rs" dataSource="${con}">
		select * from adminuser 
	</sql:query>
	
  <jsp:include page="inc/head.jsp"></jsp:include>

       <div id="main-wrapper">
         <jsp:include page="inc/header.jsp"></jsp:include>
   <jsp:include page="inc/sidebar.jsp"></jsp:include>
            <div class="content-body">
                <div class="container-fluid">


                    <div class="row">
                        <div class="col-12">
                            <h3 class="content-heading">Users</h3>
                        </div>
                        <div class="col-12">
                            <div class="card-footer d-flex justify-content-between align-items-center">
                                <div class="vertical-card__menu--location">
                                    <div class="d-block">
                                        All Users
                                    </div>
                                </div>
                            </div>
                             <div class="card-body">
                                    <div class="table-responsive">
                                        <table id="example" class="display" style="min-width: 845px">
                                            <thead>
                                                <tr>
                                   
                                                    <th>User</th>
                                                    <th>Phone</th>
                                                    <th>Email</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${rs.rows}" var="row">  
                                                    <tr>
                                                        <td>${row.Username}</td>
                                                        <td>${row.Phone_no}</td>
                                                        <td>${row.Email}</td>
                                                    <td><span><a href="" class="mr-4" data-toggle="tooltip" data-placement="top" title="" data-original-title="Edit"><i class="fa fa-pencil color-muted"></i> </a><i class="fa fa-close color-danger"></i></span>
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
