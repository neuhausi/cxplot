<?php
include("db.php");
session_start();
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
  $toName = $_POST['name'];
  $toEmail = $_POST['email'];
  $toSubject = $_POST['subject'];
  $toMessage = $_POST['message'];
  $to = "imnphd@gmail.com";
  $subject = $toSubject;
  $message = "Name: $toName\n Email: $toEmail\n Message: $toMessage";
  $headers = 'From:' . $toEmail;
  try {
    //code...
    ini_set('SMTP', 'imnphd@gmail.com');
    ini_set('smtp_port', 587);
    if (mail($to, $subject, $message, $headers)) {
      echo "Message sent successfully!";
    } else {
      echo "Failed to send Message. Please try again.";
    }
  } catch (\Throwable $th) {
    //throw $th;
    // echo $th->getMessage();
  }
}
