<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Add Student</title>

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
		
		<div id="logout">
        <a href="logout"><button>Logout</button></a>
        </div>
		
		<div id="logo">
			<img src="images/Logo4.png" class="src">
		</div>
		
	</nav>
	
	
<container>
<div class="container1">
		<nav id="navbar2">
        <header><img src="images/Logo5.png" class="src2" >Menu</header>
        <ul class="navul">
        	<li class="navli"><a class="nav-link" href="AdminDashboard.jsp">Dashboard</a></li>
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
<div id="f">
	<h1>Student Registration Form</h1>
    
        <form Action="Confirmation.jsp" method="post">
        	<pre><p>Student Roll No.:  <input type="number"   name="Roll No" id="RollNo" placeholder="Enter University Roll No." required style="width: 374px; "></p></pre>
            <pre><p>Student Name:      <input type="text" size="50" name="Name" id="Name" placeholder="Enter your name" required></p></pre>
            <pre><p>Student Contact:   <input type="number" min=1000000000 max=9999999999 name="Contact" id="Contact" placeholder="Enter your Contact number" required style="width: 376px; "></p></pre>
            <pre><p>Student E-mail Id: <input type="email" size="50" name="Email" id="Email" placeholder="Enter your email id" required></p></pre>
            <pre><p>Session :          <input type="text" size="50" name="StudentSession" id="Session" placeholder="Enter Session" required></p></pre>
            <pre><label for="Gender" >Gender :            <input class="inline" type="radio" name="Gender" value="Male"/ checked>Male <input class="inline" type="radio" name="Gender" value="Female"/>Female <input class="inline" type="radio" name="Gender" value="Other"/>Other</label></pre>
            
          	 <div class="button-group">
             <input type="SUBMIT" value="Add Student" name="b1">    <input type="RESET" value="RESET">
             </div>
        </form>
        </div>
        </div>
        </container>
</body>
</html>