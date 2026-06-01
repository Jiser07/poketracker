-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 01, 2026 at 09:59 PM
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
  `nickname` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `gender` varchar(10) NOT NULL DEFAULT 'Male',
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `upvotes` int(11) DEFAULT 0,
  `species_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pokemon`
--

INSERT INTO `pokemon` (`id`, `user_id`, `nickname`, `level`, `gender`, `image`, `created_at`, `upvotes`, `species_id`) VALUES
(14, 1, 'Bulbasaur', 1, 'Female', '1780343502_649793951_2484185198702561_5155173347306209027_n.jpg', '2026-06-01 19:51:42', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pokemon_dex`
--

CREATE TABLE `pokemon_dex` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `form` varchar(100) DEFAULT NULL,
  `type1` varchar(50) DEFAULT NULL,
  `type2` varchar(50) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `hp` int(11) DEFAULT NULL,
  `attack` int(11) DEFAULT NULL,
  `defense` int(11) DEFAULT NULL,
  `sp_attack` int(11) DEFAULT NULL,
  `sp_defense` int(11) DEFAULT NULL,
  `speed` int(11) DEFAULT NULL,
  `generation` int(11) DEFAULT NULL,
  `sprite` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pokemon_dex`
--

INSERT INTO `pokemon_dex` (`id`, `name`, `form`, `type1`, `type2`, `total`, `hp`, `attack`, `defense`, `sp_attack`, `sp_defense`, `speed`, `generation`, `sprite`) VALUES
(1, 'Bulbasaur', ' ', 'Grass', 'Poison', 318, 45, 49, 49, 65, 65, 45, 1, 'assets/sprites/1.png'),
(2, 'Ivysaur', ' ', 'Grass', 'Poison', 405, 60, 62, 63, 80, 80, 60, 1, 'assets/sprites/2.png'),
(3, 'Venusaur', ' ', 'Grass', 'Poison', 525, 80, 82, 83, 100, 100, 80, 1, 'assets/sprites/3.png'),
(4, 'Charmander', ' ', 'Fire', ' ', 309, 39, 52, 43, 60, 50, 65, 1, 'assets/sprites/4.png'),
(5, 'Charmeleon', ' ', 'Fire', ' ', 405, 58, 64, 58, 80, 65, 80, 1, 'assets/sprites/5.png'),
(6, 'Charizard', ' ', 'Fire', 'Flying', 534, 78, 84, 78, 109, 85, 100, 1, 'assets/sprites/6.png'),
(7, 'Squirtle', ' ', 'Water', ' ', 314, 44, 48, 65, 50, 64, 43, 1, 'assets/sprites/7.png'),
(8, 'Wartortle', ' ', 'Water', ' ', 405, 59, 63, 80, 65, 80, 58, 1, 'assets/sprites/8.png'),
(9, 'Blastoise', ' ', 'Water', ' ', 530, 79, 83, 100, 85, 105, 78, 1, 'assets/sprites/9.png'),
(10, 'Caterpie', ' ', 'Bug', ' ', 195, 45, 30, 35, 20, 20, 45, 1, 'assets/sprites/10.png'),
(11, 'Metapod', ' ', 'Bug', ' ', 205, 50, 20, 55, 25, 25, 30, 1, 'assets/sprites/11.png'),
(12, 'Butterfree', ' ', 'Bug', 'Flying', 395, 60, 45, 50, 90, 80, 70, 1, 'assets/sprites/12.png'),
(13, 'Weedle', ' ', 'Bug', 'Poison', 195, 40, 35, 30, 20, 20, 50, 1, 'assets/sprites/13.png'),
(14, 'Kakuna', ' ', 'Bug', 'Poison', 205, 45, 25, 50, 25, 25, 35, 1, 'assets/sprites/14.png'),
(15, 'Beedrill', ' ', 'Bug', 'Poison', 395, 65, 90, 40, 45, 80, 75, 1, 'assets/sprites/15.png'),
(16, 'Pidgey', ' ', 'Normal', 'Flying', 251, 40, 45, 40, 35, 35, 56, 1, 'assets/sprites/16.png'),
(17, 'Pidgeotto', ' ', 'Normal', 'Flying', 349, 63, 60, 55, 50, 50, 71, 1, 'assets/sprites/17.png'),
(18, 'Pidgeot', ' ', 'Normal', 'Flying', 479, 83, 80, 75, 70, 70, 101, 1, 'assets/sprites/18.png'),
(19, 'Rattata', ' ', 'Normal', ' ', 253, 30, 56, 35, 25, 35, 72, 1, 'assets/sprites/19.png'),
(20, 'Raticate', ' ', 'Normal', ' ', 413, 55, 81, 60, 50, 70, 97, 1, 'assets/sprites/20.png'),
(21, 'Spearow', ' ', 'Normal', 'Flying', 262, 40, 60, 30, 31, 31, 70, 1, 'assets/sprites/21.png'),
(22, 'Fearow', ' ', 'Normal', 'Flying', 442, 65, 90, 65, 61, 61, 100, 1, 'assets/sprites/22.png'),
(23, 'Ekans', ' ', 'Poison', ' ', 288, 35, 60, 44, 40, 54, 55, 1, 'assets/sprites/23.png'),
(24, 'Arbok', ' ', 'Poison', ' ', 448, 60, 95, 69, 65, 79, 80, 1, 'assets/sprites/24.png'),
(25, 'Pikachu', ' ', 'Electric', ' ', 320, 35, 55, 40, 50, 50, 90, 1, 'assets/sprites/25.png'),
(26, 'Raichu', ' ', 'Electric', ' ', 485, 60, 90, 55, 90, 80, 110, 1, 'assets/sprites/26.png'),
(27, 'Sandshrew', ' ', 'Ground', ' ', 300, 50, 75, 85, 20, 30, 40, 1, 'assets/sprites/27.png'),
(28, 'Sandslash', ' ', 'Ground', ' ', 450, 75, 100, 110, 45, 55, 65, 1, 'assets/sprites/28.png'),
(29, 'Nidoran', 'Female', 'Poison', ' ', 275, 55, 47, 52, 40, 40, 41, 1, 'assets/sprites/29.png'),
(30, 'Nidorina', ' ', 'Poison', ' ', 365, 70, 62, 67, 55, 55, 56, 1, 'assets/sprites/30.png'),
(31, 'Nidoqueen', ' ', 'Poison', 'Ground', 505, 90, 92, 87, 75, 85, 76, 1, 'assets/sprites/31.png'),
(32, 'Nidoran', 'Male', 'Poison', ' ', 273, 46, 57, 40, 40, 40, 50, 1, 'assets/sprites/32.png'),
(33, 'Nidorino', ' ', 'Poison', ' ', 365, 61, 72, 57, 55, 55, 65, 1, 'assets/sprites/33.png'),
(34, 'Nidoking', ' ', 'Poison', 'Ground', 505, 81, 102, 77, 85, 75, 85, 1, 'assets/sprites/34.png'),
(35, 'Clefairy', ' ', 'Fairy', ' ', 323, 70, 45, 48, 60, 65, 35, 1, 'assets/sprites/35.png'),
(36, 'Clefable', ' ', 'Fairy', ' ', 483, 95, 70, 73, 95, 90, 60, 1, 'assets/sprites/36.png'),
(37, 'Vulpix', ' ', 'Fire', ' ', 299, 38, 41, 40, 50, 65, 65, 1, 'assets/sprites/37.png'),
(38, 'Ninetales', ' ', 'Fire', ' ', 505, 73, 76, 75, 81, 100, 100, 1, 'assets/sprites/38.png'),
(39, 'Jigglypuff', ' ', 'Normal', 'Fairy', 270, 115, 45, 20, 45, 25, 20, 1, 'assets/sprites/39.png'),
(40, 'Wigglytuff', ' ', 'Normal', 'Fairy', 435, 140, 70, 45, 85, 50, 45, 1, 'assets/sprites/40.png'),
(41, 'Zubat', ' ', 'Poison', 'Flying', 245, 40, 45, 35, 30, 40, 55, 1, 'assets/sprites/41.png'),
(42, 'Golbat', ' ', 'Poison', 'Flying', 455, 75, 80, 70, 65, 75, 90, 1, 'assets/sprites/42.png'),
(43, 'Oddish', ' ', 'Grass', 'Poison', 320, 45, 50, 55, 75, 65, 30, 1, 'assets/sprites/43.png'),
(44, 'Gloom', ' ', 'Grass', 'Poison', 395, 60, 65, 70, 85, 75, 40, 1, 'assets/sprites/44.png'),
(45, 'Vileplume', ' ', 'Grass', 'Poison', 490, 75, 80, 85, 110, 90, 50, 1, 'assets/sprites/45.png'),
(46, 'Paras', ' ', 'Bug', 'Grass', 285, 35, 70, 55, 45, 55, 25, 1, 'assets/sprites/46.png'),
(47, 'Parasect', ' ', 'Bug', 'Grass', 405, 60, 95, 80, 60, 80, 30, 1, 'assets/sprites/47.png'),
(48, 'Venonat', ' ', 'Bug', 'Poison', 305, 60, 55, 50, 40, 55, 45, 1, 'assets/sprites/48.png'),
(49, 'Venomoth', ' ', 'Bug', 'Poison', 450, 70, 65, 60, 90, 75, 90, 1, 'assets/sprites/49.png'),
(50, 'Diglett', ' ', 'Ground', ' ', 265, 10, 55, 25, 35, 45, 95, 1, 'assets/sprites/50.png'),
(51, 'Dugtrio', ' ', 'Ground', ' ', 425, 35, 100, 50, 50, 70, 120, 1, 'assets/sprites/51.png'),
(52, 'Meowth', ' ', 'Normal', ' ', 290, 40, 45, 35, 40, 40, 90, 1, 'assets/sprites/52.png'),
(53, 'Persian', ' ', 'Normal', ' ', 440, 65, 70, 60, 65, 65, 115, 1, 'assets/sprites/53.png'),
(54, 'Psyduck', ' ', 'Water', ' ', 320, 50, 52, 48, 65, 50, 55, 1, 'assets/sprites/54.png'),
(55, 'Golduck', ' ', 'Water', ' ', 500, 80, 82, 78, 95, 80, 85, 1, 'assets/sprites/55.png'),
(56, 'Mankey', ' ', 'Fighting', ' ', 305, 40, 80, 35, 35, 45, 70, 1, 'assets/sprites/56.png'),
(57, 'Primeape', ' ', 'Fighting', ' ', 455, 65, 105, 60, 60, 70, 95, 1, 'assets/sprites/57.png'),
(58, 'Growlithe', ' ', 'Fire', ' ', 350, 55, 70, 45, 70, 50, 60, 1, 'assets/sprites/58.png'),
(59, 'Arcanine', ' ', 'Fire', ' ', 555, 90, 110, 80, 100, 80, 95, 1, 'assets/sprites/59.png'),
(60, 'Poliwag', ' ', 'Water', ' ', 300, 40, 50, 40, 40, 40, 90, 1, 'assets/sprites/60.png'),
(61, 'Poliwhirl', ' ', 'Water', ' ', 385, 65, 65, 65, 50, 50, 90, 1, 'assets/sprites/61.png'),
(62, 'Poliwrath', ' ', 'Water', 'Fighting', 510, 90, 95, 95, 70, 90, 70, 1, 'assets/sprites/62.png'),
(63, 'Abra', ' ', 'Psychic', ' ', 310, 25, 20, 15, 105, 55, 90, 1, 'assets/sprites/63.png'),
(64, 'Kadabra', ' ', 'Psychic', ' ', 400, 40, 35, 30, 120, 70, 105, 1, 'assets/sprites/64.png'),
(65, 'Alakazam', ' ', 'Psychic', ' ', 500, 55, 50, 45, 135, 95, 120, 1, 'assets/sprites/65.png'),
(66, 'Machop', ' ', 'Fighting', ' ', 305, 70, 80, 50, 35, 35, 35, 1, 'assets/sprites/66.png'),
(67, 'Machoke', ' ', 'Fighting', ' ', 405, 80, 100, 70, 50, 60, 45, 1, 'assets/sprites/67.png'),
(68, 'Machamp', ' ', 'Fighting', ' ', 505, 90, 130, 80, 65, 85, 55, 1, 'assets/sprites/68.png'),
(69, 'Bellsprout', ' ', 'Grass', 'Poison', 300, 50, 75, 35, 70, 30, 40, 1, 'assets/sprites/69.png'),
(70, 'Weepinbell', ' ', 'Grass', 'Poison', 390, 65, 90, 50, 85, 45, 55, 1, 'assets/sprites/70.png'),
(71, 'Victreebel', ' ', 'Grass', 'Poison', 490, 80, 105, 65, 100, 70, 70, 1, 'assets/sprites/71.png'),
(72, 'Tentacool', ' ', 'Water', 'Poison', 335, 40, 40, 35, 50, 100, 70, 1, 'assets/sprites/72.png'),
(73, 'Tentacruel', ' ', 'Water', 'Poison', 515, 80, 70, 65, 80, 120, 100, 1, 'assets/sprites/73.png'),
(74, 'Geodude', ' ', 'Rock', 'Ground', 300, 40, 80, 100, 30, 30, 20, 1, 'assets/sprites/74.png'),
(75, 'Graveler', ' ', 'Rock', 'Ground', 390, 55, 95, 115, 45, 45, 35, 1, 'assets/sprites/75.png'),
(76, 'Golem', ' ', 'Rock', 'Ground', 495, 80, 120, 130, 55, 65, 45, 1, 'assets/sprites/76.png'),
(77, 'Ponyta', ' ', 'Fire', ' ', 410, 50, 85, 55, 65, 65, 90, 1, 'assets/sprites/77.png'),
(78, 'Rapidash', ' ', 'Fire', ' ', 500, 65, 100, 70, 80, 80, 105, 1, 'assets/sprites/78.png'),
(79, 'Slowpoke', ' ', 'Water', 'Psychic', 315, 90, 65, 65, 40, 40, 15, 1, 'assets/sprites/79.png'),
(80, 'Slowbro', ' ', 'Water', 'Psychic', 490, 95, 75, 110, 100, 80, 30, 1, 'assets/sprites/80.png'),
(81, 'Magnemite', ' ', 'Electric', 'Steel', 325, 25, 35, 70, 95, 55, 45, 1, 'assets/sprites/81.png'),
(82, 'Magneton', ' ', 'Electric', 'Steel', 465, 50, 60, 95, 120, 70, 70, 1, 'assets/sprites/82.png'),
(83, 'Farfetch\'d', ' ', 'Normal', 'Flying', 377, 52, 90, 55, 58, 62, 60, 1, 'assets/sprites/83.png'),
(84, 'Doduo', ' ', 'Normal', 'Flying', 310, 35, 85, 45, 35, 35, 75, 1, 'assets/sprites/84.png'),
(85, 'Dodrio', ' ', 'Normal', 'Flying', 470, 60, 110, 70, 60, 60, 110, 1, 'assets/sprites/85.png'),
(86, 'Seel', ' ', 'Water', ' ', 325, 65, 45, 55, 45, 70, 45, 1, 'assets/sprites/86.png'),
(87, 'Dewgong', ' ', 'Water', 'Ice', 475, 90, 70, 80, 70, 95, 70, 1, 'assets/sprites/87.png'),
(88, 'Grimer', ' ', 'Poison', ' ', 325, 80, 80, 50, 40, 50, 25, 1, 'assets/sprites/88.png'),
(89, 'Muk', ' ', 'Poison', ' ', 500, 105, 105, 75, 65, 100, 50, 1, 'assets/sprites/89.png'),
(90, 'Shellder', ' ', 'Water', ' ', 305, 30, 65, 100, 45, 25, 40, 1, 'assets/sprites/90.png'),
(91, 'Cloyster', ' ', 'Water', 'Ice', 525, 50, 95, 180, 85, 45, 70, 1, 'assets/sprites/91.png'),
(92, 'Gastly', ' ', 'Ghost', 'Poison', 310, 30, 35, 30, 100, 35, 80, 1, 'assets/sprites/92.png'),
(93, 'Haunter', ' ', 'Ghost', 'Poison', 405, 45, 50, 45, 115, 55, 95, 1, 'assets/sprites/93.png'),
(94, 'Gengar', ' ', 'Ghost', 'Poison', 500, 60, 65, 60, 130, 75, 110, 1, 'assets/sprites/94.png'),
(95, 'Onix', ' ', 'Rock', 'Ground', 385, 35, 45, 160, 30, 45, 70, 1, 'assets/sprites/95.png'),
(96, 'Drowzee', ' ', 'Psychic', ' ', 328, 60, 48, 45, 43, 90, 42, 1, 'assets/sprites/96.png'),
(97, 'Hypno', ' ', 'Psychic', ' ', 483, 85, 73, 70, 73, 115, 67, 1, 'assets/sprites/97.png'),
(98, 'Krabby', ' ', 'Water', ' ', 325, 30, 105, 90, 25, 25, 50, 1, 'assets/sprites/98.png'),
(99, 'Kingler', ' ', 'Water', ' ', 475, 55, 130, 115, 50, 50, 75, 1, 'assets/sprites/99.png'),
(100, 'Voltorb', ' ', 'Electric', ' ', 330, 40, 30, 50, 55, 55, 100, 1, 'assets/sprites/100.png'),
(101, 'Electrode', ' ', 'Electric', ' ', 490, 60, 50, 70, 80, 80, 150, 1, 'assets/sprites/101.png'),
(102, 'Exeggcute', ' ', 'Grass', 'Psychic', 325, 60, 40, 80, 60, 45, 40, 1, 'assets/sprites/102.png'),
(103, 'Exeggutor', ' ', 'Grass', 'Psychic', 530, 95, 95, 85, 125, 75, 55, 1, 'assets/sprites/103.png'),
(104, 'Cubone', ' ', 'Ground', ' ', 320, 50, 50, 95, 40, 50, 35, 1, 'assets/sprites/104.png'),
(105, 'Marowak', ' ', 'Ground', ' ', 425, 60, 80, 110, 50, 80, 45, 1, 'assets/sprites/105.png'),
(106, 'Hitmonlee', ' ', 'Fighting', ' ', 455, 50, 120, 53, 35, 110, 87, 1, 'assets/sprites/106.png'),
(107, 'Hitmonchan', ' ', 'Fighting', ' ', 455, 50, 105, 79, 35, 110, 76, 1, 'assets/sprites/107.png'),
(108, 'Lickitung', ' ', 'Normal', ' ', 385, 90, 55, 75, 60, 75, 30, 1, 'assets/sprites/108.png'),
(109, 'Koffing', ' ', 'Poison', ' ', 340, 40, 65, 95, 60, 45, 35, 1, 'assets/sprites/109.png'),
(110, 'Weezing', ' ', 'Poison', ' ', 490, 65, 90, 120, 85, 70, 60, 1, 'assets/sprites/110.png'),
(111, 'Rhyhorn', ' ', 'Ground', 'Rock', 345, 80, 85, 95, 30, 30, 25, 1, 'assets/sprites/111.png'),
(112, 'Rhydon', ' ', 'Ground', 'Rock', 485, 105, 130, 120, 45, 45, 40, 1, 'assets/sprites/112.png'),
(113, 'Chansey', ' ', 'Normal', ' ', 450, 250, 5, 5, 35, 105, 50, 1, 'assets/sprites/113.png'),
(114, 'Tangela', ' ', 'Grass', ' ', 435, 65, 55, 115, 100, 40, 60, 1, 'assets/sprites/114.png'),
(115, 'Kangaskhan', ' ', 'Normal', ' ', 490, 105, 95, 80, 40, 80, 90, 1, 'assets/sprites/115.png'),
(116, 'Horsea', ' ', 'Water', ' ', 295, 30, 40, 70, 70, 25, 60, 1, 'assets/sprites/116.png'),
(117, 'Seadra', ' ', 'Water', ' ', 440, 55, 65, 95, 95, 45, 85, 1, 'assets/sprites/117.png'),
(118, 'Goldeen', ' ', 'Water', ' ', 320, 45, 67, 60, 35, 50, 63, 1, 'assets/sprites/118.png'),
(119, 'Seaking', ' ', 'Water', ' ', 450, 80, 92, 65, 65, 80, 68, 1, 'assets/sprites/119.png'),
(120, 'Staryu', ' ', 'Water', ' ', 340, 30, 45, 55, 70, 55, 85, 1, 'assets/sprites/120.png'),
(121, 'Starmie', ' ', 'Water', 'Psychic', 520, 60, 75, 85, 100, 85, 115, 1, 'assets/sprites/121.png'),
(122, 'Mr. Mime', ' ', 'Psychic', 'Fairy', 460, 40, 45, 65, 100, 120, 90, 1, 'assets/sprites/122.png'),
(123, 'Scyther', ' ', 'Bug', 'Flying', 500, 70, 110, 80, 55, 80, 105, 1, 'assets/sprites/123.png'),
(124, 'Jynx', ' ', 'Ice', 'Psychic', 455, 65, 50, 35, 115, 95, 95, 1, 'assets/sprites/124.png'),
(125, 'Electabuzz', ' ', 'Electric', ' ', 490, 65, 83, 57, 95, 85, 105, 1, 'assets/sprites/125.png'),
(126, 'Magmar', ' ', 'Fire', ' ', 495, 65, 95, 57, 100, 85, 93, 1, 'assets/sprites/126.png'),
(127, 'Pinsir', ' ', 'Bug', ' ', 500, 65, 125, 100, 55, 70, 85, 1, 'assets/sprites/127.png'),
(128, 'Tauros', ' ', 'Normal', ' ', 490, 75, 100, 95, 40, 70, 110, 1, 'assets/sprites/128.png'),
(129, 'Magikarp', ' ', 'Water', ' ', 200, 20, 10, 55, 15, 20, 80, 1, 'assets/sprites/129.png'),
(130, 'Gyarados', ' ', 'Water', 'Flying', 540, 95, 125, 79, 60, 100, 81, 1, 'assets/sprites/130.png'),
(131, 'Lapras', ' ', 'Water', 'Ice', 535, 130, 85, 80, 85, 95, 60, 1, 'assets/sprites/131.png'),
(132, 'Ditto', ' ', 'Normal', ' ', 288, 48, 48, 48, 48, 48, 48, 1, 'assets/sprites/132.png'),
(133, 'Eevee', ' ', 'Normal', ' ', 325, 55, 55, 50, 45, 65, 55, 1, 'assets/sprites/133.png'),
(134, 'Vaporeon', ' ', 'Water', ' ', 525, 130, 65, 60, 110, 95, 65, 1, 'assets/sprites/134.png'),
(135, 'Jolteon', ' ', 'Electric', ' ', 525, 65, 65, 60, 110, 95, 130, 1, 'assets/sprites/135.png'),
(136, 'Flareon', ' ', 'Fire', ' ', 525, 65, 130, 60, 95, 110, 65, 1, 'assets/sprites/136.png'),
(137, 'Porygon', ' ', 'Normal', ' ', 395, 65, 60, 70, 85, 75, 40, 1, 'assets/sprites/137.png'),
(138, 'Omanyte', ' ', 'Rock', 'Water', 355, 35, 40, 100, 90, 55, 35, 1, 'assets/sprites/138.png'),
(139, 'Omastar', ' ', 'Rock', 'Water', 495, 70, 60, 125, 115, 70, 55, 1, 'assets/sprites/139.png'),
(140, 'Kabuto', ' ', 'Rock', 'Water', 355, 30, 80, 90, 55, 45, 55, 1, 'assets/sprites/140.png'),
(141, 'Kabutops', ' ', 'Rock', 'Water', 495, 60, 115, 105, 65, 70, 80, 1, 'assets/sprites/141.png'),
(142, 'Aerodactyl', ' ', 'Rock', 'Flying', 515, 80, 105, 65, 60, 75, 130, 1, 'assets/sprites/142.png'),
(143, 'Snorlax', ' ', 'Normal', ' ', 540, 160, 110, 65, 65, 110, 30, 1, 'assets/sprites/143.png'),
(144, 'Articuno', ' ', 'Ice', 'Flying', 580, 90, 85, 100, 95, 125, 85, 1, 'assets/sprites/144.png'),
(145, 'Zapdos', ' ', 'Electric', 'Flying', 580, 90, 90, 85, 125, 90, 100, 1, 'assets/sprites/145.png'),
(146, 'Moltres', ' ', 'Fire', 'Flying', 580, 90, 100, 90, 125, 85, 90, 1, 'assets/sprites/146.png'),
(147, 'Dratini', ' ', 'Dragon', ' ', 300, 41, 64, 45, 50, 50, 50, 1, 'assets/sprites/147.png'),
(148, 'Dragonair', ' ', 'Dragon', ' ', 420, 61, 84, 65, 70, 70, 70, 1, 'assets/sprites/148.png'),
(149, 'Dragonite', ' ', 'Dragon', 'Flying', 600, 91, 134, 95, 100, 100, 80, 1, 'assets/sprites/149.png'),
(150, 'Mewtwo', ' ', 'Psychic', ' ', 680, 106, 110, 90, 154, 90, 130, 1, 'assets/sprites/150.png'),
(151, 'Mew', ' ', 'Psychic', ' ', 600, 100, 100, 100, 100, 100, 100, 1, 'assets/sprites/151.png'),
(152, 'Chikorita', ' ', 'Grass', ' ', 318, 45, 49, 65, 49, 65, 45, 2, 'assets/sprites/152.png'),
(153, 'Bayleef', ' ', 'Grass', ' ', 405, 60, 62, 80, 63, 80, 60, 2, 'assets/sprites/153.png'),
(154, 'Meganium', ' ', 'Grass', ' ', 525, 80, 82, 100, 83, 100, 80, 2, 'assets/sprites/154.png'),
(155, 'Cyndaquil', ' ', 'Fire', ' ', 309, 39, 52, 43, 60, 50, 65, 2, 'assets/sprites/155.png'),
(156, 'Quilava', ' ', 'Fire', ' ', 405, 58, 64, 58, 80, 65, 80, 2, 'assets/sprites/156.png'),
(157, 'Typhlosion', ' ', 'Fire', ' ', 534, 78, 84, 78, 109, 85, 100, 2, 'assets/sprites/157.png'),
(158, 'Totodile', ' ', 'Water', ' ', 314, 50, 65, 64, 44, 48, 43, 2, 'assets/sprites/158.png'),
(159, 'Croconaw', ' ', 'Water', ' ', 405, 65, 80, 80, 59, 63, 58, 2, 'assets/sprites/159.png'),
(160, 'Feraligatr', ' ', 'Water', ' ', 530, 85, 105, 100, 79, 83, 78, 2, 'assets/sprites/160.png'),
(161, 'Sentret', ' ', 'Normal', ' ', 215, 35, 46, 34, 35, 45, 20, 2, 'assets/sprites/161.png'),
(162, 'Furret', ' ', 'Normal', ' ', 415, 85, 76, 64, 45, 55, 90, 2, 'assets/sprites/162.png'),
(163, 'Hoothoot', ' ', 'Normal', 'Flying', 262, 60, 30, 30, 36, 56, 50, 2, 'assets/sprites/163.png'),
(164, 'Noctowl', ' ', 'Normal', 'Flying', 452, 100, 50, 50, 86, 96, 70, 2, 'assets/sprites/164.png'),
(165, 'Ledyba', ' ', 'Bug', 'Flying', 265, 40, 20, 30, 40, 80, 55, 2, 'assets/sprites/165.png'),
(166, 'Ledian', ' ', 'Bug', 'Flying', 390, 55, 35, 50, 55, 110, 85, 2, 'assets/sprites/166.png'),
(167, 'Spinarak', ' ', 'Bug', 'Poison', 250, 40, 60, 40, 40, 40, 30, 2, 'assets/sprites/167.png'),
(168, 'Ariados', ' ', 'Bug', 'Poison', 400, 70, 90, 70, 60, 70, 40, 2, 'assets/sprites/168.png'),
(169, 'Crobat', ' ', 'Poison', 'Flying', 535, 85, 90, 80, 70, 80, 130, 2, 'assets/sprites/169.png'),
(170, 'Chinchou', ' ', 'Water', 'Electric', 330, 75, 38, 38, 56, 56, 67, 2, 'assets/sprites/170.png'),
(171, 'Lanturn', ' ', 'Water', 'Electric', 460, 125, 58, 58, 76, 76, 67, 2, 'assets/sprites/171.png'),
(172, 'Pichu', ' ', 'Electric', ' ', 205, 20, 40, 15, 35, 35, 60, 2, 'assets/sprites/172.png'),
(173, 'Cleffa', ' ', 'Fairy', ' ', 218, 50, 25, 28, 45, 55, 15, 2, 'assets/sprites/173.png'),
(174, 'Igglybuff', ' ', 'Normal', 'Fairy', 210, 90, 30, 15, 40, 20, 15, 2, 'assets/sprites/174.png'),
(175, 'Togepi', ' ', 'Fairy', ' ', 245, 35, 20, 65, 40, 65, 20, 2, 'assets/sprites/175.png'),
(176, 'Togetic', ' ', 'Fairy', 'Flying', 405, 55, 40, 85, 80, 105, 40, 2, 'assets/sprites/176.png'),
(177, 'Natu', ' ', 'Psychic', 'Flying', 320, 40, 50, 45, 70, 45, 70, 2, 'assets/sprites/177.png'),
(178, 'Xatu', ' ', 'Psychic', 'Flying', 470, 65, 75, 70, 95, 70, 95, 2, 'assets/sprites/178.png'),
(179, 'Mareep', ' ', 'Electric', ' ', 280, 55, 40, 40, 65, 45, 35, 2, 'assets/sprites/179.png'),
(180, 'Flaaffy', ' ', 'Electric', ' ', 365, 70, 55, 55, 80, 60, 45, 2, 'assets/sprites/180.png'),
(181, 'Ampharos', ' ', 'Electric', ' ', 510, 90, 75, 85, 115, 90, 55, 2, 'assets/sprites/181.png'),
(182, 'Bellossom', ' ', 'Grass', ' ', 490, 75, 80, 95, 90, 100, 50, 2, 'assets/sprites/182.png'),
(183, 'Marill', ' ', 'Water', 'Fairy', 250, 70, 20, 50, 20, 50, 40, 2, 'assets/sprites/183.png'),
(184, 'Azumarill', ' ', 'Water', 'Fairy', 420, 100, 50, 80, 60, 80, 50, 2, 'assets/sprites/184.png'),
(185, 'Sudowoodo', ' ', 'Rock', ' ', 410, 70, 100, 115, 30, 65, 30, 2, 'assets/sprites/185.png'),
(186, 'Politoed', ' ', 'Water', ' ', 500, 90, 75, 75, 90, 100, 70, 2, 'assets/sprites/186.png'),
(187, 'Hoppip', ' ', 'Grass', 'Flying', 250, 35, 35, 40, 35, 55, 50, 2, 'assets/sprites/187.png'),
(188, 'Skiploom', ' ', 'Grass', 'Flying', 340, 55, 45, 50, 45, 65, 80, 2, 'assets/sprites/188.png'),
(189, 'Jumpluff', ' ', 'Grass', 'Flying', 460, 75, 55, 70, 55, 95, 110, 2, 'assets/sprites/189.png'),
(190, 'Aipom', ' ', 'Normal', ' ', 360, 55, 70, 55, 40, 55, 85, 2, 'assets/sprites/190.png'),
(191, 'Sunkern', ' ', 'Grass', ' ', 180, 30, 30, 30, 30, 30, 30, 2, 'assets/sprites/191.png'),
(192, 'Sunflora', ' ', 'Grass', ' ', 425, 75, 75, 55, 105, 85, 30, 2, 'assets/sprites/192.png'),
(193, 'Yanma', ' ', 'Bug', 'Flying', 390, 65, 65, 45, 75, 45, 95, 2, 'assets/sprites/193.png'),
(194, 'Wooper', ' ', 'Water', 'Ground', 210, 55, 45, 45, 25, 25, 15, 2, 'assets/sprites/194.png'),
(195, 'Quagsire', ' ', 'Water', 'Ground', 430, 95, 85, 85, 65, 65, 35, 2, 'assets/sprites/195.png'),
(196, 'Espeon', ' ', 'Psychic', ' ', 525, 65, 65, 60, 130, 95, 110, 2, 'assets/sprites/196.png'),
(197, 'Umbreon', ' ', 'Dark', ' ', 525, 95, 65, 110, 60, 130, 65, 2, 'assets/sprites/197.png'),
(198, 'Murkrow', ' ', 'Dark', 'Flying', 405, 60, 85, 42, 85, 42, 91, 2, 'assets/sprites/198.png'),
(199, 'Slowking', ' ', 'Water', 'Psychic', 490, 95, 75, 80, 100, 110, 30, 2, 'assets/sprites/199.png'),
(200, 'Misdreavus', ' ', 'Ghost', ' ', 435, 60, 60, 60, 85, 85, 85, 2, 'assets/sprites/200.png'),
(201, 'Unown', ' ', 'Psychic', ' ', 336, 48, 72, 48, 72, 48, 48, 2, 'assets/sprites/201.png'),
(202, 'Wobbuffet', ' ', 'Psychic', ' ', 405, 190, 33, 58, 33, 58, 33, 2, 'assets/sprites/202.png'),
(203, 'Girafarig', ' ', 'Normal', 'Psychic', 455, 70, 80, 65, 90, 65, 85, 2, 'assets/sprites/203.png'),
(204, 'Pineco', ' ', 'Bug', ' ', 290, 50, 65, 90, 35, 35, 15, 2, 'assets/sprites/204.png'),
(205, 'Forretress', ' ', 'Bug', 'Steel', 465, 75, 90, 140, 60, 60, 40, 2, 'assets/sprites/205.png'),
(206, 'Dunsparce', ' ', 'Normal', ' ', 415, 100, 70, 70, 65, 65, 45, 2, 'assets/sprites/206.png'),
(207, 'Gligar', ' ', 'Ground', 'Flying', 430, 65, 75, 105, 35, 65, 85, 2, 'assets/sprites/207.png'),
(208, 'Steelix', ' ', 'Steel', 'Ground', 510, 75, 85, 200, 55, 65, 30, 2, 'assets/sprites/208.png'),
(209, 'Snubbull', ' ', 'Fairy', ' ', 300, 60, 80, 50, 40, 40, 30, 2, 'assets/sprites/209.png'),
(210, 'Granbull', ' ', 'Fairy', ' ', 450, 90, 120, 75, 60, 60, 45, 2, 'assets/sprites/210.png'),
(211, 'Qwilfish', ' ', 'Water', 'Poison', 440, 65, 95, 85, 55, 55, 85, 2, 'assets/sprites/211.png'),
(212, 'Scizor', ' ', 'Bug', 'Steel', 500, 70, 130, 100, 55, 80, 65, 2, 'assets/sprites/212.png'),
(213, 'Shuckle', ' ', 'Bug', 'Rock', 505, 20, 10, 230, 10, 230, 5, 2, 'assets/sprites/213.png'),
(214, 'Heracross', ' ', 'Bug', 'Fighting', 500, 80, 125, 75, 40, 95, 85, 2, 'assets/sprites/214.png'),
(215, 'Sneasel', ' ', 'Dark', 'Ice', 430, 55, 95, 55, 35, 75, 115, 2, 'assets/sprites/215.png'),
(216, 'Teddiursa', ' ', 'Normal', ' ', 330, 60, 80, 50, 50, 50, 40, 2, 'assets/sprites/216.png'),
(217, 'Ursaring', ' ', 'Normal', ' ', 500, 90, 130, 75, 75, 75, 55, 2, 'assets/sprites/217.png'),
(218, 'Slugma', ' ', 'Fire', ' ', 250, 40, 40, 40, 70, 40, 20, 2, 'assets/sprites/218.png'),
(219, 'Magcargo', ' ', 'Fire', 'Rock', 430, 60, 50, 120, 90, 80, 30, 2, 'assets/sprites/219.png'),
(220, 'Swinub', ' ', 'Ice', 'Ground', 250, 50, 50, 40, 30, 30, 50, 2, 'assets/sprites/220.png'),
(221, 'Piloswine', ' ', 'Ice', 'Ground', 450, 100, 100, 80, 60, 60, 50, 2, 'assets/sprites/221.png'),
(222, 'Corsola', ' ', 'Water', 'Rock', 410, 65, 55, 95, 65, 95, 35, 2, 'assets/sprites/222.png'),
(223, 'Remoraid', ' ', 'Water', ' ', 300, 35, 65, 35, 65, 35, 65, 2, 'assets/sprites/223.png'),
(224, 'Octillery', ' ', 'Water', ' ', 480, 75, 105, 75, 105, 75, 45, 2, 'assets/sprites/224.png'),
(225, 'Delibird', ' ', 'Ice', 'Flying', 330, 45, 55, 45, 65, 45, 75, 2, 'assets/sprites/225.png'),
(226, 'Mantine', ' ', 'Water', 'Flying', 485, 85, 40, 70, 80, 140, 70, 2, 'assets/sprites/226.png'),
(227, 'Skarmory', ' ', 'Steel', 'Flying', 465, 65, 80, 140, 40, 70, 70, 2, 'assets/sprites/227.png'),
(228, 'Houndour', ' ', 'Dark', 'Fire', 330, 45, 60, 30, 80, 50, 65, 2, 'assets/sprites/228.png'),
(229, 'Houndoom', ' ', 'Dark', 'Fire', 500, 75, 90, 50, 110, 80, 95, 2, 'assets/sprites/229.png'),
(230, 'Kingdra', ' ', 'Water', 'Dragon', 540, 75, 95, 95, 95, 95, 85, 2, 'assets/sprites/230.png'),
(231, 'Phanpy', ' ', 'Ground', ' ', 330, 90, 60, 60, 40, 40, 40, 2, 'assets/sprites/231.png'),
(232, 'Donphan', ' ', 'Ground', ' ', 500, 90, 120, 120, 60, 60, 50, 2, 'assets/sprites/232.png'),
(233, 'Porygon2', ' ', 'Normal', ' ', 515, 85, 80, 90, 105, 95, 60, 2, 'assets/sprites/233.png'),
(234, 'Stantler', ' ', 'Normal', ' ', 465, 73, 95, 62, 85, 65, 85, 2, 'assets/sprites/234.png'),
(235, 'Smeargle', ' ', 'Normal', ' ', 250, 55, 20, 35, 20, 45, 75, 2, 'assets/sprites/235.png'),
(236, 'Tyrogue', ' ', 'Fighting', ' ', 210, 35, 35, 35, 35, 35, 35, 2, 'assets/sprites/236.png'),
(237, 'Hitmontop', ' ', 'Fighting', ' ', 455, 50, 95, 95, 35, 110, 70, 2, 'assets/sprites/237.png'),
(238, 'Smoochum', ' ', 'Ice', 'Psychic', 305, 45, 30, 15, 85, 65, 65, 2, 'assets/sprites/238.png'),
(239, 'Elekid', ' ', 'Electric', ' ', 360, 45, 63, 37, 65, 55, 95, 2, 'assets/sprites/239.png'),
(240, 'Magby', ' ', 'Fire', ' ', 365, 45, 75, 37, 70, 55, 83, 2, 'assets/sprites/240.png'),
(241, 'Miltank', ' ', 'Normal', ' ', 490, 95, 80, 105, 40, 70, 100, 2, 'assets/sprites/241.png'),
(242, 'Blissey', ' ', 'Normal', ' ', 540, 255, 10, 10, 75, 135, 55, 2, 'assets/sprites/242.png'),
(243, 'Raikou', ' ', 'Electric', ' ', 580, 90, 85, 75, 115, 100, 115, 2, 'assets/sprites/243.png'),
(244, 'Entei', ' ', 'Fire', ' ', 580, 115, 115, 85, 90, 75, 100, 2, 'assets/sprites/244.png'),
(245, 'Suicune', ' ', 'Water', ' ', 580, 100, 75, 115, 90, 115, 85, 2, 'assets/sprites/245.png'),
(246, 'Larvitar', ' ', 'Rock', 'Ground', 300, 50, 64, 50, 45, 50, 41, 2, 'assets/sprites/246.png'),
(247, 'Pupitar', ' ', 'Rock', 'Ground', 410, 70, 84, 70, 65, 70, 51, 2, 'assets/sprites/247.png'),
(248, 'Tyranitar', ' ', 'Rock', 'Dark', 600, 100, 134, 110, 95, 100, 61, 2, 'assets/sprites/248.png'),
(249, 'Lugia', ' ', 'Psychic', 'Flying', 680, 106, 90, 130, 90, 154, 110, 2, 'assets/sprites/249.png'),
(250, 'Ho-oh', ' ', 'Fire', 'Flying', 680, 106, 130, 90, 110, 154, 90, 2, 'assets/sprites/250.png'),
(251, 'Celebi', ' ', 'Psychic', 'Grass', 600, 100, 100, 100, 100, 100, 100, 2, 'assets/sprites/251.png'),
(252, 'Treecko', ' ', 'Grass', ' ', 310, 40, 45, 35, 65, 55, 70, 3, 'assets/sprites/252.png'),
(253, 'Grovyle', ' ', 'Grass', ' ', 405, 50, 65, 45, 85, 65, 95, 3, 'assets/sprites/253.png'),
(254, 'Sceptile', ' ', 'Grass', ' ', 530, 70, 85, 65, 105, 85, 120, 3, 'assets/sprites/254.png'),
(255, 'Torchic', ' ', 'Fire', ' ', 310, 45, 60, 40, 70, 50, 45, 3, 'assets/sprites/255.png'),
(256, 'Combusken', ' ', 'Fire', 'Fighting', 405, 60, 85, 60, 85, 60, 55, 3, 'assets/sprites/256.png'),
(257, 'Blaziken', ' ', 'Fire', 'Fighting', 530, 80, 120, 70, 110, 70, 80, 3, 'assets/sprites/257.png'),
(258, 'Mudkip', ' ', 'Water', ' ', 310, 50, 70, 50, 50, 50, 40, 3, 'assets/sprites/258.png'),
(259, 'Marshtomp', ' ', 'Water', 'Ground', 405, 70, 85, 70, 60, 70, 50, 3, 'assets/sprites/259.png'),
(260, 'Swampert', ' ', 'Water', 'Ground', 535, 100, 110, 90, 85, 90, 60, 3, 'assets/sprites/260.png'),
(261, 'Poochyena', ' ', 'Dark', ' ', 220, 35, 55, 35, 30, 30, 35, 3, 'assets/sprites/261.png'),
(262, 'Mightyena', ' ', 'Dark', ' ', 420, 70, 90, 70, 60, 60, 70, 3, 'assets/sprites/262.png'),
(263, 'Zigzagoon', ' ', 'Normal', ' ', 240, 38, 30, 41, 30, 41, 60, 3, 'assets/sprites/263.png'),
(264, 'Linoone', ' ', 'Normal', ' ', 420, 78, 70, 61, 50, 61, 100, 3, 'assets/sprites/264.png'),
(265, 'Wurmple', ' ', 'Bug', ' ', 195, 45, 45, 35, 20, 30, 20, 3, 'assets/sprites/265.png'),
(266, 'Silcoon', ' ', 'Bug', ' ', 205, 50, 35, 55, 25, 25, 15, 3, 'assets/sprites/266.png'),
(267, 'Beautifly', ' ', 'Bug', 'Flying', 395, 60, 70, 50, 100, 50, 65, 3, 'assets/sprites/267.png'),
(268, 'Cascoon', ' ', 'Bug', ' ', 205, 50, 35, 55, 25, 25, 15, 3, 'assets/sprites/268.png'),
(269, 'Dustox', ' ', 'Bug', 'Poison', 385, 60, 50, 70, 50, 90, 65, 3, 'assets/sprites/269.png'),
(270, 'Lotad', ' ', 'Water', 'Grass', 220, 40, 30, 30, 40, 50, 30, 3, 'assets/sprites/270.png'),
(271, 'Lombre', ' ', 'Water', 'Grass', 340, 60, 50, 50, 60, 70, 50, 3, 'assets/sprites/271.png'),
(272, 'Ludicolo', ' ', 'Water', 'Grass', 480, 80, 70, 70, 90, 100, 70, 3, 'assets/sprites/272.png'),
(273, 'Seedot', ' ', 'Grass', ' ', 220, 40, 40, 50, 30, 30, 30, 3, 'assets/sprites/273.png'),
(274, 'Nuzleaf', ' ', 'Grass', 'Dark', 340, 70, 70, 40, 60, 40, 60, 3, 'assets/sprites/274.png'),
(275, 'Shiftry', ' ', 'Grass', 'Dark', 480, 90, 100, 60, 90, 60, 80, 3, 'assets/sprites/275.png'),
(276, 'Taillow', ' ', 'Normal', 'Flying', 270, 40, 55, 30, 30, 30, 85, 3, 'assets/sprites/276.png'),
(277, 'Swellow', ' ', 'Normal', 'Flying', 455, 60, 85, 60, 75, 50, 125, 3, 'assets/sprites/277.png'),
(278, 'Wingull', ' ', 'Water', 'Flying', 270, 40, 30, 30, 55, 30, 85, 3, 'assets/sprites/278.png'),
(279, 'Pelipper', ' ', 'Water', 'Flying', 440, 60, 50, 100, 95, 70, 65, 3, 'assets/sprites/279.png'),
(280, 'Ralts', ' ', 'Psychic', 'Fairy', 198, 28, 25, 25, 45, 35, 40, 3, 'assets/sprites/280.png'),
(281, 'Kirlia', ' ', 'Psychic', 'Fairy', 278, 38, 35, 35, 65, 55, 50, 3, 'assets/sprites/281.png'),
(282, 'Gardevoir', ' ', 'Psychic', 'Fairy', 518, 68, 65, 65, 125, 115, 80, 3, 'assets/sprites/282.png'),
(283, 'Surskit', ' ', 'Bug', 'Water', 269, 40, 30, 32, 50, 52, 65, 3, 'assets/sprites/283.png'),
(284, 'Masquerain', ' ', 'Bug', 'Flying', 454, 70, 60, 62, 100, 82, 80, 3, 'assets/sprites/284.png'),
(285, 'Shroomish', ' ', 'Grass', ' ', 295, 60, 40, 60, 40, 60, 35, 3, 'assets/sprites/285.png'),
(286, 'Breloom', ' ', 'Grass', 'Fighting', 460, 60, 130, 80, 60, 60, 70, 3, 'assets/sprites/286.png'),
(287, 'Slakoth', ' ', 'Normal', ' ', 280, 60, 60, 60, 35, 35, 30, 3, 'assets/sprites/287.png'),
(288, 'Vigoroth', ' ', 'Normal', ' ', 440, 80, 80, 80, 55, 55, 90, 3, 'assets/sprites/288.png'),
(289, 'Slaking', ' ', 'Normal', ' ', 670, 150, 160, 100, 95, 65, 100, 3, 'assets/sprites/289.png'),
(290, 'Nincada', ' ', 'Bug', 'Ground', 266, 31, 45, 90, 30, 30, 40, 3, 'assets/sprites/290.png'),
(291, 'Ninjask', ' ', 'Bug', 'Flying', 456, 61, 90, 45, 50, 50, 160, 3, 'assets/sprites/291.png'),
(292, 'Shedinja', ' ', 'Bug', 'Ghost', 236, 1, 90, 45, 30, 30, 40, 3, 'assets/sprites/292.png'),
(293, 'Whismur', ' ', 'Normal', ' ', 240, 64, 51, 23, 51, 23, 28, 3, 'assets/sprites/293.png'),
(294, 'Loudred', ' ', 'Normal', ' ', 360, 84, 71, 43, 71, 43, 48, 3, 'assets/sprites/294.png'),
(295, 'Exploud', ' ', 'Normal', ' ', 490, 104, 91, 63, 91, 73, 68, 3, 'assets/sprites/295.png'),
(296, 'Makuhita', ' ', 'Fighting', ' ', 237, 72, 60, 30, 20, 30, 25, 3, 'assets/sprites/296.png'),
(297, 'Hariyama', ' ', 'Fighting', ' ', 474, 144, 120, 60, 40, 60, 50, 3, 'assets/sprites/297.png'),
(298, 'Azurill', ' ', 'Normal', 'Fairy', 190, 50, 20, 40, 20, 40, 20, 3, 'assets/sprites/298.png'),
(299, 'Nosepass', ' ', 'Rock', ' ', 375, 30, 45, 135, 45, 90, 30, 3, 'assets/sprites/299.png'),
(300, 'Skitty', ' ', 'Normal', ' ', 260, 50, 45, 45, 35, 35, 50, 3, 'assets/sprites/300.png'),
(301, 'Delcatty', ' ', 'Normal', ' ', 400, 70, 65, 65, 55, 55, 90, 3, 'assets/sprites/301.png'),
(302, 'Sableye', ' ', 'Dark', 'Ghost', 380, 50, 75, 75, 65, 65, 50, 3, 'assets/sprites/302.png'),
(303, 'Mawile', ' ', 'Steel', 'Fairy', 380, 50, 85, 85, 55, 55, 50, 3, 'assets/sprites/303.png'),
(304, 'Aron', ' ', 'Steel', 'Rock', 330, 50, 70, 100, 40, 40, 30, 3, 'assets/sprites/304.png'),
(305, 'Lairon', ' ', 'Steel', 'Rock', 430, 60, 90, 140, 50, 50, 40, 3, 'assets/sprites/305.png'),
(306, 'Aggron', ' ', 'Steel', 'Rock', 530, 70, 110, 180, 60, 60, 50, 3, 'assets/sprites/306.png'),
(307, 'Meditite', ' ', 'Fighting', 'Psychic', 280, 30, 40, 55, 40, 55, 60, 3, 'assets/sprites/307.png'),
(308, 'Medicham', ' ', 'Fighting', 'Psychic', 410, 60, 60, 75, 60, 75, 80, 3, 'assets/sprites/308.png'),
(309, 'Electrike', ' ', 'Electric', ' ', 295, 40, 45, 40, 65, 40, 65, 3, 'assets/sprites/309.png'),
(310, 'Manectric', ' ', 'Electric', ' ', 475, 70, 75, 60, 105, 60, 105, 3, 'assets/sprites/310.png'),
(311, 'Plusle', ' ', 'Electric', ' ', 405, 60, 50, 40, 85, 75, 95, 3, 'assets/sprites/311.png'),
(312, 'Minun', ' ', 'Electric', ' ', 405, 60, 40, 50, 75, 85, 95, 3, 'assets/sprites/312.png'),
(313, 'Volbeat', ' ', 'Bug', ' ', 430, 65, 73, 75, 47, 85, 85, 3, 'assets/sprites/313.png'),
(314, 'Illumise', ' ', 'Bug', ' ', 430, 65, 47, 75, 73, 85, 85, 3, 'assets/sprites/314.png'),
(315, 'Roselia', ' ', 'Grass', 'Poison', 400, 50, 60, 45, 100, 80, 65, 3, 'assets/sprites/315.png'),
(316, 'Gulpin', ' ', 'Poison', ' ', 302, 70, 43, 53, 43, 53, 40, 3, 'assets/sprites/316.png'),
(317, 'Swalot', ' ', 'Poison', ' ', 467, 100, 73, 83, 73, 83, 55, 3, 'assets/sprites/317.png'),
(318, 'Carvanha', ' ', 'Water', 'Dark', 305, 45, 90, 20, 65, 20, 65, 3, 'assets/sprites/318.png'),
(319, 'Sharpedo', ' ', 'Water', 'Dark', 460, 70, 120, 40, 95, 40, 95, 3, 'assets/sprites/319.png'),
(320, 'Wailmer', ' ', 'Water', ' ', 400, 130, 70, 35, 70, 35, 60, 3, 'assets/sprites/320.png'),
(321, 'Wailord', ' ', 'Water', ' ', 500, 170, 90, 45, 90, 45, 60, 3, 'assets/sprites/321.png'),
(322, 'Numel', ' ', 'Fire', 'Ground', 305, 60, 60, 40, 65, 45, 35, 3, 'assets/sprites/322.png'),
(323, 'Camerupt', ' ', 'Fire', 'Ground', 460, 70, 100, 70, 105, 75, 40, 3, 'assets/sprites/323.png'),
(324, 'Torkoal', ' ', 'Fire', ' ', 470, 70, 85, 140, 85, 70, 20, 3, 'assets/sprites/324.png'),
(325, 'Spoink', ' ', 'Psychic', ' ', 330, 60, 25, 35, 70, 80, 60, 3, 'assets/sprites/325.png'),
(326, 'Grumpig', ' ', 'Psychic', ' ', 470, 80, 45, 65, 90, 110, 80, 3, 'assets/sprites/326.png'),
(327, 'Spinda', ' ', 'Normal', ' ', 360, 60, 60, 60, 60, 60, 60, 3, 'assets/sprites/327.png'),
(328, 'Trapinch', ' ', 'Ground', ' ', 290, 45, 100, 45, 45, 45, 10, 3, 'assets/sprites/328.png'),
(329, 'Vibrava', ' ', 'Ground', 'Dragon', 340, 50, 70, 50, 50, 50, 70, 3, 'assets/sprites/329.png'),
(330, 'Flygon', ' ', 'Ground', 'Dragon', 520, 80, 100, 80, 80, 80, 100, 3, 'assets/sprites/330.png'),
(331, 'Cacnea', ' ', 'Grass', ' ', 335, 50, 85, 40, 85, 40, 35, 3, 'assets/sprites/331.png'),
(332, 'Cacturne', ' ', 'Grass', 'Dark', 475, 70, 115, 60, 115, 60, 55, 3, 'assets/sprites/332.png'),
(333, 'Swablu', ' ', 'Normal', 'Flying', 310, 45, 40, 60, 40, 75, 50, 3, 'assets/sprites/333.png'),
(334, 'Altaria', ' ', 'Dragon', 'Flying', 490, 75, 70, 90, 70, 105, 80, 3, 'assets/sprites/334.png'),
(335, 'Zangoose', ' ', 'Normal', ' ', 458, 73, 115, 60, 60, 60, 90, 3, 'assets/sprites/335.png'),
(336, 'Seviper', ' ', 'Poison', ' ', 458, 73, 100, 60, 100, 60, 65, 3, 'assets/sprites/336.png'),
(337, 'Lunatone', ' ', 'Rock', 'Psychic', 460, 90, 55, 65, 95, 85, 70, 3, 'assets/sprites/337.png'),
(338, 'Solrock', ' ', 'Rock', 'Psychic', 460, 90, 95, 85, 55, 65, 70, 3, 'assets/sprites/338.png'),
(339, 'Barboach', ' ', 'Water', 'Ground', 288, 50, 48, 43, 46, 41, 60, 3, 'assets/sprites/339.png'),
(340, 'Whiscash', ' ', 'Water', 'Ground', 468, 110, 78, 73, 76, 71, 60, 3, 'assets/sprites/340.png'),
(341, 'Corphish', ' ', 'Water', ' ', 308, 43, 80, 65, 50, 35, 35, 3, 'assets/sprites/341.png'),
(342, 'Crawdaunt', ' ', 'Water', 'Dark', 468, 63, 120, 85, 90, 55, 55, 3, 'assets/sprites/342.png'),
(343, 'Baltoy', ' ', 'Ground', 'Psychic', 300, 40, 40, 55, 40, 70, 55, 3, 'assets/sprites/343.png'),
(344, 'Claydol', ' ', 'Ground', 'Psychic', 500, 60, 70, 105, 70, 120, 75, 3, 'assets/sprites/344.png'),
(345, 'Lileep', ' ', 'Rock', 'Grass', 355, 66, 41, 77, 61, 87, 23, 3, 'assets/sprites/345.png'),
(346, 'Cradily', ' ', 'Rock', 'Grass', 495, 86, 81, 97, 81, 107, 43, 3, 'assets/sprites/346.png'),
(347, 'Anorith', ' ', 'Rock', 'Bug', 355, 45, 95, 50, 40, 50, 75, 3, 'assets/sprites/347.png'),
(348, 'Armaldo', ' ', 'Rock', 'Bug', 495, 75, 125, 100, 70, 80, 45, 3, 'assets/sprites/348.png'),
(349, 'Feebas', ' ', 'Water', ' ', 200, 20, 15, 20, 10, 55, 80, 3, 'assets/sprites/349.png'),
(350, 'Milotic', ' ', 'Water', ' ', 540, 95, 60, 79, 100, 125, 81, 3, 'assets/sprites/350.png'),
(351, 'Castform', ' ', 'Normal', ' ', 420, 70, 70, 70, 70, 70, 70, 3, 'assets/sprites/351.png'),
(352, 'Kecleon', ' ', 'Normal', ' ', 440, 60, 90, 70, 60, 120, 40, 3, 'assets/sprites/352.png'),
(353, 'Shuppet', ' ', 'Ghost', ' ', 295, 44, 75, 35, 63, 33, 45, 3, 'assets/sprites/353.png'),
(354, 'Banette', ' ', 'Ghost', ' ', 455, 64, 115, 65, 83, 63, 65, 3, 'assets/sprites/354.png'),
(355, 'Duskull', ' ', 'Ghost', ' ', 295, 20, 40, 90, 30, 90, 25, 3, 'assets/sprites/355.png'),
(356, 'Dusclops', ' ', 'Ghost', ' ', 455, 40, 70, 130, 60, 130, 25, 3, 'assets/sprites/356.png'),
(357, 'Tropius', ' ', 'Grass', 'Flying', 460, 99, 68, 83, 72, 87, 51, 3, 'assets/sprites/357.png'),
(358, 'Chimecho', ' ', 'Psychic', ' ', 455, 75, 50, 80, 95, 90, 65, 3, 'assets/sprites/358.png'),
(359, 'Absol', ' ', 'Dark', ' ', 465, 65, 130, 60, 75, 60, 75, 3, 'assets/sprites/359.png'),
(360, 'Wynaut', ' ', 'Psychic', ' ', 260, 95, 23, 48, 23, 48, 23, 3, 'assets/sprites/360.png'),
(361, 'Snorunt', ' ', 'Ice', ' ', 300, 50, 50, 50, 50, 50, 50, 3, 'assets/sprites/361.png'),
(362, 'Glalie', ' ', 'Ice', ' ', 480, 80, 80, 80, 80, 80, 80, 3, 'assets/sprites/362.png'),
(363, 'Spheal', ' ', 'Ice', 'Water', 290, 70, 40, 50, 55, 50, 25, 3, 'assets/sprites/363.png'),
(364, 'Sealeo', ' ', 'Ice', 'Water', 410, 90, 60, 70, 75, 70, 45, 3, 'assets/sprites/364.png'),
(365, 'Walrein', ' ', 'Ice', 'Water', 530, 110, 80, 90, 95, 90, 65, 3, 'assets/sprites/365.png'),
(366, 'Clamperl', ' ', 'Water', ' ', 345, 35, 64, 85, 74, 55, 32, 3, 'assets/sprites/366.png'),
(367, 'Huntail', ' ', 'Water', ' ', 485, 55, 104, 105, 94, 75, 52, 3, 'assets/sprites/367.png'),
(368, 'Gorebyss', ' ', 'Water', ' ', 485, 55, 84, 105, 114, 75, 52, 3, 'assets/sprites/368.png'),
(369, 'Relicanth', ' ', 'Water', 'Rock', 485, 100, 90, 130, 45, 65, 55, 3, 'assets/sprites/369.png'),
(370, 'Luvdisc', ' ', 'Water', ' ', 330, 43, 30, 55, 40, 65, 97, 3, 'assets/sprites/370.png'),
(371, 'Bagon', ' ', 'Dragon', ' ', 300, 45, 75, 60, 40, 30, 50, 3, 'assets/sprites/371.png'),
(372, 'Shelgon', ' ', 'Dragon', ' ', 420, 65, 95, 100, 60, 50, 50, 3, 'assets/sprites/372.png'),
(373, 'Salamence', ' ', 'Dragon', 'Flying', 600, 95, 135, 80, 110, 80, 100, 3, 'assets/sprites/373.png'),
(374, 'Beldum', ' ', 'Steel', 'Psychic', 300, 40, 55, 80, 35, 60, 30, 3, 'assets/sprites/374.png'),
(375, 'Metang', ' ', 'Steel', 'Psychic', 420, 60, 75, 100, 55, 80, 50, 3, 'assets/sprites/375.png'),
(376, 'Metagross', ' ', 'Steel', 'Psychic', 600, 80, 135, 130, 95, 90, 70, 3, 'assets/sprites/376.png'),
(377, 'Regirock', ' ', 'Rock', ' ', 580, 80, 100, 200, 50, 100, 50, 3, 'assets/sprites/377.png'),
(378, 'Regice', ' ', 'Ice', ' ', 580, 80, 50, 100, 100, 200, 50, 3, 'assets/sprites/378.png'),
(379, 'Registeel', ' ', 'Steel', ' ', 580, 80, 75, 150, 75, 150, 50, 3, 'assets/sprites/379.png'),
(380, 'Latias', ' ', 'Dragon', 'Psychic', 600, 80, 80, 90, 110, 130, 110, 3, 'assets/sprites/380.png'),
(381, 'Latios', ' ', 'Dragon', 'Psychic', 600, 80, 90, 80, 130, 110, 110, 3, 'assets/sprites/381.png'),
(382, 'Kyogre', ' ', 'Water', ' ', 670, 100, 100, 90, 150, 140, 90, 3, 'assets/sprites/382.png'),
(383, 'Groudon', ' ', 'Ground', ' ', 670, 100, 150, 140, 100, 90, 90, 3, 'assets/sprites/383.png'),
(384, 'Rayquaza', ' ', 'Dragon', 'Flying', 680, 105, 150, 90, 150, 90, 95, 3, 'assets/sprites/384.png'),
(385, 'Jirachi', ' ', 'Steel', 'Psychic', 600, 100, 100, 100, 100, 100, 100, 3, 'assets/sprites/385.png'),
(386, 'Deoxys', 'Normal Forme', 'Psychic', ' ', 600, 50, 150, 50, 150, 50, 150, 3, 'assets/sprites/386.png'),
(387, 'Turtwig', ' ', 'Grass', ' ', 318, 55, 68, 64, 45, 55, 31, 4, 'assets/sprites/387.png'),
(388, 'Grotle', ' ', 'Grass', ' ', 405, 75, 89, 85, 55, 65, 36, 4, 'assets/sprites/388.png'),
(389, 'Torterra', ' ', 'Grass', 'Ground', 525, 95, 109, 105, 75, 85, 56, 4, 'assets/sprites/389.png'),
(390, 'Chimchar', ' ', 'Fire', ' ', 309, 44, 58, 44, 58, 44, 61, 4, 'assets/sprites/390.png'),
(391, 'Monferno', ' ', 'Fire', 'Fighting', 405, 64, 78, 52, 78, 52, 81, 4, 'assets/sprites/391.png'),
(392, 'Infernape', ' ', 'Fire', 'Fighting', 534, 76, 104, 71, 104, 71, 108, 4, 'assets/sprites/392.png'),
(393, 'Piplup', ' ', 'Water', ' ', 314, 53, 51, 53, 61, 56, 40, 4, 'assets/sprites/393.png'),
(394, 'Prinplup', ' ', 'Water', ' ', 405, 64, 66, 68, 81, 76, 50, 4, 'assets/sprites/394.png'),
(395, 'Empoleon', ' ', 'Water', 'Steel', 530, 84, 86, 88, 111, 101, 60, 4, 'assets/sprites/395.png'),
(396, 'Starly', ' ', 'Normal', 'Flying', 245, 40, 55, 30, 30, 30, 60, 4, 'assets/sprites/396.png'),
(397, 'Staravia', ' ', 'Normal', 'Flying', 340, 55, 75, 50, 40, 40, 80, 4, 'assets/sprites/397.png'),
(398, 'Staraptor', ' ', 'Normal', 'Flying', 485, 85, 120, 70, 50, 60, 100, 4, 'assets/sprites/398.png'),
(399, 'Bidoof', ' ', 'Normal', ' ', 250, 59, 45, 40, 35, 40, 31, 4, 'assets/sprites/399.png'),
(400, 'Bibarel', ' ', 'Normal', 'Water', 410, 79, 85, 60, 55, 60, 71, 4, 'assets/sprites/400.png'),
(401, 'Kricketot', ' ', 'Bug', ' ', 194, 37, 25, 41, 25, 41, 25, 4, 'assets/sprites/401.png'),
(402, 'Kricketune', ' ', 'Bug', ' ', 384, 77, 85, 51, 55, 51, 65, 4, 'assets/sprites/402.png'),
(403, 'Shinx', ' ', 'Electric', ' ', 263, 45, 65, 34, 40, 34, 45, 4, 'assets/sprites/403.png'),
(404, 'Luxio', ' ', 'Electric', ' ', 363, 60, 85, 49, 60, 49, 60, 4, 'assets/sprites/404.png'),
(405, 'Luxray', ' ', 'Electric', ' ', 523, 80, 120, 79, 95, 79, 70, 4, 'assets/sprites/405.png'),
(406, 'Budew', ' ', 'Grass', 'Poison', 280, 40, 30, 35, 50, 70, 55, 4, 'assets/sprites/406.png'),
(407, 'Roserade', ' ', 'Grass', 'Poison', 515, 60, 70, 65, 125, 105, 90, 4, 'assets/sprites/407.png'),
(408, 'Cranidos', ' ', 'Rock', ' ', 350, 67, 125, 40, 30, 30, 58, 4, 'assets/sprites/408.png'),
(409, 'Rampardos', ' ', 'Rock', ' ', 495, 97, 165, 60, 65, 50, 58, 4, 'assets/sprites/409.png'),
(410, 'Shieldon', ' ', 'Rock', 'Steel', 350, 30, 42, 118, 42, 88, 30, 4, 'assets/sprites/410.png'),
(411, 'Bastiodon', ' ', 'Rock', 'Steel', 495, 60, 52, 168, 47, 138, 30, 4, 'assets/sprites/411.png'),
(412, 'Burmy', 'Plant Cloak', 'Bug', ' ', 224, 40, 29, 45, 29, 45, 36, 4, 'assets/sprites/412.png'),
(413, 'Wormadam', 'Plant Cloak', 'Bug', 'Grass', 424, 60, 59, 85, 79, 105, 36, 4, 'assets/sprites/413.png'),
(414, 'Mothim', ' ', 'Bug', 'Flying', 424, 70, 94, 50, 94, 50, 66, 4, 'assets/sprites/414.png'),
(415, 'Combee', ' ', 'Bug', 'Flying', 244, 30, 30, 42, 30, 42, 70, 4, 'assets/sprites/415.png'),
(416, 'Vespiquen', ' ', 'Bug', 'Flying', 474, 70, 80, 102, 80, 102, 40, 4, 'assets/sprites/416.png'),
(417, 'Pachirisu', ' ', 'Electric', ' ', 405, 60, 45, 70, 45, 90, 95, 4, 'assets/sprites/417.png'),
(418, 'Buizel', ' ', 'Water', ' ', 330, 55, 65, 35, 60, 30, 85, 4, 'assets/sprites/418.png'),
(419, 'Floatzel', ' ', 'Water', ' ', 495, 85, 105, 55, 85, 50, 115, 4, 'assets/sprites/419.png'),
(420, 'Cherubi', ' ', 'Grass', ' ', 275, 45, 35, 45, 62, 53, 35, 4, 'assets/sprites/420.png'),
(421, 'Cherrim', ' ', 'Grass', ' ', 450, 70, 60, 70, 87, 78, 85, 4, 'assets/sprites/421.png'),
(422, 'Shellos', ' ', 'Water', ' ', 325, 76, 48, 48, 57, 62, 34, 4, 'assets/sprites/422.png'),
(423, 'Gastrodon', ' ', 'Water', 'Ground', 475, 111, 83, 68, 92, 82, 39, 4, 'assets/sprites/423.png'),
(424, 'Ambipom', ' ', 'Normal', ' ', 482, 75, 100, 66, 60, 66, 115, 4, 'assets/sprites/424.png'),
(425, 'Drifloon', ' ', 'Ghost', 'Flying', 348, 90, 50, 34, 60, 44, 70, 4, 'assets/sprites/425.png'),
(426, 'Drifblim', ' ', 'Ghost', 'Flying', 498, 150, 80, 44, 90, 54, 80, 4, 'assets/sprites/426.png'),
(427, 'Buneary', ' ', 'Normal', ' ', 350, 55, 66, 44, 44, 56, 85, 4, 'assets/sprites/427.png'),
(428, 'Lopunny', ' ', 'Normal', ' ', 480, 65, 76, 84, 54, 96, 105, 4, 'assets/sprites/428.png'),
(429, 'Mismagius', ' ', 'Ghost', ' ', 495, 60, 60, 60, 105, 105, 105, 4, 'assets/sprites/429.png'),
(430, 'Honchkrow', ' ', 'Dark', 'Flying', 505, 100, 125, 52, 105, 52, 71, 4, 'assets/sprites/430.png'),
(431, 'Glameow', ' ', 'Normal', ' ', 310, 49, 55, 42, 42, 37, 85, 4, 'assets/sprites/431.png'),
(432, 'Purugly', ' ', 'Normal', ' ', 452, 71, 82, 64, 64, 59, 112, 4, 'assets/sprites/432.png'),
(433, 'Chingling', ' ', 'Psychic', ' ', 285, 45, 30, 50, 65, 50, 45, 4, 'assets/sprites/433.png'),
(434, 'Stunky', ' ', 'Poison', 'Dark', 329, 63, 63, 47, 41, 41, 74, 4, 'assets/sprites/434.png'),
(435, 'Skuntank', ' ', 'Poison', 'Dark', 479, 103, 93, 67, 71, 61, 84, 4, 'assets/sprites/435.png'),
(436, 'Bronzor', ' ', 'Steel', 'Psychic', 300, 57, 24, 86, 24, 86, 23, 4, 'assets/sprites/436.png'),
(437, 'Bronzong', ' ', 'Steel', 'Psychic', 500, 67, 89, 116, 79, 116, 33, 4, 'assets/sprites/437.png'),
(438, 'Bonsly', ' ', 'Rock', ' ', 290, 50, 80, 95, 10, 45, 10, 4, 'assets/sprites/438.png'),
(439, 'Mime Jr.', ' ', 'Psychic', 'Fairy', 310, 20, 25, 45, 70, 90, 60, 4, 'assets/sprites/439.png'),
(440, 'Happiny', ' ', 'Normal', ' ', 220, 100, 5, 5, 15, 65, 30, 4, 'assets/sprites/440.png'),
(441, 'Chatot', ' ', 'Normal', 'Flying', 411, 76, 65, 45, 92, 42, 91, 4, 'assets/sprites/441.png'),
(442, 'Spiritomb', ' ', 'Ghost', 'Dark', 485, 50, 92, 108, 92, 108, 35, 4, 'assets/sprites/442.png'),
(443, 'Gible', ' ', 'Dragon', 'Ground', 300, 58, 70, 45, 40, 45, 42, 4, 'assets/sprites/443.png'),
(444, 'Gabite', ' ', 'Dragon', 'Ground', 410, 68, 90, 65, 50, 55, 82, 4, 'assets/sprites/444.png'),
(445, 'Garchomp', ' ', 'Dragon', 'Ground', 600, 108, 130, 95, 80, 85, 102, 4, 'assets/sprites/445.png'),
(446, 'Munchlax', ' ', 'Normal', ' ', 390, 135, 85, 40, 40, 85, 5, 4, 'assets/sprites/446.png'),
(447, 'Riolu', ' ', 'Fighting', ' ', 285, 40, 70, 40, 35, 40, 60, 4, 'assets/sprites/447.png'),
(448, 'Lucario', ' ', 'Fighting', 'Steel', 525, 70, 110, 70, 115, 70, 90, 4, 'assets/sprites/448.png'),
(449, 'Hippopotas', ' ', 'Ground', ' ', 330, 68, 72, 78, 38, 42, 32, 4, 'assets/sprites/449.png'),
(450, 'Hippowdon', ' ', 'Ground', ' ', 525, 108, 112, 118, 68, 72, 47, 4, 'assets/sprites/450.png'),
(451, 'Skorupi', ' ', 'Poison', 'Bug', 330, 40, 50, 90, 30, 55, 65, 4, 'assets/sprites/451.png'),
(452, 'Drapion', ' ', 'Poison', 'Dark', 500, 70, 90, 110, 60, 75, 95, 4, 'assets/sprites/452.png'),
(453, 'Croagunk', ' ', 'Poison', 'Fighting', 300, 48, 61, 40, 61, 40, 50, 4, 'assets/sprites/453.png'),
(454, 'Toxicroak', ' ', 'Poison', 'Fighting', 490, 83, 106, 65, 86, 65, 85, 4, 'assets/sprites/454.png'),
(455, 'Carnivine', ' ', 'Grass', ' ', 454, 74, 100, 72, 90, 72, 46, 4, 'assets/sprites/455.png'),
(456, 'Finneon', ' ', 'Water', ' ', 330, 49, 49, 56, 49, 61, 66, 4, 'assets/sprites/456.png'),
(457, 'Lumineon', ' ', 'Water', ' ', 460, 69, 69, 76, 69, 86, 91, 4, 'assets/sprites/457.png'),
(458, 'Mantyke', ' ', 'Water', 'Flying', 345, 45, 20, 50, 60, 120, 50, 4, 'assets/sprites/458.png'),
(459, 'Snover', ' ', 'Grass', 'Ice', 334, 60, 62, 50, 62, 60, 40, 4, 'assets/sprites/459.png'),
(460, 'Abomasnow', ' ', 'Grass', 'Ice', 494, 90, 92, 75, 92, 85, 60, 4, 'assets/sprites/460.png'),
(461, 'Weavile', ' ', 'Dark', 'Ice', 510, 70, 120, 65, 45, 85, 125, 4, 'assets/sprites/461.png'),
(462, 'Magnezone', ' ', 'Electric', 'Steel', 535, 70, 70, 115, 130, 90, 60, 4, 'assets/sprites/462.png'),
(463, 'Lickilicky', ' ', 'Normal', ' ', 515, 110, 85, 95, 80, 95, 50, 4, 'assets/sprites/463.png'),
(464, 'Rhyperior', ' ', 'Ground', 'Rock', 535, 115, 140, 130, 55, 55, 40, 4, 'assets/sprites/464.png'),
(465, 'Tangrowth', ' ', 'Grass', ' ', 535, 100, 100, 125, 110, 50, 50, 4, 'assets/sprites/465.png'),
(466, 'Electivire', ' ', 'Electric', ' ', 540, 75, 123, 67, 95, 85, 95, 4, 'assets/sprites/466.png'),
(467, 'Magmortar', ' ', 'Fire', ' ', 540, 75, 95, 67, 125, 95, 83, 4, 'assets/sprites/467.png'),
(468, 'Togekiss', ' ', 'Fairy', 'Flying', 545, 85, 50, 95, 120, 115, 80, 4, 'assets/sprites/468.png'),
(469, 'Yanmega', ' ', 'Bug', 'Flying', 515, 86, 76, 86, 116, 56, 95, 4, 'assets/sprites/469.png'),
(470, 'Leafeon', ' ', 'Grass', ' ', 525, 65, 110, 130, 60, 65, 95, 4, 'assets/sprites/470.png'),
(471, 'Glaceon', ' ', 'Ice', ' ', 525, 65, 60, 110, 130, 95, 65, 4, 'assets/sprites/471.png'),
(472, 'Gliscor', ' ', 'Ground', 'Flying', 510, 75, 95, 125, 45, 75, 95, 4, 'assets/sprites/472.png'),
(473, 'Mamoswine', ' ', 'Ice', 'Ground', 530, 110, 130, 80, 70, 60, 80, 4, 'assets/sprites/473.png'),
(474, 'Porygon-Z', ' ', 'Normal', ' ', 535, 85, 80, 70, 135, 75, 90, 4, 'assets/sprites/474.png'),
(475, 'Gallade', ' ', 'Psychic', 'Fighting', 518, 68, 125, 65, 65, 115, 80, 4, 'assets/sprites/475.png'),
(476, 'Probopass', ' ', 'Rock', 'Steel', 525, 60, 55, 145, 75, 150, 40, 4, 'assets/sprites/476.png'),
(477, 'Dusknoir', ' ', 'Ghost', ' ', 525, 45, 100, 135, 65, 135, 45, 4, 'assets/sprites/477.png'),
(478, 'Froslass', ' ', 'Ice', 'Ghost', 480, 70, 80, 70, 80, 70, 110, 4, 'assets/sprites/478.png'),
(479, 'Rotom', ' ', 'Electric', 'Ghost', 440, 50, 50, 77, 95, 77, 91, 4, 'assets/sprites/479.png'),
(480, 'Uxie', ' ', 'Psychic', ' ', 580, 75, 75, 130, 75, 130, 95, 4, 'assets/sprites/480.png'),
(481, 'Mesprit', ' ', 'Psychic', ' ', 580, 80, 105, 105, 105, 105, 80, 4, 'assets/sprites/481.png'),
(482, 'Azelf', ' ', 'Psychic', ' ', 580, 75, 125, 70, 125, 70, 115, 4, 'assets/sprites/482.png'),
(483, 'Dialga', ' ', 'Steel', 'Dragon', 680, 100, 120, 120, 150, 100, 90, 4, 'assets/sprites/483.png'),
(484, 'Palkia', ' ', 'Water', 'Dragon', 680, 90, 120, 100, 150, 120, 100, 4, 'assets/sprites/484.png'),
(485, 'Heatran', ' ', 'Fire', 'Steel', 600, 91, 90, 106, 130, 106, 77, 4, 'assets/sprites/485.png'),
(486, 'Regigigas', ' ', 'Normal', ' ', 670, 110, 160, 110, 80, 110, 100, 4, 'assets/sprites/486.png'),
(487, 'Giratina', 'Altered Forme', 'Ghost', 'Dragon', 680, 150, 100, 120, 100, 120, 90, 4, 'assets/sprites/487.png'),
(488, 'Cresselia', ' ', 'Psychic', ' ', 580, 120, 70, 110, 75, 120, 85, 4, 'assets/sprites/488.png'),
(489, 'Phione', ' ', 'Water', ' ', 480, 80, 80, 80, 80, 80, 80, 4, 'assets/sprites/489.png'),
(490, 'Manaphy', ' ', 'Water', ' ', 600, 100, 100, 100, 100, 100, 100, 4, 'assets/sprites/490.png'),
(491, 'Darkrai', ' ', 'Dark', ' ', 600, 70, 90, 90, 135, 90, 125, 4, 'assets/sprites/491.png'),
(492, 'Shaymin', 'Land Forme', 'Grass', ' ', 600, 100, 100, 100, 100, 100, 100, 4, 'assets/sprites/492.png'),
(493, 'Arceus', ' ', 'Normal', ' ', 720, 120, 120, 120, 120, 120, 120, 4, 'assets/sprites/493.png'),
(494, 'Victini', ' ', 'Psychic', 'Fire', 600, 100, 100, 100, 100, 100, 100, 5, 'assets/sprites/494.png'),
(495, 'Snivy', ' ', 'Grass', ' ', 308, 45, 45, 55, 45, 55, 63, 5, 'assets/sprites/495.png'),
(496, 'Servine', ' ', 'Grass', ' ', 413, 60, 60, 75, 60, 75, 83, 5, 'assets/sprites/496.png'),
(497, 'Serperior', ' ', 'Grass', ' ', 528, 75, 75, 95, 75, 95, 113, 5, 'assets/sprites/497.png'),
(498, 'Tepig', ' ', 'Fire', ' ', 308, 65, 63, 45, 45, 45, 45, 5, 'assets/sprites/498.png'),
(499, 'Pignite', ' ', 'Fire', 'Fighting', 418, 90, 93, 55, 70, 55, 55, 5, 'assets/sprites/499.png'),
(500, 'Emboar', ' ', 'Fire', 'Fighting', 528, 110, 123, 65, 100, 65, 65, 5, 'assets/sprites/500.png'),
(501, 'Oshawott', ' ', 'Water', ' ', 308, 55, 55, 45, 63, 45, 45, 5, 'assets/sprites/501.png'),
(502, 'Dewott', ' ', 'Water', ' ', 413, 75, 75, 60, 83, 60, 60, 5, 'assets/sprites/502.png'),
(503, 'Samurott', ' ', 'Water', ' ', 528, 95, 100, 85, 108, 70, 70, 5, 'assets/sprites/503.png'),
(504, 'Patrat', ' ', 'Normal', ' ', 255, 45, 55, 39, 35, 39, 42, 5, 'assets/sprites/504.png'),
(505, 'Watchog', ' ', 'Normal', ' ', 420, 60, 85, 69, 60, 69, 77, 5, 'assets/sprites/505.png'),
(506, 'Lillipup', ' ', 'Normal', ' ', 275, 45, 60, 45, 25, 45, 55, 5, 'assets/sprites/506.png'),
(507, 'Herdier', ' ', 'Normal', ' ', 370, 65, 80, 65, 35, 65, 60, 5, 'assets/sprites/507.png'),
(508, 'Stoutland', ' ', 'Normal', ' ', 500, 85, 110, 90, 45, 90, 80, 5, 'assets/sprites/508.png'),
(509, 'Purrloin', ' ', 'Dark', ' ', 281, 41, 50, 37, 50, 37, 66, 5, 'assets/sprites/509.png'),
(510, 'Liepard', ' ', 'Dark', ' ', 446, 64, 88, 50, 88, 50, 106, 5, 'assets/sprites/510.png'),
(511, 'Pansage', ' ', 'Grass', ' ', 316, 50, 53, 48, 53, 48, 64, 5, 'assets/sprites/511.png'),
(512, 'Simisage', ' ', 'Grass', ' ', 498, 75, 98, 63, 98, 63, 101, 5, 'assets/sprites/512.png'),
(513, 'Pansear', ' ', 'Fire', ' ', 316, 50, 53, 48, 53, 48, 64, 5, 'assets/sprites/513.png'),
(514, 'Simisear', ' ', 'Fire', ' ', 498, 75, 98, 63, 98, 63, 101, 5, 'assets/sprites/514.png'),
(515, 'Panpour', ' ', 'Water', ' ', 316, 50, 53, 48, 53, 48, 64, 5, 'assets/sprites/515.png'),
(516, 'Simipour', ' ', 'Water', ' ', 498, 75, 98, 63, 98, 63, 101, 5, 'assets/sprites/516.png'),
(517, 'Munna', ' ', 'Psychic', ' ', 292, 76, 25, 45, 67, 55, 24, 5, 'assets/sprites/517.png');
INSERT INTO `pokemon_dex` (`id`, `name`, `form`, `type1`, `type2`, `total`, `hp`, `attack`, `defense`, `sp_attack`, `sp_defense`, `speed`, `generation`, `sprite`) VALUES
(518, 'Musharna', ' ', 'Psychic', ' ', 487, 116, 55, 85, 107, 95, 29, 5, 'assets/sprites/518.png'),
(519, 'Pidove', ' ', 'Normal', 'Flying', 264, 50, 55, 50, 36, 30, 43, 5, 'assets/sprites/519.png'),
(520, 'Tranquill', ' ', 'Normal', 'Flying', 358, 62, 77, 62, 50, 42, 65, 5, 'assets/sprites/520.png'),
(521, 'Unfezant', ' ', 'Normal', 'Flying', 488, 80, 115, 80, 65, 55, 93, 5, 'assets/sprites/521.png'),
(522, 'Blitzle', ' ', 'Electric', ' ', 295, 45, 60, 32, 50, 32, 76, 5, 'assets/sprites/522.png'),
(523, 'Zebstrika', ' ', 'Electric', ' ', 497, 75, 100, 63, 80, 63, 116, 5, 'assets/sprites/523.png'),
(524, 'Roggenrola', ' ', 'Rock', ' ', 280, 55, 75, 85, 25, 25, 15, 5, 'assets/sprites/524.png'),
(525, 'Boldore', ' ', 'Rock', ' ', 390, 70, 105, 105, 50, 40, 20, 5, 'assets/sprites/525.png'),
(526, 'Gigalith', ' ', 'Rock', ' ', 515, 85, 135, 130, 60, 80, 25, 5, 'assets/sprites/526.png'),
(527, 'Woobat', ' ', 'Psychic', 'Flying', 323, 65, 45, 43, 55, 43, 72, 5, 'assets/sprites/527.png'),
(528, 'Swoobat', ' ', 'Psychic', 'Flying', 425, 67, 57, 55, 77, 55, 114, 5, 'assets/sprites/528.png'),
(529, 'Drilbur', ' ', 'Ground', ' ', 328, 60, 85, 40, 30, 45, 68, 5, 'assets/sprites/529.png'),
(530, 'Excadrill', ' ', 'Ground', 'Steel', 508, 110, 135, 60, 50, 65, 88, 5, 'assets/sprites/530.png'),
(531, 'Audino', ' ', 'Normal', ' ', 445, 103, 60, 86, 60, 86, 50, 5, 'assets/sprites/531.png'),
(532, 'Timburr', ' ', 'Fighting', ' ', 305, 75, 80, 55, 25, 35, 35, 5, 'assets/sprites/532.png'),
(533, 'Gurdurr', ' ', 'Fighting', ' ', 405, 85, 105, 85, 40, 50, 40, 5, 'assets/sprites/533.png'),
(534, 'Conkeldurr', ' ', 'Fighting', ' ', 505, 105, 140, 95, 55, 65, 45, 5, 'assets/sprites/534.png'),
(535, 'Tympole', ' ', 'Water', ' ', 294, 50, 50, 40, 50, 40, 64, 5, 'assets/sprites/535.png'),
(536, 'Palpitoad', ' ', 'Water', 'Ground', 384, 75, 65, 55, 65, 55, 69, 5, 'assets/sprites/536.png'),
(537, 'Seismitoad', ' ', 'Water', 'Ground', 509, 105, 95, 75, 85, 75, 74, 5, 'assets/sprites/537.png'),
(538, 'Throh', ' ', 'Fighting', ' ', 465, 120, 100, 85, 30, 85, 45, 5, 'assets/sprites/538.png'),
(539, 'Sawk', ' ', 'Fighting', ' ', 465, 75, 125, 75, 30, 75, 85, 5, 'assets/sprites/539.png'),
(540, 'Sewaddle', ' ', 'Bug', 'Grass', 310, 45, 53, 70, 40, 60, 42, 5, 'assets/sprites/540.png'),
(541, 'Swadloon', ' ', 'Bug', 'Grass', 380, 55, 63, 90, 50, 80, 42, 5, 'assets/sprites/541.png'),
(542, 'Leavanny', ' ', 'Bug', 'Grass', 500, 75, 103, 80, 70, 80, 92, 5, 'assets/sprites/542.png'),
(543, 'Venipede', ' ', 'Bug', 'Poison', 260, 30, 45, 59, 30, 39, 57, 5, 'assets/sprites/543.png'),
(544, 'Whirlipede', ' ', 'Bug', 'Poison', 360, 40, 55, 99, 40, 79, 47, 5, 'assets/sprites/544.png'),
(545, 'Scolipede', ' ', 'Bug', 'Poison', 485, 60, 100, 89, 55, 69, 112, 5, 'assets/sprites/545.png'),
(546, 'Cottonee', ' ', 'Grass', 'Fairy', 280, 40, 27, 60, 37, 50, 66, 5, 'assets/sprites/546.png'),
(547, 'Whimsicott', ' ', 'Grass', 'Fairy', 480, 60, 67, 85, 77, 75, 116, 5, 'assets/sprites/547.png');

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
(4, 14, 1);

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
-- Indexes for table `pokemon_dex`
--
ALTER TABLE `pokemon_dex`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `pokemon_votes`
--
ALTER TABLE `pokemon_votes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
