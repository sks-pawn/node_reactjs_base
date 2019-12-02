-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 02, 2019 lúc 12:22 PM
-- Phiên bản máy phục vụ: 10.1.40-MariaDB
-- Phiên bản PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `schoolsystem`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `adonis_schema`
--

CREATE TABLE `adonis_schema` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `batch` int(11) DEFAULT NULL,
  `migration_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `adonis_schema`
--

INSERT INTO `adonis_schema` (`id`, `name`, `batch`, `migration_time`) VALUES
(1, '1503250034279_user', 1, '2019-11-12 09:19:55');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cars`
--

CREATE TABLE `cars` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `cars`
--

INSERT INTO `cars` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'bmw', 'bmw', NULL, NULL),
(2, 'lambo', 'lambo', NULL, NULL),
(3, 'tesla', 'tesla', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `class`
--

CREATE TABLE `class` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4,
  `price` bigint(20) DEFAULT NULL,
  `id_lecturers` bigint(20) DEFAULT NULL,
  `study_time_of_the_day` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `count_necessary` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `course_start_time` datetime DEFAULT NULL,
  `course_end_time` datetime DEFAULT NULL,
  `address` varchar(500) CHARACTER SET utf8mb4 DEFAULT NULL,
  `createdtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `count_current` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `class`
--

INSERT INTO `class` (`id`, `name`, `description`, `price`, `id_lecturers`, `study_time_of_the_day`, `count_necessary`, `status`, `course_start_time`, `course_end_time`, `address`, `createdtime`, `count_current`) VALUES
(1, 'Reacjs', 'Test', 2000000, 4, 'Từ 2h đến 6h sáng', 30, -1, '2019-05-20 00:00:00', '2019-06-20 00:00:00', 'Test', '2019-05-21 03:11:37', 3),
(2, 'Nodejs', 'Chịu', 3000000, 4, 'Từ 2h đến 6h sáng', 30, -1, '2019-05-20 00:00:00', '2019-06-20 00:00:00', NULL, '2019-06-07 08:47:41', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `countries`
--

INSERT INTO `countries` (`id`, `name`, `locale`, `created_at`, `updated_at`) VALUES
(1, 'Afghanistan', 'AF', '2019-12-02 11:52:39', '2019-12-02 11:52:39'),
(2, 'Åland Islands', 'AX', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(3, 'Albania', 'AL', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(4, 'Algeria', 'DZ', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(5, 'American Samoa', 'AS', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(6, 'AndorrA', 'AD', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(7, 'Angola', 'AO', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(8, 'Anguilla', 'AI', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(9, 'Antarctica', 'AQ', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(10, 'Antigua and Barbuda', 'AG', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(11, 'Argentina', 'AR', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(12, 'Armenia', 'AM', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(13, 'Aruba', 'AW', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(14, 'Australia', 'AU', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(15, 'Austria', 'AT', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(16, 'Azerbaijan', 'AZ', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(17, 'Bahamas', 'BS', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(18, 'Bahrain', 'BH', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(19, 'Bangladesh', 'BD', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(20, 'Barbados', 'BB', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(21, 'Belarus', 'BY', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(22, 'Belgium', 'BE', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(23, 'Belize', 'BZ', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(24, 'Benin', 'BJ', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(25, 'Bermuda', 'BM', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(26, 'Bhutan', 'BT', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(27, 'Bolivia', 'BO', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(28, 'Bosnia and Herzegovina', 'BA', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(29, 'Botswana', 'BW', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(30, 'Bouvet Island', 'BV', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(31, 'Brazil', 'BR', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(32, 'British Indian Ocean Territory', 'IO', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(33, 'Brunei Darussalam', 'BN', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(34, 'Bulgaria', 'BG', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(35, 'Burkina Faso', 'BF', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(36, 'Burundi', 'BI', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(37, 'Cambodia', 'KH', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(38, 'Cameroon', 'CM', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(39, 'Canada', 'CA', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(40, 'Cape Verde', 'CV', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(41, 'Cayman Islands', 'KY', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(42, 'Central African Republic', 'CF', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(43, 'Chad', 'TD', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(44, 'Chile', 'CL', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(45, 'China', 'CN', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(46, 'Christmas Island', 'CX', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(47, 'Cocos (Keeling) Islands', 'CC', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(48, 'Colombia', 'CO', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(49, 'Comoros', 'KM', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(50, 'Congo', 'CG', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(51, 'Congo, The Democratic Republic of the', 'CD', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(52, 'Cook Islands', 'CK', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(53, 'Costa Rica', 'CR', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(54, 'Cote D\"Ivoire', 'CI', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(55, 'Croatia', 'HR', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(56, 'Cuba', 'CU', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(57, 'Cyprus', 'CY', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(58, 'Czech Republic', 'CZ', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(59, 'Denmark', 'DK', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(60, 'Djibouti', 'DJ', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(61, 'Dominica', 'DM', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(62, 'Dominican Republic', 'DO', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(63, 'Ecuador', 'EC', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(64, 'Egypt', 'EG', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(65, 'El Salvador', 'SV', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(66, 'Equatorial Guinea', 'GQ', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(67, 'Eritrea', 'ER', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(68, 'Estonia', 'EE', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(69, 'Ethiopia', 'ET', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(70, 'Falkland Islands (Malvinas)', 'FK', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(71, 'Faroe Islands', 'FO', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(72, 'Fiji', 'FJ', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(73, 'Finland', 'FI', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(74, 'France', 'FR', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(75, 'French Guiana', 'GF', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(76, 'French Polynesia', 'PF', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(77, 'French Southern Territories', 'TF', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(78, 'Gabon', 'GA', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(79, 'Gambia', 'GM', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(80, 'Georgia', 'GE', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(81, 'Germany', 'DE', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(82, 'Ghana', 'GH', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(83, 'Gibraltar', 'GI', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(84, 'Greece', 'GR', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(85, 'Greenland', 'GL', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(86, 'Grenada', 'GD', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(87, 'Guadeloupe', 'GP', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(88, 'Guam', 'GU', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(89, 'Guatemala', 'GT', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(90, 'Guernsey', 'GG', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(91, 'Guinea', 'GN', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(92, 'Guinea-Bissau', 'GW', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(93, 'Guyana', 'GY', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(94, 'Haiti', 'HT', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(95, 'Heard Island and Mcdonald Islands', 'HM', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(96, 'Holy See (Vatican City State)', 'VA', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(97, 'Honduras', 'HN', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(98, 'Hong Kong', 'HK', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(99, 'Hungary', 'HU', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(100, 'Iceland', 'IS', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(101, 'India', 'IN', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(102, 'Indonesia', 'ID', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(103, 'Iran, Islamic Republic Of', 'IR', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(104, 'Iraq', 'IQ', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(105, 'Ireland', 'IE', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(106, 'Isle of Man', 'IM', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(107, 'Israel', 'IL', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(108, 'Italy', 'IT', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(109, 'Jamaica', 'JM', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(110, 'Japan', 'JP', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(111, 'Jersey', 'JE', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(112, 'Jordan', 'JO', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(113, 'Kazakhstan', 'KZ', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(114, 'Kenya', 'KE', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(115, 'Kiribati', 'KI', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(116, 'Korea, Democratic People\"S Republic of', 'KP', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(117, 'Korea, Republic of', 'KR', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(118, 'Kuwait', 'KW', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(119, 'Kyrgyzstan', 'KG', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(120, 'Lao People\"S Democratic Republic', 'LA', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(121, 'Latvia', 'LV', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(122, 'Lebanon', 'LB', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(123, 'Lesotho', 'LS', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(124, 'Liberia', 'LR', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(125, 'Libyan Arab Jamahiriya', 'LY', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(126, 'Liechtenstein', 'LI', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(127, 'Lithuania', 'LT', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(128, 'Luxembourg', 'LU', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(129, 'Macao', 'MO', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(130, 'Macedonia, The Former Yugoslav Republic of', 'MK', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(131, 'Madagascar', 'MG', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(132, 'Malawi', 'MW', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(133, 'Malaysia', 'MY', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(134, 'Maldives', 'MV', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(135, 'Mali', 'ML', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(136, 'Malta', 'MT', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(137, 'Marshall Islands', 'MH', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(138, 'Martinique', 'MQ', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(139, 'Mauritania', 'MR', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(140, 'Mauritius', 'MU', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(141, 'Mayotte', 'YT', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(142, 'Mexico', 'MX', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(143, 'Micronesia, Federated States of', 'FM', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(144, 'Moldova, Republic of', 'MD', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(145, 'Monaco', 'MC', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(146, 'Mongolia', 'MN', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(147, 'Montserrat', 'MS', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(148, 'Morocco', 'MA', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(149, 'Mozambique', 'MZ', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(150, 'Myanmar', 'MM', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(151, 'Namibia', 'NA', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(152, 'Nauru', 'NR', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(153, 'Nepal', 'NP', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(154, 'Netherlands', 'NL', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(155, 'Netherlands Antilles', 'AN', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(156, 'New Caledonia', 'NC', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(157, 'New Zealand', 'NZ', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(158, 'Nicaragua', 'NI', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(159, 'Niger', 'NE', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(160, 'Nigeria', 'NG', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(161, 'Niue', 'NU', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(162, 'Norfolk Island', 'NF', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(163, 'Northern Mariana Islands', 'MP', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(164, 'Norway', 'NO', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(165, 'Oman', 'OM', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(166, 'Pakistan', 'PK', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(167, 'Palau', 'PW', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(168, 'Palestinian Territory, Occupied', 'PS', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(169, 'Panama', 'PA', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(170, 'Papua New Guinea', 'PG', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(171, 'Paraguay', 'PY', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(172, 'Peru', 'PE', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(173, 'Philippines', 'PH', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(174, 'Pitcairn', 'PN', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(175, 'Poland', 'PL', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(176, 'Portugal', 'PT', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(177, 'Puerto Rico', 'PR', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(178, 'Qatar', 'QA', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(179, 'Reunion', 'RE', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(180, 'Romania', 'RO', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(181, 'Russian Federation', 'RU', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(182, 'RWANDA', 'RW', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(183, 'Saint Helena', 'SH', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(184, 'Saint Kitts and Nevis', 'KN', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(185, 'Saint Lucia', 'LC', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(186, 'Saint Pierre and Miquelon', 'PM', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(187, 'Saint Vincent and the Grenadines', 'VC', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(188, 'Samoa', 'WS', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(189, 'San Marino', 'SM', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(190, 'Sao Tome and Principe', 'ST', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(191, 'Saudi Arabia', 'SA', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(192, 'Senegal', 'SN', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(193, 'Serbia and Montenegro', 'CS', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(194, 'Seychelles', 'SC', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(195, 'Sierra Leone', 'SL', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(196, 'Singapore', 'SG', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(197, 'Slovakia', 'SK', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(198, 'Slovenia', 'SI', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(199, 'Solomon Islands', 'SB', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(200, 'Somalia', 'SO', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(201, 'South Africa', 'ZA', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(202, 'South Georgia and the South Sandwich Islands', 'GS', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(203, 'Spain', 'ES', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(204, 'Sri Lanka', 'LK', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(205, 'Sudan', 'SD', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(206, 'Suri name', 'SR', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(207, 'Svalbard and Jan Mayen', 'SJ', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(208, 'Swaziland', 'SZ', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(209, 'Sweden', 'SE', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(210, 'Switzerland', 'CH', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(211, 'Syrian Arab Republic', 'SY', '2019-12-02 11:52:40', '2019-12-02 11:52:40'),
(212, 'Taiwan, Province of China', 'TW', '2019-12-02 11:52:41', '2019-12-02 11:52:41'),
(213, 'Tajikistan', 'TJ', '2019-12-02 11:52:41', '2019-12-02 11:52:41'),
(214, 'Tanzania, United Republic of', 'TZ', '2019-12-02 11:52:41', '2019-12-02 11:52:41'),
(215, 'Thailand', 'TH', '2019-12-02 11:52:41', '2019-12-02 11:52:41'),
(216, 'Timor-Leste', 'TL', '2019-12-02 11:52:41', '2019-12-02 11:52:41'),
(217, 'Togo', 'TG', '2019-12-02 11:52:41', '2019-12-02 11:52:41'),
(218, 'Tokelau', 'TK', '2019-12-02 11:52:41', '2019-12-02 11:52:41'),
(219, 'Tonga', 'TO', '2019-12-02 11:52:41', '2019-12-02 11:52:41'),
(220, 'Trinidad and Tobago', 'TT', '2019-12-02 11:52:41', '2019-12-02 11:52:41'),
(221, 'Tunisia', 'TN', '2019-12-02 11:52:41', '2019-12-02 11:52:41'),
(222, 'Turkey', 'TR', '2019-12-02 11:52:41', '2019-12-02 11:52:41'),
(223, 'Turkmenistan', 'TM', '2019-12-02 11:52:41', '2019-12-02 11:52:41'),
(224, 'Turks and Caicos Islands', 'TC', '2019-12-02 11:52:41', '2019-12-02 11:52:41'),
(225, 'Tuvalu', 'TV', '2019-12-02 11:52:41', '2019-12-02 11:52:41'),
(226, 'Uganda', 'UG', '2019-12-02 11:52:41', '2019-12-02 11:52:41'),
(227, 'Ukraine', 'UA', '2019-12-02 11:52:41', '2019-12-02 11:52:41'),
(228, 'United Arab Emirates', 'AE', '2019-12-02 11:52:41', '2019-12-02 11:52:41'),
(229, 'United Kingdom', 'GB', '2019-12-02 11:52:41', '2019-12-02 11:52:41'),
(230, 'United States', 'US', '2019-12-02 11:52:41', '2019-12-02 11:52:41'),
(231, 'United States Minor Outlying Islands', 'UM', '2019-12-02 11:52:41', '2019-12-02 11:52:41'),
(232, 'Uruguay', 'UY', '2019-12-02 11:52:41', '2019-12-02 11:52:41'),
(233, 'Uzbekistan', 'UZ', '2019-12-02 11:52:41', '2019-12-02 11:52:41'),
(234, 'Vanuatu', 'VU', '2019-12-02 11:52:41', '2019-12-02 11:52:41'),
(235, 'Venezuela', 'VE', '2019-12-02 11:52:41', '2019-12-02 11:52:41'),
(236, 'Viet Nam', 'VN', '2019-12-02 11:52:41', '2019-12-02 11:52:41'),
(237, 'Virgin Islands, British', 'VG', '2019-12-02 11:52:41', '2019-12-02 11:52:41'),
(238, 'Virgin Islands, U.S.', 'VI', '2019-12-02 11:52:41', '2019-12-02 11:52:41'),
(239, 'Wallis and Futuna', 'WF', '2019-12-02 11:52:41', '2019-12-02 11:52:41'),
(240, 'Western Sahara', 'EH', '2019-12-02 11:52:41', '2019-12-02 11:52:41'),
(241, 'Yemen', 'YE', '2019-12-02 11:52:41', '2019-12-02 11:52:41'),
(242, 'Zambia', 'ZM', '2019-12-02 11:52:41', '2019-12-02 11:52:41'),
(243, 'Zimbabwe', 'ZW', '2019-12-02 11:52:41', '2019-12-02 11:52:41');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `defailt_status`
--

CREATE TABLE `defailt_status` (
  `value` char(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `trạng thái` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `table` char(50) CHARACTER SET utf8mb4 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `defailt_status`
--

INSERT INTO `defailt_status` (`value`, `trạng thái`, `table`) VALUES
('-1', 'Chưa hoạt động', 'class'),
('1', 'Đang hoạt động', 'class'),
('2', 'Đã hoàn thành', 'class'),
('0', 'Đã đủ người', 'class');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` mediumtext NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `content`, `created_at`, `updated_at`) VALUES
(1, 1, 'Associate Professor', 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(2, 2, 'Developer IV', 'Proin interdum mauris non ligula pellentesque ultrices.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(3, 3, 'Business Systems Development Analyst', 'Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(4, 4, 'Structural Engineer', 'Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(5, 5, 'Design Engineer', 'Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(6, 6, 'Technical Writer', 'Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(7, 7, 'Sales Representative', 'Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(8, 8, 'Statistician I', 'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(9, 9, 'Safety Technician IV', 'Phasellus sit amet erat.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(10, 10, 'Assistant Manager', 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(11, 11, 'Pharmacist', 'Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(12, 12, 'Director of Sales', 'Integer ac leo.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(13, 13, 'Software Test Engineer I', 'Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(14, 14, 'VP Marketing', 'Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(15, 15, 'Statistician II', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(16, 16, 'Design Engineer', 'Proin risus. Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(17, 17, 'Actuary', 'In hac habitasse platea dictumst.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(18, 18, 'Associate Professor', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(19, 19, 'Chemical Engineer', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(20, 20, 'Operator', 'Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(21, 21, 'Tax Accountant', 'Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(22, 22, 'Graphic Designer', 'Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(23, 23, 'Programmer Analyst III', 'Phasellus in felis. Donec semper sapien a libero.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(24, 24, 'Recruiting Manager', 'Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(25, 25, 'Web Designer II', 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(26, 26, 'Biostatistician IV', 'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(27, 27, 'Sales Associate', 'Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(28, 28, 'Quality Engineer', 'In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(29, 29, 'VP Sales', 'Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(30, 30, 'Account Executive', 'Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(31, 31, 'Financial Advisor', 'Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(32, 32, 'Community Outreach Specialist', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(33, 33, 'Pharmacist', 'Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(34, 34, 'Media Manager III', 'Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(35, 35, 'Statistician I', 'Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(36, 36, 'Executive Secretary', 'In blandit ultrices enim.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(37, 37, 'Payment Adjustment Coordinator', 'Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(38, 38, 'Database Administrator I', 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(39, 39, 'Assistant Manager', 'Morbi non lectus.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(40, 40, 'GIS Technical Architect', 'Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(41, 41, 'Human Resources Assistant II', 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(42, 42, 'Assistant Professor', 'Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(43, 43, 'Sales Representative', 'Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(44, 44, 'Health Coach III', 'Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(45, 45, 'Web Designer II', 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(46, 46, 'Physical Therapy Assistant', 'Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(47, 47, 'Chemical Engineer', 'Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(48, 48, 'Sales Representative', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(49, 49, 'Cost Accountant', 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(50, 50, 'Research Nurse', 'Phasellus sit amet erat. Nulla tempus.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(51, 51, 'Director of Sales', 'Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(52, 52, 'Design Engineer', 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(53, 53, 'Programmer Analyst I', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(54, 54, 'VP Sales', 'Integer tincidunt ante vel ipsum.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(55, 55, 'Senior Developer', 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(56, 56, 'Research Assistant II', 'Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(57, 57, 'Developer I', 'Phasellus in felis. Donec semper sapien a libero. Nam dui.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(58, 58, 'Tax Accountant', 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(59, 59, 'Structural Analysis Engineer', 'Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(60, 60, 'Marketing Assistant', 'Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(61, 61, 'Programmer Analyst IV', 'Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(62, 62, 'Design Engineer', 'Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(63, 63, 'Help Desk Technician', 'In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(64, 64, 'Senior Sales Associate', 'Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(65, 65, 'Senior Cost Accountant', 'Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(66, 66, 'Cost Accountant', 'Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(67, 67, 'Database Administrator IV', 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(68, 68, 'VP Product Management', 'In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(69, 69, 'Quality Control Specialist', 'Nulla tempus.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(70, 70, 'GIS Technical Architect', 'Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(71, 71, 'Operator', 'Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(72, 72, 'Senior Cost Accountant', 'Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(73, 73, 'Physical Therapy Assistant', 'Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(74, 74, 'Community Outreach Specialist', 'Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(75, 75, 'Marketing Manager', 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(76, 76, 'Engineer II', 'Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(77, 77, 'Media Manager III', 'Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(78, 78, 'Graphic Designer', 'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(79, 79, 'Human Resources Manager', 'Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(80, 80, 'Financial Analyst', 'Integer ac leo.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(81, 81, 'Programmer Analyst IV', 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(82, 82, 'Analog Circuit Design manager', 'Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(83, 83, 'Geological Engineer', 'Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(84, 84, 'Senior Sales Associate', 'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(85, 85, 'Design Engineer', 'Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(86, 86, 'Food Chemist', 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(87, 87, 'Assistant Media Planner', 'Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(88, 88, 'Legal Assistant', 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(89, 89, 'Data Coordiator', 'Suspendisse potenti. In eleifend quam a odio.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(90, 90, 'Software Consultant', 'Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(91, 91, 'Actuary', 'Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(92, 92, 'Quality Engineer', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(93, 93, 'Statistician I', 'In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(94, 94, 'Occupational Therapist', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(95, 95, 'Geologist II', 'Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(96, 96, 'Electrical Engineer', 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(97, 97, 'Research Assistant IV', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(98, 98, 'Clinical Specialist', 'Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(99, 99, 'Nurse', 'Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', '2019-12-02 18:22:21', '2019-12-02 18:22:21'),
(100, 100, 'Community Outreach Specialist', 'Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus.', '2019-12-02 18:22:21', '2019-12-02 18:22:21');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `role` varchar(50) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `role`, `name`) VALUES
(0, 'accountant', 'Kế toán'),
(1, 'admin', 'Admin'),
(2, 'lecturers', 'Giảng viên'),
(3, 'student', 'Sinh viên');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `schedules`
--

CREATE TABLE `schedules` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `price_active` tinyint(1) DEFAULT NULL,
  `createdtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_class` bigint(20) DEFAULT NULL,
  `done` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `schedules`
--

INSERT INTO `schedules` (`id`, `user_id`, `status`, `price_active`, `createdtime`, `id_class`, `done`) VALUES
(1, 5, 1, 1, '2019-05-21 03:53:46', 1, 1),
(2, 5, 0, 0, '2019-05-21 04:00:44', 2, 0),
(4, 2, 1, 1, '2019-05-21 07:20:03', 1, 0),
(5, 5, 1, 1, '2019-05-22 10:04:45', 1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tokens`
--

CREATE TABLE `tokens` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `token` varchar(255) NOT NULL,
  `type` varchar(80) NOT NULL,
  `is_revoked` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tokens`
--

INSERT INTO `tokens` (`id`, `user_id`, `token`, `type`, `is_revoked`, `created_at`, `updated_at`) VALUES
(82, 2, '26f2fa674c3244cfa4c1892183328884', 'api_token', 0, '2019-11-13 11:03:51', '2019-11-13 11:03:51'),
(83, 1, 'be1a27cf-21ed-4645-b566-821930483843', 'jwt_refresh_token', 0, '2019-11-13 14:49:06', '2019-11-13 14:49:06'),
(85, 1, '590ceed1-0df7-4cde-89c4-59684fb96d8e', 'jwt_refresh_token', 0, '2019-11-13 14:56:57', '2019-11-13 14:56:57'),
(86, 1, 'cebf06a8-09f9-498e-a236-08d2112ef49b', 'jwt_refresh_token', 0, '2019-11-13 15:01:24', '2019-11-13 15:01:24'),
(87, 1, '7606bc16-68c8-4e34-8143-d95118e61225', 'jwt_refresh_token', 0, '2019-11-13 15:06:06', '2019-11-13 15:06:06'),
(88, 1, '815d69f9-7636-403c-bbff-b1a167f4c360', 'jwt_refresh_token', 0, '2019-11-13 15:13:43', '2019-11-13 15:13:43'),
(89, 1, 'e4f5d142-c0ec-44fc-ad67-e7e94fbb2293', 'jwt_refresh_token', 0, '2019-11-13 15:15:08', '2019-11-13 15:15:08'),
(90, 1, 'b2b8f9a2-91b9-45c4-9c20-795b5d938f64', 'jwt_refresh_token', 0, '2019-11-13 15:15:16', '2019-11-13 15:15:16'),
(91, 1, '623abfb2-c1ea-4797-87ef-bb483151c865', 'jwt_refresh_token', 0, '2019-11-13 15:15:21', '2019-11-13 15:15:21'),
(92, 1, 'e3742154-50c3-4aeb-8368-52d2ecf5c501', 'jwt_refresh_token', 0, '2019-11-13 15:15:55', '2019-11-13 15:15:55'),
(93, 1, 'ce330e6c-0ec7-4006-9e20-cd349f8503bc', 'jwt_refresh_token', 0, '2019-11-13 15:28:16', '2019-11-13 15:28:16'),
(94, 1, '6d568a3f-2c37-4a11-9850-57c997326ab5', 'jwt_refresh_token', 0, '2019-11-13 15:28:32', '2019-11-13 15:28:32'),
(95, 1, '53512e08-7224-4c89-9671-4857707fbb0d', 'jwt_refresh_token', 0, '2019-11-13 15:28:55', '2019-11-13 15:28:55'),
(96, 1, 'e6a93d0e-2156-4ec7-b0f8-840b0093c97a', 'jwt_refresh_token', 0, '2019-11-13 15:29:01', '2019-11-13 15:29:01'),
(97, 1, '6756b329-4523-401f-9e45-0d962bfd9bf6', 'jwt_refresh_token', 0, '2019-11-13 16:32:39', '2019-11-13 16:32:39'),
(98, 1, 'e93e3254-0d5e-45c5-b3be-6e8b10cb9e65', 'jwt_refresh_token', 0, '2019-11-13 16:32:40', '2019-11-13 16:32:40'),
(99, 1, '11bb4240-b3a4-4dd2-b28b-fe6267bee3df', 'jwt_refresh_token', 0, '2019-11-13 16:32:42', '2019-11-13 16:32:42'),
(100, 1, 'fb22a62c-d125-4983-9356-55bef6a760bd', 'jwt_refresh_token', 0, '2019-11-13 16:36:30', '2019-11-13 16:36:30'),
(101, 1, 'be8ffcf6-3c72-494a-8e10-99ed264aa8e5', 'jwt_refresh_token', 0, '2019-11-13 16:36:36', '2019-11-13 16:36:36'),
(102, 1, '9f8214a9-a267-4116-8c12-f6ce632b008e', 'jwt_refresh_token', 0, '2019-11-13 16:36:40', '2019-11-13 16:36:40'),
(103, 1, 'd3e0c202-6ff6-4672-bc46-210041a096e9', 'jwt_refresh_token', 0, '2019-11-13 16:36:45', '2019-11-13 16:36:45'),
(104, 1, '4f4dc6d3-b248-403d-818a-159d432a8e39', 'jwt_refresh_token', 0, '2019-11-13 16:36:47', '2019-11-13 16:36:47'),
(105, 1, '6ac325ab-4810-49cc-ab52-c46702cdbc96', 'jwt_refresh_token', 0, '2019-11-13 16:37:17', '2019-11-13 16:37:17'),
(106, 1, '48d69cbc-268d-4dfd-becc-72e11264061e', 'jwt_refresh_token', 0, '2019-11-13 16:37:53', '2019-11-13 16:37:53'),
(107, 1, '0de48819-0e2f-4e48-b9f4-2d0a4ec45fcb', 'jwt_refresh_token', 0, '2019-11-13 16:38:10', '2019-11-13 16:38:10'),
(108, 1, 'e9f51465-95e1-47f2-8470-54ccaf9bd225', 'jwt_refresh_token', 0, '2019-11-13 16:40:10', '2019-11-13 16:40:10'),
(109, 1, '54d10345-5764-4ebb-a3fb-74c3d9c793a4', 'jwt_refresh_token', 0, '2019-11-13 16:41:28', '2019-11-13 16:41:28'),
(110, 1, 'b3d4fa52-00ff-4521-ad45-7022acd1df9c', 'jwt_refresh_token', 0, '2019-11-13 16:42:22', '2019-11-13 16:42:22'),
(111, 1, '8d30c5ed-6476-4f02-8371-064f7ae18b2c', 'jwt_refresh_token', 0, '2019-11-13 16:42:24', '2019-11-13 16:42:24'),
(112, 1, '3377f549-2ef2-4559-b7f1-f3df7d67257b', 'jwt_refresh_token', 0, '2019-11-13 16:43:23', '2019-11-13 16:43:23'),
(113, 1, '4d4656dd-e1d9-4b83-953e-21c357cf1b83', 'jwt_refresh_token', 0, '2019-11-13 16:43:49', '2019-11-13 16:43:49'),
(114, 1, '225b34e8-da51-4659-ba7a-5a2f9ae5f384', 'jwt_refresh_token', 0, '2019-11-14 15:56:42', '2019-11-14 15:56:42'),
(115, 1, '0d913c24-e9f0-482a-a87d-fc296a626d3f', 'jwt_refresh_token', 0, '2019-11-14 15:56:47', '2019-11-14 15:56:47'),
(116, 1, '7a88a6c3-e1e6-4586-b39b-15ce82821b88', 'jwt_refresh_token', 0, '2019-11-14 15:57:21', '2019-11-14 15:57:21'),
(117, 1, '0e22f89d-dfd2-4ed9-a7c3-30bd8ce61cef', 'jwt_refresh_token', 0, '2019-11-14 15:57:58', '2019-11-14 15:57:58'),
(118, 1, '3c4304e6-a91a-4063-b087-fdf7a5d0f1a2', 'jwt_refresh_token', 0, '2019-11-14 15:58:46', '2019-11-14 15:58:46'),
(119, 1, '7c9bd12b-6957-4f71-87a5-bca17f62aae6', 'jwt_refresh_token', 0, '2019-11-14 15:58:59', '2019-11-14 15:58:59'),
(120, 1, '816afd8f-c218-4682-bee4-d210ca3e9392', 'jwt_refresh_token', 0, '2019-11-14 16:00:53', '2019-11-14 16:00:53'),
(121, 1, '98bcaba6-3265-4cda-aaf8-014d47a2f2d3', 'jwt_refresh_token', 0, '2019-11-14 16:01:09', '2019-11-14 16:01:09'),
(122, 1, 'bb26f9db-94f9-45bc-b1ea-ee077c66f5bb', 'jwt_refresh_token', 0, '2019-11-14 16:01:14', '2019-11-14 16:01:14'),
(123, 1, 'dbff07c9-38fc-43fe-a5f3-d322fd339d8c', 'jwt_refresh_token', 0, '2019-11-14 16:01:20', '2019-11-14 16:01:20'),
(124, 1, '3ab8877a-61fd-4b29-b80b-a3f00bac11a8', 'jwt_refresh_token', 0, '2019-11-14 16:01:23', '2019-11-14 16:01:23'),
(125, 1, '56275f88-7794-4171-a52b-779f49692c19', 'jwt_refresh_token', 0, '2019-11-14 16:01:25', '2019-11-14 16:01:25'),
(126, 1, 'fc2b4ce9-4804-4dbb-9d61-7b3dfb903fc5', 'jwt_refresh_token', 0, '2019-11-14 16:01:26', '2019-11-14 16:01:26'),
(127, 1, 'b3e38952-4b52-42f0-bd00-a382c1d4816d', 'jwt_refresh_token', 0, '2019-11-14 16:01:40', '2019-11-14 16:01:40'),
(128, 1, '11fcce86-3202-4ab2-a280-7f8ea0363325', 'jwt_refresh_token', 0, '2019-11-14 16:02:32', '2019-11-14 16:02:32'),
(129, 1, '9cbbd0b6-c0cc-4ac1-b3ef-f3495a05366d', 'jwt_refresh_token', 0, '2019-11-14 16:03:38', '2019-11-14 16:03:38'),
(130, 1, '7a159b1f-3fb9-47b3-9445-44730e81f0c3', 'jwt_refresh_token', 0, '2019-11-14 16:05:30', '2019-11-14 16:05:30'),
(131, 1, '3766cae1-c8de-4832-854e-2dd4dde55996', 'jwt_refresh_token', 0, '2019-11-14 16:06:34', '2019-11-14 16:06:34'),
(132, 1, 'e1834600-2e28-46a9-82da-9e8dd9b3a8c2', 'jwt_refresh_token', 0, '2019-11-14 16:09:48', '2019-11-14 16:09:48'),
(133, 1, '73c83f3c-eacc-48b7-8ce1-41580f853340', 'jwt_refresh_token', 0, '2019-11-14 16:10:11', '2019-11-14 16:10:11'),
(134, 1, '6881a062-809d-4482-a869-80ed9d4ce9e6', 'jwt_refresh_token', 0, '2019-11-14 16:18:29', '2019-11-14 16:18:29'),
(135, 1, '5c0dca99-db31-4740-b7fe-67c3df06bc14', 'jwt_refresh_token', 0, '2019-11-14 16:18:34', '2019-11-14 16:18:34'),
(136, 1, '039d5a3e-cd39-4a40-9f25-eb5f81ce8844', 'jwt_refresh_token', 0, '2019-11-14 16:24:23', '2019-11-14 16:24:23'),
(137, 1, '9881321c-b741-47d9-b822-f001cd7f04ba', 'jwt_refresh_token', 0, '2019-11-14 16:25:26', '2019-11-14 16:25:26'),
(138, 1, 'aea3fe33-f276-498a-a1b2-0ab2e7e831a7', 'jwt_refresh_token', 0, '2019-11-14 16:25:30', '2019-11-14 16:25:30'),
(139, 1, '71da26c2-171e-4896-8508-22c07e141966', 'jwt_refresh_token', 0, '2019-11-14 16:25:37', '2019-11-14 16:25:37'),
(140, 1, 'd3d814bc-3096-4644-9122-da21cc08f190', 'jwt_refresh_token', 0, '2019-11-14 16:25:40', '2019-11-14 16:25:40'),
(141, 1, '1e799a85-8a33-4a71-a986-374ef5b8db8c', 'jwt_refresh_token', 0, '2019-11-14 16:26:01', '2019-11-14 16:26:01'),
(142, 1, '343dac67-6e00-45d6-ba29-f572ad0b04e6', 'jwt_refresh_token', 0, '2019-11-14 16:27:49', '2019-11-14 16:27:49'),
(143, 1, 'b4352cfb-dde7-44de-8fce-2487efb166d2', 'jwt_refresh_token', 0, '2019-11-14 16:27:56', '2019-11-14 16:27:56'),
(144, 1, 'a3b1f70d-98bb-43c4-8544-e49a05bb0153', 'jwt_refresh_token', 0, '2019-11-14 16:47:08', '2019-11-14 16:47:08'),
(145, 1, 'bb45b46c-19ed-4c31-a854-65846f52c9a4', 'jwt_refresh_token', 0, '2019-11-14 17:16:37', '2019-11-14 17:16:37'),
(146, 1, '5b2cddcb-e21d-4580-bd94-cb919c22ea77', 'jwt_refresh_token', 0, '2019-11-14 17:17:17', '2019-11-14 17:17:17'),
(147, 1, '8c7aed14-5287-4639-9c40-cb81eb498dc6', 'jwt_refresh_token', 0, '2019-11-14 18:26:37', '2019-11-14 18:26:37'),
(148, 1, '73010756-5010-4b47-a654-604ceb2e52f0', 'jwt_refresh_token', 0, '2019-11-15 11:12:15', '2019-11-15 11:12:15'),
(149, 1, 'bade0909-d57a-4de8-bea0-9a8f204b78a9', 'jwt_refresh_token', 0, '2019-11-15 11:12:33', '2019-11-15 11:12:33'),
(150, 1, 'e134d488-8c3f-47a7-aa00-6d7142831adf', 'jwt_refresh_token', 0, '2019-11-15 11:13:40', '2019-11-15 11:13:40'),
(151, 1, '3dd84541-a88a-4899-a4c7-3ba0db8035d0', 'jwt_refresh_token', 0, '2019-11-15 11:13:48', '2019-11-15 11:13:48'),
(152, 1, '37a50416-247c-4edf-b5eb-a29d0a58347a', 'jwt_refresh_token', 0, '2019-11-15 11:29:43', '2019-11-15 11:29:43'),
(153, 1, '5fc1fb06-295c-49d7-8881-48efbbbf4d17', 'jwt_refresh_token', 0, '2019-11-15 11:30:15', '2019-11-15 11:30:15'),
(154, 1, '7e8476e7-3404-4458-869a-7473c1ee2cfc', 'jwt_refresh_token', 0, '2019-11-15 11:30:56', '2019-11-15 11:30:56'),
(155, 1, 'ec650b49-1060-40bc-9492-94260a380b37', 'jwt_refresh_token', 0, '2019-11-15 11:31:25', '2019-11-15 11:31:25'),
(156, 1, 'aeedca44-7fde-4f04-aa95-c52fac6a9c6e', 'jwt_refresh_token', 0, '2019-11-15 11:31:59', '2019-11-15 11:31:59'),
(157, 1, '5052a632-88b9-4707-8737-66611a673bc8', 'jwt_refresh_token', 0, '2019-11-15 11:37:12', '2019-11-15 11:37:12'),
(158, 1, '498dfc6e-aa65-48d3-99c0-5575a91acffc', 'jwt_refresh_token', 0, '2019-11-15 11:37:46', '2019-11-15 11:37:46'),
(159, 1, 'fc3a3ecd-15a0-4c61-9e8b-4c3e8e0adea9', 'jwt_refresh_token', 0, '2019-11-15 11:48:05', '2019-11-15 11:48:05'),
(160, 1, '85ace77e-3436-4773-9fc1-100cf1cbd4de', 'jwt_refresh_token', 0, '2019-11-15 11:48:12', '2019-11-15 11:48:12'),
(161, 1, '2ba7ad43-3efb-476d-865b-37b31ffd9f49', 'jwt_refresh_token', 0, '2019-11-15 11:48:28', '2019-11-15 11:48:28'),
(162, 1, '9dd57e9d-31db-4c38-9db3-b605eab46c6e', 'jwt_refresh_token', 0, '2019-11-15 11:48:46', '2019-11-15 11:48:46'),
(163, 1, 'a9064418-8842-4c19-a0b9-4eca72d3859f', 'jwt_refresh_token', 0, '2019-11-15 11:50:38', '2019-11-15 11:50:38'),
(164, 1, '0c88e567-1f10-41ef-a7ad-20a7d14def20', 'jwt_refresh_token', 0, '2019-11-15 11:51:37', '2019-11-15 11:51:37'),
(165, 1, 'cbe3304c-2315-4f67-a254-eb1c68d7bb49', 'jwt_refresh_token', 0, '2019-11-15 11:51:48', '2019-11-15 11:51:48'),
(166, 1, 'e1b443b1-29ce-44da-a4a6-17dcb7ffbba0', 'jwt_refresh_token', 0, '2019-11-15 11:54:37', '2019-11-15 11:54:37'),
(167, 1, '63fd4b7d-b8d9-4d2e-9ab1-72713e14b045', 'jwt_refresh_token', 0, '2019-11-15 11:54:56', '2019-11-15 11:54:56'),
(168, 1, '8494d666-9564-4592-9c0c-172cbabf6a2a', 'jwt_refresh_token', 0, '2019-11-15 11:59:09', '2019-11-15 11:59:09'),
(169, 1, '4111d2f0-913e-4889-ae94-6ef78554389f', 'jwt_refresh_token', 0, '2019-11-15 12:00:59', '2019-11-15 12:00:59'),
(170, 1, 'e850af2f-cc33-4eaf-b04c-6fc582bd62c0', 'jwt_refresh_token', 0, '2019-11-15 14:07:56', '2019-11-15 14:07:56'),
(171, 1, '34651ba0-769b-4785-9fad-11b8fb699bbd', 'jwt_refresh_token', 0, '2019-11-15 14:08:54', '2019-11-15 14:08:54'),
(172, 1, 'dd4a8113-628d-4166-a1a9-e543929efe29', 'jwt_refresh_token', 0, '2019-11-15 14:09:21', '2019-11-15 14:09:21'),
(173, 1, 'f6c1b494-7c0e-4d25-bce2-95085b046778', 'jwt_refresh_token', 0, '2019-11-15 14:09:45', '2019-11-15 14:09:45'),
(174, 1, 'eb21462b-d232-4838-9016-0521777a451b', 'jwt_refresh_token', 0, '2019-11-15 14:09:53', '2019-11-15 14:09:53'),
(175, 1, 'f16432dd-aed9-4833-80d0-4f462050fe51', 'jwt_refresh_token', 0, '2019-11-15 14:12:02', '2019-11-15 14:12:02'),
(176, 1, '812912da-c5eb-497f-a76c-a9a3fe468f48', 'jwt_refresh_token', 0, '2019-11-15 16:08:05', '2019-11-15 16:08:05'),
(177, 3, '74e4d404-af94-40a5-8d2c-2e251c9c9dc8', 'jwt_refresh_token', 0, '2019-11-15 16:16:18', '2019-11-15 16:16:18'),
(178, 3, '4f167588-783b-49de-8f89-85121fb140b7', 'jwt_refresh_token', 0, '2019-11-15 17:35:52', '2019-11-15 17:35:52'),
(179, 1, 'a81d9309-c4bc-4991-ac94-92259b1c6271', 'jwt_refresh_token', 0, '2019-11-15 17:39:20', '2019-11-15 17:39:20'),
(180, 3, 'c7ebe018-ef35-43e4-ae8d-f11fd4c8cbdb', 'jwt_refresh_token', 0, '2019-11-15 17:54:22', '2019-11-15 17:54:22'),
(181, 1, 'a5e9879d-6675-4eeb-86f2-2709b2fd87f9', 'jwt_refresh_token', 0, '2019-11-15 17:54:58', '2019-11-15 17:54:58'),
(182, 1, '22ca078b-59f1-4eaa-9ea4-a37cef8a381f', 'jwt_refresh_token', 0, '2019-11-18 11:28:36', '2019-11-18 11:28:36'),
(183, 1, '1a128d6c-3f14-4e88-99ef-e8fa37d638de', 'jwt_refresh_token', 0, '2019-11-18 16:27:31', '2019-11-18 16:27:31'),
(184, 1, '622475e0-faf2-4dfd-a327-fb5f5e4cc984', 'jwt_refresh_token', 0, '2019-11-18 17:07:54', '2019-11-18 17:07:54'),
(185, 1, 'e073f03b-ab2d-4dc6-84d3-9860642d5d22', 'jwt_refresh_token', 0, '2019-11-20 11:10:01', '2019-11-20 11:10:01'),
(186, 1, 'cb530803-c187-46ce-a036-569b1fb19a19', 'jwt_refresh_token', 0, '2019-11-20 13:45:10', '2019-11-20 13:45:10'),
(187, 1, 'f823a60c-fda2-49d0-aeba-abdced3b43f1', 'jwt_refresh_token', 0, '2019-11-20 13:45:16', '2019-11-20 13:45:16'),
(188, 64, 'de9bc05b-38e9-4280-b6a2-ac1707709fb2', 'jwt_refresh_token', 0, '2019-11-21 17:07:50', '2019-11-21 17:07:50'),
(189, 64, 'db4a9034-4af2-4a5b-a9c2-232ae93a328c', 'jwt_refresh_token', 0, '2019-11-21 17:08:14', '2019-11-21 17:08:14'),
(190, 65, 'c296c067-0343-4fa0-b792-49ee655f7bb8', 'jwt_refresh_token', 0, '2019-11-21 17:09:42', '2019-11-21 17:09:42'),
(191, 66, '17b37ff0-415a-4dd0-810a-e9530d55a658', 'jwt_refresh_token', 0, '2019-11-21 17:10:29', '2019-11-21 17:10:29'),
(192, 66, '1fc474ee-b245-4c54-999e-2a7eacf887cd', 'jwt_refresh_token', 0, '2019-11-21 17:12:34', '2019-11-21 17:12:34'),
(193, 66, 'd02ef4af-8cba-4a86-884c-124cd63811c6', 'jwt_refresh_token', 0, '2019-11-21 17:12:46', '2019-11-21 17:12:46'),
(194, 66, '9d51c2b5-cbe5-4e07-83e8-43687501adb6', 'jwt_refresh_token', 0, '2019-11-21 17:13:34', '2019-11-21 17:13:34'),
(195, 66, '44374a86-f0d4-448b-a717-84713e0712f9', 'jwt_refresh_token', 0, '2019-11-21 17:14:21', '2019-11-21 17:14:21'),
(196, 1, '2453d46f-40c8-4e52-9570-13014a35ea14', 'jwt_refresh_token', 0, '2019-11-21 17:17:02', '2019-11-21 17:17:02'),
(197, 66, '6a1446ca-555a-4972-b382-cb4d4bf6efdf', 'jwt_refresh_token', 0, '2019-11-21 17:18:59', '2019-11-21 17:18:59'),
(198, 66, 'cb86578e-1df1-43ab-8b49-5e98a23f8e39', 'jwt_refresh_token', 0, '2019-11-21 17:32:07', '2019-11-21 17:32:07'),
(199, 66, 'ecb442bd-64d4-4850-8645-87e7de7d4d81', 'jwt_refresh_token', 0, '2019-11-21 17:34:57', '2019-11-21 17:34:57'),
(200, 66, '62110b38-84c7-4575-a51b-3cd2581c3036', 'jwt_refresh_token', 0, '2019-11-21 17:35:03', '2019-11-21 17:35:03'),
(201, 66, 'd1cfd82c-fd9a-457b-9463-18a737fe2843', 'jwt_refresh_token', 0, '2019-11-21 17:47:18', '2019-11-21 17:47:18'),
(202, 66, '70b79fbf-e2cd-40d9-b70b-ae2dbfa358a0', 'jwt_refresh_token', 0, '2019-11-22 15:22:32', '2019-11-22 15:22:32'),
(203, 66, 'f150725d-c56c-4c29-8393-fdc7d681c0cc', 'jwt_refresh_token', 0, '2019-11-22 15:22:44', '2019-11-22 15:22:44'),
(204, 66, '3c2b5067-60d8-4aa9-9d0c-28580acd2323', 'jwt_refresh_token', 0, '2019-11-22 16:03:07', '2019-11-22 16:03:07'),
(205, 66, 'eeacb151-8e16-499d-915b-7cdfe2932a08', 'jwt_refresh_token', 0, '2019-11-22 16:10:47', '2019-11-22 16:10:47'),
(206, 66, '8df1766d-e6d6-453a-958f-a51d6cfbae79', 'jwt_refresh_token', 0, '2019-11-22 16:12:20', '2019-11-22 16:12:20'),
(207, 66, 'b3562828-5405-4388-addd-90acd4feeeea', 'jwt_refresh_token', 0, '2019-11-25 11:33:23', '2019-11-25 11:33:23'),
(208, 66, '532f9f8d-734c-49e7-9bc2-95cfb0be95c5', 'jwt_refresh_token', 0, '2019-11-25 11:34:45', '2019-11-25 11:34:45'),
(209, 70, 'be7a7ca7-8d7c-40da-837e-ecb736034f66', 'jwt_refresh_token', 0, '2019-11-25 15:39:14', '2019-11-25 15:39:14'),
(210, 71, '79b5ecd4-3427-4a74-91a6-2f54fc415aa3', 'jwt_refresh_token', 0, '2019-11-25 15:40:56', '2019-11-25 15:40:56'),
(211, 71, 'da18a819-7473-4f15-9926-9d8d1e0e4a49', 'jwt_refresh_token', 0, '2019-11-25 15:45:08', '2019-11-25 15:45:08'),
(212, 71, 'ad07977e-4cd0-40f5-8c14-b3a18112604d', 'jwt_refresh_token', 0, '2019-11-25 16:18:28', '2019-11-25 16:18:28'),
(213, 73, '1b0f992b-c382-4335-8a75-b5fca686b34f', 'jwt_refresh_token', 0, '2019-11-26 11:33:23', '2019-11-26 11:33:23'),
(214, 74, '8703253d-5f55-42dc-a6bb-f4ede54198ee', 'jwt_refresh_token', 0, '2019-11-26 11:39:01', '2019-11-26 11:39:01'),
(215, 5, 'c06933f2-beb2-4402-9809-ade03f8a14c8', 'jwt_refresh_token', 0, '2019-11-26 11:47:14', '2019-11-26 11:47:14'),
(216, 5, '374c12b6-31d8-494d-823a-30fd90f2de3c', 'jwt_refresh_token', 0, '2019-11-26 11:52:01', '2019-11-26 11:52:01'),
(217, 75, '2dc9b51a-058b-4df9-848c-dcfb51a2e39a', 'jwt_refresh_token', 0, '2019-11-26 15:16:44', '2019-11-26 15:16:44'),
(218, 76, '46394a69-cd3e-4469-ac65-fdf17e18672d', 'jwt_refresh_token', 0, '2019-11-26 15:23:25', '2019-11-26 15:23:25'),
(219, 81, '55303ac1-3f79-4674-9d44-b216ace4a6eb', 'jwt_refresh_token', 0, '2019-11-28 11:12:41', '2019-11-28 11:12:41'),
(220, 5, '7e37b41c-dc73-4a58-8c1e-4266d3ac72b1', 'jwt_refresh_token', 0, '2019-11-28 11:57:15', '2019-11-28 11:57:15');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `countrie_id` int(11) NOT NULL,
  `login_source` varchar(255) DEFAULT NULL,
  `token` varchar(1000) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `dob` varchar(255) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `first_name` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `countrie_id`, `login_source`, `token`, `email`, `avatar`, `last_name`, `password`, `role`, `status`, `created_at`, `dob`, `first_name`, `phone`, `gender`, `updated_at`) VALUES
(1, 1, NULL, '', 'admin@gmail.com', '', 'test name', '$2a$10$QRLsUiMEMSR2poMP7qdxWe6Mx7Mo6X7SWKEZeUAbQAWxpSt8tqHXG', 1, 0, '2019-05-03 21:44:35', '0000-00-00 00:00:00', 'zzzzzzz name', '0971653226', 1, '2019-11-15 10:42:35'),
(2, 7, NULL, '', 'admin555@gmail.com', '', 'last name', '$2a$10$QRLsUiMEMSR2poMP7qdxWe6Mx7Mo6X7SWKEZeUAbQAWxpSt8tqHXG', 1, 1, '2019-05-21 03:09:04', '0000-00-00 00:00:00', 'first name', '0871653226', 1, NULL),
(3, 236, NULL, '', 'accountant@gmail.com', '', 'Accountant', '$2a$10$JULlTX6G9bK9NOx4o7dBAOntpLxjXvwvPFLDlIRXdMn3MlCL6HyWy', 0, 1, '2019-05-21 03:09:28', '0000-00-00 00:00:00', 'Accountant', '09819321321', 1, NULL),
(4, 236, NULL, '', 'teacher@gmail.com', '', 'Teacher', '$2a$10$GmeFQ2dt7kZdqw2RmzhAJ.rSD/9nEZUiT3.ffRW7O53OTO0VjbtdO', 2, 1, '2019-05-21 03:09:49', '0000-00-00 00:00:00', 'Teacher', '09819321321', 1, NULL),
(5, 236, NULL, '', 'admin3@gmail.com', '', 'last name', '$2a$10$AudqgmE586iaPNf4LniYTOFF724TlzPrclB8KZZ0Qsuw411BBZuzu', 1, 1, '2019-05-21 03:53:46', '0000-00-00 00:00:00', 'Anh Thành', '0925151251', 1, '2019-11-26 04:54:44'),
(6, 236, NULL, '', 'test2222@gmail.com', '', '321', '$2a$10$5NZdVLP7L2ny6du6CKsF4uEhzX1FdpQyMDYE6jozTQzpAgOIRuLqC', 3, 1, '2019-05-21 04:00:44', '0000-00-00 00:00:00', '43214', '0987654321', NULL, NULL),
(7, 15, NULL, '', 'zcx@gmail.com', '', 'last name', '$2a$10$QRLsUiMEMSR2poMP7qdxWe6Mx7Mo6X7SWKEZeUAbQAWxpSt8tqHXG', 3, 1, '2019-11-14 05:03:16', '0000-00-00 00:00:00', 'first name', '0987654326', 1, NULL),
(8, 236, NULL, '', 'zcxb@gmail.com', '', 'last name', '$2a$10$QRLsUiMEMSR2poMP7qdxWe6Mx7Mo6X7SWKEZeUAbQAWxpSt8tqHXG', 3, 1, '2019-11-14 05:04:15', '0000-00-00 00:00:00', 'first name', '0987653226', 1, NULL),
(9, 236, NULL, '', 'zcxvb@gmail.com', '', 'last name', '$2a$10$QRLsUiMEMSR2poMP7qdxWe6Mx7Mo6X7SWKEZeUAbQAWxpSt8tqHXG', 3, 1, '2019-11-14 07:23:24', '0000-00-00 00:00:00', 'first name', '09987653226', 1, NULL),
(20, 5, NULL, '', 'fgazzzbbbbbbbbbbbvx@gmail.com', '', 'last name', '$2a$10$MRfbYfr3Czf98CAulBvDheGPGBurycbzJGK3TvH0I80oLNmlJwjOS', 1, 1, '2019-11-15 04:25:26', '0000-00-00 00:00:00', 'first name', '0971253216', 1, '2019-11-15 04:25:26'),
(21, 236, NULL, '', 'fbbbbbbbbbvx@gmail.com', '', 'last name', '$2a$10$FIOsj/ZOUBjGUl/.dnnZOOKww7lx57KL3ZzOc1G5D7b4iyQnzqu9y', 1, 1, '2019-11-15 04:26:17', '0000-00-00 00:00:00', 'first name', '01253216', 1, '2019-11-15 04:26:17'),
(22, 236, NULL, '', 'fggggbbbbvx@gmail.com', '', 'last name', '$2a$10$/tdW1bkjMRBAvBhSes5k4ONN3n8Isxye62E4K/VWBKaeM5.Ev64/2', 1, 1, '2019-11-15 04:26:53', '0000-00-00 00:00:00', 'first name', '012532165', 1, '2019-11-15 04:26:53'),
(23, 7, NULL, '', 'fggggbbbbvxzzzzzzzz@gmail.com', '', 'last name', '$2a$10$1VLhYAa1NuJOkwDRaNcShuwla/J4EDyKfBJE1lSxf3KXLNVbKBkXG', 1, 1, '2019-11-15 04:46:38', '0000-00-00 00:00:00', 'first name', '01253215', 1, '2019-11-15 04:46:38'),
(24, 16, NULL, '', 'fggggbbbbzzz@gmail.com', '', 'last name', '$2a$10$DAdYNQXpz4ulhGJ/Ui6Sb.uXCJaMcyjXmYy8u9ZcVLXZmT1pM3aXu', 1, 1, '2019-11-15 04:47:01', '0000-00-00 00:00:00', 'first name', '0125315', 1, '2019-11-15 04:47:01'),
(25, 236, NULL, '', '123dsa@gmail.com', '', 'last name', '$2a$10$BKwcS4kzMGjFNqtFeOEBK.kxbEVLvG.0CNpICPtCJf6/JyVK9XuUG', 1, 1, '2019-11-15 06:56:11', '0000-00-00 00:00:00', 'first name', '0125315432', 1, '2019-11-15 06:56:11'),
(26, 9, NULL, '', 'vcxvcxdsa@gmail.com', '', 'last name', '$2a$10$C5QX/6W6SCZlBDY8NHq4n.akIIWS4hferS5fr2wta7bFUkg0L7RZq', 1, 1, '2019-11-15 07:17:53', '0000-00-00 00:00:00', 'first name', '015315432', 1, '2019-11-15 07:17:53'),
(27, 236, NULL, '', 'vcxvcsa@gmail.com', '', 'last name', '123123', 1, 1, '2019-11-15 07:40:25', '0000-00-00 00:00:00', 'first name', '01531543222', 1, '2019-11-15 07:40:25'),
(28, 236, NULL, '', 'vcxvcsazzzzzzz@gmail.com', '', 'last name', '$2a$10$NVUJjkAxXRaeXXmh3uhX7uYmVhVskxPnuWgKwAmiy7T/008cd78s.', 1, 0, '2019-11-15 07:43:30', '0000-00-00 00:00:00', 'first name', '015315432222', 1, '2019-11-28 04:27:27'),
(32, 236, NULL, '', 'vcxvzz@gmail.com', '', 'last name', '$2a$10$2HntzzG06AHUBijzx8bM8OWaOB60Q1wtqGTSV2Qo5axwUKdjWUsFK', 1, 0, '2019-11-15 08:12:53', '0000-00-00 00:00:00', 'first name', '015311543222', 1, '2019-11-28 04:27:27'),
(33, 236, NULL, '', 'vcxvzzggggggggg@gmail.com', '', 'last name', '$2a$10$Y0J.fi8beYsdKl5tfPSHSuabhXI1aKo0p6Haz2bs6d8PUTohi8Y0q', 1, 0, '2019-11-15 08:13:09', '0000-00-00 00:00:00', 'first name', '01531154223222', 1, '2019-11-20 06:49:57'),
(56, 15, NULL, '', 'vcxggggg@gmail.com', '', 'last name', '$2a$10$EAo0vh5.WkRaIPl7zO4U9.1ZswP7kKO0BW0QfR.sStvSTjG4OpHA6', 1, 0, '2019-11-18 08:34:24', '0000-00-00 00:00:00', 'first name', '0953133223', 1, '2019-11-20 04:46:24'),
(59, 236, NULL, '', 'vcxgugvcg@gmail.com', '', 'last name', '$2a$10$UHBD0N1YxqQPdT10u8bRfeAGLphaLyHEMo1FuprmwDV6Vo2KuVP8C', 1, 0, '2019-11-18 10:17:37', '0000-00-00 00:00:00', 'firs7zO4U10$EAo0vh5.WkRaIPl7zO4U10$EAo0vh5.WkRaIPl7zO4U10$EAo0vh5.WkRaIPl7zO4U10$EAo0vh5.WkRaIPl7zO4U10$EAo0vh5.WkRaIPl7zO4U10$EAo0vh5.WkRaIPl7zO4U', '0923153253', 1, '2019-11-20 06:49:57'),
(67, 236, NULL, '', 'thanhanh.nguyen@isobar.com', '', 'last name', '$2a$10$65MOClCRqngdEdEyyGNxb.GlxVWR0ytU65Y9CK6t9Z.5Bs30qxW7q', 1, 1, '2019-11-22 04:32:45', '0000-00-00 00:00:00', 'Anh Thành', '0925151251', 1, '2019-11-27 10:27:11'),
(72, 12, NULL, '', 'thfcds.nguyen@isobar.com', '', 'last name', '$2a$10$e.F59JGHCoKrOEw.UopzYuIQNdJBejWtPGr3HnGqac/MOQnAd6ZTW', 1, 1, '2019-11-25 09:38:44', '0000-00-00 00:00:00', 'Anh Thành', '0925151251', 1, '2019-11-25 09:38:44'),
(76, 236, 'google', '', 'anhthanh1996vp@gmail.com', 'https://lh3.googleusercontent.com/a-/AAuE7mD0LR906FJ3ChgNlOtc_s40nUTt0i5CFzTN5Fp7tg', 'Nguyễn Thành', NULL, 3, 0, '2019-11-26 08:23:25', '0000-00-00 00:00:00', 'Nguyễn Thành', NULL, NULL, '2019-11-29 04:49:32'),
(77, 236, NULL, '', 'thfcdscccccccccc.nguyen@isobar.com', '', 'last name', '$2a$10$81hyYCJMRDZuFp826Ygq8us8EN.Aeqfpi4XWxtHZcr6N6gNbgppDO', 1, 1, '2019-11-26 10:24:06', '0000-00-00 00:00:00', 'Anh Thành', '0925158251', 1, '2019-11-26 10:24:06'),
(78, 236, NULL, '', 'tbbbbbbbbbbbc.nguyen@isobar.com', '', 'last name', '$2a$10$5giJRJn4k3f6WARjVOyw..IMuFqFxBiEboUXtkicxvb7aP16cl0/C', 1, 1, '2019-11-26 10:35:54', '0000-00-00 00:00:00', 'Anh Thành', '0935158251', 1, '2019-11-26 10:35:54'),
(79, 236, NULL, '', 'tbc.nguyen@isobar.com', '', 'last name', '$2a$10$3YibUT6./ifp6ykvFA0vfOInr7Z8pz7pqeD7EKy2MvBIdcqM9dULm', 1, 1, '2019-11-27 04:22:56', '0000-00-00 00:00:00', 'Anh Thành', '0935258255', 1, '2019-11-27 04:22:56'),
(80, 236, NULL, '', 'tbcvvv.nguyen@isobar.com', '', 'last name', '$2a$10$cYsWO0/Oj6xq63Hgqw5erOvHnNDniVJt8lwmugkw1fI/ziBpXuwQu', 1, 1, '2019-11-27 04:26:53', '0000-00-00 00:00:00', 'Anh Thành', '0955258255', 1, '2019-11-27 04:26:53'),
(81, 236, 'google', '', 'sks.pawn.nat@gmail.com', 'https://lh3.googleusercontent.com/a-/AAuE7mBIYGHiTKIW_bwCyPvVy0V0d_4tEgV1V5SWN6ko', 'Thành Nguyễn', NULL, 3, 0, '2019-11-28 03:54:24', '0000-00-00 00:00:00', 'Thành Nguyễn', NULL, NULL, '2019-11-28 04:30:10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users_cars`
--

CREATE TABLE `users_cars` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `car_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `users_cars`
--

INSERT INTO `users_cars` (`id`, `user_id`, `car_id`, `status`) VALUES
(1, 5, 1, 0),
(2, 5, 3, 1),
(3, 4, 1, 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `adonis_schema`
--
ALTER TABLE `adonis_schema`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users_cars`
--
ALTER TABLE `users_cars`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `adonis_schema`
--
ALTER TABLE `adonis_schema`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `class`
--
ALTER TABLE `class`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=244;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=221;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
