<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header("Location: auth/login.php");
    exit();
}
include 'includes/connection.php';

$sys_message = "";
$msg_type = "";

// Fetch all pokemon from dex for dropdown
$dex_result = mysqli_query($conn, "SELECT id, name, form FROM pokemon_dex ORDER BY id ASC");
$dex_pokemon = [];
while ($row = mysqli_fetch_assoc($dex_result)) {
    $dex_pokemon[] = $row;
}

if (isset($_POST['add_pokemon'])) {
    $user_id = $_SESSION['user_id'];
    
    // Escaped variables to prevent any punctuation/apostrophe syntax crashes
    $nickname    = mysqli_real_escape_string($conn, trim($_POST['nickname']) ?: '');
    $level       = mysqli_real_escape_string($conn, trim($_POST['level']));
    $gender      = mysqli_real_escape_string($conn, trim($_POST['gender']));
    $species_id  = mysqli_real_escape_string($conn, trim($_POST['species_id']));
    $description = mysqli_real_escape_string($conn, trim($_POST['description']) ?: ''); 

    if ($level < 1 || $level > 100) {
        $sys_message = "Level must be between 1 and 100.";
        $msg_type = "error";
    } elseif (!in_array($gender, ['Male', 'Female'])) {
        $sys_message = "Invalid gender selected.";
        $msg_type = "error";
    } elseif ($_FILES['image']['size'] > 2000000) {
        $sys_message = "Image size too large. 2MB max.";
        $msg_type = "error";
    } else {
        $image_name = time() . "_" . $_FILES['image']['name'];
        $temp_name  = $_FILES['image']['tmp_name'];
        $image_type = strtolower(pathinfo($image_name, PATHINFO_EXTENSION));
        $allowed_types = ['jpg', 'jpeg', 'png'];

        if (!in_array($image_type, $allowed_types)) {
            $sys_message = "Only JPG, JPEG, and PNG files allowed.";
            $msg_type = "error";
        } else {
            $folder = "uploads/" . $image_name;
            move_uploaded_file($temp_name, $folder);

            $sql = "INSERT INTO pokemon (user_id, nickname, level, gender, species_id, upvotes, image, description)
                    VALUES ('$user_id', '$nickname', '$level', '$gender', '$species_id', '0', '$image_name', '$description')";

            if (mysqli_query($conn, $sql)) {
                $sys_message = "PKMN data registered to PC successfully!";
                $msg_type = "success";
            } else {
                $sys_message = "System Error: " . mysqli_error($conn);
                $msg_type = "error";
            }
        }
    }
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Add Pokémon - PC System</title>
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

<?php if ($sys_message != ""): ?>
    <div class="sys-message <?php echo $msg_type; ?>">
        ▶ <?php echo $sys_message; ?>
    </div>
<?php endif; ?>

<form method="POST" enctype="multipart/form-data">
    <h2 class="form-title">REGISTER PKMN</h2>

    <input type="hidden" name="species_id" id="species-id-input">

    <label>Species:</label>
    <div class="species-search-wrap">
        <input type="text" id="species-search" placeholder="Search Pokémon species..." autocomplete="off">
        <div id="species-dropdown"></div>
    </div>
    <div class="selected-species-row" id="selected-species-row">
        <img id="sprite-preview-img" src="" alt="">
        <span class="selected-species-name" id="selected-species-name"></span>
    </div>

    <label>Nickname:</label>
    <input type="text" name="nickname" id="nickname-input" placeholder="Leave blank to use species name">

    <label>Level (1-100):</label>
    <input type="number" name="level" min="1" max="100" placeholder="Lv." required>

    <label>Gender:</label>
    <select name="gender" required>
        <option value="">-- Select Gender --</option>
        <option value="Male">♂ Male</option>
        <option value="Female">♀ Female</option>
    </select>

    <!-- NEW: Multi-line Textarea with explicit character limits in the label -->
    <label>Description / Journal Entry <span style="font-size:0.6rem; opacity:0.7; font-weight:normal;">(Max 150 Chars)</span>:</label>
    <textarea name="description" placeholder="Write a description here... " rows="4" maxlength="150"></textarea>

    <label>Thumbnail Image:</label>
    <input type="file" name="image" accept=".jpg,.jpeg,.png" required>

    <button type="submit" name="add_pokemon">SAVE TO PC</button>
</form>

<script>
const dexData = <?php echo json_encode($dex_pokemon); ?>;
const searchInput  = document.getElementById('species-search');
const dropdown     = document.getElementById('species-dropdown');
const speciesIdInput = document.getElementById('species-id-input');
const spriteImg    = document.getElementById('sprite-preview-img');
const speciesLabel = document.getElementById('selected-species-name');
const nicknameInput = document.getElementById('nickname-input');

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
    dropdown.style.display = 'none';

    // Show sprite inline next to name
    const row = document.getElementById('selected-species-row');
    spriteImg.src = `assets/sprites/${p.id}.png`;
    speciesLabel.textContent = `#${String(p.id).padStart(4,'0')} ${label.toUpperCase()}`;
    row.style.display = 'flex';
}

document.addEventListener('click', function (e) {
    if (!e.target.closest('.species-search-wrap')) {
        dropdown.style.display = 'none';
    }
});
</script>
</body>
</html>