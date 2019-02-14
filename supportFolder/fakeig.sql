-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 14, 2019 at 07:24 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fakeig`
--
CREATE DATABASE IF NOT EXISTS `fakeig` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `fakeig`;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--
-- Creation: Feb 14, 2019 at 05:04 PM
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feeds_id` int(11) NOT NULL,
  `who_is` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `comments`:
--   `who_is`
--       `user` -> `id`
--   `feeds_id`
--       `feeds` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `feeds`
--
-- Creation: Feb 14, 2019 at 05:04 PM
--

DROP TABLE IF EXISTS `feeds`;
CREATE TABLE IF NOT EXISTS `feeds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `caption` varchar(255) NOT NULL,
  `url_path` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `feeds`:
--   `user_id`
--       `user` -> `id`
--

--
-- Dumping data for table `feeds`
--

INSERT INTO `feeds` (`id`, `user_id`, `caption`, `url_path`, `created_at`) VALUES
(1, 10, 'dada', 'storage/Ace.(Final.Fantasy.Type-0).full.1043778.jpg', '2019-02-14 17:16:17'),
(2, 6, 'Doge is fanny', 'storage/doge-27302-1920x1080 (1).jpg', '2019-02-14 18:00:36'),
(3, 6, 'niganiga', 'storage/smile_1-512.png', '2019-02-14 18:11:36'),
(4, 12, 'Nununuuuuuuuuu aQoE KnG3n qmhhhhhhhhh :* :* :*', 'storage/NU.png', '2019-02-14 18:17:53');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--
-- Creation: Feb 14, 2019 at 05:04 PM
--

DROP TABLE IF EXISTS `likes`;
CREATE TABLE IF NOT EXISTS `likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feeds_id` int(11) NOT NULL,
  `who_is` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `likes`:
--   `feeds_id`
--       `feeds` -> `id`
--   `who_is`
--       `user` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `user`
--
-- Creation: Feb 13, 2019 at 01:59 PM
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `password` varchar(33) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `user`:
--

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `password`) VALUES
(6, 'wisnu.bimantoro', '0d61925803c0421c928f4ac189acf233'),
(7, 'maderajaadi', '14023e59ee2494b8ac2500211e099587'),
(10, 'cuarlzs', '30177ca51398ac348d4c07362f4b7b3b'),
(12, 'theofilazs', 'c6c4e868c804d602e7a317459af0ca2a'),
(13, 'mhafiz', '839a54bf20626e4942bc8f11873f0654'),
(14, 'bokep_indo', 'cb42e130d1471239a27fca6228094f0e'),
(15, 'bokep_indo', '05d251ea28c5be9426611a121db0c92a'),
(16, 'bokep_indo', '05d251ea28c5be9426611a121db0c92a'),
(17, 'xcgvvxcv', '47bce5c74f589f4867dbd57e9ca9f808'),
(18, 'aaaaxxx', '47bce5c74f589f4867dbd57e9ca9f808');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`who_is`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `comments_ibfk_3` FOREIGN KEY (`feeds_id`) REFERENCES `feeds` (`id`);

--
-- Constraints for table `feeds`
--
ALTER TABLE `feeds`
  ADD CONSTRAINT `feeds_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`feeds_id`) REFERENCES `feeds` (`id`),
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`who_is`) REFERENCES `user` (`id`);


--
-- Metadata
--
USE `phpmyadmin`;

--
-- Metadata for table comments
--

--
-- Metadata for table feeds
--

--
-- Metadata for table likes
--

--
-- Metadata for table user
--

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'fakeig', 'user', '{\"sorted_col\":\"`user`.`password`  DESC\"}', '2019-02-13 16:59:40');

--
-- Metadata for database fakeig
--
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
