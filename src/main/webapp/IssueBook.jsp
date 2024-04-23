<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Issue Book</title>

<link rel="stylesheet" href="css/HomePageStyle.css">
<link rel="stylesheet" href="css/Dashboard.css">
</head>
<body>
<nav id="navbar">
		<div id="logo">
			<img src="images/Logo1.jpg" alt="StackLab.com" class="src">
		</div>
		<ul>
			<li class="item"><p>Welcome <%=session.getAttribute("AdminName")%></p>
			<p> __Your Admin Id is :<%=session.getAttribute("AdminId")%></p></li>
		</ul>
		
		<div id="logo">
			<img src="images/Logo4.png" class="src">
		</div>
		
	</nav>
	<container>
	<div class="container1">
		<nav id="navbar2">
        <header><img src="images/Logo5.png" class="src2" >Menu</header>
        <ul class="navul">
        	<li class="navli"><a class="nav-link" href="AddStudent.jsp">Add Student</a></li>
        	<li class="navli"><a class="nav-link" href="SearchStudent.php">Search Student</a></li>
            <li class="navli"><a class="nav-link" href="UpdateStudent.jsp">Update Student Details</a></li>
            <li class="navli"><a class="nav-link" href="DeleteStudent.jsp">Delete Student</a></li>
            <li class="navli"><a class="nav-link" href="AddBook.jsp">Add Book</a></li>
            <li class="navli"><a class="nav-link" href="SearchBook.jsp">Search Book</a></li>
            <li class="navli"><a class="nav-link" href="ViewIssuedDetails.jsp?btn=All">View Issued and Returned Book</a></li>
            <li class="navli"><a class="nav-link" href="ViewIssuedDetails.jsp?btn=Returned">View Returned Book</a></li>
            <li class="navli"><a class="nav-link" href="ViewIssuedDetails.jsp?btn=Issued">Not Returned</a></li>
            <li class="navli"><a class="nav-link" href="ViewIssuedDetails.jsp?btn=Issued">Return Book</a></li>
        </ul>
    </nav>
    </div>
    <div class="container2" >
    <div id="f">
	<% String bid = request.getParameter("BookId"); %>
	<h1>Issue Book to Student</h1>
	<form action="Confirmation.jsp" method="post">
		<p>Book Id : </p><input name="t1" value="<%= bid %>" readonly >
		<p>Student Id : </p><input type="number" name="t2" placeholder="Enter Student Roll No." >
		<input type="submit" name= "b1" value="Issue">
		
	</form>
	<form action="SearchBook.jsp" method="post">
		<input type="submit" value="Go Back">
	</form>
	</div>
	
	
</body>
</html>