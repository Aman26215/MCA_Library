<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
    height: 100vh;
  }
#errorContainer{
    position: relative;
}

  .error-container {
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    text-align: center;
  }

  h1 {
    color: #ff6347;
    font-size: 24px;
  }

  p {
    color: #333;
    font-size: 18px;
  }

  .button-group {
    margin-top: 20px;
  }

  button {
    background-color: #4caf50;
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
<div id="errorContainer">
<img id="errorimg" src="images/error.jpg" class="src">

<div class="error-container">
        <h1>Error - Something Went Wrong</h1>
        <p>Sorry, there is some issue.</p>
        <a href="AdminDashboard.jsp"><button>Back to Dashboard</button></a>
        </div> 
        </div> 
</body>
</html>
