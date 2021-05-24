package com.Sample.Project;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Random;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.instamojo.wrapper.api.ApiContext;
import com.instamojo.wrapper.api.Instamojo;
import com.instamojo.wrapper.api.InstamojoImpl;
import com.instamojo.wrapper.model.PaymentOrder;
import com.instamojo.wrapper.model.PaymentOrderResponse;

import Model.DatenTimeFormatter;

@WebServlet("/Payment")
public class Payment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			HttpSession session =request.getSession();
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "pass@123");
			String name = request.getParameter("fname") + " " + request.getParameter("lname");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String Total = request.getParameter("tprice");
			String username = session.getAttribute("Username").toString();
		
			Random random = new Random();
			String Status = "Pending";
			String pweight = request.getParameter("pweight");
			String Orderid = "ORD000" + random.nextInt(99999);
			String Company = request.getParameter("cname");
			String Address = request.getParameter("address1") + " " + request.getParameter("address2") + " "
					+ request.getParameter("pincode");
			String placeofdelivery = request.getParameter("city") + ", " + request.getParameter("state") + ", India";
			String SoldBy = "One Stop Supply";
			String instructions = request.getParameter("note");
			String paymentMethod = request.getParameter("pmethod");
			String transaction = UUID.randomUUID().toString();
			if (instructions.equals("")) {
				instructions = "none";
			}
			DatenTimeFormatter df = new DatenTimeFormatter();
			LocalDate DateObj = LocalDate.now();
			LocalTime myObj = LocalTime.now();
			df.setDate(DateObj);
			df.setTime(myObj);
			String date = df.getDate();
			String time = df.getTime();
			String query = "insert into ordertable(OrderId,Orderdate,Ordertime,Username,Name,email,Phone,Company,TotalAmount,PaymentMethod,SoldBy,ShippingAddress,Placeofdelivery,instructions,Status) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

			PreparedStatement statement = con.prepareStatement(query);
			statement.setString(1, Orderid);
			statement.setString(2, date);
			statement.setString(3, time);
			statement.setString(4, username);
			statement.setString(5, name);
			statement.setString(6, email);
			statement.setString(7, phone);
			statement.setString(8, Company);
			statement.setString(9, Total);
			statement.setString(10, paymentMethod);
			statement.setString(11, SoldBy);
			statement.setString(12, Address);
			statement.setString(13, placeofdelivery);
			statement.setString(14, instructions);
			statement.setString(15, Status);
			statement.executeUpdate();	

			if (paymentMethod.equals("Cash on Delivery")) {
				String querys = "select * from cartitems where Username = ?";
				PreparedStatement ps =con.prepareStatement(querys);
				ps.setString(1, username);
				ResultSet rs = ps.executeQuery();
				int pid, qty;
				String pname; 
				while(rs.next())
				{
					pid = rs.getInt("ProductId");
					qty = rs.getInt("Quantity");
					pname = rs.getString("Productname");
					String query1 = "insert into orders(OrderId,ProductId,Productname,Quantity,Username) values (?,?,?,?,?)";
					PreparedStatement ps1 =con.prepareStatement(query1);
					ps1.setString(1, Orderid);
					ps1.setInt(2, pid);
					ps1.setString(3, pname);
					ps1.setInt(4, qty);
					ps1.setString(5, username);
					ps1.executeUpdate();
					
					int deductqty;
					String query2 = "select * from products where Id = ?";
					PreparedStatement ps2 =con.prepareStatement(query2);
					ps2.setInt(1, pid);
					ResultSet rs1 = ps2.executeQuery();
					while(rs1.next())
					{
						deductqty = rs1.getInt("Quantity") - qty;
				
					String query3 = "update products set Quantity = ? where Id = ?";
					PreparedStatement ps3 =con.prepareStatement(query3);
					ps3.setInt(1, deductqty);
					ps3.setInt(2, pid);
					ps3.executeUpdate();
					}
					
				}
				System.out.println(paymentMethod);
				RequestDispatcher rd = request.getRequestDispatcher("success.jsp");
				rd.forward(request, response);
			} else {
				String querys = "select * from cartitems where Username = ?";
				PreparedStatement ps =con.prepareStatement(querys);
				ps.setString(1, username);
				ResultSet rs = ps.executeQuery();
				int pid, qty;
				String pname; 
				while(rs.next())
				{
					pid = rs.getInt("ProductId");
					qty = rs.getInt("Quantity");
					pname = rs.getString("Productname");
					String query1 = "insert into orders(OrderId,ProductId,Productname,Quantity,Username) values (?,?,?,?,?)";
					PreparedStatement ps1 =con.prepareStatement(query1);
					ps1.setString(1, Orderid);
					ps1.setInt(2, pid);
					ps1.setString(3, pname);
					ps1.setInt(4, qty);
					ps1.setString(5, username);
					ps1.executeUpdate();
					
					int deductqty;
					String query2 = "select * from products where Id = ?";
					PreparedStatement ps2 =con.prepareStatement(query2);
					ps2.setInt(1, pid);
					ResultSet rs1 = ps2.executeQuery();
					while(rs1.next())
					{
						deductqty = rs1.getInt("Quantity") - qty;
				
					String query3 = "update products set Quantity = ? where Id = ?";
					PreparedStatement ps3 =con.prepareStatement(query3);
					ps3.setInt(1, deductqty);
					ps3.setInt(2, pid);
					ps3.executeUpdate();
					}
				}
				ApiContext context = ApiContext.create("test_mJD8cXosPdijPszuXGJ9U4blIq8vTra8wg3",
						"test_dgQP8AWwy8WFUo9eTzeo28IPtbOKgGCdFVmVPLCkdDPu0GwlALcD2DgEmLsHQuFoTbUj4fPWlZi7RFGJkO8RemJkTQQb2a0zZQ4lDljm5JbuBekqlfNMBS3Ao0H",
						ApiContext.Mode.TEST);
				Instamojo api = new InstamojoImpl(context);

				PaymentOrder order = new PaymentOrder();
				order.setName(name);
				order.setEmail(email);
				order.setPhone(phone);
				order.setCurrency("INR");
				order.setAmount(Double.parseDouble(Total));
				order.setDescription("Payment for " + Orderid);
				order.setTransactionId(transaction);
				order.setRedirectUrl("http://18.221.252.193:8080/Project/success.jsp");
				order.setWebhookUrl("http://18.221.252.193:8080/Project/success.jsp");
				PaymentOrderResponse paymentOrderResponse = api.createPaymentOrder(order);
				response.sendRedirect(paymentOrderResponse.getPaymentOptions().getPaymentUrl());
				session.setAttribute("Orderid", Orderid);
			
			}
		} catch (Exception e) {
			System.out.println(e);
			System.out.println(e.getMessage());

		}
	}
}
