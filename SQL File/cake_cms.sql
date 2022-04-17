-- phpMyAdmin SQL Dump
-- version 5.2.0-rc1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 17, 2022 at 05:25 PM
-- Server version: 5.7.33
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cake_cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `body` text,
  `published` tinyint(1) DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `user_id`, `title`, `slug`, `body`, `published`, `created`, `modified`) VALUES
(8, 1, 'Dicta deserunt sapiente exercitationem sunt aliquam maiores lorem nisi vitae aut a omnis quo', 'Vero-voluptate-rem-labore-nesciunt-et', 'Quae voluptas vel su', 0, '2022-03-23 22:58:12', '2022-04-17 17:25:16'),
(9, 1, 'Dolorem aut reprehenderit sapiente ut maxime mollitia repudiandae voluptas modi optio odio animi eligendi architecto', 'Dolorem-aut-reprehenderit-sapiente-ut-maxime-mollitia-repudiandae-voluptas-modi-optio-odio-animi-eligendi-architecto', 'Quidem voluptatem c', 0, '2022-03-23 22:59:48', '2022-03-23 22:59:48');

-- --------------------------------------------------------

--
-- Table structure for table `articles_tags`
--

CREATE TABLE `articles_tags` (
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `articles_tags`
--

INSERT INTO `articles_tags` (`article_id`, `tag_id`) VALUES
(9, 1),
(9, 2),
(9, 3),
(8, 7),
(8, 8),
(8, 9),
(8, 10),
(8, 11),
(8, 12),
(8, 13),
(8, 14),
(8, 15);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `title`, `created`, `modified`) VALUES
(1, 'welcome', '2022-03-23 22:39:16', '2022-03-23 22:39:16'),
(2, 'Test', '2022-03-23 22:39:37', '2022-03-23 22:39:37'),
(3, 'Example', '2022-03-23 22:39:46', '2022-03-23 22:39:46'),
(4, 'all', '2022-03-23 22:43:47', '2022-03-23 22:43:47'),
(5, '{    \"id\": 1', '2022-04-05 08:11:29', '2022-04-05 08:11:29'),
(6, '\"title\": \"welcome\"', '2022-04-05 08:11:29', '2022-04-05 08:11:29'),
(7, '\"created\": \"2022-03-23T22:39:16+00:00\"', '2022-04-05 08:11:29', '2022-04-05 08:11:29'),
(8, '\"modified\": \"2022-03-23T22:39:16+00:00\"', '2022-04-05 08:11:29', '2022-04-05 08:11:29'),
(9, '\"_joinData\": {        \"article_id\": 8', '2022-04-05 08:11:29', '2022-04-05 08:11:29'),
(10, '\"tag_id\": 1    }}', '2022-04-05 08:11:29', '2022-04-05 08:11:29'),
(11, '{    \"id\": 5', '2022-04-17 17:25:17', '2022-04-17 17:25:17'),
(12, '\"title\": \"{    \\\"id\\\": 1\"', '2022-04-17 17:25:17', '2022-04-17 17:25:17'),
(13, '\"created\": \"2022-04-05T08:11:29+00:00\"', '2022-04-17 17:25:17', '2022-04-17 17:25:17'),
(14, '\"modified\": \"2022-04-05T08:11:29+00:00\"', '2022-04-17 17:25:17', '2022-04-17 17:25:17'),
(15, '\"tag_id\": 5    }}\"title\": \"welcome\"', '2022-04-17 17:25:17', '2022-04-17 17:25:17');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `created`, `modified`) VALUES
(1, 'cakephp@example.com', 'secret', '2022-03-07 10:38:00', '2022-03-07 10:38:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `user_key` (`user_id`);

--
-- Indexes for table `articles_tags`
--
ALTER TABLE `articles_tags`
  ADD PRIMARY KEY (`article_id`,`tag_id`),
  ADD KEY `tag_key` (`tag_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `articles_tags`
--
ALTER TABLE `articles_tags`
  ADD CONSTRAINT `articles_tags_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`),
  ADD CONSTRAINT `articles_tags_ibfk_2` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
