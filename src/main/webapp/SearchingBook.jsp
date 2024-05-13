<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Book</title>
<link rel="stylesheet" href="css/NewDashboard.css">
</head>
<body>
	
	<div class="container2-search">
		<jsp:include page="SearchBook.jsp" />

		<%@ page import="java.sql.*"%>
		<%
		String bt = request.getParameter("b1");

		if (bt.equalsIgnoreCase("Search Id")) {
			String BookId1 = request.getParameter("t1");
			String bid = "%" + BookId1 + "%";

			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library", "root", "Admin@123");

				PreparedStatement pstm = con.prepareStatement("SELECT * FROM Book WHERE BookId LIKE ?;");
				pstm.setString(1, bid);

				ResultSet rs = pstm.executeQuery();
		%>
		<div class="scroll">
			<table>
				<tr style="color: indigo;">
					<th>BookId</th>
					<th>Book Name</th>
					<th>Author</th>
					<th>Publication</th>
					<th>ISBN No.</th>
					<th>Order Received</th>
					<th>Link</th>
				</tr>
				<%
				while (rs.next()) {
				%>
				<tr style="width: 10px">
					<td style='width: 3%; text-align: center;'><%=rs.getString(1)%></td>
					<td style='width: 12%'><%=rs.getString(2)%></td>
					<td style='width: 12%'><%=rs.getString(3)%></td>
					<td style='width: 12%'><%=rs.getString(4)%></td>
					<td style='width: 6%'><%=rs.getString(6)%></td>
					<td style='width: 6%'><%=rs.getString(7)%></td>
					<td style='width: 6%'>
						<%
						if (rs.getInt(5) > 0) {
						%> <a
						href="IssueBook.jsp?BookId=<%=rs.getInt(1)%>">Issue</a> <%
 } else {
 %>Book
						Already Issued<%
 }
 %>
					</td>
				</tr>

				<%
				}
				con.close();
				%>

			</table>
		</div>
		<%
		} catch (Exception e) {
		System.out.println(e);
		}
		}

		if (bt.equalsIgnoreCase("Search")) {
		String BookName = request.getParameter("t2");
		String bname = "%" + BookName + "%";

		try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library", "root", "Admin@123");

		PreparedStatement pstm = con.prepareStatement("SELECT * FROM Book WHERE BookName LIKE ?;");
		pstm.setString(1, bname);
		ResultSet rs = pstm.executeQuery();
		%>
		<div class="scroll">
			<table>
				<tr style="color: indigo;">
					<th>BookId</th>
					<th>Book Name</th>
					<th>Author</th>
					<th>Publication</th>
					<th>ISBN No.</th>
					<th>Order Received</th>
					<th>Link</th>
				</tr>
				<%
				while (rs.next()) {
				%>
				<tr style="width: 10px">
					<td style='width: 3%; text-align: center;'><%=rs.getString(1)%></td>
					<td style='width: 12%'><%=rs.getString(2)%></td>
					<td style='width: 12%'><%=rs.getString(3)%></td>
					<td style='width: 12%'><%=rs.getString(4)%></td>
					<td style='width: 6%'><%=rs.getString(6)%></td>
					<td style='width: 6%'><%=rs.getString(7)%></td>
					<td style='width: 6%'>
						<%
						if (rs.getInt(5) > 0) {
						%> <a
						href="IssueBook.jsp?BookId=<%=rs.getInt(1)%>">Issue</a> <%
 } else {
 %>Book
						Already Issued<%
 }
 %>
					</td>
				</tr>
				<%
				}
				con.close();
				%>

			</table>
		</div>
		<%
		} catch (Exception e) {
		System.out.println(e);
		}
		}

		if (bt.equalsIgnoreCase("Search All")) {

		try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library", "root", "Admin@123");

		PreparedStatement pstm = con.prepareStatement("SELECT * FROM Book");
		ResultSet rs = pstm.executeQuery();
		%>
		<div class="scroll">
			<table>
				<tr style="color: indigo;">
					<th>BookId</th>
					<th>Book Name</th>
					<th>Author</th>
					<th>Publication</th>
					<th>ISBN No.</th>
					<th>Order Received</th>
					<th>Link</th>
				</tr>
				<%
				while (rs.next()) {
				%>
				<tr style="width: 10px">
					<td style='width: 3%; text-align: center;'><%=rs.getString(1)%></td>
					<td style='width: 12%'><%=rs.getString(2)%></td>
					<td style='width: 12%'><%=rs.getString(3)%></td>
					<td style='width: 12%'><%=rs.getString(4)%></td>
					<td style='width: 6%'><%=rs.getString(6)%></td>
					<td style='width: 6%'><%=rs.getString(7)%></td>
					<td style='width: 6%'>
						<%
						if (rs.getInt(5) > 0) {
						%> <a
						href="IssueBook.jsp?BookId=<%=rs.getInt(1)%>">Issue</a> <%
 } else {
 %>Book
						Already Issued<%
 }
 %>
					</td>
				</tr>
				<%
				}
				con.close();
				%>

			</table>
		</div>
		<%
		} catch (Exception e) {
		System.out.println(e);
		}
		}
		%>
	</div>
</body>
</html>
