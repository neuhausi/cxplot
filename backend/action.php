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

    if($_SERVER['REQUEST_METHOD'] == 'post') {
        $name = $_POST['name'];
        $email = $_POST['email'];
        $message = $_POST['message'];

        $to = 'Gold2003dev@gmail.com';
        $subject = "Contact From Submission";
        $message = "Name: $name\n Email: $email\n Message: $message";
        $headers = 'From:' .$email;

        if(mail($to, $subject, $message, $headers)) {
            echo "Message sent successfully!";
        } else {
            echo "Failed to send Message. Please try again.";
        }
    }
?>
