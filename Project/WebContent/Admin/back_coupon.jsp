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
	String coupon_name = request.getParameter("coupon_name");
	String code = request.getParameter("code");
	String amt = request.getParameter("amt");
	String status = request.getParameter("status");
	
	String query = "insert into coupons(name,code,amt,status) values (?,?,?,?)";
	PreparedStatement statement=con.prepareStatement(query);
	
	statement.setString(1, coupon_name);
	statement.setString(2, code);
	statement.setString(3, amt);
	statement.setString(4, status);
	statement.executeUpdate();	
	
	response.sendRedirect("coupon.jsp");
}
catch(Exception e)
{
	System.out.println(e);
}
	
%>
</body>
</html>