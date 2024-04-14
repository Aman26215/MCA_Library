<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Confirmation Page</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library", "root", "Admin@123");
		
		String btn = request.getParameter("b1");
		
		if(btn.equalsIgnoreCase("Add Student") || btn.equalsIgnoreCase("Update Student") || btn.equalsIgnoreCase("Delete Student")){
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
			<pre><h1>Student Details</h1></pre>
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
					<pre><h1>New Details of Student</h1></pre>
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
		
		// Start of Delete Student
		
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
				<pre><h1>Details of Student</h1></pre>
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
		
		}
		
		
		// End of Delete Student
		
		
		
		
		if(btn.equalsIgnoreCase("Add Book") || btn.equalsIgnoreCase("Delete Book")){
			String bt1 = request.getParameter("BookId");
			int bid = Integer.parseInt(bt1);
			String bt2 = request.getParameter("BookName");
			String bt3 = request.getParameter("Author");
			String bt4 = request.getParameter("Publication");
		
			
			// Start of Add Book
		
			if(btn.equalsIgnoreCase("Add Book")){
			
			%>
			<pre><h1>Book Detail</h1></pre>
			<pre><p>Book Id : <%= bt1 %></p></pre>
			<pre><p>Book Name : <%= bt2 %></p></pre>
			<pre><p>Author : <%= bt3 %></p></pre>
			<pre><p>Publication : <%= bt4 %></p></pre>
			<pre><p>Do you Sure Want to Add this Book?</p></pre>
			<form action="ActionOnBook.jsp?&b1=AddBook&BookId=<%= bt1 %>&BookName=<%=bt2 %>&Author=<%=bt3 %>&Publication=<%=bt4 %>" method="post">
				<input type="Submit" value="Yes, I Confirm!"></form>
			<form action="AddBook.jsp"><input type="Submit" value="No" name="b1"></form>
	<%
		}
			
			// End of Add book
			
			// Start of Delete Book
			
			if(btn.equalsIgnoreCase("Delete Book")){
				
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery("SELECT BookName, Author, Publication FROM Book WHERE BookId="+bid);
				
				int flag =0;
				while(rs.next()){
					bt2 = rs.getString(1);
					bt3 = rs.getString(2);
					bt4 = rs.getString(3);
					
					flag=1;
				}
				if(flag==1){
					
					%>
					<pre><h1>Details of Book</h1></pre>
					<pre><p>Book Id : <%= bt1 %></p></pre>
					<pre><p>Book Name : <%= bt2 %></p></pre>
					<pre><p>Author : <%= bt3 %></p></pre>
					<pre><p>Publication : <%= bt4 %></p></pre>
					<pre><p>Do you Sure Want to Delete this Book?</p></pre>
					<form action="ActionOnBook.jsp?&b1=DeleteBook&RollNo=<%= bt1 %>" method="post">
						<input type="Submit" value="Yes, I Confirm!"></form>
					<form action="DeleteBook.jsp"><input type="Submit" value="No" name="b1"></form>
			<%
			
				}else{
					out.println("<script>alert('Book Does Not Exist.')</script>");
	                %>
	                <script>
	                window.location.href = "DeleteBook.jsp";
	                </script>
	                <%
				}	
				
			}
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}

	
	%>
</body>
</html>