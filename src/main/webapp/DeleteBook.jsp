<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Book</title>
</head>
<body>
	<h1>Delete Book</h1>
    
        <form Action="Confirmation.jsp" method="post">
        	<pre><p>Book Id :           <input type="number"   name="BookId" id="BookId" placeholder="Enter Book Id" required></p></pre>
                      	   
             <input type="Submit" value="Delete Book" name="b1">    <input type="RESET" value="Reset">
        </form>
</body>
</html>