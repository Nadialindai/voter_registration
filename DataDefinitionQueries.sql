-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: classmysql.engr.oregonstate.edu:3306
-- Generation Time: Feb 08, 2019 at 10:31 PM
-- Server version: 10.1.22-MariaDB
-- PHP Version: 7.0.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cs361_leungn`
--

-- --------------------------------------------------------

--
-- Table structure for table `ballot`
--

DROP TABLE IF EXISTS `ballot`;
CREATE TABLE `ballot` (
  `ballot_id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `candidate` varchar(255) NOT NULL,
  `zip` decimal(8,0) NOT NULL,
  `party` varchar(255) NOT NULL,
  `electoral_college` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ballot`
--

INSERT INTO `ballot` (`ballot_id`, `full_name`, `age`, `candidate`, `zip`, `party`, `electoral_college`) VALUES
(1, 'Nadia Leung', 34, 'Hillary Clinton', '01650', 'Democrat', 6),
(2, 'Thomas Lem', 36, 'Hillary Clinton', '01650', 'Democrat', 6),
(3, 'Clarissa Gasiciel', 38, 'Hillary Clinton', '650', 'Democrat', 6),
(4, 'Stephen Thomas', 34, 'Donald Trump', '02580', 'Republican', 3),
(5, 'Evan Schein', 36, 'Donald Trump', '02580', 'Republican', 3),
(6, 'Daniel Ram', 38, 'Hillary Clinton', '02580', 'Democrat', 3),
(7, 'Helena Ima', 36, 'Hillary Clinton', '01240', 'Democrat', 8),
(8, 'Penny Li', 38, 'Donald Trump', '01240', 'Republican', 8),
(9, 'Rachel Kim', 36, 'Donald Trump', '01980', 'Republican', 9),
(10, 'Uma Thurman', 38, 'Donald Trump', '01980', 'Republican', 9);

-- --------------------------------------------------------

--
-- Table structure for table `voters`
--

DROP TABLE IF EXISTS `voters`;
CREATE TABLE `voters` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `birthday` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `voters`
--

INSERT INTO `voters` (`id`, `first_name`, `last_name`, `birthday`) VALUES
(1, 'Yuzhe', 'Chen', '1985-06-06 00:00:00.000000'),
(2, 'Jimmy', 'Kart', '1965-06-06 00:00:00.000000'),
(3, 'Lady', 'Gaga', '1990-02-04 00:00:00.000000'),
(4, 'Rachel', 'Jolie', '1995-06-12 00:00:00.000000'),
(5, 'Olivia', 'stone', '1987-02-27 00:00:00.000000');

-- --------------------------------------------------------

--
-- Table structure for table `candidate_votes`
--

DROP TABLE IF EXISTS `candidate_votes`;
CREATE TABLE `candidate_votes` (
  `voter_id` int(11) NOT NULL,
  `candidate_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `candidate_votes`
--

