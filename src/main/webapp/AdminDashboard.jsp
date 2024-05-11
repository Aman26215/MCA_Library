<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>																							
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<link rel="stylesheet" href="css/HomePageStyle.css">
<link rel="stylesheet" href="css/Dashboard.css">

</head>
<body>

<nav id="navbar">
		<div id="logo">
			<img src="images/Logo1.jpg" alt="StackLab.com" class="src">
		</div>
		
		<ul>

			<li class="item" style="padding-right:20px;margin-left: 220px;"><p>
		Welcome
		<%=session.getAttribute("AdminName")%></p></li>
			<li class="item"><p>
		Your Admin Id is :
		<%=session.getAttribute("AdminId")%></p></li>
			
		</ul>
		<div id="logout">
        <a href="logout"><button>Logout</button></a>
        </div>
		<div id="logo">
			<img src="images/Logo4.png" class="src">
		</div>
		
	</nav>
	
	<div id="partion">
	<div class="container1">
		<nav id="navbar2">
        <header><img src="images/Logo5.png" class="src2" >Menu</header>
        <ul class="navul">
        	<li class="navli"><a class="nav-link" href="AddStudent.jsp">Add Student</a></li>
        	<li class="navli"><a class="nav-link" href="SearchStudent.jsp">Search Student</a></li>
            <li class="navli"><a class="nav-link" href="UpdateStudent.jsp">Update Student Details</a></li>
            <li class="navli"><a class="nav-link" href="DeleteStudent.jsp">Delete Student</a></li>
            <li class="navli"><a class="nav-link" href="AddBook.jsp">Add Book</a></li>
            <li class="navli"><a class="nav-link" href="SearchBook.jsp">Search Book</a></li>
            <li class="navli"><a class="nav-link" href="ViewHistory.jsp">Borrow History</a></li>
            <li class="navli"><a class="nav-link" href="Returning.jsp?b1=Search All">Not Returned</a></li>
            <li class="navli"><a class="nav-link" href="Return.jsp">Return Book</a></li>
        </ul>
    </nav>
    </div>

    
    <div class="container2">
    	<div id="parentcontainer">
    <div id="childcontainer">
        <h2>Books</h2>
    </div>
    <div id="childcontainer">
        <h2>Students</h2>
    </div>
    <div id="childcontainer">
        <h2>Admins</h2>
    </div>
    </div>
    <div id="parentcontainer">
    <div id="childcontainer">
        <h2>Issued</h2>
    </div>
    <div id="childcontainer">
        <h2>Returned</h2>
    </div>
    <div id="childcontainer">
        <h2>Not Returned</h2>
    </div>
    </div>

</div>

    </container>

    	  
    </div>
	
</body>
</html>