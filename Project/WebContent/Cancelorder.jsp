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
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","pass@123");
	String orderid = request.getParameter("Orderid");
	out.println(orderid);
	System.out.println(orderid);
	String query = "update ordertable set Status = 'Cancelled' where OrderId = ?";
	String query1 = "delete from orders where OrderId = ?";
	PreparedStatement statement=con.prepareStatement(query);
	statement.setString(1, orderid);
	statement.executeUpdate();	
	
	PreparedStatement statement1=con.prepareStatement(query1);
	statement1.setString(1, orderid);
	statement1.executeUpdate();	
	response.sendRedirect("my_account.jsp");
}
catch(Exception e)
{
	System.out.println(e);
}
%>
</body>
</html>