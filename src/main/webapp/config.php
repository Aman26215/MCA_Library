<?php
    $con = mysqli_connect("localhost","root","Admin@123","library");
    
    if(!$con){
        echo "Connection Failed" . mysqli_connect_error();
    }
?>