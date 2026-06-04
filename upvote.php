<?php
session_start();
header('Content-Type: application/json'); // Tell browser we are sending JSON data back

if (!isset($_SESSION['user_id'])) {
    echo json_encode(['success' => false, 'error' => 'Not logged in']);
    exit();
}

include 'includes/connection.php';

$user_id = $_SESSION['user_id'];
$pokemon_id = mysqli_real_escape_string($conn, $_GET['id']);

$check_sql = "SELECT * FROM pokemon_votes WHERE pokemon_id='$pokemon_id' AND user_id='$user_id'";
$check_result = mysqli_query($conn, $check_sql);

// If no vote exists, ADD it
if (mysqli_num_rows($check_result) == 0) {
    $vote_sql = "INSERT INTO pokemon_votes (pokemon_id, user_id) VALUES ('$pokemon_id', '$user_id')";
    mysqli_query($conn, $vote_sql);

    $update_sql = "UPDATE pokemon SET upvotes = upvotes + 1 WHERE id='$pokemon_id'";
    mysqli_query($conn, $update_sql);
    
    $action = 'added';
} 
// Else REMOVE it
else {
    $delete_vote_sql = "DELETE FROM pokemon_votes WHERE pokemon_id='$pokemon_id' AND user_id='$user_id'";
    mysqli_query($conn, $delete_vote_sql);

    $update_sql = "UPDATE pokemon SET upvotes = upvotes - 1 WHERE id='$pokemon_id'";
    mysqli_query($conn, $update_sql);
    
    $action = 'removed';
}

// Fetch the new total to send back to the JavaScript
$count_res = mysqli_query($conn, "SELECT upvotes FROM pokemon WHERE id='$pokemon_id'");
$row = mysqli_fetch_assoc($count_res);

echo json_encode([
    'success' => true, 
    'new_upvotes' => $row['upvotes'], 
    'action' => $action
]);
exit();
?>