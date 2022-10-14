-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 08, 2022 at 06:19 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `file_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_login`
--

CREATE TABLE `admin_login` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `admin_user` text NOT NULL,
  `admin_password` text NOT NULL,
  `admin_status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_login`
--

INSERT INTO `admin_login` (`id`, `name`, `admin_user`, `admin_password`, `admin_status`) VALUES
(13, 'CampCodes', 'admin@gmail.com', '$2y$12$yjn.g4FtUoXrOqqNMka/Mu/4tq7Brp7Q.aAILGCrjpw.iHKas/uC.', ''),
(14, 'Abdul Korim', 'karim@gmil.com', '$2y$12$MQD5pzKPjQzlXX5qL.LznOhRF8KTf2U5put22/.8w8eilMQ4qJXfK', '');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `user_id` int(20) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_comment` varchar(400) NOT NULL,
  `admin_reply` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `user_name`, `user_email`, `user_comment`, `admin_reply`) VALUES
(1, 10, 'sohel rana', 'sohel@gmail.com', 'this is test comment', 'This is first reply'),
(5, 3, 'md mohiuddin sobuj', 'sobuj@gmail.com', 'Hi I am mohiuddin', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`) VALUES
(1, 'cse'),
(2, 'eee'),
(4, 'ice'),
(5, 'cste'),
(6, 'others'),
(7, 'register office'),
(8, 'math');

-- --------------------------------------------------------

--
-- Table structure for table `history_log`
--

