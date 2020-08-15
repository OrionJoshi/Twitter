-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 15, 2020 at 03:26 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tweety`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `commentID` int(11) NOT NULL,
  `comment` varchar(140) NOT NULL,
  `commentOn` int(11) NOT NULL,
  `commentBy` int(11) NOT NULL,
  `commentAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`commentID`, `comment`, `commentOn`, `commentBy`, `commentAt`) VALUES
(3, 'hi', 1, 1, '2020-07-19 13:13:08'),
(4, 'hi', 1, 1, '2020-07-19 13:13:08'),
(5, 'nice', 40, 12, '2020-08-08 07:25:15'),
(6, 'nice', 40, 12, '2020-08-08 07:25:15'),
(7, 'nice', 40, 12, '2020-08-08 07:25:16');

-- --------------------------------------------------------

--
-- Table structure for table `follow`
--

CREATE TABLE `follow` (
  `followID` int(11) NOT NULL,
  `sender` int(11) NOT NULL,
  `receiver` int(11) NOT NULL,
  `followOn` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `follow`
--

INSERT INTO `follow` (`followID`, `sender`, `receiver`, `followOn`) VALUES
(43, 12, 14, '0000-00-00 00:00:00'),
(44, 14, 12, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `likeID` int(11) NOT NULL,
  `likeBy` int(11) NOT NULL,
  `likeOn` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`likeID`, `likeBy`, `likeOn`) VALUES
(4, 1, 7),
(10, 1, 6),
(12, 1, 1),
(15, 12, 8),
(16, 14, 34),
(17, 14, 32),
(19, 14, 29),
(20, 12, 39);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `messageID` int(11) NOT NULL,
  `message` text NOT NULL,
  `messageTo` int(11) NOT NULL,
  `messageFrom` int(11) NOT NULL,
  `messageOn` datetime NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`messageID`, `message`, `messageTo`, `messageFrom`, `messageOn`, `status`) VALUES
(1, 'hi', 12, 1, '0000-00-00 00:00:00', 1),
(2, 'hello', 1, 12, '2020-08-03 15:13:09', 0);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `ID` int(11) NOT NULL,
  `notificationFor` int(11) NOT NULL,
  `notificationFrom` int(11) NOT NULL,
  `target` int(11) NOT NULL,
  `type` enum('follow','retweet','like','mention') NOT NULL,
  `time` datetime NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`ID`, `notificationFor`, `notificationFrom`, `target`, `type`, `time`, `status`) VALUES
(7, 14, 12, 14, 'follow', '2020-08-07 14:52:35', 1),
(8, 14, 12, 39, 'like', '2020-08-07 14:52:43', 1),
(9, 14, 12, 40, 'mention', '2020-08-07 14:53:01', 1),
(10, 12, 14, 12, 'follow', '2020-08-07 14:56:33', 1),
(11, 12, 14, 32, 'retweet', '2020-08-07 14:56:43', 1);

-- --------------------------------------------------------

--
-- Table structure for table `trends`
--

