<?php
include("db.php");
session_start();
if ($_POST['type'] == 'blog_read') {
  $sql = "SELECT * FROM `blogs`";
  $data = [];
  $result = $conn->query($sql);
  if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
      $res = [
        'id' => $row['id'],
        'title' => $row['title'],
        'description' => $row['description'],
        'picture' => $row['picture'],
        'created_at' => $row['created_at'],
      ];
      array_push($data, $res);
    }
    echo json_encode($data);
  }
  $conn->close();
}
