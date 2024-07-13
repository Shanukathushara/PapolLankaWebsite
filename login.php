<?php
include 'db.php';
session_start();


if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];
    $password = $_POST['password'];

    // Prepare a select statement to fetch the user data
    $stmt = $conn->prepare("SELECT userid, name, password FROM users WHERE email = ?");
    $stmt->bind_param("s", $email);

    if ($stmt->execute()) {
        $stmt->store_result();

        // Check if the user exists
        if ($stmt->num_rows == 1) {
            $stmt->bind_result($userid, $name, $hashed_password);
            $stmt->fetch();

            // Verify the password
            if (password_verify($password, $hashed_password)) {
                // Start a new session and store user data
                $_SESSION['userid'] = $userid;
                $_SESSION['name'] = $name;
                $_SESSION['email'] = $email;
                header("Location: index.php");
                exit();
            } else {
                echo "Invalid password";
            }
        } else {
            echo "No account found with that email";
        }
    } else {
        echo "Error: " . $stmt->error;
    }

    // Close the statement and connection
    $stmt->close();
    $conn->close();
}
?>