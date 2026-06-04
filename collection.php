<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header("Location: auth/login.php");
    exit();
}
include 'includes/connection.php';

$user_id = $_SESSION['user_id'];
$search  = isset($_GET['search']) ? mysqli_real_escape_string($conn, $_GET['search']) : "";

// Updated SQL to search by nickname OR species name
$sql = "SELECT pokemon.*, pokemon_dex.name AS species_name, pokemon_dex.sprite AS species_sprite,
        pokemon_dex.id AS pokedex_number, pokemon_dex.type1, pokemon_dex.type2,
        pokemon_dex.hp, pokemon_dex.attack, pokemon_dex.defense, 
        pokemon_dex.sp_attack, pokemon_dex.sp_defense, pokemon_dex.speed
        FROM pokemon
        LEFT JOIN pokemon_dex ON pokemon.species_id = pokemon_dex.id AND (pokemon_dex.form = '' OR pokemon_dex.form IS NULL)
        WHERE pokemon.user_id='$user_id' 
        AND (pokemon.nickname LIKE '%$search%' OR pokemon_dex.name LIKE '%$search%')
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
            <input type="text" name="search" placeholder="Search PKMN or Species..." value="<?php echo htmlspecialchars($search); ?>">
            <button type="submit">SEARCH</button>
        </div>
        <div class="result-count">IN BOX: <?php echo mysqli_num_rows($result); ?></div>
    </form>

    <div class="pc-box">
        <div class="pc-info-panel">
            <div class="panel-header">- PKMN DATA -</div>

            <div class="sprite-box">
                <img id="detail-thumbnail" class="detail-thumbnail-img" src="" alt="Thumbnail">
            </div>

            <div class="info-content" id="detail-content" style="display:none;">
                <div class="detail-header-row">
                    <img id="detail-sprite" class="detail-sprite-img" src="" alt="Sprite">
                    <div>
                        <h3 class="pkmn-name-row">
                            <span id="detail-nickname"></span> 
                            <span id="detail-gender"></span>
                        </h3>
                        <p class="pkmn-species-info">
                            <span id="detail-pokedex"></span> 
                            <span id="detail-species"></span>
                        </p>
                    </div>
                </div>
                
                <p id="detail-level" class="pkmn-level"></p>
                
                <div id="detail-types" class="detail-types-container"></div>

                <div class="stat-row"><span class="label">UPVOTES</span><span id="detail-upvotes" class="val"></span></div>

                <!-- Description Area with Inline View/Edit Modes and Truncation -->
                <div id="description-container" style="margin-top: 12px;">
                    <div id="desc-view-mode">
                        <p id="detail-description" class="pkmn-description" style="display:none; margin-bottom: 6px;"></p>
                        <a href="#" id="btn-edit-desc" style="display:none; font-size:0.6rem; text-decoration:underline; color:var(--gba-blue); cursor:pointer;">▶ Edit Entry</a>
                    </div>
                    <div id="desc-edit-mode" style="display:none; margin-bottom:12px;">
                        <input type="text" id="input-description" placeholder="Write entry..." maxlength="150" style="width:100%; margin-bottom:8px; padding: 8px; font-size:0.7rem; border:2px solid var(--dialogue-border-outer); font-family:inherit;">
                        <div style="display:flex; gap:8px;">
                            <button id="btn-save-desc" class="btn-pc" style="padding:6px; font-size:0.6rem; background:#e8f8e8; cursor:pointer;">SAVE</button>
                            <button id="btn-cancel-desc" class="btn-pc btn-danger" style="padding:6px; font-size:0.6rem; cursor:pointer;">CANCEL</button>
                        </div>
                    </div>
                </div>

                <div class="stats-toggle-btn" id="btn-toggle-stats" onclick="toggleStats()">BASE STATS ▼</div>

                <div class="stats-grid" id="stats-container" style="display:none;">
                    <div class="stat-inner-row"><span class="label">HP</span><span id="stat-hp" class="val"></span></div>
                    <div class="stat-inner-row"><span class="label">ATK</span><span id="stat-atk" class="val"></span></div>
                    <div class="stat-inner-row"><span class="label">DEF</span><span id="stat-def" class="val"></span></div>
                    <div class="stat-inner-row"><span class="label">SPA</span><span id="stat-spa" class="val"></span></div>
                    <div class="stat-inner-row"><span class="label">SPD</span><span id="stat-spd" class="val"></span></div>
                    <div class="stat-inner-row"><span class="label">SPE</span><span id="stat-spe" class="val"></span></div>
                </div>

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
                    $gender_class = $row['gender'] === 'Female' ? 'gender-female' : 'gender-male';
                    $sprite_url = htmlspecialchars($row['species_sprite'] ?? '');
                    $pokedex_num = $row['pokedex_number'] ? 'No. ' . str_pad($row['pokedex_number'], 3, '0', STR_PAD_LEFT) : '';
                ?>
                    <div class="pc-pokemon-slot"
                        onclick="updateDetails(this)"
                        data-id="<?php echo $row['id']; ?>"
                        data-thumbnail="uploads/<?php echo htmlspecialchars($row['image']); ?>"
                        data-sprite="<?php echo $sprite_url; ?>"
                        data-nickname="<?php echo htmlspecialchars($row['nickname']); ?>"
                        data-species="<?php echo htmlspecialchars($row['species_name'] ?? '???'); ?>"
                        data-pokedex="<?php echo $pokedex_num; ?>"
                        data-level="Lv<?php echo htmlspecialchars($row['level']); ?>"
                        data-gendericon="<?php echo $gender_icon; ?>"
                        data-genderclass="<?php echo $gender_class; ?>"
                        data-type1="<?php echo htmlspecialchars($row['type1'] ?? ''); ?>"
                        data-type2="<?php echo htmlspecialchars($row['type2'] ?? ''); ?>"
                        data-hp="<?php echo htmlspecialchars($row['hp'] ?? '0'); ?>"
                        data-atk="<?php echo htmlspecialchars($row['attack'] ?? '0'); ?>"
                        data-def="<?php echo htmlspecialchars($row['defense'] ?? '0'); ?>"
                        data-spa="<?php echo htmlspecialchars($row['sp_attack'] ?? '0'); ?>"
                        data-spd="<?php echo htmlspecialchars($row['sp_defense'] ?? '0'); ?>"
                        data-spe="<?php echo htmlspecialchars($row['speed'] ?? '0'); ?>"
                        data-upvotes="▲ <?php echo htmlspecialchars($row['upvotes']); ?>"
                        data-description="<?php echo htmlspecialchars($row['description'] ?? '', ENT_QUOTES, 'UTF-8'); ?>"
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
const typeColors = {
    'Normal': '#A8A878', 'Fire': '#F08030', 'Water': '#6890F0', 'Electric': '#F8D030',
    'Grass': '#78C850', 'Ice': '#98D8D8', 'Fighting': '#C03028', 'Poison': '#A040A0',
    'Ground': '#E0C068', 'Flying': '#A890F0', 'Psychic': '#F85888', 'Bug': '#A8B820',
    'Rock': '#B8A038', 'Ghost': '#705898', 'Dragon': '#7038F8', 'Dark': '#705848',
    'Steel': '#B8B8D0', 'Fairy': '#EE99AC'
};

