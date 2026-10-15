<?php
// Update these values if your local MySQL settings differ.
$host = 'localhost';
$user = 'root';
$pass = '';
$db   = 'db_school';

mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
try {
    $conn = mysqli_connect($host, $user, $pass, $db);
    mysqli_set_charset($conn, 'utf8mb4');
} catch (mysqli_sql_exception $e) {
    http_response_code(500);
    exit('Database connection failed. Check config.php and make sure MySQL is running.');
}
?>
