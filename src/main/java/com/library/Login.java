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

	        PrintWriter out = response.getWriter();

	        String id1 = request.getParameter("t1");
	        int id = Integer.parseInt(id1);
	        String givenPass = request.getParameter("t2");

	        try {
	            Class.forName("com.mysql.jdbc.Driver");
	            Connection con = DriverManager.getConnection(
	                    "jdbc:mysql://localhost:3306/library", "root", "Admin@123");

	            PreparedStatement pstm = con.prepareStatement("SELECT AdminName, password FROM Admin WHERE AdminId=?");
	            pstm.setInt(1, id);
	            ResultSet rs = pstm.executeQuery();

	            if (rs.next()) {
	                String pass = rs.getString("password");
	                if (givenPass.equals(pass)) {

	                    // Invalidate existing session if it exists
	                    HttpSession existingSession = request.getSession(false);
	                    if (existingSession != null) {
	                        existingSession.invalidate();
	                    }

	                    out.println("<script>alert('Login Completed.')</script>");
	                    String adminName = rs.getString("AdminName");

	                    // Create a new session
	                    HttpSession newSession = request.getSession(true);
	                    // Set session attributes
	                    newSession.setAttribute("AdminName", adminName);
	                    newSession.setAttribute("AdminId", id);

	                    RequestDispatcher rd = request.getRequestDispatcher("/AdminDashboard.jsp");
	                    rd.forward(request, response);

	                } else {
	                    response.setContentType("text/html");
	                    out.print("<h3 style='color: #bf0303cf;margin-top: 400px;position: fixed;text-align: center;'>Incorrect Password</h3>");
	                    RequestDispatcher rd = request.getRequestDispatcher("/AdminLogin.html");
	                    rd.include(request, response);
	                }
	            } else {
	                response.setContentType("text/html");
	                out.print("<h3 style='color: #bf0303cf;margin-top: 400px;position: fixed;text-align: center;'>Admin ID Not Found.</h3>");
	                RequestDispatcher rd = request.getRequestDispatcher("/AdminLogin.html");
	                rd.include(request, response);
	            }

	            con.close();
	        } catch (Exception e) {
	            System.out.println(e);
	        }
	    }
}