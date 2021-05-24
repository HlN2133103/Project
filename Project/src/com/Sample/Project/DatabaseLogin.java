package com.Sample.Project;

import java.io.IOException;
import org.mindrot.jbcrypt.BCrypt;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name="DatabaseLogin", urlPatterns = "/DatabaseLogin")

public class DatabaseLogin extends HttpServlet
{ 
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		Password p = new Password();
		String username = req.getParameter("user");
		String email = req.getParameter("user");
		String password = req.getParameter("pass");
	
		PrintWriter out= resp.getWriter();
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","pass@123");
			PreparedStatement statement = connect.prepareStatement("select * from user where Username=? OR Email=?");
			statement.setString(1, username);
			statement.setString(2, email);
			ResultSet result =statement.executeQuery();
			
			HttpSession session=req.getSession();
			if(result.next())
			{	
				session.setAttribute("Name",result.getString("Name"));
				session.setAttribute("Username",result.getString("Username"));
				session.setAttribute("Email",result.getString("Email"));
				session.setAttribute("Company_name",result.getString("Company_name"));
				session.setAttribute("Phone_no",result.getString("Phone_no"));
				session.setAttribute("Status",result.getString("Status"));
				session.setAttribute("CurrentStatus",result.getString("CurrentStatus"));
				
				String status = session.getAttribute("Status").toString();
				String currentstatus = session.getAttribute("CurrentStatus").toString();
				
				if(currentstatus.equals("Not-Activated") && p.checkPassword(password, result.getString("Password")))
				{
					out.println("<script>alert('User Account Not Activated');</script>");
					session.invalidate();
					resp.sendRedirect("Login.jsp");
				}
				
//				else if(status.equals("Admin") && p.checkPassword(password, result.getString("Password"))) 
//				{
//					out.println("<script>alert('Welcome "+username+"');</script>");
//					resp.sendRedirect("Admin/Adminindex.jsp");
//				}
				else if(status.equals("User") && p.checkPassword(password, result.getString("Password")))
				{
					out.println("<script>alert('Welcome "+username+"');</script>");
					resp.sendRedirect("index.jsp");
				}
				else
				{
					out.println("<script>alert('Invlaid login Credentials');</script>");
					resp.sendRedirect("Login.jsp");
				}
			}
			else
			{
				out.println("<script>alert('Invlaid login Credentials');</script>");
				resp.sendRedirect("Login.jsp");
			}
		} 
		 catch (Exception e) 
		{
			 System.out.println(e);
		}
	}
}
