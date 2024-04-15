<?php
// include("config.php");
if(isset($_POST['input'])){
    echo "<h1>Logged in!</h1>";
    
    $con = mysqli_connect("localhost","root","Admin@123","library");
    if ($con) {
        echo "<h1>Logged in!</h1>";
    } else {
        die("Sorry! Something went wrong.");
    }
    
    $input = $_POST['input'];
    
    $query = "SELECT * FROM Student WHERE StudentName LIKE CONCAT(?, '%')";
    $stmt = mysqli_prepare($con, $query);
    mysqli_stmt_bind_param($stmt, "s", $input);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    
    if(mysqli_num_rows($result) > 0) {
        ?>
        <table class="t">
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
                while($row = mysqli_fetch_assoc($result)) {
                    $sid = $row['StudentId'];
                    $name = $row['StudentName'];
                    $contact = $row['StudentContact'];
                    $email = $row['StudentEmail'];
                    $session = $row['StudentSession'];
                    $gender = $row['Gender'];
                ?>
                    <tr>
                        <td><?php echo $sid; ?></td>
                        <td><?php echo $name; ?></td>
                        <td><?php echo $contact; ?></td>
                        <td><?php echo $email; ?></td>
                        <td><?php echo $session; ?></td>
                        <td><?php echo $gender; ?></td>
                    </tr>
                <?php 
                }
                ?>
            </tbody>
        </table>
<?php 
    } else {
        echo "<h6 class='text-danger text-center mt-3'>No data Found</h6>";
    }
}
?>
