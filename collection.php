<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header("Location: auth/login.php");
    exit();
}
include 'includes/connection.php';

$user_id = $_SESSION['user_id'];
$search  = isset($_GET['search']) ? $_GET['search'] : "";

$sql = "SELECT pokemon.*, pokemon_dex.name AS species_name, pokemon_dex.sprite AS species_sprite
        FROM pokemon
        LEFT JOIN pokemon_dex ON pokemon.species_id = pokemon_dex.id AND (pokemon_dex.form = '' OR pokemon_dex.form IS NULL)
        WHERE pokemon.user_id='$user_id' AND pokemon.nickname LIKE '%$search%'
        ORDER BY pokemon.created_at DESC";

$result = mysqli_query($conn, $sql);
?>
<!DOCTYPE html>
<html>
<head>
    <title>My Collection - PC Box</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>

<div class="navbar">
    <h1>PokéTracker</h1>
    <div class="nav-links">
        <a href="index.php">Home</a>
        <a href="dashboard.php">Trainer Card</a>
        <a href="collection.php">My PC Box</a>
        <a href="add-pokemon.php">Add PKMN</a>
        <a href="leaderboard.php">Leaderboard</a>
        <a href="auth/logout.php" onclick="return confirm('Logout?')">Logout</a>
    </div>
</div>

<div class="container">
    <form method="GET" class="pc-filter-form">
        <div class="filter-inputs">
            <input type="text" name="search" placeholder="Search PKMN..." value="<?php echo htmlspecialchars($search); ?>">
            <button type="submit">SEARCH</button>
        </div>
        <div class="result-count">IN BOX: <?php echo mysqli_num_rows($result); ?></div>
    </form>

    <div class="pc-box">
        <div class="pc-info-panel">
            <div class="panel-header">- PKMN DATA -</div>

            <div class="sprite-box">
                <img id="detail-thumbnail" src="" alt="Thumbnail" style="display:none; max-width:100%; border-radius:6px;">
            </div>

            <div class="info-content" id="detail-content" style="display:none;">
                <div style="display:flex; align-items:center; gap:8px; margin-bottom:4px;">
                    <img id="detail-sprite" src="" alt="Sprite" style="display:none; image-rendering:pixelated; width:64px; height:64px; flex-shrink:0;">
                    <div>
                        <h3 id="detail-nickname" class="pkmn-name" style="margin:0;"></h3>
                        <p id="detail-species" style="font-size:0.7rem; opacity:0.7; margin:0;"></p>
                    </div>
                </div>
                <p id="detail-level" class="pkmn-level"></p>
                <div class="stat-row"><span class="label">GENDER</span><span id="detail-gender" class="val"></span></div>
                <div class="stat-row"><span class="label">UPVOTES</span><span id="detail-upvotes" class="val"></span></div>

                <div class="action-buttons">
                    <a id="btn-edit" href="#" class="btn-pc">EDIT</a>
                    <a id="btn-release" href="#" class="btn-pc btn-danger" onclick="return confirm('Release this Pokémon?')">RELEASE</a>
                </div>
            </div>

            <div class="info-content empty-state" id="empty-state">
                <?php if (mysqli_num_rows($result) == 0) { ?>
                    <p>Box is empty.<br>Go catch some!</p>
                <?php } else { ?>
                    <p>Select a Pokémon<br>to view data.</p>
                <?php } ?>
            </div>
        </div>

        <div class="pc-box-main">
            <div class="pc-box-header">
                <span class="arrow">◀</span>
                <h2>MY PC BOX 1</h2>
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
                        data-gender="<?php echo $gender_icon . ' ' . htmlspecialchars($row['gender']); ?>"
                        data-upvotes="▲ <?php echo htmlspecialchars($row['upvotes']); ?>"
                        data-edit="edit-pokemon.php?id=<?php echo $row['id']; ?>"
                        data-delete="delete-pokemon.php?id=<?php echo $row['id']; ?>">
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

    const nickname = element.getAttribute('data-nickname');
    const species  = element.getAttribute('data-species');
    if (nickname) {
        document.getElementById('detail-nickname').innerText = nickname;
        document.getElementById('detail-species').innerText  = species;
        document.getElementById('detail-species').style.display = '';
    } else {
        document.getElementById('detail-nickname').innerText = species;
        document.getElementById('detail-species').innerText  = '';
        document.getElementById('detail-species').style.display = 'none';
    }
    document.getElementById('detail-level').innerText     = element.getAttribute('data-level');
    document.getElementById('detail-gender').innerText    = element.getAttribute('data-gender');
    document.getElementById('detail-upvotes').innerText   = element.getAttribute('data-upvotes');

    document.getElementById('btn-edit').href    = element.getAttribute('data-edit');
    document.getElementById('btn-release').href = element.getAttribute('data-delete');
}
</script>
</body>
</html>