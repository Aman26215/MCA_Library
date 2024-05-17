<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>																							
<meta charset="UTF-8">
<title>Admin Dashboard</title>
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
    
    <%@ page import="java.sql.*"%>
    <%@ page import="java.text.SimpleDateFormat"%>
	<%@ page import="java.util.Date"%>
    <%
    	try{
    		Class.forName("com.mysql.jdbc.Driver");
    	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library", "root", "Admin@123");
			int cn1 = 0,cn2 = 0,cn3 = 0,cn4 = 0,cn5 = 0;
			String cn6;
			
    		Statement stmt = con.createStatement();
    		ResultSet rs = stmt.executeQuery("SELECT count(BookId) FROM Book");
    		while(rs.next()){
    			cn1 = rs.getInt(1);
    		}
    		
    		rs = stmt.executeQuery("SELECT count(StudentId) FROM Student");
    		while(rs.next()){
    			cn2 = rs.getInt(1);
    		}
    		rs = stmt.executeQuery("SELECT count(BorrowId) From BorrowRegister");
    		while(rs.next()){
    			cn3 = rs.getInt(1);
    		}
    		rs = stmt.executeQuery("SELECT count(BorrowId) From BorrowRegister WHERE ReturnDate IS NOT NULL;");
    		while(rs.next()){
    			cn4 = rs.getInt(1);
    		}
    		rs = stmt.executeQuery("SELECT count(BorrowId) From BorrowRegister WHERE ReturnDate IS NULL;");
    		while(rs.next()){
    			cn5 = rs.getInt(1);
    		}
    		Date d = new Date();
	        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
	        cn6 = sdf.format(d);
    		
    	    %>
    	
    <div class="container2">
    	<div id="parentcontainer">
    	
    <a href="SearchingBook.jsp?b1=Search All">
    <div id="childcontainer">
    	<img src="images/cn1.png" alt="StackLab.com" class="src3">
    	<p style="margin-bottom: -18px;margin-top: 7px;font-family: math;"><%=cn1%></p>
        <h4 style="font-family: math;">Books Available<h4>
    </div>
    </a>
    
    <a href="SearchingStudent.jsp?b1=Search All">
    <div id="childcontainer">
    	<img src="images/cn2.jpg" alt="StackLab.com" class="src3">
    	<p style="margin-bottom: -18px;margin-top: 7px;font-family: math;"><%=cn2%></p>
        <h4 style="font-family: math;">Students<h4>
    </div>
    </a>
    
    <a href="ViewHistory.jsp">
    <div id="childcontainer">
    	<img src="images/cn3.png" alt="StackLab.com" class="src3">
    	<p style="margin-bottom: -18px;margin-top: 7px;font-family: math;"><%=cn3%></p>
        <h4 style="font-family: math;">Total Book Issued<h4>
    </div>
    </a>
    
    <a href="ViewReturnedBook.jsp">
    <div id="childcontainer">
    	<img src="images/cn4.png" alt="StackLab.com" class="src3">
    	<p style="margin-bottom: -18px;margin-top: 7px;font-family: math;"><%=cn4%></p>
        <h4 style="font-family: math;">Returned Books<h4>
    </div>
    </a>
    
    <a href="Returning.jsp?b1=Search All">
    <div id="childcontainer">
    	<img src="images/cn5.jpg" alt="StackLab.com" class="src3">
    	<p style="margin-bottom: -18px;margin-top: 7px;font-family: math;"><%=cn5%></p>
        <h4 style="font-family: math;">Books Not Returned<h4>
    </div>
    </a>
    
    
    <div id="childcontainer">
    	<img src="images/cn6.png" alt="StackLab.com" class="src3">
    	<p style="margin-bottom: -18px;margin-top: 7px;font-family: math;"><%=cn6%></p>
        <h4 style="font-family: math;">Date<h4>
    </div>

</div>	<%
		con.close();
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    %>
    </div>
	</div>
</body>
</html>