<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Confirmation Page</title>
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
	<div class = "conf-div">

		<%@ page import="java.sql.*"%>
		<%@ page import="java.time.LocalDate"%>
		<%@ page import="java.time.format.DateTimeFormatter"%>
		<%
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library", "root", "Admin@123");

			String btn = request.getParameter("b1");

			if (btn.equalsIgnoreCase("Add Student") || btn.equalsIgnoreCase("Update Student")
			|| btn.equalsIgnoreCase("Delete Student")) {
				String st1 = request.getParameter("Roll No");
				long sid = Long.parseLong(st1);
				String st2 = request.getParameter("Name");
				String st3 = request.getParameter("Contact");
				String st4 = request.getParameter("Email");
				String st5 = request.getParameter("StudentSession");
				String st6 = request.getParameter("Gender");

				// Start of Add Student

				if (btn.equalsIgnoreCase("Add Student")) {
		%>
		<div class="row1">
		<div class="details">
			<h2>Student Details</h2>
			<p><span>Registration No. :</span>
				<%=st1%></p>
			<p><span>Name :</span>
				<%=st2%></p>
			<p><span>Contact :</span>
				<%=st3%></p>
			<p><span>Email :</span>
				<%=st4%></p>
			<p><span>Session :</span>
				<%=st5%></p>
			<p><span>Gender :</span>
				<%=st6%></p>
		</div>
		</div>
		
		<div class="row2">
		<div class="confirm-option">
			<h3>Do you Sure Want to Add Student?</h3>
		<div class="button-group-confirm-option">
				<form
					action="ActionOnStudent.jsp?&b1=AddStudent&RollNo=<%=st1%>&Name=<%=st2%>&Contact=<%=st3%>&Email=<%=st4%>&StudentSession=<%=st5%>&Gender=<%=st6%>"
					method="post">
					<input type="Submit" value="Yes, I Confirm!">
				</form>
				<form action="AddStudent.jsp">
					<input type="Submit" value="No" name="b1">
				</form>
			</div>
		</div>
		</div>
		<%
		}

		//End of Add Student

		//Start of Update Student

		if (btn.equalsIgnoreCase("Update Student")) {

		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT StudentId FROM Student");
		int flag = 0;
		while (rs.next()) {
			long val = rs.getLong(1);

			if (val == sid) {
		%>
		<div class="row1">
		<div class="details">
			<h2>New Details of Student</h2>
			<p><span>Registration No. :</span>
				<%=st1%></p>
			<p><span>Name :</span>
				<%=st2%></p>
			<p><span>Contact :</span>
				<%=st3%></p>
			<p><span>Email :</span>
				<%=st4%></p>
			<p><span>Session :</span>
				<%=st5%></p>
			<p><span>Gender :</span>
				<%=st6%></p>
		</div>
		</div>
			
		<div class="row2">
		<div class="confirm-option">
			<h3>Do you Sure Want to Update Student Details?</h3>
		<div class="button-group-confirm-option">
				<form
					action="ActionOnStudent.jsp?&b1=UpdateStudent&RollNo=<%=st1%>&Name=<%=st2%>&Contact=<%=st3%>&Email=<%=st4%>&StudentSession=<%=st5%>&Gender=<%=st6%>"
					method="post">
					<input type="Submit" value="Yes, I Confirm!">
				</form>
				<form action="UpdateStudent.jsp">
					<input type="Submit" value="No" name="b1">
				</form>
			</div>
		</div>
		</div>
		<%
		flag = 1;
		break;
		}

		}
		if (flag == 0) {
		out.println("<script>alert('Student Does Not Exist.')</script>");
		%>
		<script>
                window.location.href = "UpdateStudent.jsp";
                </script>
		<%
		}
		}

		// End of Update Student

		// Start of Delete Student

		if (btn.equalsIgnoreCase("Delete Student")) {

		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(
				"SELECT StudentName, StudentContact, StudentEmail, StudentSession, Gender FROM Student WHERE StudentId=" + sid);

		int flag = 0;
		while (rs.next()) {
		st2 = rs.getString(1);
		st3 = rs.getString(2);
		st4 = rs.getString(3);
		st5 = rs.getString(4);
		st6 = rs.getString(5);

		flag = 1;
		}
		if (flag == 1) {
		%>
		<div class="row1">
		<div class="details">
			<h2>Details of Student</h2>
			<p><span>Registration No. :</span>
				<%=st1%></p>
			<p><span>Name :</span>
				<%=st2%></p>
			<p><span>Contact :</span>
				<%=st3%></p>
			<p><span>Email :</span>
				<%=st4%></p>
			<p><span>Session :</span>
				<%=st5%></p>
			<p><span>Gender :</span>
				<%=st6%></p>
		</div>
		</div>
				
		<div class="row2">
		<div class="confirm-option">
			<h3>Surly Want to Delete this Student?</h3>
		<div class="button-group-confirm-option">
				<form action="ActionOnStudent.jsp?&b1=DeleteStudent&RollNo=<%=st1%>"
					method="post">
					<input type="Submit" value="Yes, I Confirm!">
				</form>
				<form action="DeleteStudent.jsp">
					<input type="Submit" value="No" name="b1">
				</form>
			</div>
		</div>
		</div>
		<%
		} else {
		out.println("<script>alert('Student Does Not Exist.')</script>");
		%>
		<script>
                window.location.href = "DeleteStudent.jsp";
                </script>
		<%
		}
		}

		}

		// End of Delete Student
		
		// Start of Add Book

		if (btn.equalsIgnoreCase("Add Book")) {
			String bt1 = request.getParameter("BookId");
			int bid = Integer.parseInt(bt1);
			String bt2 = request.getParameter("BookName");
			String bt3 = request.getParameter("Author");
			String bt4 = request.getParameter("Publication");
	        String bt5 = request.getParameter("ISBN");
	        String bt6 = request.getParameter("Date");
		%>
		<div class="row1">
		<div class="details">
			<h2>Book Detail</h2>
			<p><span>Book Id :</span>
				<%=bt1%></p>
			<p><span>Book Name :</span>
				<%=bt2%></p>
			<p><span>Author :</span>
				<%=bt3%></p>
			<p><span>Publication :</span>
				<%=bt4%></p>
		    <p><span>ISBN Number :</span>
				<%=bt5%></p>
			<p><span>Date of Receiving :</span>
				<%=bt6%></p>
			</div>
		</div>
				
		<div class="row2">
		<div class="confirm-option">
			<h3>Do you Sure Want to Add this Book?</h3>
		<div class="button-group-confirm-option">
				<form
					action="ActionOnBook.jsp?&b1=AddBook&BookId=<%=bt1%>&BookName=<%=bt2%>&Author=<%=bt3%>&Publication=<%=bt4%>&ISBN=<%=bt5%>&Date=<%=bt6%>"
					method="post">
					<input type="Submit" value="Yes, I Confirm!">
				</form>
				<form action="AddBook.jsp">
					<input type="Submit" value="No" name="b1">
				</form>
			</div>
		</div>
		</div>
		<%
		}
		

		// End of Add book

		//Issue Book
		
		if (btn.equalsIgnoreCase("Issue Book")) {
		String bid = request.getParameter("t1");
		int bid1 = Integer.parseInt(bid);
		String sid = request.getParameter("t2");

		String sname = null, scontact = null, semail = null, ssession = null, sgender = null, bname = null, bauthor = null,
				bpublication = null, bisbn = null;
		int cap = -1;

		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM Student WHERE Studentid=" + sid);
		int flag = 0;
		while (rs.next()) {
		sname = rs.getString(2);
		scontact = rs.getString(3);
		semail = rs.getString(4);
		ssession = rs.getString(5);
		sgender = rs.getString(6);
		cap = rs.getInt(7);
		flag = 1;
		}
		if (flag == 0) {
		out.println("<script>alert('Student Does Not Exist.')</script>");
		%>
		<script>
	                window.location.href = "IssueBook.jsp?BookId=<%=bid%>";
		</script>
		<%
		}
		if (cap <= 0) {
		flag = 0;
		out.println("<script>alert('This Student already Borrowed a Book.')</script>");
		%>
		<script>
		                window.location.href = "IssueBook.jsp?BookId=<%=bid%>";
		</script>
		<%
		}
		if (flag == 1) {
		Statement stmt1 = con.createStatement();
		ResultSet rs1 = stmt1.executeQuery("SELECT * FROM Book WHERE BookId=" + bid1);
		while (rs1.next()) {
			bname = rs1.getString(2);
			bauthor = rs1.getString(3);
			bpublication = rs1.getString(4);
			bisbn = rs1.getString(6);
		}
		%>
		<div class="row1">
		<div class="details"  >
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
			<h1>Student Detail</h1>
			<p><span>Student Id :</span>
				<%=sid%></p>
			<p><span>Student Name :</span>
				<%=sname%></p>
			<p><span>Contact :</span>
				<%=scontact%></p>
			<p><span>Email :</span>
				<%=semail%></p>
			<p><span>Session :</span>
				<%=ssession%></p>
			<p><span>Gender :</span>
				<%=sgender%></p>
		</div>
		</div>
		
		<div class="row2">
		<div class="confirm-option">
		<h3>Do you confirm above details?</h3>
		<div class="button-group-confirm-option">
			<form
				action="FinalAction.jsp?&b1=Issue&BookId=<%=bid%>&StudentId=<%=sid%>"
				method="post">
				<input type="Submit" value="Yes, I Confirm!">
			</form>
			<form action="IssueBook.jsp?BookId=<%=bid%>" method="post">
				<input type="submit" value="No">
			</form>
		</div>
		</div>
		</div>
		<%
		}
		}
		// End of Issue Book
		
		
		// Return Book
		
				if (btn.equalsIgnoreCase("Return")) {
					String BorrowId = request.getParameter("BorrowId");

				String bid= null, sid=null, sname = null, scontact = null, semail = null, ssession = null, sgender = null, bname = null, bauthor = null,
						bpublication = null, bisbn = null, bIssueDate= null;
				String formatedbIssueDate=null;
				int cap = -1;
				int qun = -1;

				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery("SELECT IssueDate, BorrowRegister.BookId, BookName, Author, Publication, Quantity, ISBN_No, BorrowRegister.StudentId, StudentName, StudentContact, StudentEmail, StudentSession, Gender, Capacity FROM BorrowRegister inner join Book on BorrowRegister.BookId=Book.BookId inner join Student on BorrowRegister.StudentId=Student.StudentId where BorrowId ="+BorrowId);
				int flag = 0;
				while (rs.next()) {
				bIssueDate = rs.getString(1);
				bid = rs.getString(2);
				bname = rs.getString(3);
				bauthor = rs.getString(4);
				bpublication = rs.getString(5);
				qun = rs.getInt(6);
				bisbn = rs.getString(7);
				sid = rs.getString(8);
				sname = rs.getString(9);
				scontact = rs.getString(10);
				semail = rs.getString(11);
				ssession = rs.getString(12);
				sgender = rs.getString(13);
				cap = rs.getInt(14);
				
				LocalDate ld = LocalDate.parse(bIssueDate);
				DateTimeFormatter outputFormat = DateTimeFormatter.ofPattern("dd-MM-yyyy");
				formatedbIssueDate = ld.format(outputFormat);
				
				flag = 1;
				}
				if (flag == 0) {
				out.println("<script>alert('Book Already Returned.')</script>");
				%>
				<script>
			                window.location.href = "AdminDashboard.jsp";
				</script>
				<%
				}
				if (cap > 0 || qun > 0) {
				flag = 0;
				out.println("<script>alert('Book Already Returned.')</script>");
				%>
				<script>
				                window.location.href = "AdminDashboard.jsp";
				</script>
				<%
				}
				if (flag == 1) {
				
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
				</div>
				<div class="confirm-option">
				<h3>Do you Confirm this Return?</h3>
				<div class="button-group-confirm-option">
					<form
						action="FinalAction.jsp?&b1=Return&BorrowId=<%=BorrowId%>"
						method="post">
						<input type="Submit" value="Yes, I Confirm!">
					</form>
					<form action="Returning.jsp?b1=Search All" method="post">
						<input type="submit" value="No">
					</form>
				</div>
				</div>
				</div>
				<%
				}
				}

		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
	</div>
	</div>
	</div>

</body>
</html>