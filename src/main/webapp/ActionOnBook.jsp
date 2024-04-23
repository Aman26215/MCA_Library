<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Management</title>
</head>
<body>
	<%@ page import="java.sql.*"%>

<% 
String btn = request.getParameter("b1");

String bt1 = request.getParameter("BookId");
int bid = Integer.parseInt(bt1);
String bt2 = request.getParameter("BookName");
String bt3 = request.getParameter("Author");
String bt4 = request.getParameter("Publication");
String bt5 = request.getParameter("ISBN");
String bt6 = request.getParameter("Date");

try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library", "root", "Admin@123");

    // Add Book
    
    
    if(btn.equalsIgnoreCase("AddBook")){
        try{
            PreparedStatement pstm = con.prepareStatement(
                    "INSERT INTO Book (BookId, BookName, Author, Publication, ISBN_No, OrderReceivedDate) VALUES (?,?,?,?, ?, ?)");
            pstm.setString(1, bt1);
            pstm.setString(2, bt2);
            pstm.setString(3, bt3);
            pstm.setString(4, bt4);
            pstm.setString(5, bt5);
            pstm.setString(6, bt6);
            
            int i = pstm.executeUpdate();
            
            if(i > 0){
                out.println("<script>alert('Book Added Successfully.')</script>");
                %>
                <script>
                window.location.href = "AddBook.jsp";
                </script>
                <%
            } else {
                out.println("<script>alert('Book with this Id Already Exists.')</script>");
                %>
                <script>
                window.location.href = "AddBook.jsp";
                </script>
                <%
            }
        } catch(Exception e){
            e.printStackTrace();
            out.println("<script>alert('Book with this Id Already Exists.')</script>");
            %>
            <script>
            window.location.href = "AddBook.jsp";
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