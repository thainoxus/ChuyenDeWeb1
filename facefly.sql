-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th4 08, 2019 lúc 05:05 PM
-- Phiên bản máy phục vụ: 5.7.24
-- Phiên bản PHP: 7.1.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `facefly`
--
CREATE DATABASE IF NOT EXISTS `facefly` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `facefly`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `airline_company`
--

DROP TABLE IF EXISTS `airline_company`;
CREATE TABLE IF NOT EXISTS `airline_company` (
  `id_air` int(11) NOT NULL AUTO_INCREMENT,
  `name_air` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_nation` int(11) NOT NULL,
  PRIMARY KEY (`id_air`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `airline_company`
--

INSERT INTO `airline_company` (`id_air`, `name_air`, `id_nation`) VALUES
(1, 'Delay Airline', 0),
(2, 'Repeat Airline\r\n                                       ', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `airport`
--

DROP TABLE IF EXISTS `airport`;
CREATE TABLE IF NOT EXISTS `airport` (
  `id_airport` int(11) NOT NULL AUTO_INCREMENT,
  `name_airport` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_city` int(11) NOT NULL,
  PRIMARY KEY (`id_airport`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `book`
--

DROP TABLE IF EXISTS `book`;
CREATE TABLE IF NOT EXISTS `book` (
  `id_book` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `total_person` int(11) NOT NULL,
  `id_flight` int(11) NOT NULL,
  `sum_price` int(11) DEFAULT NULL,
  `id_pay` int(11) NOT NULL,
  `id_cus` int(11) NOT NULL,
  PRIMARY KEY (`id_book`),
  KEY `fk_book` (`id_flight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `book`
--

INSERT INTO `book` (`id_book`, `id_user`, `total_person`, `id_flight`, `sum_price`, `id_pay`, `id_cus`) VALUES
(1, 1, 2, 1, NULL, 1, 1),
(2, 2, 1, 2, NULL, 2, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `city`
--

DROP TABLE IF EXISTS `city`;
CREATE TABLE IF NOT EXISTS `city` (
  `id_city` int(11) NOT NULL AUTO_INCREMENT,
  `name_city` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_airport` int(11) NOT NULL,
  `code_city` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_city`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `city`
--

INSERT INTO `city` (`id_city`, `name_city`, `id_airport`, `code_city`) VALUES
(1, 'Ho Chi Minh City', 0, 'HCM'),
(2, 'Ha Noi', 0, 'HAN');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `id_cus` int(11) NOT NULL,
  `title` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`id_cus`, `title`, `first_name`, `last_name`) VALUES
(1, 'Noxus', 'Thai', 'Nox'),
(1, 'Long', 'Nguyen Van', 'Long'),
(1, 'Loi', 'Nguyen Huu', 'Loi');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `flight_class`
--

DROP TABLE IF EXISTS `flight_class`;
CREATE TABLE IF NOT EXISTS `flight_class` (
  `id_class` int(11) NOT NULL,
  `name_class` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `flight_class`
--

INSERT INTO `flight_class` (`id_class`, `name_class`) VALUES
(1, 'Economy Flex'),
(2, 'Economy Standardddd'),
(3, 'Business');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `flight_list`
--

DROP TABLE IF EXISTS `flight_list`;
CREATE TABLE IF NOT EXISTS `flight_list` (
  `id_flight` int(11) NOT NULL AUTO_INCREMENT,
  `city_from` int(11) NOT NULL,
  `time_from` time NOT NULL,
  `city_to` int(11) NOT NULL,
  `time_to` time NOT NULL,
  `duration` time NOT NULL,
  `id_type` int(11) NOT NULL,
  `id_transit` int(11) NOT NULL,
  `id_air` int(11) NOT NULL,
  `ticket_number` int(3) NOT NULL,
  `id_class` int(11) NOT NULL,
  `price` int(55) NOT NULL,
  `id_city` int(11) NOT NULL,
  `id_route` int(11) NOT NULL,
  `kilometers` int(11) NOT NULL,
  PRIMARY KEY (`id_flight`),
  KEY `id_flight` (`id_flight`),
  KEY `fk_city` (`id_city`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `flight_list`
--

INSERT INTO `flight_list` (`id_flight`, `city_from`, `time_from`, `city_to`, `time_to`, `duration`, `id_type`, `id_transit`, `id_air`, `ticket_number`, `id_class`, `price`, `id_city`, `id_route`, `kilometers`) VALUES
(1, 1, '06:00:00', 2, '12:00:00', '06:00:00', 2, 1, 2, 600, 3, 2500000, 1, 1, 0),
(2, 2, '12:00:00', 1, '18:00:00', '06:00:00', 1, 2, 2, 600, 2, 2500000, 1, 1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `info_card`
--

DROP TABLE IF EXISTS `info_card`;
CREATE TABLE IF NOT EXISTS `info_card` (
  `id_card` int(11) NOT NULL AUTO_INCREMENT,
  `id_pay` int(11) NOT NULL,
  `card_number` char(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `card_name` char(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ccv_code` int(4) NOT NULL,
  PRIMARY KEY (`id_card`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `info_card`
--

INSERT INTO `info_card` (`id_card`, `id_pay`, `card_number`, `card_name`, `ccv_code`) VALUES
(1, 2, '1236547896541256988', 'NGUYEN VAN A', 3365),
(2, 2, '1236678965412569887', 'NGUYEN VAN b', 3415);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nation`
--

DROP TABLE IF EXISTS `nation`;
CREATE TABLE IF NOT EXISTS `nation` (
  `id_nation` int(11) NOT NULL AUTO_INCREMENT,
  `name_nation` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_nation`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `nation`
--

INSERT INTO `nation` (`id_nation`, `name_nation`) VALUES
(1, 'Việt Nam');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `id_pay` int(11) NOT NULL,
  `pay_type` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_pay`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `payment`
--

INSERT INTO `payment` (`id_pay`, `pay_type`) VALUES
(1, 'Cash'),
(2, 'Credit');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `route`
--

DROP TABLE IF EXISTS `route`;
CREATE TABLE IF NOT EXISTS `route` (
  `id_route` int(11) NOT NULL AUTO_INCREMENT,
  `name_route` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_route`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `route`
--

INSERT INTO `route` (`id_route`, `name_route`) VALUES
(1, 'Domestic route'),
(2, 'international route');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `transit`
--

DROP TABLE IF EXISTS `transit`;
CREATE TABLE IF NOT EXISTS `transit` (
  `id_transit` int(11) NOT NULL,
  `transit_num` int(11) NOT NULL,
  `id_city_transit` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_transit` time NOT NULL,
  PRIMARY KEY (`id_transit`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `transit`
--

INSERT INTO `transit` (`id_transit`, `transit_num`, `id_city_transit`, `time_transit`) VALUES
(1, 0, NULL, '00:00:00'),
(2, 0, NULL, '00:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `type`
--

DROP TABLE IF EXISTS `type`;
CREATE TABLE IF NOT EXISTS `type` (
  `id_type` int(11) NOT NULL AUTO_INCREMENT,
  `name_type` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_type`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `type`
--

INSERT INTO `type` (`id_type`, `name_type`) VALUES
(1, 'One way'),
(2, 'Return');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` int(13) NOT NULL,
  `gender` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth_day` date DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `active` int(11) NOT NULL,
  `attempt` int(11) NOT NULL,
  `last_access` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `email`, `name`, `password`, `phone`, `gender`, `birth_day`, `remember_token`, `created_at`, `updated_at`, `active`, `attempt`, `last_access`) VALUES
(1, 'admin@gmail.com', 'Admin', '$2y$10$nEB72Ai8LVX.5ypTMudl3.44/F4s4/qm1YPBsJ4/XV6vcYr5r6TLq', 125789655, NULL, NULL, 'dr0G1ElOjd2N4qtyr0k8DRXFvUzm71lHBIcsnuaxgjiSpBrtUpHIOt1tI1tm', '2019-03-14 06:40:01', '2019-03-14 06:40:01', 0, 0, '0000-00-00 00:00:00'),
(2, 'thai@gmail.com', 'admin', '$2y$10$dIm886fWzDyB81xjaalAGe7G2WjcueeURMUqKJN5K.8KVgWK19fWC', 12345678, NULL, NULL, '5UT2QtNoWXjcda1G3eb4qQIlqY4yxyW56pkqM0UnbKX5ZsCIiVkqTPF0vQHj', '2019-03-14 08:27:53', '2019-03-14 08:27:53', 0, 0, '0000-00-00 00:00:00');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
