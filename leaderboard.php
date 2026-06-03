<?php
session_start();
include 'includes/connection.php';

// SQL Query to pull Type Badges and Base Stats
$sql = "SELECT pokemon.*, users.username, 
        pokemon_dex.name AS species_name, pokemon_dex.sprite AS species_sprite,
        pokemon_dex.type1, pokemon_dex.type2,
        pokemon_dex.hp, pokemon_dex.attack, pokemon_dex.defense, 
        pokemon_dex.sp_attack, pokemon_dex.sp_defense, pokemon_dex.speed
        FROM pokemon
        JOIN users ON pokemon.user_id = users.id
        LEFT JOIN pokemon_dex ON pokemon.species_id = pokemon_dex.id AND (pokemon_dex.form = '' OR pokemon_dex.form IS NULL)
        WHERE upvotes > 0
        ORDER BY upvotes DESC
        LIMIT 10";

$result = mysqli_query($conn, $sql);

// Authentic Retro Type Colors for Server-Side PHP Rendering
$type_colors = [
    'Normal' => '#A8A878', 'Fire' => '#F08030', 'Water' => '#6890F0', 'Electric' => '#F8D030',
    'Grass' => '#78C850', 'Ice' => '#98D8D8', 'Fighting' => '#C03028', 'Poison' => '#A040A0',
    'Ground' => '#E0C068', 'Flying' => '#A890F0', 'Psychic' => '#F85888', 'Bug' => '#A8B820',
    'Rock' => '#B8A038', 'Ghost' => '#705898', 'Dragon' => '#7038F8', 'Dark' => '#705848',
    'Steel' => '#B8B8D0', 'Fairy' => '#EE99AC'
];
?>

<!DOCTYPE html>
<html>
<head>
    <title>Pokémon Hall of Fame</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body class="hof-page">

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
        <?php } else { ?>
            <a href="auth/login.php">Login</a>
            <a href="auth/register.php">Register</a>
        <?php } ?>
    </div>
</div>

<div class="container">

    <h1 class="hof-title">HALL OF FAME</h1>
    <p class="hof-subtitle">Top Pokémon ranked by community UPVOTES.</p>

    <div class="hof-list">
        <?php
        $rank = 1;
        while ($row = mysqli_fetch_assoc($result)) {
            
            $rank_class = ($rank <= 3) ? "rank-" . $rank : "rank-other";
            $display_name = $row['nickname'] ? $row['nickname'] : $row['species_name'];
            $species_name = $row['species_name'] ? $row['species_name'] : 'Unknown';
            $gender_icon = $row['gender'] === 'Female' ? '♀' : '♂';
            $sprite_url = htmlspecialchars($row['species_sprite'] ?? '');
            
            // Safe Type checks (skipping None, null, or empty spaces)
            $t1 = $row['type1'] ?? '';
            $t2 = $row['type2'] ?? '';
        ?>

        <!-- Added rank-card-<?php echo $rank; ?> class here for the gradient borders -->
        <div class="hof-card rank-card-<?php echo $rank; ?>" data-upvotes="<?php echo $row['upvotes']; ?>" onclick="toggleHofCard(this)">
            
            <div class="hof-rank <?php echo $rank_class; ?>">#<?php echo $rank; ?></div>
            
            <div class="hof-sprite-box">
                <img src="uploads/<?php echo htmlspecialchars($row['image']); ?>" alt="Portrait">
            </div>

            <div class="hof-details">
                <h2><?php echo htmlspecialchars($display_name); ?> <?php echo $gender_icon; ?></h2>
                
                <div style="display: flex; flex-direction: column; align-items: flex-start; gap: 4px;">
                    <!-- Species Tag -->
                    <div class="hof-species-tag" style="margin-bottom: 0;">
                        <?php if ($sprite_url) { ?>
                            <img src="<?php echo $sprite_url; ?>" alt="Sprite">
                        <?php } ?>
                        <span><?php echo htmlspecialchars($species_name); ?></span>
                    </div>

                    <!-- Type Badges -->
                    <div style="display: flex; gap: 6px; margin: 4px 0 10px 0;">
                        <?php if ($t1 && trim($t1) !== '' && strtolower($t1) !== 'null' && strtolower($t1) !== 'none') { ?>
                            <span class="type-badge" style="background-color: <?php echo $type_colors[$t1] ?? '#777'; ?>;"><?php echo $t1; ?></span>
                        <?php } ?>
                        <?php if ($t2 && trim($t2) !== '' && strtolower($t2) !== 'null' && strtolower($t2) !== 'none') { ?>
                            <span class="type-badge" style="background-color: <?php echo $type_colors[$t2] ?? '#777'; ?>;"><?php echo $t2; ?></span>
                        <?php } ?>
                    </div>
                </div>

                <p>Level: <?php echo htmlspecialchars($row['level']); ?></p>
                <p class="hof-trainer">Trainer: <?php echo htmlspecialchars($row['username']); ?></p>

                <!-- Expandable Area containing description & high-contrast stats grid -->
                <div class="hof-expandable" style="display:none;">
                    <?php if ($row['description'] && trim($row['description']) !== '') { ?>
                        <p class="pkmn-description" style="margin-top: 0; margin-bottom: 16px;">
                            <?php echo htmlspecialchars($row['description']); ?>
                        </p>
                    <?php } ?>

                    <div class="stats-grid" style="margin-top: 0;">
                        <div class="stat-inner-row"><span class="label">HP</span><span class="val"><?php echo htmlspecialchars($row['hp'] ?? '0'); ?></span></div>
                        <div class="stat-inner-row"><span class="label">ATK</span><span class="val"><?php echo htmlspecialchars($row['attack'] ?? '0'); ?></span></div>
                        <div class="stat-inner-row"><span class="label">DEF</span><span class="val"><?php echo htmlspecialchars($row['defense'] ?? '0'); ?></span></div>
                        <div class="stat-inner-row"><span class="label">SPA</span><span class="val"><?php echo htmlspecialchars($row['sp_attack'] ?? '0'); ?></span></div>
                        <div class="stat-inner-row"><span class="label">SPD</span><span class="val"><?php echo htmlspecialchars($row['sp_defense'] ?? '0'); ?></span></div>
                        <div class="stat-inner-row"><span class="label">SPE</span><span class="val"><?php echo htmlspecialchars($row['speed'] ?? '0'); ?></span></div>
                    </div>
                </div>
            </div>

            <!-- Click indicator -->
            <span class="hof-toggle-arrow">▼ details</span>
        </div>

        <?php $rank++; } ?>
    </div>

</div>

<!-- JavaScript to handle clean expandable card rendering -->
<script>
function toggleHofCard(card) {
    const expandable = card.querySelector('.hof-expandable');
    const label = card.querySelector('.hof-toggle-arrow');
    
    if (expandable.style.display === 'none' || !expandable.style.display) {
        expandable.style.display = 'block';
        label.innerText = '▲ hide';
    } else {
        expandable.style.display = 'none';
        label.innerText = '▼ details';
    }
}
</script>

</body>
</html>