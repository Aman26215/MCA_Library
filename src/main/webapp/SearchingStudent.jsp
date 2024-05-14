<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Student</title>
</head>
<body>
<jsp:include page="SearchStudent.jsp" />
	
<%@ page import="java.sql.*"%>
<%
String bt = request.getParameter("b1");

if(bt.equalsIgnoreCase("Search Id")) {
    String StudentId1 = request.getParameter("t1");
    String sid = "%"+StudentId1+"%";
    
    try {  
        Class.forName("com.mysql.jdbc.Driver");  
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","Admin@123");  
        
        PreparedStatement pstm = con.prepareStatement("SELECT * FROM Student WHERE StudentId LIKE ?;"); 
        pstm.setString(1, sid);
        
        ResultSet rs = pstm.executeQuery();
                
%>		<div class="scroll">
            <table>
                <tr style="color: indigo;">
                    <th>StudentId</th>
                    <th>Name</th>
                    <th>Contact</th>
                    <th>Email</th>
                    <th>Session</th>
                    <th>Gender</th>
                    <th>Status</th>
                </tr>
                <%
				while (rs.next()) {
				%>
                <tr >
                    <td style='text-align: center;'><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td style='text-align: center;'><%=rs.getString(3)%></td>
                    <td><%=rs.getString(4)%></td>
                    <td><%=rs.getString(5)%></td>
                    <td><%=rs.getString(6)%></td>
                    <td><%if(rs.getInt(7) > 0){%>  <%}else{%>Book Borrowed<%} %></td>
                </tr>
				<%
				}con.close();
				%>
				
			</table>
			</div>
		
			<%
    } catch(Exception e) {
        System.out.println(e);
    }
}
    

if(bt.equalsIgnoreCase("Search")) {
    String StudentName = request.getParameter("t2");
    String sname =  "%"+StudentName+"%";
    
    try {  
        Class.forName("com.mysql.jdbc.Driver");  
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","Admin@123");  
        
        PreparedStatement pstm = con.prepareStatement("SELECT * FROM Student WHERE StudentName LIKE ?;"); 
        pstm.setString(1, sname);
        ResultSet rs = pstm.executeQuery();
        
%>		<div class="scroll">
            <table>
                <tr style="color: indigo;">
                    <th>StudentId</th>
                    <th>Name</th>
                    <th>Contact</th>
                    <th>Email</th>
                    <th>Session</th>
                    <th>Gender</th>
                    <th>Status</th>
                </tr>
                <%
				while (rs.next()) {
				%>
                <tr >
                    <td style='text-align: center;'><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td style='text-align: center;'><%=rs.getString(3)%></td>
                    <td><%=rs.getString(4)%></td>
                    <td><%=rs.getString(5)%></td>
                    <td><%=rs.getString(6)%></td>
                    <td><%if(rs.getInt(7) > 0){%>  <%}else{%>Book Borrowed<%} %></td>
                </tr>
				<%
				}con.close();
				%>
				
			</table>
			</div>
			<%
    
    } catch(Exception e) {
        System.out.println(e);
    }
}











if(bt.equalsIgnoreCase("Search All")) {
    
    try {  
        Class.forName("com.mysql.jdbc.Driver");  
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","Admin@123");  
        
        PreparedStatement pstm = con.prepareStatement("SELECT * FROM Student");
        ResultSet rs = pstm.executeQuery();
        
%>		<div class="scroll">
            <table>
                <tr style="color: indigo;">
                    <th>StudentId</th>
                    <th>Name</th>
                    <th>Contact</th>
                    <th>Email</th>
                    <th>Session</th>
                    <th>Gender</th>
                    <th>Status</th>
                </tr>
                <%
				while (rs.next()) {
				%>
                <tr >
                    <td style='text-align: center;'><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td style='text-align: center;'><%=rs.getString(3)%></td>
                    <td><%=rs.getString(4)%></td>
                    <td><%=rs.getString(5)%></td>
                    <td><%=rs.getString(6)%></td>
                    <td><%if(rs.getInt(7) > 0){%>  <%}else{%>Book Borrowed<%} %></td>
                </tr>
				<%
				}con.close();
				%>
				
			</table>
			</div>
			<%
    } catch(Exception e) {
        System.out.println(e);
    }
}
%>

</body>
</html>