// Global variable to hold description of the selected PKMN
let activeDescription = "";

function updateDetails(element) {
    document.querySelectorAll('.pc-pokemon-slot').forEach(el => el.classList.remove('selected'));
    element.classList.add('selected');

    document.getElementById('empty-state').style.display = 'none';
    document.getElementById('detail-content').style.display = 'block';

    // Reset stats & inline edit views back to normal on new click
    document.getElementById('stats-container').style.display = 'none';
    document.getElementById('btn-toggle-stats').innerText = 'BASE STATS ▼';
    document.getElementById('desc-edit-mode').style.display = 'none';
    document.getElementById('desc-view-mode').style.display = 'block';

    const sprite = document.getElementById('detail-sprite');
    sprite.src = element.getAttribute('data-sprite');
    sprite.style.display = 'inline-block';

    const thumb = document.getElementById('detail-thumbnail');
    thumb.src = element.getAttribute('data-thumbnail');
    thumb.style.display = 'block';
    
    const nickname = element.getAttribute('data-nickname');
    const species  = element.getAttribute('data-species');
    const pokedex  = element.getAttribute('data-pokedex');
    
    document.getElementById('detail-pokedex').innerText = pokedex;

    if (nickname) {
        document.getElementById('detail-nickname').innerText = nickname;
        document.getElementById('detail-species').innerText  = species;
    } else {
        document.getElementById('detail-nickname').innerText = species;
        document.getElementById('detail-species').innerText  = '';
    }
    
    const genderEl = document.getElementById('detail-gender');
    genderEl.innerText = element.getAttribute('data-gendericon');
    genderEl.className = element.getAttribute('data-genderclass');

    document.getElementById('detail-level').innerText     = element.getAttribute('data-level');
    document.getElementById('detail-upvotes').innerText   = element.getAttribute('data-upvotes');

    // Load full description and trigger truncated rendering
    activeDescription = element.getAttribute('data-description') || "";
    renderDescription(activeDescription, true);
    
    document.getElementById('btn-edit-desc').style.display = 'inline-block';

    const typesContainer = document.getElementById('detail-types');
    typesContainer.innerHTML = ''; 
    const type1 = element.getAttribute('data-type1');
    const type2 = element.getAttribute('data-type2');
    
    if (type1 && type1.trim() !== '' && type1.toLowerCase() !== 'null' && type1.toLowerCase() !== 'none') {
        typesContainer.innerHTML += `<span class="type-badge" style="background-color: ${typeColors[type1] || '#777'};">${type1}</span>`;
    }
    if (type2 && type2.trim() !== '' && type2.toLowerCase() !== 'null' && type2.toLowerCase() !== 'none') {
        typesContainer.innerHTML += `<span class="type-badge" style="background-color: ${typeColors[type2] || '#777'};">${type2}</span>`;
    }

    document.getElementById('stat-hp').innerText  = element.getAttribute('data-hp');
    document.getElementById('stat-atk').innerText = element.getAttribute('data-atk');
    document.getElementById('stat-def').innerText = element.getAttribute('data-def');
    document.getElementById('stat-spa').innerText = element.getAttribute('data-spa');
    document.getElementById('stat-spd').innerText = element.getAttribute('data-spd');
    document.getElementById('stat-spe').innerText = element.getAttribute('data-spe');

    document.getElementById('btn-edit').href    = element.getAttribute('data-edit');
    document.getElementById('btn-release').href = element.getAttribute('data-delete');
}

