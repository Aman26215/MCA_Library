<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body><% 
String st1 = request.getParameter("RollNo");
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
</body>
</html>