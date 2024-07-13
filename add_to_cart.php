<?php
session_start();
$loggedIn = isset($_SESSION['loggedIn']) && $_SESSION['loggedIn'];

if ($loggedIn) {
    $userId = $_SESSION['userid'];
    $data = json_decode(file_get_contents('php://input'), true);
    $productId = $data['product_id'];

    include 'db.php'; // Include the database connection file

    // Insert product into cart_items table
    $sql = "INSERT INTO cart_items (user_id, product_id) VALUES ($userId, $productId)";
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