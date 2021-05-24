package com.Sample.Project;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.PreparedStatement;

@WebServlet("/contactUs")
public class contactUs extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String customerName = request.getParameter("customerName");
		String customerEmail = request.getParameter("customerEmail");
		String contactSubject = request.getParameter("contactSubject");
		String contactMessage = request.getParameter("contactMessage");
		String query = "insert into contacts(name,email,subject,message) values (?,?,?,?)";
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Project","root","pass@123");
			PreparedStatement statement = con.prepareStatement(query);
			statement.setString(1, customerName);
			statement.setString(2, customerEmail);
			statement.setString(3, contactSubject);
			statement.setString(4, contactMessage);
			statement.executeUpdate();
			
			Email e = new Email(customerEmail, contactSubject, 
					"Thankyou For Contacting Us\n\n"
			+contactMessage
			+"\n\n\n This is an auto-generated email.  Do not reply to this email."); 
			e.sendEmail();
			response.sendRedirect("contact.jsp");
			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

}
