<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form Action="ActionOnStudent.jsp" method="post">
            
            <pre><p>Student Roll No.:           <input type="number"   name="Roll No" id="RollNo" placeholder="Enter University Roll No." required></p></pre>
            <pre><p>Student Name:              <input type="text" size="50" name="Name" id="Name" placeholder="Enter your name" required></p></pre>
            <pre><p>Student Contact:           <input type="number" min=1000000000 max=9999999999 name="Contact" id="Contact" placeholder="Enter your Contact number" required></p></pre>
            <pre><p>Student E-mail Id:         <input type="email" size="50" name="Email" id="Email" placeholder="Enter your email id" required></p></pre>
            <pre><p>Session :         <input type="text" size="50" name="session" id="session" placeholder="Enter Session" required></p></pre>
            <pre><label for="Gender" >Gender :                  <input class="inline" type="radio" name="Gender" value="Male" checked>Male <input class="inline" type="radio" name="Gender" value="Female"/>Female <input class="inline" type="radio" name="Gender" value="Other"/>Other</label></pre>
            
             <input type="SUBMIT" value="Update Student" name="b1">    <input type="RESET" value="RESET">
        </form>
        
        <script>
        function showConfirmation() {
            var result = confirm("Are you sure you want to proceed?");
            if (result) {
            	request.setAttribute("name", request.getAttribute("t1")) ;
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/ActionOnStudent.jsp");
                rd.forward(request, response);
            } else {
                alert("Cancelled!");
            }
        }
    </script>
        
</body>
</html>