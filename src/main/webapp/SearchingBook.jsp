<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Book</title>
</head>
<body>
	
	
		<jsp:include page="SearchBook.jsp" />

		<%@ page import="java.sql.*"%>
		<%@ page import="java.time.LocalDate"%>
		<%@ page import="java.time.format.DateTimeFormatter"%>
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
				
				String dd = null;
				DateTimeFormatter outputFormat = DateTimeFormatter.ofPattern("dd-MM-yyyy");
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
					dd = rs.getString(7);
					if(dd != null){
						LocalDate ld = LocalDate.parse(dd);
						dd = ld.format(outputFormat);
						}
				%>
				<tr>
					<td style='width: 3%; text-align: center;'><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>
					<td><%=rs.getString(6)%></td>
					<td><%=dd%></td>
					<td style='text-align: center;'>
						<%
						if (rs.getInt(5) > 0) {
						%> <a
						href="IssueBook.jsp?BookId=<%=rs.getInt(1)%>">Issue</a> <%
 } else {
 %><p style="color:red">Book Already Issued</p><%
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
		
		String dd = null;
		DateTimeFormatter outputFormat = DateTimeFormatter.ofPattern("dd-MM-yyyy");
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
					dd = rs.getString(7);
					if(dd != null){
						LocalDate ld = LocalDate.parse(dd);
						dd = ld.format(outputFormat);
						}
				%>
				<tr>
					<td style='text-align: center;'><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>
					<td><%=rs.getString(6)%></td>
					<td><%=dd%></td>
					<td style='text-align: center;'>
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
		
		String dd = null;
		DateTimeFormatter outputFormat = DateTimeFormatter.ofPattern("dd-MM-yyyy");
		
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
					dd = rs.getString(7);
					if(dd != null){
						LocalDate ld = LocalDate.parse(dd);
						dd = ld.format(outputFormat);
						}
				%>
				
				<tr>
					<td style='text-align: center;'><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>
					<td><%=rs.getString(6)%></td>
					<td><%=dd%></td>
					<td style='text-align: center;'>
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
	
</body>
</html>
