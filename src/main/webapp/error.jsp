<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/Dashboard.css">
<style>
body{
    font-family: Arial, sans-serif;
    background-color: lavender;
    height: 100vh;
  }
  
 .error-container {
    background-color: antiquewhite;
    text-align: center;
  }

h1{
    color: #ff6347;
    font-size: 24px;

}

p{
    color: #333;
    font-size: 18px;
}

button{
    background-color: deepskyblue;
    color: #fff;
    border: none;
    padding: 10px 20px;
    font-size: 16px;
    cursor: pointer;
    border-radius: 5px;
    transition: background-color 0.3s;
  }

button:hover {
    background-color: #45a049;
  }
</style>

</head>

<body>

<div class="error-container">
       
        <h1>Error - Something Went Wrong</h1>
        <p>Sorry, there is some issue.</p>
        <a href="AdminDashboard.jsp"><button>Back to Dashboard</button></a>
</div> 
   
</body>
</html>
