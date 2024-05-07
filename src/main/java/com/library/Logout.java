package com.library;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 HttpSession session = request.getSession(false);
	        
	        if (session != null) {
	            // Invalidate the session
	        	response.setContentType("text/html");
	        	response.setHeader("Cache-Control", "no-cache, no-store");
	        	response.setHeader("Pragma", "no-cache");
	            session.invalidate();
	        }
	        
	        // Redirect the user to the login page or any other page after logout
	        response.sendRedirect(request.getContextPath() + "/AdminLogin.html"); // Change this to the appropriate page
	    
	}

}
