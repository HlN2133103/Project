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
				int randomnumber=r.nextInt(99999)+1000; 
				
				HttpSession hs=req.getSession();
				hs.setAttribute("randomnumber", randomnumber);
				hs.setAttribute("email", email);
				
				Email em=new Email(email,"Password Recovery - One Stop Supply",
						 "Dear user,\n"
						+"Here is your One Time Password(OTP) to reset your password.\n\n"
						+"Otp is: "+randomnumber
						+"\n\nDo not share your OTP with anyone.\n"
						+"\nThis is an auto-generated email.  Do not reply to this email."
						);
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
