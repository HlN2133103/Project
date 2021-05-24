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


@WebServlet("/UpdateProducts")
public class UpdateProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String query = "update products set  Productname = ?,Brand = ?,MRP_Price = ?,C_Price = ?,S_Price = ?,Quantity = ?,Weight = ?, Status = ?, Margin = ?, description = ? where Id = ?";
		
		int Id = Integer.parseInt(request.getParameter("ids"));
		System.out.println(Id);
		String pname = request.getParameter("pname");
		String brand = request.getParameter("brand");
		String mrp = request.getParameter("mrp_price");
		String cp = request.getParameter("c_price");
		String sp = request.getParameter("s_price");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		String weight = request.getParameter("weight");
		String description = request.getParameter("description");
		int m1 = Integer.parseInt(mrp)-Integer.parseInt(sp);
		int m2 = m1*100;
		int margin = m2/Integer.parseInt(mrp);
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","pass@123");
			PreparedStatement statement=con.prepareStatement(query);
			
			statement.setString(1, pname);
			statement.setString(2, brand);
			statement.setString(3, mrp);
			statement.setString(4, cp);
			statement.setString(5, sp);
			statement.setInt(6, quantity);
			statement.setString(7, weight);
			if(quantity > 0)
			{
			statement.setString(8,"Available");
			}
			else
			{
				statement.setString(8,"Not Available");
			}
			statement.setInt(9, margin);
			statement.setString(10, description);
			statement.setInt(11, Id);
			statement.executeUpdate();
			
			response.sendRedirect("Admin/product_page.jsp");
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

}
