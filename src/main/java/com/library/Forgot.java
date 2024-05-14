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

@WebServlet("/Forgot")
public class Forgot extends HttpServlet {

	private static final long serialVersionUID = 1L;

	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	        PrintWriter out = response.getWriter();

	        String id1 = request.getParameter("t1");
	        int id = Integer.parseInt(id1);
	        String givenEmail = request.getParameter("t2");
	        String givenPass = request.getParameter("t3");

	        try {
	            Class.forName("com.mysql.jdbc.Driver");
	            Connection con = DriverManager.getConnection(
	                    "jdbc:mysql://localhost:3306/library", "root", "Admin@123");
	            
	            PreparedStatement pstm = con.prepareStatement("SELECT AdminEmail FROM Admin WHERE AdminId=?");
	            pstm.setInt(1, id);
	            ResultSet rs = pstm.executeQuery();
	            int flag =0;
	            
	            if (rs.next()) {
	                String email = rs.getString("AdminEmail");
	                
	                if (givenEmail.equals(email)) {
	                	
	                	flag = 1;
	                }
	                else {
	                    response.setContentType("text/html");
	                    out.print("<h3 style='color: #bf0303cf;margin-top: 400px;position: fixed;text-align: center;'>Credential mismatch. Please enter correct credentials.</h3>");
	                    RequestDispatcher rd = request.getRequestDispatcher("/ForgetPassword.html");
	                    rd.include(request, response);
	                }
	            } else {
	                response.setContentType("text/html");
	                out.print("<h3 style='color: #bf0303cf;margin-top: 400px;position: fixed;text-align: center;'>Admin ID Not Found.</h3>");
	                RequestDispatcher rd = request.getRequestDispatcher("/ForgetPassword.html");
	                rd.include(request, response);
	            }
	            
	            if(flag == 1) {
                	PreparedStatement pstm1 = con.prepareStatement("UPDATE Admin SET Password = ? WHERE AdminId = ?");
                	pstm1.setString(1, givenPass);
    	            pstm1.setInt(2, id);
    	            pstm1.executeUpdate();
                    
    	            response.setContentType("text/html");
	                out.print("<h3 style='color: #bf0303cf;margin-top: 400px;position: fixed;text-align: center;'>Your Password has changed now! Please Login.</h3>");
	                RequestDispatcher rd = request.getRequestDispatcher("/AdminLogin.html");
	                rd.include(request, response);
    	            
                }

	            con.close();
	        } catch (Exception e) {
	            System.out.println(e);
	        }
	    }
}
