<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Return Book</title>
</head>
<body>

	<jsp:include page="Return.jsp" />
	<div class="scroll">
	
	<%@ page import="java.sql.*"%>
	<%@ page import="java.time.LocalDate"%>
	<%@ page import="java.time.format.DateTimeFormatter"%>
	<%
	String bt = request.getParameter("b1");
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library", "root", "Admin@123");
	

	if (bt.equalsIgnoreCase("Search By Book")) {
		String bid = request.getParameter("t1");

			PreparedStatement pstm = con.prepareStatement("select BorrowId, BorrowRegister.BookId, BookName, BorrowRegister.StudentId, StudentName, StudentContact, IssueDate, Quantity from BorrowRegister inner join Book on BorrowRegister.BookId=Book.BookId inner join Student on BorrowRegister.StudentId=Student.StudentId where (Quantity = 0 AND BorrowRegister.BookId=?)");
			pstm.setString(1, bid);

			ResultSet rs = pstm.executeQuery();
			int flag=0;
			
			String dd = null;
			DateTimeFormatter outputFormat = DateTimeFormatter.ofPattern("dd-MM-yyyy");
	%>
		<table>
				<tr>
					<th>Borrow No.</th>
					<th>Book Id</th>
					<th>Book Name</th>
					<th>Student Id</th>
					<th>Student Name</th>
					<th>Contact</th>
					<th>Borrow Date</th>
					<th>Link</th>
				</tr>
			<%
			while (rs.next()) {
				flag=1;
				
				dd = rs.getString(7);
				if(dd != null){
				LocalDate ld = LocalDate.parse(dd);
				dd = ld.format(outputFormat);
				}
			%>
				<tr>
					<td style='text-align: center;'><%=rs.getString(1)%></td>
					<td style='text-align: center;'><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td style='text-align: center;'><%=rs.getString(4)%></td>
					<td><%=rs.getString(5)%></td>
					<td><%=rs.getString(6)%></td>
					<td><%=dd%></td>
					<td style='text-align: center;'><a href="Confirmation.jsp?b1=Return&BorrowId=<%=rs.getInt(1)%>">Return</a>
					</td>
				</tr>
			<%
			}
			con.close();
			%>

		</table>
	<%if(flag==0){
				 out.println("<script>alert('Entered Book Id is Not Issued Yet.')</script>");
	                %>
	                <script>
	                window.location.href = "Return.jsp";
	                </script>
	                <%
			}
	} 
	
	
	
	
	
	

	if (bt.equalsIgnoreCase("Search By Student")) {
		String sid = request.getParameter("t2");

			PreparedStatement pstm = con.prepareStatement("select BorrowId, BorrowRegister.BookId, BookName, BorrowRegister.StudentId, StudentName, StudentContact, IssueDate, Quantity from BorrowRegister inner join Book on BorrowRegister.BookId=Book.BookId inner join Student on BorrowRegister.StudentId=Student.StudentId where (Quantity = 0 AND BorrowRegister.StudentId=?)");
			pstm.setString(1, sid);

			ResultSet rs = pstm.executeQuery();
			int flag=0;
			
			String dd = null;
			DateTimeFormatter outputFormat = DateTimeFormatter.ofPattern("dd-MM-yyyy");
	%>
		<table>
				<tr>
					<th>Borrow No.</th>
					<th>Book Id</th>
					<th>Book Name</th>
					<th>Student Id</th>
					<th>Student Name</th>
					<th>Contact</th>
					<th>Borrow Date</th>
					<th>Link</th>
				</tr>
			<%
			while (rs.next()) {
				flag=1;
				
				dd = rs.getString(7);
				if(dd != null){
					LocalDate ld = LocalDate.parse(dd);
					dd = ld.format(outputFormat);
					}
				%>
				<tr>
					<td style='text-align: center;'><%=rs.getString(1)%></td>
					<td style='text-align: center;'><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td style='text-align: center;'><%=rs.getString(4)%></td>
					<td><%=rs.getString(5)%></td>
					<td><%=rs.getString(6)%></td>
					<td><%=dd%></td>
					<td style='text-align: center;'><a href="Confirmation.jsp?b1=Return&BorrowId=<%=rs.getInt(1)%>">Return</a>
					</td>
				</tr>
			<%
			}
			con.close();
			%>

		</table>
	
	<%if(flag==0){
				 out.println("<script>alert('Entered Student has no books now.')</script>");
	                %>
	                <script>
	                window.location.href = "Return.jsp";
	                </script>
	                <%
			}
	} 
	
	
	


	if (bt.equalsIgnoreCase("Search All")) {

			PreparedStatement pstm = con.prepareStatement("select BorrowId, BorrowRegister.BookId, BookName, BorrowRegister.StudentId, StudentName, StudentContact, IssueDate, Quantity from BorrowRegister inner join Book on BorrowRegister.BookId=Book.BookId inner join Student on BorrowRegister.StudentId=Student.StudentId where (Quantity = 0)");

			ResultSet rs = pstm.executeQuery();
			int flag=0;
			
			String dd = null;
			DateTimeFormatter outputFormat = DateTimeFormatter.ofPattern("dd-MM-yyyy");
	%>
	
		<table>
				<tr>
					<th>Borrow No.</th>
					<th>Book Id</th>
					<th>Book Name</th>
					<th>Student Id</th>
					<th>Student Name</th>
					<th>Contact</th>
					<th>Borrow Date</th>
					<th>Link</th>
				</tr>
			<%
			while (rs.next()) {
				flag=1;
				
				dd = rs.getString(7);
				if(dd != null){
					LocalDate ld = LocalDate.parse(dd);
					dd = ld.format(outputFormat);
					}
			%>
				<tr>
					<td style='text-align: center;'><%=rs.getString(1)%></td>
					<td style='text-align: center;'><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td style='text-align: center;'><%=rs.getString(4)%></td>
					<td><%=rs.getString(5)%></td>
					<td><%=rs.getString(6)%></td>
					<td><%=dd%></td>
					<td style='text-align: center;'><a href="Confirmation.jsp?b1=Return&BorrowId=<%=rs.getInt(1)%>">Return</a>
					</td>
				</tr>
			<%
			}
			con.close();
			%>

		</table>
	
	
	<%if(flag==0){%>
				 <p style="color:Red; position: relative; text-align-last: center; font-weight:Bold;">No Borrowed Book Available</p>
				 
	                <%
			}
	} 
	
	}catch (Exception e) {
		System.out.println(e);
		}
	%>
	</div>
</body>
</html>
