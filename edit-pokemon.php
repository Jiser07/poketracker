<?php
session_start();

if (!isset($_SESSION['user_id'])) {
    header("Location: auth/login.php");
    exit();
}

include 'includes/connection.php';

$id = $_GET['id'];

$sql = "SELECT pokemon.*, pokemon_dex.name AS species_name
        FROM pokemon
        LEFT JOIN pokemon_dex ON pokemon.species_id = pokemon_dex.id AND (pokemon_dex.form = '' OR pokemon_dex.form IS NULL)
        WHERE pokemon.id='$id'
        AND pokemon.user_id='{$_SESSION['user_id']}'";

$result = mysqli_query($conn, $sql);
$pokemon = mysqli_fetch_assoc($result);

if (!$pokemon) {
    die("Pokémon not found.");
}

// Fetch all species for dropdown
$dex_result = mysqli_query($conn, "SELECT id, name, form FROM pokemon_dex ORDER BY id ASC");
$dex_pokemon = [];
while ($row = mysqli_fetch_assoc($dex_result)) {
    $dex_pokemon[] = $row;
}

$sys_message = "";
$msg_type = "";

if (isset($_POST['update_pokemon'])) {
    $nickname   = trim($_POST['nickname']);
    $level      = trim($_POST['level']);
    $gender     = trim($_POST['gender']);
    $species_id = trim($_POST['species_id']);

    if ($level < 1 || $level > 100) {
        $sys_message = "Level must be between 1 and 100.";
        $msg_type = "error";
    } elseif (!in_array($gender, ['Male', 'Female'])) {
        $sys_message = "Invalid gender selected.";
        $msg_type = "error";
    } else {
        // Handle optional new image upload
        if (!empty($_FILES['image']['name'])) {
            if ($_FILES['image']['size'] > 2000000) {
                $sys_message = "Image size too large. 2MB max.";
                $msg_type = "error";
            } else {
                $image_name = time() . "_" . $_FILES['image']['name'];
                $image_type = strtolower(pathinfo($image_name, PATHINFO_EXTENSION));
                $allowed_types = ['jpg', 'jpeg', 'png'];

                if (!in_array($image_type, $allowed_types)) {
                    $sys_message = "Only JPG, JPEG, and PNG files allowed.";
                    $msg_type = "error";
                } else {
                    // Delete old image
                    $old_image = "uploads/" . $pokemon['image'];
                    if (file_exists($old_image)) unlink($old_image);

                    move_uploaded_file($_FILES['image']['tmp_name'], "uploads/" . $image_name);
                    $pokemon['image'] = $image_name;
                }
            }
        }

        if ($msg_type !== "error") {
            $update_sql = "UPDATE pokemon SET
                nickname='$nickname',
                level='$level',
                gender='$gender',
                species_id='$species_id',
                image='{$pokemon['image']}'
                WHERE id='$id'";

            if (mysqli_query($conn, $update_sql)) {
                header("Location: collection.php");
                exit();
            } else {
                $sys_message = "Error: " . mysqli_error($conn);
                $msg_type = "error";
            }
        }
    }
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Pokémon</title>
    <link rel="stylesheet" href="assets/css/style.css">
    <style>
        .sys-message {
            background: var(--dialogue-bg); border: 4px solid var(--dialogue-border-outer);
            border-radius: 8px; box-shadow: inset 0 0 0 2px #ffffff, inset 0 0 0 4px var(--dialogue-border-inner), 4px 4px 0 rgba(0,0,0,0.15);
            max-width: 500px; margin: 0 auto 24px auto; padding: 16px 24px; font-size: 0.8rem; line-height: 1.6;
        }
        .sys-message.error   { color: var(--gba-red);   text-shadow: 1px 1px 0 #ffb0b0; }
        .sys-message.success { color: var(--gba-green); text-shadow: 1px 1px 0 #d0f0c0; }
        .form-title {
            margin-top: 0; margin-bottom: 24px; font-size: 1rem; text-align: center; color: var(--gba-text);
            text-shadow: 2px 2px 0 var(--gba-text-shadow); border-bottom: 4px dotted var(--dialogue-border-inner); padding-bottom: 16px;
        }
        .species-search-wrap { position: relative; margin-bottom: 8px; }
        #species-search { width: 100%; box-sizing: border-box; }
        #species-dropdown {
            display: none; position: absolute; z-index: 100; background: var(--dialogue-bg);
            border: 3px solid var(--dialogue-border-outer); border-radius: 6px;
            max-height: 200px; overflow-y: auto; width: 100%; box-sizing: border-box;
            box-shadow: 4px 4px 0 rgba(0,0,0,0.2);
        }
        .species-option {
            padding: 6px 12px; cursor: pointer; font-size: 0.8rem; color: var(--gba-text);
            border-bottom: 1px solid var(--dialogue-border-inner);
            display: flex; align-items: center; gap: 8px;
        }
        .species-option:hover { background: var(--dialogue-border-inner); }
        .species-option img { image-rendering: pixelated; width: 32px; height: 32px; flex-shrink: 0; }
        .selected-species-row {
            display: none; align-items: center; gap: 10px; margin: 8px 0 12px;
        }
        .selected-species-row img { image-rendering: pixelated; width: 64px; height: 64px; }
        .selected-species-name { font-size: 0.8rem; color: var(--gba-text); }
        .current-image { margin: 8px 0; }
        .current-image img { max-width: 120px; border-radius: 6px; display: block; margin-bottom: 6px; }
    </style>
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

<?php if ($sys_message != ""): ?>
    <div class="sys-message <?php echo $msg_type; ?>">
        ▶ <?php echo $sys_message; ?>
    </div>
<?php endif; ?>

<form method="POST" enctype="multipart/form-data">
    <h2 class="form-title">EDIT PKMN</h2>

    <input type="hidden" name="species_id" id="species-id-input" value="<?php echo $pokemon['species_id']; ?>">

    <label>Species:</label>
    <div class="species-search-wrap">
        <input type="text" id="species-search" placeholder="Search Pokémon species..." autocomplete="off"
               value="<?php echo htmlspecialchars($pokemon['species_name'] ?? ''); ?>">
        <div id="species-dropdown"></div>
    </div>
    <div class="selected-species-row" id="selected-species-row">
        <img id="sprite-preview-img" src="assets/sprites/<?php echo $pokemon['species_id']; ?>.png" alt="">
        <span class="selected-species-name" id="selected-species-name"><?php echo htmlspecialchars($pokemon['species_name'] ?? ''); ?></span>
    </div>

    <label>Nickname:</label>
    <input type="text" name="nickname" value="<?php echo htmlspecialchars($pokemon['nickname']); ?>" required>

    <label>Level (1-100):</label>
    <input type="number" name="level" min="1" max="100" value="<?php echo $pokemon['level']; ?>" required>

    <label>Gender:</label>
    <select name="gender" required>
        <option value="Male"   <?php if ($pokemon['gender'] === 'Male')   echo 'selected'; ?>>♂ Male</option>
        <option value="Female" <?php if ($pokemon['gender'] === 'Female') echo 'selected'; ?>>♀ Female</option>
    </select>

    <label>Thumbnail Image:</label>
    <div class="current-image">
        <img src="uploads/<?php echo htmlspecialchars($pokemon['image']); ?>" alt="Current thumbnail">
        <small>Current image — upload a new one to replace it</small>
    </div>
    <input type="file" name="image" accept=".jpg,.jpeg,.png">

    <button type="submit" name="update_pokemon">SAVE CHANGES</button>
</form>

<script>
const dexData = <?php echo json_encode($dex_pokemon); ?>;
const searchInput    = document.getElementById('species-search');
const dropdown       = document.getElementById('species-dropdown');
const speciesIdInput = document.getElementById('species-id-input');
const spriteImg      = document.getElementById('sprite-preview-img');
const speciesLabel   = document.getElementById('selected-species-name');
const selectedRow    = document.getElementById('selected-species-row');

// Show current sprite on load
selectedRow.style.display = 'flex';

searchInput.addEventListener('input', function () {
    const query = this.value.trim().toLowerCase();
    dropdown.innerHTML = '';
    if (!query) { dropdown.style.display = 'none'; return; }

    const matches = dexData.filter(p =>
        p.name.toLowerCase().includes(query) ||
        (p.form && p.form.toLowerCase().includes(query))
    ).slice(0, 30);

    if (matches.length === 0) { dropdown.style.display = 'none'; return; }

    matches.forEach(p => {
        const div = document.createElement('div');
        div.className = 'species-option';
        const img = document.createElement('img');
        img.src = `assets/sprites/${p.id}.png`;
        img.alt = '';
        const txt = document.createElement('span');
        txt.textContent = p.form && p.form.trim() ? `#${p.id} ${p.name} (${p.form})` : `#${p.id} ${p.name}`;
        div.appendChild(img);
        div.appendChild(txt);
        div.addEventListener('click', () => selectSpecies(p));
        dropdown.appendChild(div);
    });
    dropdown.style.display = 'block';
});

function selectSpecies(p) {
    const label = p.form && p.form.trim() ? `${p.name} (${p.form})` : p.name;
    searchInput.value    = label;
    speciesIdInput.value = p.id;
    spriteImg.src = `assets/sprites/${p.id}.png`;
    speciesLabel.textContent = `#${String(p.id).padStart(4,'0')} ${label.toUpperCase()}`;
    selectedRow.style.display = 'flex';
    dropdown.style.display = 'none';
}

document.addEventListener('click', function (e) {
    if (!e.target.closest('.species-search-wrap')) {
        dropdown.style.display = 'none';
    }
});
</script>
</body>
</html>