package com.library;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.sql.*;

import java.io.PrintWriter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class Login extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                
        String bt = request.getParameter("b1");
    	PrintWriter out = response.getWriter();
    	if(bt.equalsIgnoreCase("Login")) {
    		
    		String id1 = request.getParameter("t1");
    		int id = Integer.parseInt(id1);
    		String givenPass = request.getParameter("t2");
    	
    			
    	try{  
    		Class.forName("com.mysql.jdbc.Driver");  
    		Connection con=DriverManager.getConnection(  
    		"jdbc:mysql://localhost:3306/library","root","Admin@123");  
    		
    		PreparedStatement pstm = con.prepareStatement("SELECT AdminName, password FROM Admin WHERE AdminId=?"); 
    		pstm.setInt(1, id);
    		ResultSet rs = pstm.executeQuery();
    		
    		if (rs.next()) {
    			String pass = rs.getString("password");
    			if(givenPass.equals(pass)) {
    				
    				out.println("<script>alert('Login Successfull..')</script>");
    				String AdminName = rs.getString("AdminName");
    				
    				HttpSession hs = request.getSession();
    				hs.setAttribute("AdminName", AdminName);
    				hs.setAttribute("AdminId", id);
    				
    				
    				RequestDispatcher rd = request.getRequestDispatcher("/AdminDashboard.jsp");
    				rd.forward(request, response);
    				
    			}else {
    				out.println("<script>alert('Login Faild. User Id or Password Mismachted.')</script>");
    				response.setContentType("text/html");
    				out.print("<h3 style='color:red>Email Id and password did not match.</h3>");
    				RequestDispatcher rd = request.getRequestDispatcher("/AdminLogin.html");
    				rd.include(request, response);
    			}
    		}else {
    			out.println("<script>alert('Admin Id Not found.')</script>");
    			response.setContentType("text/html");
				out.print("<h3 style='color:red>User Id not Found.</h3>");
				RequestDispatcher rd = request.getRequestDispatcher("/AdminLogin.html");
				rd.include(request, response);
    		}
    			
    			
    		}catch(Exception e){
    			System.out.println(e);
    	}
    	}
    	     
    	       
    	      
    }
} 