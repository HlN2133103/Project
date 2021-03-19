package com.Sample.Project;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/OTP")
public class OTP extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String email=req.getParameter("email");
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Project","root","root");
			PreparedStatement ps=con.prepareStatement("select * from User where Email=?");
			ps.setString(1, email);
			ResultSet result=ps.executeQuery();
			
			PrintWriter out=resp.getWriter();
			if(result.next())
			{
				Random r=new Random();
				int randomnumber=r.nextInt(8999)+1000; 
				
				HttpSession hs=req.getSession();
				hs.setAttribute("randomnumber", randomnumber);
				hs.setAttribute("email", email);
				
				Email em=new Email(email,""
						+ "ResetPassword" ,"Hi ,"+result.getString("Company_name")
								+ "\r\n  To reset your password, "
								+ "Please Enter The Given OTP Below. "
								+ "Your changes  will update the password for Website and Any services use by your ID.	 \r\n"
								+ "Otp is: "+randomnumber);
				em.sendEmail();
				
				out.println(""
						+ "<script>"
						+ "alert('Otp have been sent to your E-Mail. Please check!!');"
						+"window.location='CollectOTP.jsp';"
						+ "</script>");
						
			}
			else
			{
				out.println(""
						+ "<script>"
						+ "alert('Email is Incorrect');"
						+ "window.location='CollectEmail.jsp';"
						+ "</script>");
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
	}
}
