<?php
session_start();
include 'includes/connection.php';

$sql = "SELECT pokemon.*, users.username, pokemon_dex.name AS species_name, pokemon_dex.sprite AS species_sprite
        FROM pokemon
        JOIN users ON pokemon.user_id = users.id
        LEFT JOIN pokemon_dex ON pokemon.species_id = pokemon_dex.id
        ORDER BY pokemon.created_at DESC";

$result = mysqli_query($conn, $sql);
?>
<!DOCTYPE html>
<html>
<head>
    <title>PokéTracker - Community Box</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body class="index-page">

<div class="navbar">
    <h1>PokéTracker</h1>
    <div class="nav-links">
    <?php if (isset($_SESSION['user_id'])) { ?>
        <a href="index.php">Home</a>
        <a href="dashboard.php">Trainer Card</a>
        <a href="collection.php">My PC Box</a>
        <a href="add-pokemon.php">Add PKMN</a>
        <a href="leaderboard.php">Leaderboard</a>
        <a href="auth/logout.php" onclick="return confirm('Logout?')">Logout</a>
    <?php } else { ?>
        <a href="index.php">Home</a>
        <a href="auth/login.php">Login</a>
        <a href="auth/register.php">Register</a>
    <?php } ?>
    </div>
</div>

<div class="container">
    <div class="pc-box">
        <div class="pc-info-panel">
            <div class="panel-header">- PKMN DATA -</div>

            <div class="info-content" id="detail-content" style="display:none;">
                <div style="display:flex; align-items:center; gap:8px; margin-bottom:4px;">
                    <img id="detail-sprite" src="" alt="Sprite" style="display:none; image-rendering:pixelated; width:64px; height:64px; flex-shrink:0;">
                    <div>
                        <h3 id="detail-nickname" class="pkmn-name" style="margin:0;"></h3>
                        <p id="detail-species" style="font-size:0.7rem; opacity:0.7; margin:0;"></p>
                    </div>
                </div>
                <p id="detail-level" class="pkmn-level"></p>
                <div class="stat-row"><span class="label">TRAINER</span><span id="detail-trainer" class="val"></span></div>
                <div class="stat-row"><span class="label">GENDER</span><span id="detail-gender" class="val"></span></div>
                <div class="stat-row"><span class="label">UPVOTES</span><span id="detail-upvotes" class="val"></span></div>

                <div class="sprite-box" style="margin-top:10px;">
                    <img id="detail-thumbnail" src="" alt="Thumbnail" style="display:none; max-width:100%; border-radius:6px;">
                </div>

                <div class="action-buttons">
                    <a id="btn-upvote" href="#" class="btn-pc">▲ UPVOTE</a>
                </div>
            </div>

            <div class="info-content empty-state" id="empty-state">
                <p>Select a Pokémon<br>to view data.</p>
            </div>
        </div>

        <div class="pc-box-main">
            <div class="pc-box-header">
                <span class="arrow">◀</span>
                <h2>COMMUNITY BOX 1</h2>
                <span class="arrow">▶</span>
            </div>
            <div class="pc-box-grid">
                <?php while ($row = mysqli_fetch_assoc($result)) {
                    $gender_icon = $row['gender'] === 'Female' ? '♀' : '♂';
                    $sprite_url = htmlspecialchars($row['species_sprite'] ?? '');
                ?>
                    <div class="pc-pokemon-slot"
                        onclick="updateDetails(this)"
                        data-thumbnail="uploads/<?php echo htmlspecialchars($row['image']); ?>"
                        data-sprite="<?php echo $sprite_url; ?>"
                        data-nickname="<?php echo htmlspecialchars($row['nickname']); ?>"
                        data-species="<?php echo htmlspecialchars($row['species_name'] ?? '???'); ?>"
                        data-level="Lv<?php echo htmlspecialchars($row['level']); ?>"
                        data-trainer="<?php echo htmlspecialchars($row['username']); ?>"
                        data-gender="<?php echo $gender_icon . ' ' . htmlspecialchars($row['gender']); ?>"
                        data-upvotes="▲ <?php echo htmlspecialchars($row['upvotes']); ?>"
                        data-id="<?php echo $row['id']; ?>">
                        <img src="uploads/<?php echo htmlspecialchars($row['image']); ?>" alt="<?php echo htmlspecialchars($row['nickname']); ?>">
                    </div>
                <?php } ?>
            </div>
        </div>
    </div>
</div>

<script>
function updateDetails(element) {
    document.querySelectorAll('.pc-pokemon-slot').forEach(el => el.classList.remove('selected'));
    element.classList.add('selected');

    document.getElementById('empty-state').style.display = 'none';
    document.getElementById('detail-content').style.display = 'block';

    const sprite = document.getElementById('detail-sprite');
    sprite.src = element.getAttribute('data-sprite');
    sprite.style.display = 'inline-block';

    const thumb = document.getElementById('detail-thumbnail');
    thumb.src = element.getAttribute('data-thumbnail');
    thumb.style.display = 'block';

    document.getElementById('detail-nickname').innerText  = element.getAttribute('data-nickname');
    document.getElementById('detail-species').innerText   = element.getAttribute('data-species');
    document.getElementById('detail-level').innerText     = element.getAttribute('data-level');
    document.getElementById('detail-trainer').innerText   = element.getAttribute('data-trainer');
    document.getElementById('detail-gender').innerText    = element.getAttribute('data-gender');
    document.getElementById('detail-upvotes').innerText   = element.getAttribute('data-upvotes');

    document.getElementById('btn-upvote').href = 'upvote.php?id=' + element.getAttribute('data-id');
}
</script>
</body>
</html>