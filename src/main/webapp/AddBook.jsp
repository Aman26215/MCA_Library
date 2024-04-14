<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Book</title>
</head>
<body>
	<h1>Add New Book</h1>
    
        <form Action="Confirmation.jsp" method="post">
        	<pre><p>Book Id :           <input type="number"   name="BookId" id="BookId" placeholder="Enter Book Id" required></p></pre>
            <pre><p>Book Name :              <input type="text" size="50" name="BookName" id="BookName" placeholder="Enter Book Name" required></p></pre>
            <pre><p>Author :           <input type="text" size="50" name="Author" id="Author" placeholder="Enter Author Name" required></p></pre>
            <pre><p>Publication :        <input type="text" size="50" name="Publication" id="Publication" placeholder="Publication Name" required></p></pre>
                      	   
             <input type="Submit" value="Add Book" name="b1">    <input type="RESET" value="Reset">
        </form>
</body>
</html>