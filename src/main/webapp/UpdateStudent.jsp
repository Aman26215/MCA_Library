<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Student Details</title>
<link rel="stylesheet" href="css/NewDashboard.css">
</head>
<body>
<nav id="navbar">
		<div id="logo">
			<img src="images/Logo2.jpg" alt="StackLab.com" class="src">
		</div>
		
		<ul id="AdminDetails">

			<li ><p>
		Welcome
		<%=session.getAttribute("AdminName")%></p></li>
			<li style="padding-left:25px"><p>
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
	<h1 style="text-align:center; margin:10px;">Update Student Details</h1>
	
<div class="formbox">
	<form Action="Confirmation.jsp" method="post">
            <h4 style="color:crimson;margin-top:5px;">*Only fill those fields which you want to update.</h4>
			<h4 style="color:crimson;margin-top:-20px;">*Student Registration number is compulsory to fill.</h4>
            <pre>Registration No.:   <input type="number"   name="Roll No" id="RollNo" placeholder="University Registration Number" required></pre>
            <pre>Student Name:       <input type="text" size="50" name="Name" id="Name" placeholder="Enter Student Name" ></pre>
            <pre>Student Contact:    <input type="number" min=1000000000 max=9999999999 name="Contact" id="Contact" placeholder="Enter Contact Number" ></pre>
            <pre>Student E-mail Id:  <input type="email" size="50" name="Email" id="Email" placeholder="Enter E-mail address" ></pre>
            <pre>Session :           <input type="text" size="50" name="StudentSession" id="session" placeholder="Enter Session" ></pre>
            <pre><label for="Gender" >Gender :            <input class="inline" type="radio" name="Gender" value="Male" checked>Male <input class="inline" type="radio" name="Gender" value="Female"/>Female <input class="inline" type="radio" name="Gender" value="Other"/>Other</label></pre>
            
             <div class="button-group-search">
             <input type="SUBMIT" value="Update Student" name="b1">    <input type="RESET" value="RESET">
             </div>
        </form>
        </div>
        </div>
        </div>
        
        
</body>
</html>