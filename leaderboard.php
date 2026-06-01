<?php
session_start();
include 'includes/connection.php';

$sql = "SELECT pokemon.*, users.username
        FROM pokemon
        JOIN users ON pokemon.user_id = users.id
        ORDER BY upvotes DESC
        LIMIT 10";

$result = mysqli_query($conn, $sql);
?>

<!DOCTYPE html>
<html>
<head>
    <title>Pokémon Hall of Fame</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>

<div class="navbar">
    <h1>PokéTracker</h1>
    <div class="nav-links">
        <a href="index.php">Home</a>
        <?php if (isset($_SESSION['user_id'])) { ?>
            <a href="dashboard.php">Trainer Card</a>
            <a href="collection.php">My PC Box</a>
            <a href="add-pokemon.php">Add PKMN</a>
            <a href="leaderboard.php">Leaderboard</a>
            <a href="auth/logout.php">Logout</a>
        <?php } ?>
    </div>
</div>

<div class="container">

    <h2>🏆 Pokémon Hall of Fame</h2>

    <p>Top Pokémon ranked by community upvotes.</p>

    <?php
    $rank = 1;

    while ($row = mysqli_fetch_assoc($result)) {
    ?>

    <div class="pokemon-card">

        <h2>
            <?php
            if ($rank == 1) {
                echo "🥇";
            } elseif ($rank == 2) {
                echo "🥈";
            } elseif ($rank == 3) {
                echo "🥉";
            } else {
                echo "#".$rank;
            }
            ?>
            <?php echo htmlspecialchars($row['name']); ?>
        </h2>

        <img src="uploads/<?php echo htmlspecialchars($row['image']); ?>">

        <p>
            Trainer:
            <?php echo htmlspecialchars($row['username']); ?>
        </p>

        <p>
            Type:
            <?php echo htmlspecialchars($row['type']); ?>
        </p>

        <p>
            Level:
            <?php echo htmlspecialchars($row['level']); ?>
        </p>

        <p>
            ▲ <?php echo $row['upvotes']; ?> Upvotes
        </p>

    </div>

    <?php
    $rank++;
    }
    ?>

</div>

</body>
</html>