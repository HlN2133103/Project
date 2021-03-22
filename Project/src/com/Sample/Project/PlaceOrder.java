package com.Sample.Project;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.time.LocalDate;
import java.time.LocalTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.DatenTimeFormatter;

@WebServlet("/PlaceOrder")
public class PlaceOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{	
			DatenTimeFormatter df = new DatenTimeFormatter();
			LocalDate DateObj  = LocalDate.now(); 
			LocalTime myObj = LocalTime.now();
			df.setDate(DateObj);
			df.setTime(myObj);
			String date = df.getDate();
			String time = df.getTime();
			
			String query = "insert into demo values(?,?)";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
			PreparedStatement statement=con.prepareStatement(query);
			statement.setString(1, date);
			statement.executeUpdate();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

}
