<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Management</title>
</head>
<body>

<%@ page import="java.sql.*"%>

<% 
String btn = request.getParameter("b1");

String st1 = request.getParameter("RollNo");
long sid = Long.parseLong(st1);
String st2 = request.getParameter("Name");
String st3 = request.getParameter("Contact");
String st4 = request.getParameter("Email");
String st5 = request.getParameter("StudentSession");
String st6 = request.getParameter("Gender");

try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library", "root", "Admin@123");

    // Add Student
    if(btn.equalsIgnoreCase("AddStudent")){
        try{
            PreparedStatement pstm = con.prepareStatement(
                    "INSERT INTO Student (StudentId, StudentName, StudentContact, StudentEmail, StudentSession, Gender) VALUES (?,?,?,?,?,?)");
            pstm.setString(1, st1);
            pstm.setString(2, st2);
            pstm.setString(3, st3);
            pstm.setString(4, st4);
            pstm.setString(5, st5);
            pstm.setString(6, st6);
            
            int i = pstm.executeUpdate();
            
            if(i > 0){
                out.println("<script>alert('Student Added Successfully.')</script>");
                %>
                <script>
                window.location.href = "AddStudent.jsp";
                </script>
                <%
            } else {
                out.println("<script>alert('Student with this Id Already Exists.')</script>");
                %>
                <script>
                window.location.href = "AddStudent.jsp";
                </script>
                <%
            }
        } catch(Exception e){
            out.println("<script>alert('Student with this Id Already Exists.')</script>");
            %>
            <script>
            window.location.href = "AddStudent.jsp";
            </script>
            <%
        }
    }
    
    // Update Student
    
    if(btn.equalsIgnoreCase("UpdateStudent")){
        try{
                        
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT StudentId FROM Student");
            
            boolean b = false;
            
            while(rs.next()) {
                long val = rs.getLong(1);
                
                if(val == sid) {
                    if(!st2.isEmpty()) {
                        PreparedStatement pstm = con.prepareStatement("UPDATE Student SET StudentName = ? WHERE StudentId = ?");
                        pstm.setString(1, st2);
                        pstm.setLong(2, sid);
                        pstm.executeUpdate();
                    }
                    
                    if(!st3.isEmpty()) {
                        PreparedStatement pstm = con.prepareStatement("UPDATE Student SET StudentContact = ? WHERE StudentId = ?");
                        pstm.setString(1, st3);
                        pstm.setLong(2, sid);
                        pstm.executeUpdate();
                    }
                    
                    if(!st4.isEmpty()) {
                        PreparedStatement pstm = con.prepareStatement("UPDATE Student SET StudentEmail = ? WHERE StudentId = ?");
                        pstm.setString(1, st4);
                        pstm.setLong(2, sid);
                        pstm.executeUpdate();
                    }
                    
                    if(!st5.isEmpty()) {
                        PreparedStatement pstm = con.prepareStatement("UPDATE Student SET StudentSession = ? WHERE StudentId = ?");
                        pstm.setString(1, st5);
                        pstm.setLong(2, sid);
                        pstm.executeUpdate();
                    }
                    
                    if(!st6.isEmpty()) {
                        PreparedStatement pstm = con.prepareStatement("UPDATE Student SET Gender = ? WHERE StudentId = ?");
                        pstm.setString(1, st6);
                        pstm.setLong(2, sid);
                        pstm.executeUpdate();
                    }
                    
                    out.println("<script>alert('Updated Successfully.')</script>");
                    b = true;
                    %>
                    <script>
                    window.location.href = "UpdateStudent.jsp";
                    </script>
                    <%
                    break;
                }
            }
            
            if(b==false){
                out.println("<script>alert('Student Does Not Exist.')</script>");
                %>
                <script>
                window.location.href = "UpdateStudent.jsp";
                </script>
                <%
            }
        } catch(Exception e){
            e.printStackTrace();
        }
    }
    

	// Delete Student
    
	if(btn.equalsIgnoreCase("DeleteStudent")){
		
		Statement stmt = con.createStatement();
		int i = stmt.executeUpdate("DELETE FROM Student WHERE StudentId="+sid);
		
		if(i>0){
			out.println("<script>alert('Deleted Successfully.')</script>");
       
            %>
            <script>
            window.location.href = "DeleteStudent.jsp";
            </script>
            <%
		}else{
			out.println("<script>alert('Something Went Wrong.')</script>");
		       
            %>
            <script>
            window.location.href = "DeleteStudent.jsp";
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
