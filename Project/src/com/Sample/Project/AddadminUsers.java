package com.Sample.Project;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/AddadminUsers")
public class AddadminUsers extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String query = "insert into adminuser values(?,?,?,?,?)";
		String name = request.getParameter("name");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String Phone = request.getParameter("phone");
		String Email = request.getParameter("email");
		try
		{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","pass@123");
				PreparedStatement statement=con.prepareStatement(query);
				statement.setString(1, name);
				statement.setString(2, username);
				statement.setString(3, password);
				statement.setString(4, Phone);
				statement.setString(5, Email);
				statement.executeUpdate();
				
				response.sendRedirect("Admin/AllAdminUsers.jsp");
				
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

}
