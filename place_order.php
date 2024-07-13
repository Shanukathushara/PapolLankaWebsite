<?php
session_start();
$loggedIn = isset($_SESSION['loggedIn']) && $_SESSION['loggedIn'];

if ($loggedIn) {
    $userId = $_SESSION['userid'];
    $data = json_decode(file_get_contents('php://input'), true);
    $name = $data['name'];
    $address = $data['address'];
    $email = $data['email'];
    $phone = $data['phone'];

    include 'db.php'; // Include the database connection file

    // Insert order details into orders table
    $sql = "INSERT INTO orders (user_id, name, address, email, phone) VALUES ($userId, '$name', '$address', '$email', '$phone')";
    if ($conn->query($sql) === TRUE) {
        // Clear cart items for the user
        $sql = "DELETE FROM cart_items WHERE user_id = $userId";
        if ($conn->query($sql) === TRUE) {
            echo json_encode(['success' => true]);
        } else {
            echo json_encode(['success' => false]);
        }
    } else {
        echo json_encode(['success' => false]);
    }

    $conn->close();
} else {
    echo json_encode(['success' => false]);
}
?>