CREATE TABLE `history_log` (
  `log_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `email_address` text NOT NULL,
  `action` varchar(100) NOT NULL,
  `actions` varchar(200) NOT NULL DEFAULT 'Has LoggedOut the system at',
  `ip` text NOT NULL,
  `host` text NOT NULL,
  `login_time` varchar(200) NOT NULL,
  `logout_time` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `history_log`
--

INSERT INTO `history_log` (`log_id`, `id`, `email_address`, `action`, `actions`, `ip`, `host`, `login_time`, `logout_time`) VALUES
(0, 1, 'nario@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'buhayko-PC', 'May-29-2019 02:36 PM', 'May-30-2019 04:33 PM'),
(0, 1, 'nario@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'buhayko-PC', 'May-30-2019 04:30 PM', 'May-30-2019 04:33 PM'),
(0, 3, 'sobuj@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-G2I9B1V', 'Oct-06-2022 12:38 AM', 'Oct-06-2022 12:51 PM'),
(0, 3, 'sobuj@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-G2I9B1V', 'Oct-06-2022 12:31 PM', 'Oct-06-2022 12:51 PM'),
(0, 3, 'sobuj@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-G2I9B1V', 'Oct-06-2022 12:54 PM', ''),
(0, 3, 'sobuj@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-G2I9B1V', 'Oct-06-2022 12:55 PM', ''),
(0, 4, 'sohel@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-G2I9B1V', 'Oct-06-2022 01:15 PM', ''),
(0, 3, 'sobuj@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-G2I9B1V', 'Oct-07-2022 12:38 AM', ''),
(0, 3, 'sobuj@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-G2I9B1V', 'Oct-07-2022 10:46 AM', ''),
(0, 3, 'sobuj@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-G2I9B1V', 'Oct-07-2022 10:51 AM', ''),
(0, 3, 'sobuj@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-G2I9B1V', 'Oct-07-2022 10:55 AM', ''),
(0, 8, 'selim@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-G2I9B1V', 'Oct-07-2022 10:57 AM', ''),
(0, 10, 'sohel@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-G2I9B1V', 'Oct-07-2022 11:00 AM', ''),
(0, 10, 'sohel@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-G2I9B1V', 'Oct-07-2022 12:52 PM', ''),
(0, 3, 'sobuj@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-G2I9B1V', 'Oct-07-2022 01:30 PM', ''),
(0, 10, 'sohel@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-G2I9B1V', 'Oct-07-2022 04:57 PM', ''),
(0, 3, 'sobuj@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-G2I9B1V', 'Oct-07-2022 09:10 PM', ''),
(0, 3, 'sobuj@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-G2I9B1V', 'Oct-07-2022 09:23 PM', ''),
(0, 3, 'sobuj@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-G2I9B1V', 'Oct-08-2022 12:26 AM', ''),
(0, 13, 'hasan@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-G2I9B1V', 'Oct-08-2022 11:39 AM', ''),
(0, 3, 'sobuj@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-G2I9B1V', 'Oct-08-2022 02:54 PM', ''),
(0, 3, 'sobuj@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-G2I9B1V', 'Oct-08-2022 04:40 PM', ''),
(0, 15, 'korim@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-G2I9B1V', 'Oct-08-2022 04:43 PM', ''),
(0, 15, 'korim@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-G2I9B1V', 'Oct-08-2022 05:03 PM', ''),
(0, 3, 'sobuj@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-G2I9B1V', 'Oct-08-2022 07:04 PM', ''),
(0, 17, 'azar@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-G2I9B1V', 'Oct-09-2022 12:15 AM', '');

-- --------------------------------------------------------

--
-- Table structure for table `history_log1`
--

CREATE TABLE `history_log1` (
  `log_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `admin_user` text NOT NULL,
  `action` varchar(100) NOT NULL,
  `actions` varchar(200) NOT NULL DEFAULT 'Has LoggedOut the system at',
  `ip` text NOT NULL,
  `host` text NOT NULL,
  `login_time` varchar(200) NOT NULL,
  `logout_time` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `history_log1`
--

INSERT INTO `history_log1` (`log_id`, `id`, `admin_user`, `action`, `actions`, `ip`, `host`, `login_time`, `logout_time`) VALUES
(0, 11, 'richard@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'buhayko-PC', 'May-29-2019 02:34 PM', 'May-29-2019 02:35 PM'),
(0, 12, 'joneltoledo@yahoo.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'buhayko-PC', 'May-29-2019 02:35 PM', 'Mar-27-2021 10:59 PM'),
(0, 12, 'joneltoledo@yahoo.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'buhayko-PC', 'May-29-2019 02:37 PM', 'Mar-27-2021 10:59 PM'),
(0, 12, 'joneltoledo@yahoo.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'buhayko-PC', 'May-30-2019 04:33 PM', 'Mar-27-2021 10:59 PM'),
(0, 12, 'joneltoledo@yahoo.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '127.0.0.1', 'keystone.mwbsys.com', 'Mar-27-2021 10:56 PM', 'Mar-27-2021 10:59 PM'),
(0, 13, 'admin@campcodes.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '127.0.0.1', 'keystone.mwbsys.com', 'Mar-27-2021 10:59 PM', 'Oct-09-2022 12:15 AM'),
(0, 13, 'admin@campcodes.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-G2I9B1V', 'Oct-06-2022 12:37 AM', 'Oct-09-2022 12:15 AM'),
(0, 13, 'admin@campcodes.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-G2I9B1V', 'Oct-06-2022 12:10 PM', 'Oct-09-2022 12:15 AM'),
(0, 13, 'admin@campcodes.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-G2I9B1V', 'Oct-06-2022 01:13 PM', 'Oct-09-2022 12:15 AM'),
(0, 13, 'admin@campcodes.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-G2I9B1V', 'Oct-06-2022 02:12 PM', 'Oct-09-2022 12:15 AM'),
(0, 13, 'admin@campcodes.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-G2I9B1V', 'Oct-07-2022 12:41 AM', 'Oct-09-2022 12:15 AM'),
(0, 13, 'admin@campcodes.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-G2I9B1V', 'Oct-07-2022 10:39 AM', 'Oct-09-2022 12:15 AM'),
(0, 13, 'admin@campcodes.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-G2I9B1V', 'Oct-07-2022 10:57 AM', 'Oct-09-2022 12:15 AM'),
(0, 13, 'admin@campcodes.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-G2I9B1V', 'Oct-07-2022 11:06 AM', 'Oct-09-2022 12:15 AM'),
(0, 13, 'admin@campcodes.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-G2I9B1V', 'Oct-07-2022 12:40 PM', 'Oct-09-2022 12:15 AM'),
(0, 13, 'admin@campcodes.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-G2I9B1V', 'Oct-07-2022 01:29 PM', 'Oct-09-2022 12:15 AM'),
(0, 13, 'admin@campcodes.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-G2I9B1V', 'Oct-07-2022 04:59 PM', 'Oct-09-2022 12:15 AM'),
(0, 13, 'admin@campcodes.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-G2I9B1V', 'Oct-07-2022 10:45 PM', 'Oct-09-2022 12:15 AM'),
(0, 13, 'admin@campcodes.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-G2I9B1V', 'Oct-07-2022 10:48 PM', 'Oct-09-2022 12:15 AM'),
(0, 13, 'admin@campcodes.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-G2I9B1V', 'Oct-07-2022 10:50 PM', 'Oct-09-2022 12:15 AM'),
(0, 13, 'admin@campcodes.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-G2I9B1V', 'Oct-08-2022 12:26 AM', 'Oct-09-2022 12:15 AM'),
(0, 13, 'admin@campcodes.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-G2I9B1V', 'Oct-08-2022 12:29 AM', 'Oct-09-2022 12:15 AM'),
(0, 13, 'admin@campcodes.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-G2I9B1V', 'Oct-08-2022 11:31 AM', 'Oct-09-2022 12:15 AM'),
(0, 13, 'admin@campcodes.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-G2I9B1V', 'Oct-08-2022 02:16 PM', 'Oct-09-2022 12:15 AM'),
(0, 13, 'admin@campcodes.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-G2I9B1V', 'Oct-08-2022 04:39 PM', 'Oct-09-2022 12:15 AM'),
(0, 13, 'admin@campcodes.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-G2I9B1V', 'Oct-08-2022 04:44 PM', 'Oct-09-2022 12:15 AM'),
(0, 13, 'admin@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-G2I9B1V', 'Oct-08-2022 05:02 PM', 'Oct-09-2022 12:15 AM'),
(0, 13, 'admin@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-G2I9B1V', 'Oct-08-2022 07:03 PM', 'Oct-09-2022 12:15 AM'),
(0, 13, 'admin@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-G2I9B1V', 'Oct-09-2022 12:08 AM', 'Oct-09-2022 12:15 AM'),
(0, 13, 'admin@gmail.com', 'Has LoggedIn the system at', 'Has LoggedOut the system at', '::1', 'DESKTOP-G2I9B1V', 'Oct-09-2022 12:14 AM', 'Oct-09-2022 12:15 AM');

-- --------------------------------------------------------

--
-- Table structure for table `login_user`
--

CREATE TABLE `login_user` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `email_address` text NOT NULL,
  `department` varchar(200) DEFAULT NULL,
  `image` varchar(400) DEFAULT NULL,
  `user_password` text NOT NULL,
  `user_status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_user`
--

INSERT INTO `login_user` (`id`, `name`, `email_address`, `department`, `image`, `user_password`, `user_status`) VALUES
(3, 'md mohiuddin sobuj', 'sobuj@gmail.com', 'eee', '1665226948_1412952766_360_F_297245133_gBPfK0h10UM3y7vfoEiBC3ZXt559KZar.jpg', '$2y$12$eo08omHRL.pmCn8m05pARuCfmw7DgZMYPM08kSbqDHrOvi4ITlIYu', 'Employee'),
(8, 'Md Selim Alahi', 'selim@gmail.com', 'cse', NULL, '$2y$12$7tZpKX2dKg7vI51/mkyaDOYL039/XR.1EGpAGYMwjd9zIoc/uuN1.', ''),
(10, 'sohel rana', 'sohel@gmail.com', 'eee', NULL, '$2y$12$PucNlXSpGAo8HXnUSi.s/OjrvNwSZD4pIMCgFJFtO9lPZLeE..MMq', 'Employee'),
(15, 'korim khan niloy', 'korim@gmail.com', 'eee', '1665219629_1538601612_280536478_1679277295756342_7449353121275820574_n.jpg', '$2y$12$3TwA3C4UBnFgPcJAqXhj5OW6E2UEWMoACJOg1iBdVdfjWGvua1raq', 'Employee'),
(17, 'Azar uddin', 'azar@gmail.com', 'math', '1665245721_658237255_22654-6-man-thumb.png', '$2y$12$BlbNQx0iRbPuViEuCMxrUeXEAUFjKxONXqX6/yp.SfPiqTtaoGnx2', 'Employee');

-- --------------------------------------------------------

--
-- Table structure for table `upload_files`
--

CREATE TABLE `upload_files` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(200) NOT NULL,
  `SIZE` varchar(200) NOT NULL,
  `DOWNLOAD` varchar(200) DEFAULT NULL,
  `DEPARTMENT` varchar(200) NOT NULL,
  `TIMERS` varchar(200) NOT NULL,
  `ADMIN_STATUS` varchar(300) NOT NULL,
  `EMAIL` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `upload_files`
--

INSERT INTO `upload_files` (`ID`, `NAME`, `SIZE`, `DOWNLOAD`, `DEPARTMENT`, `TIMERS`, `ADMIN_STATUS`, `EMAIL`) VALUES
(1, 'ajax_tutorial.pdf', '618379', '3', '', 'May-29-2019 02:36 PM', 'Employee', 'Email Luis Nario'),
(2, 'css_tutorial.pdf', '910221', '0', '', 'May-29-2019 02:36 PM', 'Employee', 'Email Luis Nario'),
(5, 'sample.pdf', '11', '0', 'eee', 'Oct-06-2022 01:09 AM', 'Admin', 'CampCodes'),
(6, 'test1.pdf', '9', '4', 'cse', 'Oct-06-2022 01:13 AM', 'Admin', 'CampCodes'),
(7, 'test3.pdf', '5', '0', 'ice', 'Oct-06-2022 01:13 AM', 'Admin', 'CampCodes'),
(8, 'test4.pdf', '5', '0', 'cste', 'Oct-06-2022 01:14 AM', 'Admin', 'CampCodes'),
(9, 'cse.pdf', '8', '0', 'cse', 'Oct-06-2022 02:34 PM', 'Admin', 'CampCodes'),
(10, 'sample (2).pdf', '6', '0', 'eee', 'Oct-07-2022 12:37 AM', 'Admin', 'CampCodes'),
(11, 'emty.pdf', '0', '0', 'ice', 'Oct-08-2022 01:50 PM', 'Admin', 'Others'),
(12, 'test20.pdf', '0', '0', 'math', 'Oct-09-2022 12:10 AM', 'Admin', 'Math');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_login`
--
ALTER TABLE `admin_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_user`
--
ALTER TABLE `login_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `upload_files`
--
ALTER TABLE `upload_files`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_login`
--
ALTER TABLE `admin_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `login_user`
--
ALTER TABLE `login_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `upload_files`
--
ALTER TABLE `upload_files`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
