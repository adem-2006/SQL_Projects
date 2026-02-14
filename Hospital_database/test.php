/Hospital_admin/
│
├─ index.php        # Dashboard (cədvəllər)
├─ table.php        # Seçilmiş cədvəlin içi
├─ hospital.db      # SQLite database
└─ style.css        # sadə stil (optional)

<?php
$db = new SQLite3("hospital.db");

// Cədvəlləri götür
$tables = $db->query("SELECT name FROM sqlite_master WHERE type='table'");
?>
<!DOCTYPE html>
<html>
<head>
    <title>Hospital Admin Panel</title>
    <style>
        body { font-family: sans-serif; display: flex; }
        .sidebar { width: 200px; padding: 10px; background: #f0f0f0; }
        .content { padding: 10px; flex-grow: 1; }
        a { display: block; margin-bottom: 5px; text-decoration: none; color: black; }
        a:hover { background: #ddd; }
    </style>
</head>
<body>
    <div class="sidebar">
        <h3>Tables</h3>
        <?php while ($row = $tables->fetchArray(SQLITE3_ASSOC)): ?>
            <a href="table.php?name=<?= $row['name'] ?>"><?= $row['name'] ?></a>
        <?php endwhile; ?>
    </div>
    <div class="content">
        <h3>Welcome</h3>
        <p>Select a table to view its data.</p>
    </div>
</body>
</html>

<?php
$db = new SQLite3("hospital.db");
$table = $_GET['name'] ?? '';

// SQL injection qarşısı almaq üçün sadə check
if (!preg_match('/^[a-zA-Z0-9_]+$/', $table)) {
    die("Invalid table name");
}

// Columns və data
$columns = $db->query("PRAGMA table_info($table)");
$rows = $db->query("SELECT * FROM $table");
?>
<!DOCTYPE html>
<html>
<head>
    <title><?= $table ?> - Hospital Admin</title>
    <style>
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid #ccc; padding: 5px; }
        th { background: #eee; }
    </style>
</head>
<body>
    <a href="index.php">← Back to Tables</a>
    <h2>Table: <?= $table ?></h2>
    <table>
        <tr>
            <?php while ($col = $columns->fetchArray(SQLITE3_ASSOC)): ?>
                <th><?= $col['name'] ?></th>
            <?php endwhile; ?>
        </tr>
        <?php while ($row = $rows->fetchArray(SQLITE3_ASSOC)): ?>
        <tr>
            <?php foreach ($row as $cell): ?>
                <td><?= htmlspecialchars($cell) ?></td>
            <?php endforeach; ?>
        </tr>
        <?php endwhile; ?>
    </table>
</body>
</html>
