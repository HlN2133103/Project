<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page language="java"  import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
try
{
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
	String username = request.getParameter("Username");
	String query = "update User set CurrentStatus = 'Activated' where Username = ?";
	PreparedStatement statement=con.prepareStatement(query);
	
	statement.setString(1, username);
	statement.executeUpdate();	
	
	response.sendRedirect("ActivateUser.jsp");
}
catch(Exception e)
{
	System.out.println(e);
}
	
	
%>
       
       
</body>
</html>