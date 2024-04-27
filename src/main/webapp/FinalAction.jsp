<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	response.setHeader("Cache-Control", "no-cache, no-store");
	%>
	<%@ page import="java.sql.*"%>
	<%@ page import="java.text.SimpleDateFormat"%>
	<%@ page import="java.util.Date"%>
		<%
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library", "root", "Admin@123");
			
			String btn = request.getParameter("b1");
			
			
			if(btn.equalsIgnoreCase("Issue")){
			
			String bid = request.getParameter("BookId");
			String sid = request.getParameter("StudentId");
			
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT Quantity FROM Book WHERE BookId="+bid);
			if(rs.next() && rs.getInt(1)>0){
			
			Date d = new Date();
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
			PreparedStatement ptmt = con.prepareStatement("INSERT INTO BorrowRegister (BookId, StudentId, IssueDate) VALUES (?,?,?)");
			ptmt.setString(1, bid);
			ptmt.setString(2, sid);
			ptmt.setString(3, sdf.format(d));
			
			//Decreasing Quantity of Book and Capacity of Student
			PreparedStatement ptmt2 = con.prepareStatement("UPDATE Student SET Capacity = Capacity-1 WHERE StudentId="+sid);
			ptmt2.executeUpdate();
			PreparedStatement ptmt3 = con.prepareStatement("UPDATE Book SET Quantity = Quantity-1 WHERE BookId="+bid);
			ptmt3.executeUpdate();
			
			
			int i = ptmt.executeUpdate();
			if(i>0){
				out.println("<video width='320' height='240' autoplay muted>");
	            out.println("<source src='tick.mp4' type='video/mp4'>");
	            out.println("</video>");
	            out.println("<p>Thank You! Book Borrowed.</p>");
	            out.println("<form action='AdminDashboard.jsp'>");
	            out.println("<button type='Submit'>Go To Dashboard</button>");
	            out.println("</form>");
	            out.println("<form action='Logout'>");
	            out.println("<button type='Submit'>Logout</button>");
	            out.println("</form>");
			}
			}
			else{
				out.println("<script>alert('Book Already Issued.')</script>");
				%>
				<script>
		                window.location.href = "AdminDashboard.jsp";
		                </script>
				<%
			}
			}
			
			
			
			if(btn.equalsIgnoreCase("Return")){
				
				String BorrowId = request.getParameter("BorrowId");
				
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery("SELECT Quantity, Capacity, BorrowRegister.BookId, BorrowRegister.StudentId FROM BorrowRegister inner join Book on BorrowRegister.BookId=Book.BookId inner join Student on BorrowRegister.StudentId=Student.StudentId where BorrowId ="+BorrowId);
				if(rs.next() && rs.getInt(1)==0 && rs.getInt(2)==0){
				String bid = rs.getString(3);
				String sid = rs.getString(4);
				
				Date d = new Date();
		        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				
				PreparedStatement ptmt = con.prepareStatement("UPDATE BorrowRegister SET ReturnDate =? WHERE BorrowId="+BorrowId);
				ptmt.setString(1, sdf.format(d));
				
				//Increasing Quantity of Book and Capacity of Student
				PreparedStatement ptmt2 = con.prepareStatement("UPDATE Book SET Quantity = Quantity+1 WHERE BookId="+bid);
				ptmt2.executeUpdate();
				PreparedStatement ptmt3 = con.prepareStatement("UPDATE Student SET Capacity = Capacity+1 WHERE StudentId="+sid);
				ptmt3.executeUpdate();
				
				
				
				int i = ptmt.executeUpdate();
				if(i>0){
					out.println("<video width='320' height='240' autoplay muted>");
		            out.println("<source src='tick.mp4' type='video/mp4'>");
		            out.println("</video>");
		            out.println("<p>Thank You! Book Returned.</p>");
		            out.println("<p>Kindly place this on the library shelf.</p>");
		            out.println("<form action='AdminDashboard.jsp'>");
		            out.println("<button type='Submit'>Go To Dashboard</button>");
		            out.println("</form>");
		            out.println("<form action='Logout'>");
		            out.println("<button type='Submit'>Logout</button>");
		            out.println("</form>");
				}
				}
				else{
					out.println("<script>alert('Book Already Returned.')</script>");
					%>
					<script>
			                window.location.href = "AdminDashboard.jsp";
			                </script>
					<%
				}
				}
			
		}catch(Exception e){
			e.printStackTrace();
		}
			
			
			
	%>
</body>
</html>