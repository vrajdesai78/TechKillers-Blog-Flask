-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 31, 2019 at 06:26 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `techkillers`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `Sr_no` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(20) NOT NULL,
  `phone_no` varchar(20) NOT NULL,
  `message` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`Sr_no`, `name`, `email`, `phone_no`, `message`, `date`) VALUES
(1, 'first text', 'frist@gmail.cm', '7684849394', 'first text', '2019-12-16 10:56:44'),
(13, 'Rohan  Vyas', 'rohans.v@gmail.com', '1293457584', 'hello my name is rohan vyas', '2019-12-17 11:06:46'),
(14, 'Vraj Desai', 'ankitdeshpande11@gma', '1293457584', 'ea;lksjdflk;asjdf', '2019-12-21 08:41:40'),
(15, 'Vraj Desai', 'vrajdesai78@gmail.co', '39202482392', 'j;fld;kajf;lkdasjf', '2019-12-21 08:44:15'),
(16, 'Vraj Desai', 'keligas886@mailseo.n', '8320216364', 'vraj desai', '2019-12-21 21:46:55'),
(17, 'Rohan  Vyas', 'ankitdeshpande11@gma', '39202482392', 'abc', '2019-12-21 21:48:27'),
(18, 'vrajdesai', 'vraj78desai@gmail.co', '39202482392', 'abc', '2019-12-21 21:51:59');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `Sr_no` int(11) NOT NULL,
  `title` text NOT NULL,
  `tagline` text NOT NULL,
  `img_file` varchar(25) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `slug` varchar(25) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`Sr_no`, `title`, `tagline`, `img_file`, `date`, `slug`, `content`) VALUES
(1, 'Best smartphones under 10000', 'Cheap and Best', 'home-bg.jpg', '2019-12-19 14:51:04', 'smartphones-under-10000', 'If you are in the market looking for the best phones under 10000, chances are that you will end up with too many options. As technology continues to become more affordable with each passing month, features such as dual, and even quad rear cameras, FHD+ displays and fingerprint sensors have started making their way to mobiles under 10,000. Moreover, the increase in battery size means that users do not have to charge their phones too often. Which one should you buy, though? We sifted through the latest mobile phone under 10,000 and curated a comprehensive list of the best smartphones under 10,000. These new phone between 5k and 10k will give you the best of all worlds, for smartphones within this price.\r\n              \r\n              '),
(2, 'Best smartphone under 20000', 'Realme X2', 'home-bg.jpg', '2019-12-18 16:31:04', 'smartphones-under-20000', 'Realme X2 smartphone has a Super AMOLED display. It measures 158.7 mm x 75.2 mm x 8.6 mm and weighs 182 grams. The screen has a resolution of 1080 x 2340 pixels and 403 ppi pixel density. It has an aspect ratio of 19.5:9 and screen-to-body ratio of 84.07 %. On camera front, the buyers get a 32 MP Front Camera and on the rear, there\'s an 64+8+2+2 MP camera with features like 5 x Digital Zoom, Auto Flash, Face detection, Touch to focus. It is backed by a 4000 mAh battery. Connectivity features in the smartphone include WiFi, Bluetooth, GPS, Volte, and mor'),
(3, 'Best smartphones under 30000', 'Realme X2 Pro', 'home-bg.jpg', '2019-12-19 10:17:02', 'smartphones-under-30000', 'Realme is stepping up its game with its latest offering, the Realme X2 Pro. With a starting price of Rs. 29,999, the Realme X2 Pro offers many of the features found in higher-priced mid-range flagships, which automatically boosts its value proposition. This is also the company\'s first ‘true\' flagship offering, and is the first time that Realme is venturing above the over-Rs. 20,000 price segment in India. So far, the company has earned a reputation for making budget-friendly phones, but with the X2 Pro, can it convince its fanbase and new potential buyers to spend this much money for its top-end offering? We\'ve been testing the X2 Pro for about a week, and it\'s now time to see if this premium smartphone has managed to pull it off.\r\n              '),
(4, 'Best smartphones under 15000', 'Redmi Note 8 Pro', 'home-bg.jpg', '2019-12-29 18:54:31', 'smartphones-under-15000', '              Redmi Note 8 Pro is powered by an octa-core MediaTek Helio G90T processor that features 2 cores clocked at 2.05GHz and 6 cores clocked at 2GHz. It comes with 6GB of RAM. The Redmi Note 8 Pro runs Android 9 Pie and is powered by a 4500mAh non-removable battery. The Redmi Note 8 Pro supports proprietary fast charging.\r\n               \r\nVraj Desai');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`Sr_no`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`Sr_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `Sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `Sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
