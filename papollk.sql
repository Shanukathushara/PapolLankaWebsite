-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 12, 2024 at 08:50 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `papollk`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `stock` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `image`, `category`, `stock`) VALUES
(1, 'Samsung Galaxy S24 Ultra', '12GB+256GB or 12GB+128GB', 389990.00, 'images/Sam24 .jpg', 'Smartphones', 10),
(2, 'iPhone 15 Pro Max', '1TB or 512GB or 256GB', 474990.00, 'images/Iphone15.jpg', 'Smartphones', 10),
(3, 'Oppo A78', '8GB+128GB Extended Ram up to 16GB', 69990.00, 'images/OppoA78.jpg', 'Smartphones', 10),
(4, 'iPhone 11 Pro', '128GB or 256GB', 174990.00, 'images/iphone11.jpg', 'Smartphones', 10),
(5, 'Samsung S10+ 5G', '1TB or 512GB or 256GB', 134990.00, 'images/S10.jpg', 'Smartphones', 10),
(6, 'HUAWEI Pura70 Ultra', '8GB+128GB or 12GB+256GB', 374990.00, 'images/Huawei.jpg', 'Smartphones', 10),
(7, 'Samsung Note 20 Ultra', '512GB or 256GB', 274990.00, 'images/SamNote.jpg', 'Smartphones', 10),
(8, 'iPhone X', '32GB or 64GB', 100990.00, 'images/iPhonex.jpg', 'Smartphones', 10),
(9, 'Samsung S23 Ultra 5G', '12GB+1TB or 8GB+512GB', 399990.00, 'images/Sam23.jpg', 'Smartphones', 10),
(10, 'Nothing 2a', '8GB+1TB or 8GB+512GB', 274990.00, 'images/Nothing2a.jpg', 'Smartphones', 10),
(11, 'JBL Tune 510BB', 'Bluetooth', 29980.00, 'images/JBLhead.jpg', 'Accessories', 20),
(12, 'JBL Charge 5', 'Portable', 49000.00, 'images/JBLSpeaker.jpg', 'Accessories', 20),
(13, 'Anker Nano PowerBank', '25W- dual C ports', 7800.00, 'images/PowerBank.jpg', 'Accessories', 20),
(14, 'Jadel Keyboard English', 'QWERTY', 6000.00, 'images/Keyboard.jpg', 'Accessories', 20),
(15, 'Logitech G402 Hyperion', 'Gaming Mouse', 20000.00, 'images/Mouse.jpg', 'Accessories', 20),
(16, 'Samsung AKG Original Earphones', 'In-ear', 3800.00, 'images/earphones.jpg', 'Accessories', 20),
(17, 'Wireless Charger', 'Choetech branded', 12999.00, 'images/wirelesscharger.jpg', 'Accessories', 20),
(18, 'HylerWek SmartWatch', 'Waterproof, Heartrate', 5489.00, 'images/Smartwatch.jpg', 'Accessories', 20),
(19, 'Linksys High Speed Router', '5 Gbps speed', 14890.00, 'images/router.jpg', 'Accessories', 20),
(20, 'USB 3.0 Flash Drive', '2TB', 1990.00, 'images/Flash.jpg', 'Accessories', 20);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `name`, `email`, `password`, `created_at`) VALUES
(1, 'Dinusha', 'dinusha@gmail.com', '$2y$10$c0uZ4lcacHHATaxH9OTdfOUtg.px2.zreAHLWHSeooW4uAJMAoWsC', '2024-07-07 04:58:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
