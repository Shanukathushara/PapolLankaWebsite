<?php
include 'db.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $_POST['name'];
    $email = $_POST['email'];
    $password = $_POST['password'];
    $confirm_password = $_POST['confirm_password'];

    if ($password == $confirm_password) {
        $hashed_password = password_hash($password, PASSWORD_DEFAULT);

        // Prepare an SQL statement for safe insertion of user data
        $stmt = $conn->prepare("INSERT INTO users (name, email, password) VALUES (?, ?, ?)");
        $stmt->bind_param("sss", $name, $email, $hashed_password);

        if ($stmt->execute() === TRUE) {
            echo "New record created successfully";
            header('Location: login.html');
            exit();
        } else {
            echo "Error: " . $stmt->error;
        }

        // Close the statement
        $stmt->close();
    } else {
        echo "Passwords do not match";
    }

    // Close the connection
    $conn->close();
}
?>