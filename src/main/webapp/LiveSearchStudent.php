<?php
$search_value = $_POST["input"];
$con = mysqli_connect("localhost","root","","test") or die("Connection Failed");
$query = "SELECT * FROM Student WHERE StudentName LIKE '%{$search_value}%'";
$result = mysqli_query($con, $query) or die("SQL Query Failed.");
$output = "";


        if(mysqli_num_rows($result) > 0){
           $output = '
            <table border="1" width="100%" cellspacing="0" cellpadding="10px">
               
                    <tr>
                        <th>Student Id</th>
                        <th>Name</th>
                        <th>Contact</th>
                        <th>Email</th>
                        <th>Session</th>
                        <th>Gender</th>                        
                    </tr>';
          
                    while($row = mysqli_fetch_assoc($result)){
                        
                        $output .= "<tr>
                                        <td align='center'>{$row["StudentId"]}</td>
                                        <td align='center'>{$row["StudentName"]}</td>
                                        <td align='center'>{$row["StudentContact"]}</td>
                                        <td align='center'>{$row["StudentEmail"]}</td>
                                        <td align='center'>{$row["StudentSession"]}</td>
                                        <td align='center'>{$row["Gender"]}</td>
                                        </tr>";
                    }
                    $output .= "</table>";
                    
                    mysqli_close($con);
                    
                    echo $output;
                        
        } else {
            
            echo "No Data Found";
        }
?>
