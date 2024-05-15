<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Accession</title>
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

	<%@ page import="java.sql.*"%>
	<%@ page import="java.time.LocalDate"%>
	<%@ page import="java.time.format.DateTimeFormatter"%>
	<%
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library", "root", "Admin@123");
	
		

			PreparedStatement pstm = con.prepareStatement("select BorrowId, BorrowRegister.BookId, BookName, BorrowRegister.StudentId, StudentName, StudentContact, IssueDate, ReturnDate from BorrowRegister inner join Book on BorrowRegister.BookId=Book.BookId inner join Student on BorrowRegister.StudentId=Student.StudentId ORDER BY BorrowId DESC");

			ResultSet rs = pstm.executeQuery();
			int flag=0;
			
			String dd1 = null;
			String dd2 = null;
			DateTimeFormatter outputFormat = DateTimeFormatter.ofPattern("dd-MM-yyyy");
			
	%>
	<div class="container2">
	<h1 style="text-align: center; margin: 10px;">Accession History</h1>
	<div class="scroll2">
			<table>
				<tr style="color: indigo;">
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
			
			<%
			while (rs.next()) {
				flag=1;
				
				dd1 = rs.getString(7);
				dd2 = rs.getString(8);
				if(dd1 != null){
				LocalDate ld = LocalDate.parse(dd1);
				dd1 = ld.format(outputFormat);
				}
				if(dd2 != null){
					LocalDate ld = LocalDate.parse(dd2);
					dd2 = ld.format(outputFormat);
				}
			%>
			
				<tr>
					<td style='width: 3%; text-align: center;'><%=rs.getString(1)%></td>
					<td style='width: 3%; text-align: center;'><%=rs.getString(2)%></td>
					<td style='width: 12%'><%=rs.getString(3)%></td>
					<td style='width: 3%; text-align: center;'><%=rs.getString(4)%></td>
					<td style='width: 15%'><%=rs.getString(5)%></td>
					<td style='width: 10%'><%=rs.getString(6)%></td>
					<td style='width: 8%'><%=dd1%></td>
					<td style='width: 8%'><%=dd2%></td>
					<td style='width: 3%; text-align: center;'><a href="HistoryDetails.jsp?BorrowId=<%=rs.getString(1)%>"><img src="images/eye.png" class="src4"></a></td>
				</tr>
			
			<%
			}
			con.close();
			%>

		</table>
	
	<%if(flag==0){%>
				 <p style="color:Red;position: relative; text-align:center; font-weight:Bold">No Borrowed Book Available</p>
				 
	                <%
			}%></div></div></div><%
	
	
	}catch (Exception e) {
		System.out.println(e);
		}
	%>
		
</body>
</html>