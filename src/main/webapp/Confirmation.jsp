<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "Admin@123");
		System.out.println("1");
		String btn = request.getParameter("b1");
		
		// Start of Add Student

		if (btn.equalsIgnoreCase("Add Student")) {
			System.out.println("2");
			String st1 = request.getParameter("Roll No");
			String st2 = request.getParameter("Name");
			String st3 = request.getParameter("Contact");
			String st4 = request.getParameter("Email");
			String st5 = request.getParameter("Session");
			String st6 = request.getParameter("Gender");
			
			%>
			<pre><p>Student Details</p></pre>
			<pre><p>Roll No. : <%= st1 %></p></pre>
			<pre><p>Name : <%= st2 %></p></pre>
			<pre><p>Contact : <%= st3 %></p></pre>
			<pre><p>Email : <%= st4 %></p></pre>
			<pre><p>Session : <%= st5 %></p></pre>
			<pre><p>Gender : <%= st6 %></p></pre>
			<pre><p>Do you Sure Want to Add Student</p></pre>
			<form action="ActionOnStudent.jsp?&b1=AddStudent&RollNo=<%= st1 %>&Name=<%=st2 %>&Contact=<%=st3 %>&Email=<%=st4 %>&Session=<%=st5 %>&Gender=<%=st6 %>" method="post">
				<input type="Submit" value="Yes, I Confirm!"></form>
			<form action="AddStudent.jsp"><input type="Submit" value="No" name="b1"></form>
	<%System.out.println("3");
		}
	}catch(Exception e){
		e.printStackTrace();
	}

			
	%>
</body>
</html>