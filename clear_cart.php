<?php
session_start();
$loggedIn = isset($_SESSION['loggedIn']) && $_SESSION['loggedIn'];

if ($loggedIn) {
    $userId = $_SESSION['userid'];

    include 'db.php'; // Include the database connection file

    // Delete cart items for the user
    $sql = "DELETE FROM cart_items WHERE user_id = $userId";
    if ($conn->query($sql) === TRUE) {
        echo json_encode(['success' => true]);
    } else {
        echo json_encode(['success' => false]);
    }

    $conn->close();
} else {
    echo json_encode(['success' => false]);
}
?>
