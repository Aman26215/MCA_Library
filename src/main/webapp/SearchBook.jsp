<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Student</title>
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
		<div class="searchform">
			<h1>Search Book</h1>
				<form action="SearchingBook.jsp" method="post">
	
           <p style="font-size:10px"><pre>Book Id :     </pre></p><input type="number" name="t1" palceholder="Enter Book Id" style="padding:5px"><input type="submit" value="Search Id" name="b1" style="padding:5px">
           <p>OR</p>
           <p style="font-size:10px"><pre>Book Name :     </pre></p><input type="text" name="t2" palceholder="Enter Book Name" style="padding:5px"><input type="submit" value="Search Name" name="b1" style="padding:5px;">
       		<p>OR</p>
            
            <input type="submit" value="Search All" name="b1">
        
	</form>
	</div>
        </div>
        </div>
</body>
</html>