INSERT INTO `candidate_votes` (`voter_id`, `candidate_id`) VALUES
(1, 1),
(2, 3),
(3, 6),
(4, 5),
(5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `state_vote`
--

DROP TABLE IF EXISTS `state_vote`;
CREATE TABLE `state_vote` (
  `id` int(11) NOT NULL,
  `count` float NOT NULL,
  `candidate_id` int(11) NOT NULL,
  `voter_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `state_vote`
--

INSERT INTO `state_vote` (`id`, `count`, `candidate_id`, `voter_id`) VALUES
(1, 650, 1, 1),
(2, 1230, 3, 2),
(3, 2540, 6, 3),
(4, 3960, 5, 4),
(5, 3220, 3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `state_ballot`
--

DROP TABLE IF EXISTS `state_ballot`;
CREATE TABLE `state_ballot` (
  `electoral_college` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `ballot_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `state_ballot`
--

INSERT INTO `state_ballot` (`electoral_college`, `state_id`, `ballot_id`) VALUES
(1, 1, 2),
(1, 2, 1),
(1, 2, 4),
(1, 3, 1),
(1, 3, 3),
(1, 3, 7),
(2, 4, 9),
(1, 5, 7),
(1, 5, 9);

-- --------------------------------------------------------

--
-- Table structure for table `candidates`
--

DROP TABLE IF EXISTS `candidates`;
CREATE TABLE `candidates` (
  `id` int(11) NOT NULL,
  `candidate` varchar(255) NOT NULL,
  `state_name` varchar(255) NOT NULL,
  `party` varchar(255) NOT NULL,
  `total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `candidates`
--

INSERT INTO `candidates` (`id`, `candidate`, `state_name`, `party`, `total`) VALUES
(1, 'Donald Trump', 'MA', 'Republican', 1876600),
(2, 'Donald Trump', 'CA', 'Republican', 2676600),
(3, 'Hillary Clinton', 'NY', 'Democrat', 3876600),
(5, 'Hillary Clinton', 'KY', 'Democrat', 4976600),
(6, 'Hillary Clinton', 'TX', 'Democrat', 23556800);

-- --------------------------------------------------------

--
-- Table structure for table `candidate_ballot`
--

DROP TABLE IF EXISTS `candidate_ballot`;
CREATE TABLE `candidate_ballot` (
  `candidate_id` int(11) NOT NULL,
  `ballot_id` int(11) NOT NULL,
  `electoral_college` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `candidate_ballot`
--

INSERT INTO `candidate_ballot` (`candidate_id`, `ballot_id`, `electoral_college`) VALUES
(1, 1, 12),
(1, 2, 12),
(1, 3, 12),
(1, 4, 20),
(1, 5, 18),
(1, 6, 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ballot`
--
ALTER TABLE `ballot`
  ADD PRIMARY KEY (`ballot_id`);

--
-- Indexes for table `voters`
--
ALTER TABLE `voters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `candidate_votes`
--
ALTER TABLE `candidate_votes`
  ADD PRIMARY KEY (`voter_id`,`candidate_id`),
  ADD KEY `candidate_id` (`candidate_id`);

--
-- Indexes for table `state_vote`
--
ALTER TABLE `state_vote`
  ADD PRIMARY KEY (`id`),
  ADD KEY `candidate_id` (`candidate_id`),
  ADD KEY `voter_id` (`voter_id`);

--
-- Indexes for table `state_ballot`
--
ALTER TABLE `state_ballot`
  ADD PRIMARY KEY (`state_id`,`ballot_id`),
  ADD KEY `ballot_id` (`ballot_id`);

--
-- Indexes for table `candidates`
--
ALTER TABLE `candidates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `candidate_ballot`
--
ALTER TABLE `candidate_ballot`
  ADD PRIMARY KEY (`candidate_id`,`ballot_id`),
  ADD KEY `ballot_id` (`ballot_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ballot`
--
ALTER TABLE `ballot`
  MODIFY `ballot_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `voters`
--
ALTER TABLE `voters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `state_vote`
--
ALTER TABLE `state_vote`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `candidates`
--
ALTER TABLE `candidates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `candidate_votes`
--
ALTER TABLE `candidate_votes`
  ADD CONSTRAINT `candidate_votes_ibfk_1` FOREIGN KEY (`voter_id`) REFERENCES `voters` (`id`),
  ADD CONSTRAINT `candidate_votes_ibfk_2` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`);

--
-- Constraints for table `state_vote`
--
ALTER TABLE `state_vote`
  ADD CONSTRAINT `state_vote_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`),
  ADD CONSTRAINT `state_vote_ibfk_2` FOREIGN KEY (`voter_id`) REFERENCES `voters` (`id`);

--
-- Constraints for table `state_ballot`
--
ALTER TABLE `state_ballot`
  ADD CONSTRAINT `state_ballot_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `state_vote` (`id`),
  ADD CONSTRAINT `state_ballot_ibfk_2` FOREIGN KEY (`ballot_id`) REFERENCES `ballot` (`ballot_id`);

--
-- Constraints for table `candidate_ballot`
--
ALTER TABLE `candidate_ballot`
  ADD CONSTRAINT `candidate_ballot_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`),
  ADD CONSTRAINT `candidate_ballot_ibfk_2` FOREIGN KEY (`ballot_id`) REFERENCES `ballot` (`ballot_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
