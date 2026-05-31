<?php
session_start();

if (!isset($_SESSION['user_id'])) {
    header("Location: auth/login.php");
    exit();
}

include 'includes/connection.php';

$user_id = $_SESSION['user_id'];
$pokemon_id = $_GET['id'];

$check_sql = "SELECT *
              FROM pokemon_votes
              WHERE pokemon_id='$pokemon_id'
              AND user_id='$user_id'";

$check_result = mysqli_query($conn, $check_sql);

if (mysqli_num_rows($check_result) == 0) {

    $vote_sql = "INSERT INTO pokemon_votes
                 (pokemon_id, user_id)
                 VALUES
                 ('$pokemon_id', '$user_id')";

    mysqli_query($conn, $vote_sql);

    $update_sql = "UPDATE pokemon
                   SET upvotes = upvotes + 1
                   WHERE id='$pokemon_id'";

    mysqli_query($conn, $update_sql);
}

header("Location: index.php");
exit();
?>