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
			<li class="item"><p>Welcome <%=session.getAttribute("AdminName")%></p>
			<p> __Your Admin Id is :<%=session.getAttribute("AdminId")%></p></li>
		</ul>
		
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
        	<li class="navli"><a class="nav-link" href="SearchStudent.php">Search Student</a></li>
            <li class="navli"><a class="nav-link" href="UpdateStudent.jsp">Update Student Details</a></li>
            <li class="navli"><a class="nav-link" href="DeleteStudent.jsp">Delete Student</a></li>
            <li class="navli"><a class="nav-link" href="AddBook.jsp">Add Book</a></li>
            <li class="navli"><a class="nav-link" href="DeleteBook.jsp">Delete Book</a></li>
            <li class="navli"><a class="nav-link" href="SearchBook.jsp">Search Book</a></li>
            <li class="navli"><a class="nav-link" href="ViewIssuedDetails.jsp?btn=All">View Issued and Returned Book</a></li>
            <li class="navli"><a class="nav-link" href="ViewIssuedDetails.jsp?btn=Returned">View Returned Book</a></li>
            <li class="navli"><a class="nav-link" href="ViewIssuedDetails.jsp?btn=Issued">View Issued</a></li>
        </ul>
    </nav>
    </div>
    
    
    <div class="container2">
    	<div id="parentcontainer">
    <div id="childcontainer">
        <h2>Container 1</h2>
        <p>This is the content of container 1.</p>
    </div>
    <div id="childcontainer">
        <h2>Container 3</h2>
        <p>This is the content of container 2.</p>
    </div>
    <div id="childcontainer">
        <h2>Container 4</h2>
        <p>This is the content of container 3.</p>
    </div>
    </div>
    	  
    </div>
  </div>
	
</body>
</html>