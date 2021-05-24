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

@WebServlet("/AddProducts")
@MultipartConfig(maxFileSize = 9999999999L)
public class AddProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		String query = "insert into products(Productname,Brand,MRP_Price,C_Price,S_Price,F_Image,Quantity,Weight,Status,Margin,description) values(?,?,?,?,?,?,?,?,?,?,?)";
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
		
		
		Part part=request.getPart("f_image");
		
		InputStream is = part.getInputStream();
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
			statement.setBinaryStream(6, is);
			statement.setInt(7, quantity);
			statement.setString(8, weight);
			if(quantity > 0)
			{
			statement.setString(9,"Available");
			}
			else
			{
				statement.setString(9,"Not Available");
			}
			statement.setInt(10, margin);
			statement.setString(11, description);
			statement.executeUpdate();
			
			response.sendRedirect("Admin/product_page.jsp");
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

}
