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

import com.instamojo.wrapper.api.ApiContext;
import com.instamojo.wrapper.api.Instamojo;
import com.instamojo.wrapper.api.InstamojoImpl;
import com.instamojo.wrapper.exception.ConnectionException;
import com.instamojo.wrapper.exception.HTTPException;
import com.instamojo.wrapper.model.Refund;

@WebServlet("/RefundPayment")
public class RefundPayment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
    	
    	String refundid, refundstatus;
    	String paymentId = request.getParameter("PaymentId");
    	Double amount = Double.valueOf(request.getParameter("Amount"));
    	String orderid = request.getParameter("orderid");
    	
    	try {
    	ApiContext context = ApiContext.create("test_mJD8cXosPdijPszuXGJ9U4blIq8vTra8wg3",
				"test_dgQP8AWwy8WFUo9eTzeo28IPtbOKgGCdFVmVPLCkdDPu0GwlALcD2DgEmLsHQuFoTbUj4fPWlZi7RFGJkO8RemJkTQQb2a0zZQ4lDljm5JbuBekqlfNMBS3Ao0H",
				ApiContext.Mode.TEST);
		Instamojo api = new InstamojoImpl(context);
		
    	Refund refund = new Refund();
    	refund.setPaymentId(paymentId);
    	refund.setStatus("Refunded");
    	refund.setType("RFD");
    	refund.setBody("Refund initiated for "+orderid);
    	refund.setRefundAmount(amount);
    	refund.setTotalAmount(amount);

    	try {
    	    Refund createdRefund = api.createRefund(refund);
    	    refundid = createdRefund.getId();
    	    refundstatus = createdRefund.getStatus();
    	    System.out.println(createdRefund.getId());
    	    System.out.println(createdRefund.getStatus());
    	    
    	    
    	    String query = "update ordertable set RefundId = ?, RefundStatus = ? where OrderId = ?";

    		Class.forName("com.mysql.jdbc.Driver");
    		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "pass@123");

    		PreparedStatement statement = con.prepareStatement(query);
    		statement.setString(1, refundid);
    		statement.setString(2, refundstatus);
    		statement.setString(3, orderid);
    		statement.executeUpdate();
        	response.sendRedirect("my_account.jsp");

    	} catch (HTTPException e) {
    	    System.out.println(e.getStatusCode());
    	    System.out.println(e.getMessage());
    	    System.out.println(e.getJsonPayload());

    	} catch (ConnectionException e) {
    	    System.out.println(e.getMessage());
    	}
    	catch(Exception e)
    	{
    		 System.out.println(e.getMessage());
    	}
	}
    	catch(Exception e)
    	{
    		 System.out.println(e.getMessage());
    	}
    }
}
