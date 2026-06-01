<?php
session_start();

if (!isset($_SESSION['user_id'])) {
    header("Location: auth/login.php");
    exit();
}

include 'includes/connection.php';

$id = $_GET['id'];

$sql = "SELECT * FROM pokemon
        WHERE id='$id'
        AND user_id='{$_SESSION['user_id']}'";

$result = mysqli_query($conn, $sql);
$pokemon = mysqli_fetch_assoc($result);

if (!$pokemon) {
    die("Pokémon not found.");
}

if (isset($_POST['update_pokemon'])) {
    $nickname = $_POST['nickname'];
    $level = $_POST['level'];

    if ($level < 1 || $level > 100) {
        echo "Level must be between 1 and 100.";
    } else {
        $update_sql = "UPDATE pokemon SET
            nickname='$nickname',
            level='$level'
            WHERE id='$id'";

        if (mysqli_query($conn, $update_sql)) {
            header("Location: collection.php");
            exit();
        } else {
            echo "Error: " . mysqli_error($conn);
        }
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Pokémon</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>

<h2>Edit Pokémon</h2>

<form method="POST">

    <label>Nickname:</label>
    <input type="text"
            name="nickname"
            value="<?php echo htmlspecialchars($pokemon['nickname']); ?>"
            required>

    <br><br>

    <label>Level (1-100):</label>
    <input type="number"
            name="level"
            value="<?php echo $pokemon['level']; ?>"
            required>

    <br><br>

    <button type="submit" name="update_pokemon">
        Update Pokémon
    </button>

</form>

</body>
</html>