// Interactive Description Truncator Function
function renderDescription(text, truncate) {
    const descEl = document.getElementById('detail-description');
    if (!text || text.trim() === '') {
        descEl.style.display = 'none';
        return;
    }
    descEl.style.display = 'block';

    const maxChars = 55; // Matches the homepage cutoff point
    
    if (truncate && text.length > maxChars) {
        const truncatedText = text.substring(0, maxChars) + '...';
        descEl.innerHTML = htmlEscape(truncatedText) + `<span class="desc-toggle-link" onclick="toggleFullDesc(true)">[More]</span>`;
    } else if (text.length > maxChars) {
        descEl.innerHTML = htmlEscape(text) + `<span class="desc-toggle-link" onclick="toggleFullDesc(false)">[Less]</span>`;
    } else {
        descEl.innerText = text;
    }
}

function toggleFullDesc(showAll) {
    renderDescription(activeDescription, !showAll);
}

// Safety function to escape HTML characters inside dynamic Javascript injections
function htmlEscape(str) {
    return str.replace(/&/g, '&amp;')
              .replace(/</g, '&lt;')
              .replace(/>/g, '&gt;')
              .replace(/"/g, '&quot;')
              .replace(/'/g, '&#039;');
}

function toggleStats() {
    const container = document.getElementById('stats-container');
    const btn = document.getElementById('btn-toggle-stats');
    
    if (container.style.display === 'none') {
        container.style.display = 'grid';
        btn.innerText = 'BASE STATS ▲';
    } else {
        container.style.display = 'none';
        btn.innerText = 'BASE STATS ▼';
    }
}

// INLINE EDITING TRIGGERS

// Toggle Edit Input Mode
document.getElementById('btn-edit-desc').addEventListener('click', function(e) {
    e.preventDefault();
    document.getElementById('desc-view-mode').style.display = 'none';
    document.getElementById('desc-edit-mode').style.display = 'block';
    
    // Autofills input field with full untruncated activeDescription variable
    document.getElementById('input-description').value = activeDescription;
    document.getElementById('input-description').focus();
});

// Cancel Edit Mode
document.getElementById('btn-cancel-desc').addEventListener('click', function(e) {
    e.preventDefault();
    document.getElementById('desc-view-mode').style.display = 'block';
    document.getElementById('desc-edit-mode').style.display = 'none';
});

// Save Description via background AJAX POST
document.getElementById('btn-save-desc').addEventListener('click', function(e) {
    e.preventDefault();
    const activeSlot = document.querySelector('.pc-pokemon-slot.selected');
    if(!activeSlot) return;

    const pokeId = activeSlot.getAttribute('data-id');
    const newDesc = document.getElementById('input-description').value;

    const formData = new FormData();
    formData.append('id', pokeId);
    formData.append('description', newDesc);

    this.style.opacity = '0.5';

    fetch('update-description.php', {
        method: 'POST',
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        this.style.opacity = '1';
        if(data.success) {
            // Update activeDescription state
            activeDescription = data.description;
            
            // Re-render description box with the new updated truncated data
            renderDescription(activeDescription, true);
            
            // Sync new description with grid slot attributes
            activeSlot.setAttribute('data-description', data.description);

            // Swap UI back to view mode
            document.getElementById('desc-view-mode').style.display = 'block';
            document.getElementById('desc-edit-mode').style.display = 'none';
        }
    })
    .catch(error => {
        this.style.opacity = '1';
        console.error('Error:', error);
    });
});
</script>
</body>
</html>