<?php
include("config.php");

if(isset($_POST['input'])){
    $input = $_POST['input'];
    
    // Using prepared statement to prevent SQL injection
    $query = "SELECT * FROM Student WHERE StudentId = 101";
    $stmt = mysqli_prepare($con, $query);
    
    // Check if the prepared statement was successful
    if ($stmt) {
        // Bind the input parameter to the statement
        mysqli_stmt_bind_param($stmt, "s", $inputWithWildcard);
        
        // Add '%' around the input for LIKE query
        $inputWithWildcard = '%' . $input . '%';
        
        // Execute the statement
        mysqli_stmt_execute($stmt);
        
        // Get the result set
        $result = mysqli_stmt_get_result($stmt);
        
        if(mysqli_num_rows($result) > 0){
            ?>
            <table border="1">
                <thead>
                    <tr>
                        <th>Student Id</th>
                        <th>Name</th>
                        <th>Contact</th>
                        <th>Email</th>
                        <th>Session</th>
                        <th>Gender</th>                        
                    </tr>
                </thead>
                
                <tbody>
<?php 
                    while($row = mysqli_fetch_assoc($result)){
                        $sid = $row['StudentId'];
                        $name = $row['StudentName'];
                        $contact = $row['StudentContact'];
                        $email = $row['StudentEmail'];
                        $session = $row['StudentSession'];
                        $gender = $row['Gender'];
?>
                        <tr>
                            <td><?php echo $sid;?></td>
                            <td><?php echo $name;?></td>
                            <td><?php echo $contact;?></td>
                            <td><?php echo $email;?></td>
                            <td><?php echo $session;?></td>
                            <td><?php echo $gender;?></td>
                        </tr>
<?php 
                    }
?>
                </tbody>
            </table>
<?php 
        } else {
            echo "Student Id\tName\tContact\tEmail\tSession\tGender<br>";
            echo "No Data Found";
        }
        
        // Close the statement
        mysqli_stmt_close($stmt);
    }
}
?>
