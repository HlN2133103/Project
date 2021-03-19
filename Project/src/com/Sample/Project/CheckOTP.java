package com.Sample.Project;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CheckOTP")
public class CheckOTP extends HttpServlet 
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		int userotp=Integer.parseInt(req.getParameter("otp"));//entered by user
		
		HttpSession hs=req.getSession();
		int yourotp=(Integer)hs.getAttribute("randomnumber");//your otp saved in session
		
		PrintWriter out=resp.getWriter();
		if(userotp==yourotp)
		{
			out.println(""
					+ "<script>"
					+ "alert('Correct OTP');"
					+ "window.location='ChangePassword.jsp';"
					+ "</script>");
		}
		else
		{
			out.println(""
					+ "<script>"
					+ "alert('InCorrect OTP');"
					+ "window.location='CollectOTP.jsp';"
					+ "</script>");
		}
				
	}
}
