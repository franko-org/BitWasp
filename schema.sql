-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2
-- http://www.phpmyadmin.net
--
-- Server version: 5.5.31
-- PHP Version: 5.4.4-14+deb7u4

CREATE DATABASE db_bitwasp
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_unicode_ci;

USE db_bitwasp;
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bitwasp`
--

CREATE TABLE IF NOT EXISTS `bw_addresses` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `user_hash` varchar(20) NOT NULL,
  `bitcoin_address` varchar(35) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

CREATE TABLE IF NOT EXISTS `bw_alerts` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `source` varchar(30) NOT NULL,
  `message` text NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Contains a log of the alert messages.' ;

CREATE TABLE IF NOT EXISTS `bw_autorun` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `interval` varchar(8) NOT NULL,
  `interval_type` varchar(10) NOT NULL,
  `last_update` varchar(20) DEFAULT 0,
  `description` varchar(200) NOT NULL,
  `index` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index` (`index`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

CREATE TABLE IF NOT EXISTS `bw_blocks` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `hash` varchar(64) NOT NULL,
  `number` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hash` (`hash`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

CREATE TABLE IF NOT EXISTS `bw_captchas` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `key` varchar(16) NOT NULL,
  `solution` varchar(20) NOT NULL,
  `time` int(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

CREATE TABLE IF NOT EXISTS `bw_categories` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL,
  `hash` varchar(20) NOT NULL,
  `name` varchar(40) NOT NULL,
  `parent_id` int(9) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hash` (`hash`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

CREATE TABLE IF NOT EXISTS `bw_config` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `parameter` varchar(30) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `parameter` (`parameter`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

INSERT INTO `bw_config` (`id`, `parameter`, `value`) VALUES
(1, 'registration_allowed', '1'),
(2, 'openssl_keysize', '2048'),
(3, 'site_description', 'open source bitcoin marketplace'),
(4, 'site_title', 'BitWasp'),
(5, 'login_timeout', '30'),
(6, 'vendor_registration_allowed', '1'),
(7, 'encrypt_private_messages', '1'),
(8, 'force_vendor_pgp', '1'),
(9, 'captcha_length', '2'),
(10, 'allow_guests', '1'),
(11, 'price_index', 'CoinDesk'),
(12, 'refund_after_inactivity', '45'),
(13, 'delete_messages_after', '45'),
(14, 'delete_transactions_after', '0'),
(15, 'max_main_balance', '0.00000000'),
(16, 'max_fees_balance', '0.00000000'),
(17, 'electrum_mpk', ''),
(18, 'electrum_iteration', ''),
(19, 'electrum_gap_limit', ''),
(20, 'delete_logs_after', '14'),
(21, 'entry_payment_vendor', '0.00000000'),
(22, 'entry_payment_buyer', '0.00000000'),
(23, 'auto_finalize_threshold', '0'),
(24, 'balance_backup_method', 'Disabled'),
(25, 'minimum_fee', '0.0003'),
(26, 'default_rate', '0.25'),
(27, 'global_proxy_url', ''),
(28, 'global_proxy_type', 'Disabled'),
(29, 'maintenance_mode', '0'),
(30, 'settings_preserve', ''),
(31, 'autorun_preserve', ''),
(32, 'terms_of_service', ''),
(33, 'terms_of_service_toggle', '0'),
(34, 'location_list_source', 'Default');

CREATE TABLE IF NOT EXISTS `bw_country_codes` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `country` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

INSERT INTO `bw_country_codes` (`id`, `country`) VALUES
(1, 'Afghanistan'),
(2, 'Albania'),
(3, 'Algeria'),
(4, 'American Samoa'),
(5, 'Andorra'),
(6, 'Angola'),
(7, 'Anguilla'),
(8, 'Antarctica'),
(9, 'Antigua and Barbuda'),
(10, 'Argentina'),
(11, 'Armenia'),
(12, 'Aruba'),
(13, 'Australia'),
(14, 'Austria'),
(15, 'Azerbaijan'),
(16, 'Bahamas'),
(17, 'Bahrain'),
(18, 'Bangladesh'),
(19, 'Barbados'),
(20, 'Belarus'),
(21, 'Belgium'),
(22, 'Belize'),
(23, 'Benin'),
(24, 'Bermuda'),
(25, 'Bhutan'),
(26, 'Bolivia'),
(27, 'Bosnia and Herzegowina'),
(28, 'Botswana'),
(29, 'Bouvet Island'),
(30, 'Brazil'),
(31, 'British Indian Ocean Territory'),
(32, 'Brunei Darussalam'),
(33, 'Bulgaria'),
(34, 'Burkina Faso'),
(35, 'Burundi'),
(36, 'Cambodia'),
(37, 'Cameroon'),
(38, 'Canada'),
(39, 'Cape Verde'),
(40, 'Cayman Islands'),
(41, 'Central African Republic'),
(42, 'Chad'),
(43, 'Chile'),
(44, 'China'),
(45, 'Christmas Island'),
(46, 'Cocos (Keeling) Islands'),
(47, 'Colombia'),
(48, 'Comoros'),
(49, 'Congo'),
(50, 'Congo, the Democratic Republic of the'),
(51, 'Cook Islands'),
(52, 'Costa Rica'),
(53, 'Cote d''Ivoire'),
(54, 'Croatia (Hrvatska)'),
(55, 'Cuba'),
(56, 'Cyprus'),
(57, 'Czech Republic'),
(58, 'Denmark'),
(59, 'Djibouti'),
(60, 'Dominica'),
(61, 'Dominican Republic'),
(62, 'East Timor'),
(63, 'Ecuador'),
(64, 'Egypt'),
(65, 'El Salvador'),
(66, 'Equatorial Guinea'),
(67, 'Eritrea'),
(68, 'Estonia'),
(69, 'Ethiopia'),
(70, 'Falkland Islands (Malvinas)'),
(71, 'Faroe Islands'),
(72, 'Fiji'),
(73, 'Finland'),
(74, 'France'),
(75, 'France Metropolitan'),
(76, 'French Guiana'),
(77, 'French Polynesia'),
(78, 'French Southern Territories'),
(79, 'Gabon'),
(80, 'Gambia'),
(81, 'Georgia'),
(82, 'Germany'),
(83, 'Ghana'),
(84, 'Gibraltar'),
(85, 'Greece'),
(86, 'Greenland'),
(87, 'Grenada'),
(88, 'Guadeloupe'),
(89, 'Guam'),
(90, 'Guatemala'),
(91, 'Guinea'),
(92, 'Guinea-Bissau'),
(93, 'Guyana'),
(94, 'Haiti'),
(95, 'Heard and Mc Donald Islands'),
(96, 'Holy See (Vatican City State)'),
(97, 'Honduras'),
(98, 'Hong Kong'),
(99, 'Hungary'),
(100, 'Iceland'),
(101, 'India'),
(102, 'Indonesia'),
(103, 'Iran (Islamic Republic of)'),
(104, 'Iraq'),
(105, 'Ireland'),
(106, 'Israel'),
(107, 'Italy'),
(108, 'Jamaica'),
(109, 'Japan'),
(110, 'Jordan'),
(111, 'Kazakhstan'),
(112, 'Kenya'),
(113, 'Kiribati'),
(114, 'Korea, Democratic People''s Republic of'),
(115, 'Korea, Republic of'),
(116, 'Kuwait'),
(117, 'Kyrgyzstan'),
(118, 'Lao, People''s Democratic Republic'),
(119, 'Latvia'),
(120, 'Lebanon'),
(121, 'Lesotho'),
(122, 'Liberia'),
(123, 'Libyan Arab Jamahiriya'),
(124, 'Liechtenstein'),
(125, 'Lithuania'),
(126, 'Luxembourg'),
(127, 'Macau'),
(128, 'Macedonia, The Former Yugoslav Republic of'),
(129, 'Madagascar'),
(130, 'Malawi'),
(131, 'Malaysia'),
(132, 'Maldives'),
(133, 'Mali'),
(134, 'Malta'),
(135, 'Marshall Islands'),
(136, 'Martinique'),
(137, 'Mauritania'),
(138, 'Mauritius'),
(139, 'Mayotte'),
(140, 'Mexico'),
(141, 'Micronesia, Federated States of'),
(142, 'Moldova, Republic of'),
(143, 'Monaco'),
(144, 'Mongolia'),
(145, 'Montserrat'),
(146, 'Morocco'),
(147, 'Mozambique'),
(148, 'Myanmar'),
(149, 'Namibia'),
(150, 'Nauru'),
(151, 'Nepal'),
(152, 'Netherlands'),
(153, 'Netherlands Antilles'),
(154, 'New Caledonia'),
(155, 'New Zealand'),
(156, 'Nicaragua'),
(157, 'Niger'),
(158, 'Nigeria'),
(159, 'Niue'),
(160, 'Norfolk Island'),
(161, 'Northern Mariana Islands'),
(162, 'Norway'),
(163, 'Oman'),
(164, 'Pakistan'),
(165, 'Palau'),
(166, 'Panama'),
(167, 'Papua New Guinea'),
(168, 'Paraguay'),
(169, 'Peru'),
(170, 'Philippines'),
(171, 'Pitcairn'),
(172, 'Poland'),
(173, 'Portugal'),
(174, 'Puerto Rico'),
(175, 'Qatar'),
(176, 'Reunion'),
(177, 'Romania'),
(178, 'Russian Federation'),
(179, 'Rwanda'),
(180, 'Saint Kitts and Nevis'),
(181, 'Saint Lucia'),
(182, 'Saint Vincent and the Grenadines'),
(183, 'Samoa'),
(184, 'San Marino'),
(185, 'Sao Tome and Principe'),
(186, 'Saudi Arabia'),
(187, 'Senegal'),
(188, 'Seychelles'),
(189, 'Sierra Leone'),
(190, 'Singapore'),
(191, 'Slovakia (Slovak Republic)'),
(192, 'Slovenia'),
(193, 'Solomon Islands'),
(194, 'Somalia'),
(195, 'South Africa'),
(196, 'South Georgia and the South Sandwich Islands'),
(197, 'Spain'),
(198, 'Sri Lanka'),
(199, 'St. Helena'),
(200, 'St. Pierre and Miquelon'),
(201, 'Sudan'),
(202, 'Suriname'),
(203, 'Svalbard and Jan Mayen Islands'),
(204, 'Swaziland'),
(205, 'Sweden'),
(206, 'Switzerland'),
(207, 'Syrian Arab Republic'),
(208, 'Taiwan, Province of China'),
(209, 'Tajikistan'),
(210, 'Tanzania, United Republic of'),
(211, 'Thailand'),
(212, 'Togo'),
(213, 'Tokelau'),
(214, 'Tonga'),
(215, 'Trinidad and Tobago'),
(216, 'Tunisia'),
(217, 'Turkey'),
(218, 'Turkmenistan'),
(219, 'Turks and Caicos Islands'),
(220, 'Tuvalu'),
(221, 'Uganda'),
(222, 'Ukraine'),
(223, 'United Arab Emirates'),
(224, 'United Kingdom'),
(225, 'United States'),
(226, 'United States Minor Outlying Islands'),
(227, 'Uruguay'),
(228, 'Uzbekistan'),
(229, 'Vanuatu'),
(230, 'Venezuela'),
(231, 'Vietnam'),
(232, 'Virgin Islands (British)'),
(233, 'Virgin Islands (U.S.)'),
(234, 'Wallis and Futuna Islands'),
(235, 'Western Sahara'),
(236, 'Yemen'),
(237, 'Yugoslavia'),
(238, 'Zambia'),
(239, 'Zimbabwe');

CREATE TABLE IF NOT EXISTS `bw_currencies` (
  `id` int(9) NOT NULL,
  `name` varchar(40) NOT NULL,
  `symbol` varchar(10) NOT NULL,
  `code` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `bw_currencies` (`id`, `name`, `symbol`, `code`) VALUES
(0, 'Bitcoin', 'BTC', 'BTC'),
(1, 'United States Dollar', '&#36;', 'USD'),
(2, 'British Pound Sterling', '&pound;', 'GBP'),
(3, 'Euro', '&euro;', 'EUR');

CREATE TABLE IF NOT EXISTS `bw_disputes` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `dispute_message` text NOT NULL,
  `admin_message` text NOT NULL,
  `disputing_user_id` int(9) NOT NULL,
  `last_update` varchar(20) NOT NULL,
  `order_id` int(9) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id` (`order_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `bw_escrow` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `buyer_id` int(9) NOT NULL,
  `vendor_id` int(9) NOT NULL,
  `order_id` int(9) NOT NULL,
  `amount` decimal(20,8) NOT NULL,
  `fee` decimal(20,8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

CREATE TABLE IF NOT EXISTS `bw_entry_payment` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `user_hash` varchar(20) NOT NULL,
  `amount` decimal(20,8) NOT NULL,
  `time` varchar(20) NOT NULL,
  `bitcoin_address` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_hash` (`user_hash`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

CREATE TABLE IF NOT EXISTS `bw_exchange_rates` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `time` varchar(20) NOT NULL,
  `usd` decimal(10,4) NOT NULL,
  `eur` decimal(10,4) NOT NULL,
  `gbp` decimal(10,4) NOT NULL,
  `btc` int(11) NOT NULL DEFAULT '1',
  `price_index` varchar(45),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

INSERT INTO `bw_exchange_rates` (`id`, `time`, `usd`, `eur`, `gbp`, `btc`, `price_index`) VALUES
(1, '1380761400', 101.7737, 74.9879, 62.8264, 1, 'CoinDesk');

CREATE TABLE IF NOT EXISTS `bw_fees` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `low` decimal(20,8) NOT NULL COMMENT 'Orders exceeding this value apply to this range',
  `high` decimal(20,8) NOT NULL COMMENT 'Orders less than this value apply to this range',
  `rate` decimal(4,3) NOT NULL COMMENT 'Percentage fee to be charged for this range',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

CREATE TABLE IF NOT EXISTS `bw_logs` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `caller` varchar(35) NOT NULL COMMENT 'Name of the script which left the log',
  `message` varchar(250) NOT NULL COMMENT 'The message for the admins',
  `title` varchar(50) NOT NULL,
  `time` varchar(20) NOT NULL,
  `info_level` varchar(20) NOT NULL,
  `hash` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hash` (`hash`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `bw_images` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `hash` varchar(20) NOT NULL,
  `encoded` longtext NOT NULL,
  `height` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hash` (`hash`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

INSERT INTO `bw_images` (`id`, `hash`, `encoded`, `height`, `width`) VALUES
(0, 'default', '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', 0, 0);

CREATE TABLE IF NOT EXISTS `bw_items` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `hash` varchar(20) NOT NULL,
  `vendor_hash` varchar(20) NOT NULL,
  `price` decimal(20,8) NOT NULL,
  `currency` int(5) NOT NULL,
  `category` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` blob NOT NULL,
  `main_image` varchar(20) NOT NULL,
  `add_time` int(20) NOT NULL,
  `hidden` enum('0','1') NOT NULL,
  `ship_from` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hash` (`hash`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

CREATE TABLE IF NOT EXISTS `bw_item_images` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `image_hash` varchar(20) NOT NULL,
  `item_hash` varchar(29) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

CREATE TABLE IF NOT EXISTS `bw_messages` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `content` blob NOT NULL,
  `encrypted` enum('0','1') NOT NULL,
  `hash` varchar(16) NOT NULL,
  `remove_on_read` enum('0','1') NOT NULL,
  `time` int(20) NOT NULL,
  `to` int(9) NOT NULL,
  `viewed` enum('0','1') NOT NULL,
  `order_id` int(9) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hash` (`hash`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Stores encrypted/plaintext messages.' ;

CREATE TABLE IF NOT EXISTS `bw_orders` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `created_time` varchar(20) NOT NULL,
  `currency` int(2) NOT NULL,
  `items` text NOT NULL,
  `price` decimal(20,8) NOT NULL,
  `time` varchar(20) NOT NULL,
  `progress` int(1) NOT NULL,
  `buyer_id` int(9) NOT NULL,
  `vendor_hash` varchar(20) NOT NULL,
  `finalized` enum('0','1') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

CREATE TABLE IF NOT EXISTS `bw_page_authorization` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `auth_level` varchar(15) NOT NULL,
  `system` enum('0','1') NOT NULL,
  `timeout` int(3) NOT NULL,
  `URI` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

INSERT INTO `bw_page_authorization` (`id`, `URI`, `auth_level`, `timeout`, `system`) VALUES
(1, 'login', 'guestonly', 0, '1'),
(2, 'register', 'guestonly', 0, '1'),
(3, 'inbox', 'login', 0, '1'),
(4, 'message', 'login', 0, '1'),
(5, 'account', 'login', 0, '1'),
(6, 'user', 'login', 0, '1'),
(7, 'pgp', 'auth|all', 5, '1'),
(8, 'home', 'login', 0, '0'),
(9, 'listings', 'vendor', 0, '1'),
(10, 'bitcoin', 'login', 0, '1'),
(11, 'admin', 'admin', 0, '1'),
(12, 'items', 'login', 0, ''),
(13, 'order', 'buyer', 0, '0'),
(14, 'orders', 'vendor', 0, '1'),
(15, '', 'login', 0, '');

CREATE TABLE IF NOT EXISTS `bw_pending_txns` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `confirmations` varchar(6) NOT NULL,
  `credited` enum('0','1') NOT NULL,
  `category` varchar(16) NOT NULL,
  `address` varchar(40) NOT NULL,
  `time` varchar(20) NOT NULL,
  `txn_id` varchar(64) NOT NULL,
  `user_hash` varchar(20) NOT NULL,
  `value` decimal(10,8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

CREATE TABLE IF NOT EXISTS `bw_pgp_keys` (
  `id` int(9) NOT NULL,
  `fingerprint` varchar(128) NOT NULL,
  `public_key` blob NOT NULL,
  `user_id` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `bw_registration_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` varchar(100) NOT NULL,
  `user_type` enum('1','2','3') NOT NULL,
  `token_content` varchar(128) NOT NULL,
  `entry_payment` decimal(20,8),
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

CREATE TABLE IF NOT EXISTS `bw_shipping_costs` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `item_id` int(9) NOT NULL,
  `destination_id` varchar(10) NOT NULL,
  `cost` decimal(20,8) NOT NULL,
  `enabled` enum('0','1'),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `bw_two_factor_tokens` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `user_id` int(9) NOT NULL,
  `solution` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ;

CREATE TABLE IF NOT EXISTS `bw_users` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `banned` enum('0','1') NOT NULL DEFAULT '0',
  `bitcoin_cashout_address` varchar(40) NOT NULL,
  `bitcoin_topup_address` varchar(40) NOT NULL,
  `bitcoin_balance` decimal(10,8) NOT NULL,
  `block_non_pgp` enum('0','1') DEFAULT '0',
  `entry_paid` enum('0','1') default '0',
  `force_pgp_messages` enum('0','1') NOT NULL,
  `location` int(3) NOT NULL,
  `login_time` int(20) NOT NULL,
  `display_login_time` enum('0','1') NOT NULL,
  `password` varchar(128) NOT NULL,
  `public_key` blob NOT NULL,
  `private_key` blob NOT NULL,
  `register_time` int(20) NOT NULL,
  `salt` varchar(128) NOT NULL,
  `two_factor_auth` enum('0','1') NOT NULL,
  `user_hash` varchar(16) NOT NULL,
  `user_name` varchar(40) NOT NULL,
  `user_role` enum('Buyer','Vendor','Admin') NOT NULL,
  `local_currency` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_hash` (`user_hash`,`user_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
