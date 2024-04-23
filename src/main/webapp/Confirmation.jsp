<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Confirmation Page</title>
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
					<%=session.getAttribute("AdminName")%></p>
				<p>
					__Your Admin Id is :<%=session.getAttribute("AdminId")%></p></li>
		</ul>

		<div id="logo">
			<img src="images/Logo4.png" class="src">
		</div>

	</nav>
	<container>
	<div class="container1">
		<nav id="navbar2">
			<header>
				<img src="images/Logo5.png" class="src2">Menu
			</header>
			<ul class="navul">
				<li class="navli"><a class="nav-link" href="AddStudent.jsp">Add
						Student</a></li>
				<li class="navli"><a class="nav-link" href="SearchStudent.php">Search
						Student</a></li>
				<li class="navli"><a class="nav-link" href="UpdateStudent.jsp">Update
						Student Details</a></li>
				<li class="navli"><a class="nav-link" href="DeleteStudent.jsp">Delete
						Student</a></li>
				<li class="navli"><a class="nav-link" href="AddBook.jsp">Add
						Book</a></li>
				<li class="navli"><a class="nav-link" href="SearchBook.jsp">Search
						Book</a></li>
				<li class="navli"><a class="nav-link"
					href="ViewIssuedDetails.jsp?btn=All">View Issued and Returned
						Book</a></li>
				<li class="navli"><a class="nav-link"
					href="ViewIssuedDetails.jsp?btn=Returned">View Returned Book</a></li>
				<li class="navli"><a class="nav-link"
					href="ViewIssuedDetails.jsp?btn=Issued">Not Returned</a></li>
				<li class="navli"><a class="nav-link"
					href="ViewIssuedDetails.jsp?btn=Issued">Return Book</a></li>
			</ul>
		</nav>
	</div>
	<div class="container2">

		<%@ page import="java.sql.*"%>
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
		<div class="c">
			<h1>Student Details</h1>
			<p>
				Roll No. :
				<%=st1%></p>
			<p>
				Name :
				<%=st2%></p>
			<p>
				Contact :
				<%=st3%></p>
			<p>
				Email :
				<%=st4%></p>
			<p>
				Session :
				<%=st5%></p>
			<p>
				Gender :
				<%=st6%></p>
			<p>Do you Sure Want to Add Student?</p>
			<div class="button-group-c">
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
		<div class="c">
			<h1>New Details of Student</h1>
			<p>
				Roll No. :
				<%=st1%></p>
			<p>
				Name :
				<%=st2%></p>
			<p>
				Contact :
				<%=st3%></p>
			<p>
				Email :
				<%=st4%></p>
			<p>
				Session :
				<%=st5%></p>
			<p>
				Gender :
				<%=st6%></p>
			<p>Do you Sure Want to Update Student Details?</p>
			<div class="button-group-c">
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
		<div class="c">
			<h1>Details of Student</h1>
			<p>
				Roll No. :
				<%=st1%></p>
			<p>
				Name :
				<%=st2%></p>
			<p>
				Contact :
				<%=st3%></p>
			<p>
				Email :
				<%=st4%></p>
			<p>
				Session :
				<%=st5%></p>
			<p>
				Gender :
				<%=st6%></p>
			<p>Do you Sure Want to Delete this Student?</p>
			<div class="button-group-c">
				<form
					action="ActionOnStudent.jsp?&b1=DeleteStudent&RollNo=<%=st1%>"
					method="post">
					<input type="Submit" value="Yes, I Confirm!">
				</form>
				<form action="DeleteStudent.jsp">
					<input type="Submit" value="No" name="b1">
				</form>
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

		if (btn.equalsIgnoreCase("Add Book") || btn.equalsIgnoreCase("Delete Book")) {
		String bt1 = request.getParameter("BookId");
		int bid = Integer.parseInt(bt1);
		String bt2 = request.getParameter("BookName");
		String bt3 = request.getParameter("Author");
		String bt4 = request.getParameter("Publication");

		// Start of Add Book

		if (btn.equalsIgnoreCase("Add Book")) {
		%>
		<div class="c">
			<h1>Book Detail</h1>
			<p>
				Book Id :
				<%=bt1%></p>
			<p>
				Book Name :
				<%=bt2%></p>
			<p>
				Author :
				<%=bt3%></p>
			<p>
				Publication :
				<%=bt4%></p>
			<p>Do you Sure Want to Add this Book?</p>
			<div class="button-group-c">
				<form
					action="ActionOnBook.jsp?&b1=AddBook&BookId=<%=bt1%>&BookName=<%=bt2%>&Author=<%=bt3%>&Publication=<%=bt4%>"
					method="post">
					<input type="Submit" value="Yes, I Confirm!">
				</form>
				<form action="AddBook.jsp">
					<input type="Submit" value="No" name="b1">
				</form>
			</div>
		</div>
		<%
		}
		}

		// End of Add book

		//Issue Book
		if (btn.equalsIgnoreCase("Issue")) {
		String bid = request.getParameter("t1");
		int bid1 = Integer.parseInt(bid);
		String sid = request.getParameter("t2");

		String sname = null, scontact = null, semail = null, ssession = null, sgender = null, bname = null, bauthor = null,
				bpublication = null, bisbn = null;

		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM Student WHERE Studentid=" + sid);
		int flag = 0;
		while (rs.next()) {
		sname = rs.getString(2);
		scontact = rs.getString(3);
		semail = rs.getString(4);
		ssession = rs.getString(5);
		sgender = rs.getString(6);
		flag = 1;
		}
		if (flag == 0) {
		out.println("<script>alert('Student Does Not Exist.')</script>");
		%>
		<script>
	                window.location.href = "IssueBook.jsp?BookId=<%=bid%>
			";
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
		<div class="c">
			<h1>Book Detail</h1>
			<p>
				Book Id :
				<%=bid%></p>
			<p>
				Book Name :
				<%=bname%></p>
			<p>
				Author :
				<%=bauthor%></p>
			<p>
				Publication :
				<%=bpublication%></p>
			<p>
				ISBN No. :
				<%=bisbn%></p>
		</div>
		<div class="c">
			<h1>Student Detail</h1>
			<p>
				Student Id :
				<%=sid%></p>
			<p>
				Student Name :
				<%=sname%></p>
			<p>
				Contact :
				<%=scontact%></p>
			<p>
				Email :
				<%=semail%></p>
			<p>
				Session :
				<%=ssession%></p>
			<p>
				Gender :
				<%=sgender%></p>
		</div>
		<p>Do you Sure Want to Issue this Book to above Student?</p>
		<div class="button-group-c">
			<form
				action="Issuing.jsp?&b1=Issue&BookId=<%=bid%>&StudentId=<%=sid%>"
				method="post">
				<input type="Submit" value="Yes, I Confirm!">
			</form>
			<form action="IssueBook.jsp?BookId=<%=bid%>" method="post">
				<input type="submit" value="No">
			</form>
		</div>
		<%
		}
		}

		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
	</div>

	</container>

</body>
</html>