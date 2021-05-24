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
import javax.servlet.http.HttpSession;

@WebServlet("/RemoveFromCart")
public class RemoveFromCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		int Id  = Integer.parseInt(request.getParameter("Id"));
		String username = session.getAttribute("Username").toString();
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","pass@123");
			
			PreparedStatement statement = con.prepareStatement("DELETE FROM cartitems where Id = ? AND Username = ?");
			statement.setInt(1, Id);
			statement.setString(2, username);
			statement.executeUpdate();
			response.sendRedirect("Cart.jsp");
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

}
