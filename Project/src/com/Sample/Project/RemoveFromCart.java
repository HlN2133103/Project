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

import Model.User;


@WebServlet("/RemoveFromCart")
public class RemoveFromCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		int Id  = Integer.parseInt(request.getParameter("Id"));
		String username = ((User)session.getAttribute("u")).getUsername();
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
			
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
