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
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library", "root", "Admin@123");
		
		String btn = request.getParameter("b1");
		
		String st1 = request.getParameter("Roll No");
		long sid = Long.parseLong(st1);
		String st2 = request.getParameter("Name");
		String st3 = request.getParameter("Contact");
		String st4 = request.getParameter("Email");
		String st5 = request.getParameter("StudentSession");
		String st6 = request.getParameter("Gender");
		
		// Start of Add Student

		if (btn.equalsIgnoreCase("Add Student")) {
			

			%>
			<pre><p>Student Details</p></pre>
			<pre><p>Roll No. : <%= st1 %></p></pre>
			<pre><p>Name : <%= st2 %></p></pre>
			<pre><p>Contact : <%= st3 %></p></pre>
			<pre><p>Email : <%= st4 %></p></pre>
			<pre><p>Session : <%= st5 %></p></pre>
			<pre><p>Gender : <%= st6 %></p></pre>
			<pre><p>Do you Sure Want to Add Student?</p></pre>
			<form action="ActionOnStudent.jsp?&b1=AddStudent&RollNo=<%= st1 %>&Name=<%=st2 %>&Contact=<%=st3 %>&Email=<%=st4 %>&StudentSession=<%=st5 %>&Gender=<%=st6 %>" method="post">
				<input type="Submit" value="Yes, I Confirm!"></form>
			<form action="AddStudent.jsp"><input type="Submit" value="No" name="b1"></form>
		
		<%
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

		}
		
		//End of Add Student
		
		//Start of Update Student
		
		if (btn.equalsIgnoreCase("Update Student")){
			
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT StudentId FROM Student");
			int flag = 0;
			while(rs.next()){
				long val = rs.getLong(1);
				
				if(val==sid){
					%>
					<pre><p>New Details of Student</p></pre>
					<pre><p>Roll No. : <%= st1 %></p></pre>
					<pre><p>Name : <%= st2 %></p></pre>
					<pre><p>Contact : <%= st3 %></p></pre>
					<pre><p>Email : <%= st4 %></p></pre>
					<pre><p>Session : <%= st5 %></p></pre>
					<pre><p>Gender : <%= st6 %></p></pre>
					<pre><p>Do you Sure Want to Update Student Details?</p></pre>
					<form action="ActionOnStudent.jsp?&b1=UpdateStudent&RollNo=<%= st1 %>&Name=<%=st2 %>&Contact=<%=st3 %>&Email=<%=st4 %>&StudentSession=<%=st5 %>&Gender=<%=st6 %>" method="post">
						<input type="Submit" value="Yes, I Confirm!"></form>
					<form action="UpdateStudent.jsp"><input type="Submit" value="No" name="b1"></form>
			<%
					flag = 1;
					break;
				}
				
			}
			if(flag == 0){
				out.println("<script>alert('Student Does Not Exist.')</script>");
                %>
                <script>
                window.location.href = "UpdateStudent.jsp";
                </script>
                <%
			}
		}
		
		
		// End of Update Student
		
		// Start of Delete
		
		if(btn.equalsIgnoreCase("Delete Student")){
			
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT StudentName, StudentContact, StudentEmail, StudentSession, Gender FROM Student WHERE StudentId="+sid);
			
			int flag =0;
			while(rs.next()){
				st2 = rs.getString(1);
				st3 = rs.getString(2);
				st4 = rs.getString(3);
				st5 = rs.getString(4);
				st6 = rs.getString(5);
				
				flag=1;
			}
			if(flag==1){
				
				%>
				<pre><p>Details of Student</p></pre>
				<pre><p>Roll No. : <%= st1 %></p></pre>
				<pre><p>Name : <%= st2 %></p></pre>
				<pre><p>Contact : <%= st3 %></p></pre>
				<pre><p>Email : <%= st4 %></p></pre>
				<pre><p>Session : <%= st5 %></p></pre>
				<pre><p>Gender : <%= st6 %></p></pre>
				<pre><p>Do you Sure Want to Delete this Student?</p></pre>
				<form action="ActionOnStudent.jsp?&b1=DeleteStudent&RollNo=<%= st1 %>" method="post">
					<input type="Submit" value="Yes, I Confirm!"></form>
				<form action="DeleteStudent.jsp"><input type="Submit" value="No" name="b1"></form>
		<%
		
			}else{
				out.println("<script>alert('Student Does Not Exist.')</script>");
                %>
                <script>
                window.location.href = "DeleteStudent.jsp";
                </script>
                <%
			}
			
			
			
			
			
			
			
			
			
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}catch(Exception e){
		e.printStackTrace();
	}

	
	%>
</body>
</html>