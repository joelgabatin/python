-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Sep 18, 2023 at 08:19 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elako_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments_tbl`
--

CREATE TABLE `comments_tbl` (
  `comments_id` int(11) NOT NULL,
  `commentor_name` varchar(30) NOT NULL,
  `commentor_feedback` varchar(400) NOT NULL,
  `position` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments_tbl`
--

INSERT INTO `comments_tbl` (`comments_id`, `commentor_name`, `commentor_feedback`, `position`) VALUES
(1, 'Henry M. Daniel', 'I am incredibly impressed with the quality of the product. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. This has exceeded my expectations!', 'Satisfied Customer'),
(2, 'Michael R. Brown', 'Exceptional support and quick response times! Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Thank you for making my experience so seamless.', 'Grateful Client'),
(3, 'Sarah K. Johnson', 'Outstanding service! Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. The team went above and beyond to meet my needs.', 'Happy User');

-- --------------------------------------------------------

--
-- Table structure for table `contactus_tbl`
--

CREATE TABLE `contactus_tbl` (
  `contactus_id` int(10) NOT NULL,
  `email_address` varchar(40) NOT NULL,
  `office_address` varchar(40) NOT NULL,
  `phone_number` varchar(40) NOT NULL,
  `google_map` varchar(1500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contactus_tbl`
--

INSERT INTO `contactus_tbl` (`contactus_id`, `email_address`, `office_address`, `phone_number`, `google_map`) VALUES
(1, 'juandelacruz@gmail.com ', 'La Trinidad, Benguet', '+0123-456789', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d9334.271551495209!2d-73.97198251485975!3d40.668170674982946!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c25b0456b5a2e7%3A0x68bdf865dda0b669!2sBrooklyn%20Botanic%20Garden%20Shop!5e0!3m2!1sen!2sbd!4v1590597267201!5m2!1sen!2sbd\" width=\"100%\" height=\"100%\" frameborder=\"0\" allowfullscreen=\"\" aria-hidden=\"false\" tabindex=\"0\"></iframe>');

-- --------------------------------------------------------

--
-- Table structure for table `products_categories_tbl`
--

CREATE TABLE `products_categories_tbl` (
  `products_cat_id` int(7) NOT NULL,
  `products_cat_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products_categories_tbl`
--

INSERT INTO `products_categories_tbl` (`products_cat_id`, `products_cat_name`) VALUES
(1, 'leaf and leafstalk'),
(3, 'root vegetables'),
(4, 'stem vegetables'),
(5, 'bulb vegetables,'),
(6, 'head or flower veget'),
(7, 'seed vegetables');

-- --------------------------------------------------------

--
-- Table structure for table `products_size_tbl`
--

CREATE TABLE `products_size_tbl` (
  `products_size_id` int(7) NOT NULL,
  `products_size` varchar(15) NOT NULL,
  `products_size_short` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products_size_tbl`
--

INSERT INTO `products_size_tbl` (`products_size_id`, `products_size`, `products_size_short`) VALUES
(1, 'Small', 'S'),
(2, 'Medium', 'M'),
(3, 'Large', 'L'),
(4, 'Extra Larg', 'XL');

-- --------------------------------------------------------

--
-- Table structure for table `products_tbl`
--

CREATE TABLE `products_tbl` (
  `products_id` int(15) NOT NULL,
  `products_name` varchar(20) NOT NULL,
  `products_old_price` decimal(7,0) NOT NULL,
  `products_new_price` decimal(7,0) NOT NULL,
  `products_photo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products_tbl`
--

INSERT INTO `products_tbl` (`products_id`, `products_name`, `products_old_price`, `products_new_price`, `products_photo`) VALUES
(1, 'Brocoli to', 120, 99, '12.png'),
(2, 'Avocado', 85, 78, '4.png'),
(3, 'Mushroom', 82, 62, '8.png'),
(4, 'Cabbage', 46, 32, '15.png'),
(5, 'Onions', 60, 55, '14.png'),
(6, 'Papaya', 92, 75, '2.png');

-- --------------------------------------------------------

--
-- Table structure for table `users_tbl`
--

CREATE TABLE `users_tbl` (
  `user_id` int(7) NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_tbl`
--

INSERT INTO `users_tbl` (`user_id`, `firstname`, `lastname`, `email`, `password`) VALUES
(32, 'Juan ', 'Dela Cruz', 'juandelacruz@gmail.c', 'pbkdf2:sha256:600000$ux6ZYUlLj'),
(34, 'Bernice', 'Bulalin', 'juandelacruz@gmail.c', 'pbkdf2:sha256:600000$xEAStBYyl');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments_tbl`
--
ALTER TABLE `comments_tbl`
  ADD PRIMARY KEY (`comments_id`);

--
-- Indexes for table `contactus_tbl`
--
ALTER TABLE `contactus_tbl`
  ADD PRIMARY KEY (`contactus_id`);

--
-- Indexes for table `products_categories_tbl`
--
ALTER TABLE `products_categories_tbl`
  ADD PRIMARY KEY (`products_cat_id`);

--
-- Indexes for table `products_size_tbl`
--
ALTER TABLE `products_size_tbl`
  ADD PRIMARY KEY (`products_size_id`);

--
-- Indexes for table `products_tbl`
--
ALTER TABLE `products_tbl`
  ADD PRIMARY KEY (`products_id`);

--
-- Indexes for table `users_tbl`
--
ALTER TABLE `users_tbl`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments_tbl`
--
ALTER TABLE `comments_tbl`
  MODIFY `comments_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contactus_tbl`
--
ALTER TABLE `contactus_tbl`
  MODIFY `contactus_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products_categories_tbl`
--
ALTER TABLE `products_categories_tbl`
  MODIFY `products_cat_id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `products_size_tbl`
--
ALTER TABLE `products_size_tbl`
  MODIFY `products_size_id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products_tbl`
--
ALTER TABLE `products_tbl`
  MODIFY `products_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users_tbl`
--
ALTER TABLE `users_tbl`
  MODIFY `user_id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
