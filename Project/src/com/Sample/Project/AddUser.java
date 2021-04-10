package com.Sample.Project;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(name="AddUser", urlPatterns = "/AddUser")
@MultipartConfig(maxFileSize = 9999999999L)
public class AddUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String query = "insert into user values(?,?,?,?,?,?,?,?,?,?,?,?)";
		String name = request.getParameter("name");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String cpassword = request.getParameter("cpassword");
		String Phone = request.getParameter("phone");
		String Email = request.getParameter("email");
		String C_name = request.getParameter("c_name");
	    String L_type = request.getParameter("l_type");
		String Address = request.getParameter("address");
		String Status = "User";
		String CurrentStatus = "Not-Activated";
		
		Part part=request.getPart("l_image");
		Part part1=request.getPart("shop_image");
			
		InputStream is = part.getInputStream();
		
		InputStream is1 = part1.getInputStream();
		
		try
		{
			if(cpassword.equals(password))
			{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
				PreparedStatement statement=con.prepareStatement(query);
				statement.setString(1, name);
				statement.setString(2, username);
				statement.setString(3, password);
				statement.setString(4, Phone);
				statement.setString(5, Email);
				statement.setString(6, C_name);
				statement.setBinaryStream(7, is);
				statement.setString(8, L_type);
				statement.setString(9, Address);
				statement.setBinaryStream(10, is1);
				statement.setString(11, Status);
				statement.setString(12, CurrentStatus);
				statement.executeUpdate();
				
				response.sendRedirect("Login.jsp");
			}
			else
			{
				response.sendRedirect("Register.jsp");
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

}
