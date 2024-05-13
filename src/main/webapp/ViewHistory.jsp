<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Accession</title>

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

	<%@ page import="java.sql.*"%>
	<%
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library", "root", "Admin@123");
	
		

			PreparedStatement pstm = con.prepareStatement("select BorrowId, BorrowRegister.BookId, BookName, BorrowRegister.StudentId, StudentName, StudentContact, IssueDate, ReturnDate from BorrowRegister inner join Book on BorrowRegister.BookId=Book.BookId inner join Student on BorrowRegister.StudentId=Student.StudentId ORDER BY BorrowId DESC");

			ResultSet rs = pstm.executeQuery();
			int flag=0;
			
	%>
	<div class="scroll">
		<table border=1>
			<thead>
				<tr>
					<th>Borrow No.</th>
					<th>Book Id</th>
					<th>Book Name</th>
					<th>Student Id</th>
					<th>Student Name</th>
					<th>Contact</th>
					<th>Borrow Date</th>
					<th>Return Date</th>
					<th>View Details</th>
				</tr>
			</thead>
			<%
			while (rs.next()) {
				flag=1;
			%>
			<tbody>
				<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>
					<td><%=rs.getString(5)%></td>
					<td><%=rs.getString(6)%></td>
					<td><%=rs.getString(7)%></td>
					<td><%=rs.getString(8)%></td>
					<td><a href="HistoryDetails.jsp?BorrowId=<%=rs.getString(1)%>"><img src="images/eye.png" class="src4"></a></td>
				</tr>
			</tbody>
			<%
			}
			con.close();
			%>

		</table>
	
	<%if(flag==0){%>
				 <p style="color:Red;position: relative; text-align:center; font-weight:Bold">No Borrowed Book Available</p>
				 
	                <%
			}%></div></container><%
	
	
	}catch (Exception e) {
		System.out.println(e);
		}
	%>
		
</body>
</html>