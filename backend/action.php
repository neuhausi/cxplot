<?php
    include("db.php");
    session_start();

    if($_POST['type'] == 'login') {

        $userEmail = $_POST['userEmail'];
        $password = $_POST['password'];
        $sql = "SELECT * FROM users WHERE email = '" . $userEmail . "' AND password = '" . $password . "'";
        $result = $conn->query($sql);

		if ($result->num_rows > 0) {			
			$_SESSION['userEmail'] = $userEmail;
			echo json_encode("SUCCESS");
		} else{
			echo json_encode("Error");
        }
       
		$conn->close();
    }

?>
