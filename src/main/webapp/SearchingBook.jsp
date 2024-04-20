<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Book</title>
<link rel="stylesheet" href="css/Dashboard.css">
</head>
<body>
<jsp:include page="SearchBook.jsp" />
	
<%@ page import="java.sql.*"%>
<%
String bt = request.getParameter("b1");

if(bt.equalsIgnoreCase("Search Id")) {
    String BookId1 = request.getParameter("t1");
    String bid = "%"+BookId1+"%";
    
    try {  
        Class.forName("com.mysql.jdbc.Driver");  
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","Admin@123");  
        
        PreparedStatement pstm = con.prepareStatement("SELECT * FROM Book WHERE BookId LIKE ?;"); 
        pstm.setString(1, bid);
        
        ResultSet rs = pstm.executeQuery();
                
%>		<div class="scroll">
            <table border=1>
                <tr>
                    <th>BookId</th>
                    <th>Book Name</th>
                    <th>Author</th>
                    <th>Publication</th>
                    <th>ISBN No.</th>
                    <th>Order Received</th>
                </tr>
                <%
				while (rs.next()) {
				%>
                <tr>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(4)%></td>
                    <td><%=rs.getString(6)%></td>
                    <td><%=rs.getString(7)%></td>
                </tr>
				<%
				}con.close();
				%>
				
			</table></div>
			<%
    } catch(Exception e) {
        System.out.println(e);
    }
}
    

if(bt.equalsIgnoreCase("Search Name")) {
    String BookName = request.getParameter("t2");
    String bname =  "%"+BookName+"%";
    
    try {  
        Class.forName("com.mysql.jdbc.Driver");  
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","Admin@123");  
        
        PreparedStatement pstm = con.prepareStatement("SELECT * FROM Book WHERE BookName LIKE ?;"); 
        pstm.setString(1, bname);
        ResultSet rs = pstm.executeQuery();
        
%>		<div class="scroll">
            <table border=1>
                <tr>
                    <th>BookId</th>
                    <th>Book Name</th>
                    <th>Author</th>
                    <th>Publication</th>
                    <th>ISBN No.</th>
                    <th>Order Received</th>
                </tr>
                <%
				while (rs.next()) {
				%>
                <tr>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(4)%></td>
                    <td><%=rs.getString(6)%></td>
                    <td><%=rs.getString(7)%></td>
                </tr>
				<%
				}con.close();
				%>
				
			</table></div>
			<%
    
    } catch(Exception e) {
        System.out.println(e);
    }
}


if(bt.equalsIgnoreCase("Search All")) {
    
    try {  
        Class.forName("com.mysql.jdbc.Driver");  
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","Admin@123");  
        
        PreparedStatement pstm = con.prepareStatement("SELECT * FROM Book");
        ResultSet rs = pstm.executeQuery();
        
%>		<div class="scroll">
            <table border=1>
                <tr>
                    <th>BookId</th>
                    <th>Book Name</th>
                    <th>Author</th>
                    <th>Publication</th>
                    <th>ISBN No.</th>
                    <th>Order Received</th>
                </tr>
                <%
				while (rs.next()) {
				%>
                <tr>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(4)%></td>
                    <td><%=rs.getString(6)%></td>
                    <td><%=rs.getString(7)%></td>
                </tr>
				<%
				}con.close();
				%>
				
			</table></div>
			<%
    } catch(Exception e) {
        System.out.println(e);
    }
}
%>

</body>
</html>
