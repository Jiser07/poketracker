-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 01, 2026 at 02:25 PM
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
-- Database: `poketracker_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `pokemon`
--

CREATE TABLE `pokemon` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `upvotes` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pokemon`
--

INSERT INTO `pokemon` (`id`, `user_id`, `name`, `type`, `level`, `status`, `rating`, `image`, `created_at`, `upvotes`) VALUES
(8, 1, 'Bulbasaur', 'Grass', 1, 'Active', 99, '1779211645_649793951_2484185198702561_5155173347306209027_n.jpg', '2026-05-19 17:27:25', 1),
(10, 4, 'Virizion', 'Grass', 50, 'Stored', 7, '1779773918_miffy.jpg', '2026-05-26 05:38:38', 1),
(11, 4, 'Gallade', 'Psychic', 40, 'Stored', 10, '1779774975_908.png', '2026-05-26 05:56:15', 0),
(12, 4, 'Folk', 'Dragon', 99, 'Favorite', 10, '1779776335_wassup.png', '2026-05-26 06:18:55', 0),
(13, 4, 'Fluttershy', 'Psychic', 67, 'In PC Box', 10, '1779981438_655.png', '2026-05-28 15:17:18', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pokemon_votes`
--

CREATE TABLE `pokemon_votes` (
  `id` int(11) NOT NULL,
  `pokemon_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pokemon_votes`
--

INSERT INTO `pokemon_votes` (`id`, `pokemon_id`, `user_id`) VALUES
(1, 8, 1),
(2, 10, 1),
(3, 13, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(20) DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`) VALUES
(1, 'hatdog', '$2y$10$tq8cMtmf0F533gUJjsqM0uQUP.fZo8o2tt1DYA0O3i.kZEmos1Wf6', 'user'),
(4, 'jhayzer07', '$2y$10$2JgWJ4at9tXU7/36Q/2um.yFjA2qGyB.yPrf34ochRRmzhkDL4BS.', 'user'),
(5, 'jhayzordex', '$2y$10$F.YlOihx2OlK9vDdgzg6sOFbhqLxxUnQdBzNvpxYhLEmgLYXJAknm', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pokemon`
--
ALTER TABLE `pokemon`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `pokemon_votes`
--
ALTER TABLE `pokemon_votes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_vote` (`pokemon_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pokemon`
--
ALTER TABLE `pokemon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `pokemon_votes`
--
ALTER TABLE `pokemon_votes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pokemon`
--
ALTER TABLE `pokemon`
  ADD CONSTRAINT `pokemon_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pokemon_votes`
--
ALTER TABLE `pokemon_votes`
  ADD CONSTRAINT `pokemon_votes_ibfk_1` FOREIGN KEY (`pokemon_id`) REFERENCES `pokemon` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pokemon_votes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
