<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>History Details</title>
<link rel="stylesheet" href="css/NewDashboard.css">
<script>
function printConfDiv() {
    // Get the content to print
    var printContents = document.querySelector('.conf-div').innerHTML;
    var originalContents = document.body.innerHTML;
    
    // Replace the body's content with the print contents
    document.body.innerHTML = printContents;

    // Print the page
    window.print();

    // Restore the body's original contents
    document.body.innerHTML = originalContents;
    location.reload(); // Reload the page to restore JavaScript functionality
}
</script>
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
	<div class = "conf-div">

		<%@ page import="java.sql.*"%>
		<%@ page import="java.time.LocalDate"%>
		<%@ page import="java.time.format.DateTimeFormatter"%>
		<%
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library", "root", "Admin@123");

	// Return Book
		
				String BorrowId = request.getParameter("BorrowId");

				String bid= null, sid=null, sname = null, scontact = null, semail = null, ssession = null, sgender = null, bname = null, bauthor = null,
						bpublication = null, bisbn = null, bIssueDate= null, bReturnDate= null;
				String formatedbIssueDate=null;
				String formatedbReturnDate=null;

				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery("SELECT IssueDate, BorrowRegister.BookId, BookName, Author, Publication, Quantity, ISBN_No, BorrowRegister.StudentId, StudentName, StudentContact, StudentEmail, StudentSession, Gender, Capacity, ReturnDate FROM BorrowRegister inner join Book on BorrowRegister.BookId=Book.BookId inner join Student on BorrowRegister.StudentId=Student.StudentId where BorrowId ="+BorrowId);
				int flag = 0;
				while (rs.next()) {
				bIssueDate = rs.getString(1);
				bid = rs.getString(2);
				bname = rs.getString(3);
				bauthor = rs.getString(4);
				bpublication = rs.getString(5);
				
				bisbn = rs.getString(7);
				sid = rs.getString(8);
				sname = rs.getString(9);
				scontact = rs.getString(10);
				semail = rs.getString(11);
				ssession = rs.getString(12);
				sgender = rs.getString(13);
				bReturnDate = rs.getString(15);
				
				LocalDate ld = LocalDate.parse(bIssueDate);
				DateTimeFormatter outputFormat = DateTimeFormatter.ofPattern("dd-MM-yyyy");
				formatedbIssueDate = ld.format(outputFormat);
				if(bReturnDate != null){
				LocalDate ld1 = LocalDate.parse(bReturnDate);
				formatedbReturnDate = ld1.format(outputFormat);
				}
				
				%>
				<div class="row1">
				<div class="details">
					<h2>Book Detail</h2>
					<p><span>Book Id :</span>
						<%=bid%></p>
					<p><span>Book Name :</span>
						<%=bname%></p>
					<p><span>Author :</span>
						<%=bauthor%></p>
					<p><span>Publication :</span>
						<%=bpublication%></p>
					<p><span>ISBN No. :</span>
						<%=bisbn%></p>
				</div>
				<div class="details">
					<h2>Student Detail</h2>
					<p><span>Student Id :</span>
						<%=sid%></p>
					<p><span>Student Name :</span>
						<%=sname%></p>
					<p><span>Contact : </span>
						<%=scontact%></p>
					<p><span>Email : </span>
						<%=semail%></p>
					<p><span>Session : </span>
						<%=ssession%></p>
					<p><span>Gender : </span>
						<%=sgender%></p>
				</div>
				</div>
				
				<div class="row2">
				<div class="details">
					<h2>Borrow Details</h2>
					<p><span>Borrow No. : </span>
						<%=BorrowId%></p>
					<p><span>Issue Date : </span>
						<%=formatedbIssueDate%></p>
					<p><span>Return Date : </span>
						<%=formatedbReturnDate%></p>
				</div>
				</div>
				<%
				}
				

		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
	</div>
	<div class="button-group-search">
	<button onclick="printConfDiv()" style="height: 30px;width: 60px;">Print</button>
	</div>
	</div>
	</div>
</body>
</html>
