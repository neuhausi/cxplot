<?php
    include("db.php");
    session_start();

    if($_POST['type'] == 'login') {

        $userEmail = $_POST['userEmail'];
        $password = $_POST['password'];
        $sql = "SELECT * FROM users WHERE email = '" . $userEmail . "'";
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {
            // output data of each row
            while($row = $result->fetch_assoc()) {
                if(password_verify($password, $row['password'])) {
                    $_SESSION['userEmail'] = $userEmail;
                    echo json_encode("SUCCESS");
                } else {
                    echo json_encode("Error");
                }
            }
        }
		$conn->close();
    }
    
    if($_POST['type'] == 'register') {
        $registerName = $_POST['registerName'];
        $registerEmail = $_POST['registerEmail'];
        $registerPassword = $_POST['registerPassword'];
        $hashedPassword = password_hash($registerPassword, PASSWORD_DEFAULT);
        $sql = "INSERT INTO `users` (`name`, `email`, `password`) VALUES ('" . $registerName . "', '" . $registerEmail . "', '" . $hashedPassword . "');";
        $result = $conn->query($sql);
		if ($result> 0) {			
			$_SESSION['userEmail'] = $registerEmail;
            $_SESSION['password'] = $registerPassword;
			echo "SUCCESS";
		} else{
			echo "Error";
        }
        $conn->close();
    }
?>
