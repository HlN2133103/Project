package com.Sample.Project;

import java.io.IOException;
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
import Model.User;

@WebServlet(name="DatabaseLogin", urlPatterns = "/DatabaseLogin")

public class DatabaseLogin extends HttpServlet
{ 
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		User u=new User();
		
		u.setUsername(req.getParameter("user"));
		u.setEmail(req.getParameter("user"));
		u.setPassword(req.getParameter("pass"));
		PrintWriter out= resp.getWriter();
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
			PreparedStatement statement = connect.prepareStatement("select * from user where Username=? OR Email=? and Password=?");
			statement.setString(1, u.getUsername());
			statement.setString(2, u.getEmail());
			statement.setString(3, u.getPassword());
			ResultSet result =statement.executeQuery();
			HttpSession session=req.getSession();
			if(result.next())
			{	
				u.setName(result.getString("Name"));
				u.setUsername(result.getString("Username"));
				u.setEmail(result.getString("Email"));
				u.setCompany(result.getString("Company_name"));
				u.setPhone(result.getString("Phone_no"));
				u.setStatus(result.getString("Status"));
				u.setCurrentStatus(result.getString("CurrentStatus"));
				
				session.setAttribute("u", u);
				String status = u.getStatus();
				String currentstatus = u.getCurrentStatus();
				
				if(currentstatus.equals("Not-Activated"))
				{
					out.println("<script>alert('User Account Not Activated');</script>");
					session.invalidate();
					resp.sendRedirect("Login.jsp");
				}
				
				else if(status.equals("Admin"))
				{
					out.println("<script>alert('Welcome "+u.getUsername()+"');</script>");
					resp.sendRedirect("Admin/Adminindex.jsp");
				}
				else
				{
					out.println("<script>alert('Welcome "+u.getUsername()+"');</script>");
					resp.sendRedirect("index.jsp");
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
