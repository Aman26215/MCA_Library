<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Student</title>
<link rel="stylesheet" href="css/HomePageStyle.css">
<link rel="stylesheet" href="css/Dashboard.css">
</head>
<body>
<nav id="navbar">
		<div id="logo">
			<img src="images/Logo1.jpg" alt="StackLab.com" class="src">
		</div>
		<ul>

			<li class="item"><p>
		
			
		</ul>
		
		<div id="logo">
			<img src="images/Logo4.png" class="src">
		</div>
		
	</nav>
	
	
<container>
<div class="container1">
		<nav id="navbar2">
        <header><img src="images/Logo5.png" class="src2" >Menu</header>
        <ul class="navul">
        	<li class="navli"><a class="nav-link" href="AddStudent.jsp">Add Student</a></li>
            <li class="navli"><a class="nav-link" href="UpdateStudent.jsp">Update Student Details</a></li>
            <li class="navli"><a class="nav-link" href="DeleteStudent.jsp">Delete Student</a></li>
            <li class="navli"><a class="nav-link" href="AddBook.jsp">Add Book</a></li>
            <li class="navli"><a class="nav-link" href="DeleteBook.jsp">Delete Book</a></li>
            <li class="navli"><a class="nav-link" href="SearchBook.jsp">Search Book</a></li>
            <li class="navli"><a class="nav-link" href="ViewIssuedDetails.jsp?btn=All">View Issued and Returned Book</a></li>
            <li class="navli"><a class="nav-link" href="ViewIssuedDetails.jsp?btn=Returned">View Returned Book</a></li>
            <li class="navli"><a class="nav-link" href="ViewIssuedDetails.jsp?btn=Issued">View Issued</a></li>
        </ul>
    </nav>
    </div>

<div class="container2">
		<div id="f">
			<h1>Search Student</h1>
    		<input type="text" class="form-control" id="LiveSearch" autocomplete="off" placeholder="Enter Student Name"></input>
        </div>
        
        <div id="searchresult" class="table-content">
        
        
        </div>
</div>
        </container>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script type="text/javascript">
    $(document).ready(function(){
        $("#LiveSearch").keyup(function(){
            var input = $(this).val();
            
		if(input != ""){
                
                $.ajax({
                    url: "LiveSearchStudent.php",
                    method: "POST",
                    data: {input: input},
                    success: function(data){
                        $("#searchresult").html(data);
                    },
                    error: function(jqXHR, textStatus, errorThrown){
                        console.log("AJAX Error:", textStatus, errorThrown);
                        alert("There was an error processing your request. Please try again.");
                    }
                });
            } else {
                $("#searchresult").css("display", "none");
            }
        });
    });
</script>

</body>
</html>