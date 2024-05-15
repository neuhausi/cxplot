<?php
    include("db.php");
    session_start();
    if($_POST['type'] == 'blogPost') {
        $currentlyDate = date("F j Y H:i:s");
        $currentlyTime = date("H:i:s");
        $sql = "INSERT INTO `blogs` (`title`, `description`, `picture`, `created_at`) VALUES ('" . $_POST['blogTitle'] . "', '" . $_POST['blogDescription'] . "', '" . $_POST['imageValue'] . "', '" . $currentlyDate . "') ";
        $result = $conn->query($sql);
        if($result > 0) {
            echo "SUCCESS";
        }else {
            echo "ERROR";
        }
    }

    if($_POST['type'] == 'blog_read') {
        $sql = "SELECT * FROM `blogs`";
        $data = [];
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {
            // output data of each row
            while($row = $result->fetch_assoc()) {
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
?>