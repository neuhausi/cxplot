<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "cxplot";
// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
$conn->set_charset("utf8");
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
