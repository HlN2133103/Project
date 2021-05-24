<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page language="java"  import="java.sql.*" %>
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
	session.getAttribute("Username");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","pass@123");
	String username = session.getAttribute("Username").toString();
	String query = "delete from cartitems where Username = ?";
	PreparedStatement statement=con.prepareStatement(query);
	statement.setString(1, username);
	statement.executeUpdate();	
	session.removeAttribute("Orderid");
	response.sendRedirect("index.jsp");
}
catch(Exception e)
{
	System.out.println(e);
}
%>
</body>
</html>
