<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Book</title>
<link rel="stylesheet" href="css/HomePageStyle.css">
<link rel="stylesheet" href="css/Dashboard.css">
</head>
<body>
<nav id="navbar">
		<div id="logo">
			<img src="images/Logo1.jpg" alt="StackLab.com" class="src">
		</div>
		<ul>

			<li class="item"><p>
		Welcome
		<%=session.getAttribute("AdminName")%></p></li>
			<li class="item"><p>
		Your Admin Id is :
		<%=session.getAttribute("AdminId")%></p></li>
			
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

<div class="container2">
<div id="f">
	<h1>Add New Book</h1>
    
        <form Action="Confirmation.jsp" method="post">
        	<pre><p>Book Id :       <input type="number"   name="BookId" id="BookId" placeholder="Enter Book Id" required></p></pre>
            <pre><p>Book Name :     <input type="text" size="50" name="BookName" id="BookName" placeholder="Enter Book Name" required></p></pre>
            <pre><p>Author :        <input type="text" size="50" name="Author" id="Author" placeholder="Enter Author Name" required></p></pre>
            <pre><p>Publication :   <input type="text" size="50" name="Publication" id="Publication" placeholder="Publication Name" required></p></pre>
            <pre><p>ISBN Number :   <input type="text" size="50" name="ISBN" id="ISBN" placeholder="ISBN Number" required></p></pre>
            <pre><p>Date of Receiving :   <input type="date" size="50" name="Date" id="Date" placeholder="Date" required></p></pre>
             <div class="button-group">        	   
             <input type="Submit" value="Add Book" name="b1">    <input type="RESET" value="Reset">
             </div>
        </form>
        </div>
        </div>
        </container>
</body>
</html>