CREATE TABLE `trends` (
  `trendID` int(11) NOT NULL,
  `hashtag` varchar(140) NOT NULL,
  `createdOn` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trends`
--

INSERT INTO `trends` (`trendID`, `hashtag`, `createdOn`) VALUES
(1, 'php', '0000-00-00 00:00:00'),
(2, 'first', '2020-07-05 14:37:55'),
(3, 'trend', '2020-08-05 14:20:35'),
(4, 'meralession', '2020-08-05 17:58:42');

-- --------------------------------------------------------

--
-- Table structure for table `tweets`
--

CREATE TABLE `tweets` (
  `tweetID` int(11) NOT NULL,
  `status` varchar(140) NOT NULL,
  `tweetBy` int(11) NOT NULL,
  `retweetID` int(11) NOT NULL,
  `retweetBy` int(11) NOT NULL,
  `tweetImage` varchar(255) NOT NULL,
  `likesCount` int(11) NOT NULL,
  `retweetCount` int(11) NOT NULL,
  `postedOn` datetime NOT NULL,
  `retweetMsg` varchar(140) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tweets`
--

INSERT INTO `tweets` (`tweetID`, `status`, `tweetBy`, `retweetID`, `retweetBy`, `tweetImage`, `likesCount`, `retweetCount`, `postedOn`, `retweetMsg`) VALUES
(1, 'i love php', 1, 0, 0, '', 2, 2, '2020-07-04 09:37:29', ''),
(2, '', 1, 0, 0, 'users/twitter.jpg', 0, 0, '2020-07-04 10:54:19', ''),
(6, 'this is my #first', 1, 0, 0, '', 2, 2, '2020-07-05 10:52:55', ''),
(7, '@mrjerk  http://www.meralession.com', 12, 0, 0, '', 1, 5, '2020-07-05 11:36:34', ''),
(8, 'i love php', 1, 1, 1, '', 4, 1, '2020-07-15 21:30:08', 'jsngjsn'),
(28, 'this is my #first', 1, 6, 1, '', 2, 1, '2020-07-25 16:55:19', 'hi'),
(29, 'hi', 12, 0, 0, '', 1, 0, '2020-07-28 13:32:15', ''),
(30, 'this is my #first', 1, 6, 12, '', 2, 2, '2020-07-28 17:44:32', 'hello'),
(31, 'tweet', 12, 0, 0, 'users/twitter.jpg', 0, 0, '2020-08-01 17:28:20', ''),
(32, 'mm', 12, 0, 0, '', 1, 1, '2020-08-04 09:03:51', ''),
(33, '#trend', 12, 0, 0, '', 0, 1, '2020-08-05 10:35:35', ''),
(34, '#meralession', 12, 0, 0, 'users/twitter.jpg', 1, 1, '2020-08-05 14:13:42', ''),
(35, '@mrjerk hi', 14, 0, 0, '', 0, 1, '2020-08-07 11:39:13', ''),
(36, '#meralession', 12, 34, 14, 'users/twitter.jpg', 1, 1, '2020-08-05 14:13:42', 'nice tweet'),
(37, '#trend', 12, 33, 14, '', 0, 1, '2020-08-05 10:35:35', 'nice trends'),
(38, '@mrjerk  http://www.meralession.com', 12, 7, 14, '', 1, 5, '2020-07-05 11:36:34', 'retweeted'),
(39, '@mrjerk how are u', 14, 0, 0, '', 1, 0, '2020-08-07 14:48:39', ''),
(40, '@clay fine bro', 12, 0, 0, '', 0, 0, '2020-08-07 14:53:01', ''),
(41, '@mrjerk hi', 14, 35, 12, '', 0, 1, '2020-08-07 11:39:13', 'good'),
(42, 'mm', 12, 32, 14, '', 1, 1, '2020-08-04 09:03:51', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(40) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(64) NOT NULL,
  `screenName` varchar(40) NOT NULL,
  `profileImage` varchar(255) NOT NULL,
  `profileCover` varchar(255) NOT NULL,
  `following` int(11) NOT NULL,
  `followers` int(11) NOT NULL,
  `bio` varchar(140) NOT NULL,
  `country` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `screenName`, `profileImage`, `profileCover`, `following`, `followers`, `bio`, `country`, `website`) VALUES
(1, 'Khageshwor', 'Orionjoshi@gmail.com', '5e9d11a14ad1c8dd77e98ef9b53fd1ba', 'OrionJoshi', 'users/twitter.jpg', 'users/cover.jpg', 0, 0, 'i love you', '', ''),
(12, 'mrjerk', 'devchand@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'devchand', 'assets/images/defaultProfileImage.png', 'assets/images/defaultCoverImage.png', 1, 1, '', '', ''),
(13, 'meralession', 'meralessio@gmail.com', '96e79218965eb72c92a549dd5a330112', 'mera', 'assets/images/defaultProfileImage.png', 'assets/images/defaultCoverImage.png', 0, 0, '', '', ''),
(14, 'clay', 'clayjension@gmail.com', 'c0ab70e395fdd94c64b4e13c11c15b39', 'jension', 'assets/images/defaultProfileImage.png', 'assets/images/defaultCoverImage.png', 1, 1, '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`commentID`);

--
-- Indexes for table `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`followID`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`likeID`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`messageID`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `trends`
--
ALTER TABLE `trends`
  ADD PRIMARY KEY (`trendID`),
  ADD UNIQUE KEY `hashtag` (`hashtag`);

--
-- Indexes for table `tweets`
--
ALTER TABLE `tweets`
  ADD PRIMARY KEY (`tweetID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `commentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `follow`
--
ALTER TABLE `follow`
  MODIFY `followID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `likeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `messageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `trends`
--
ALTER TABLE `trends`
  MODIFY `trendID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tweets`
--
ALTER TABLE `tweets`
  MODIFY `tweetID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
