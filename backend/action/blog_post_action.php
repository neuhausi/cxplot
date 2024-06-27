<?php
include("db.php");
session_start();
$file = $_FILES['file'];
$upload_dir = '../uploads/';
$filePath = $upload_dir . $file['name'];
move_uploaded_file($file['tmp_name'], $filePath);
$currentlyDate = date("F j Y H:i:s");
$currentlyTime = date("H:i:s");
$stmt = $conn->prepare("INSERT INTO `blogs` (`title`, `description`, `picture`, `created_at`) VALUES (?, ?, ?, ?) ");
$stmt->bind_param("ssss", $_POST['blog-title'], $_POST['blog-description'], $filePath, $currentlyDate);
$result = $stmt->execute();
if ($result > 0) {
  header('Location: ../blog/blog.php');
} else {
  echo "ERROR";
}
