-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 25, 2022 at 02:12 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `reps_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `agent_list`
--

CREATE TABLE `agent_list` (
  `id` int(30) NOT NULL,
  `firstname` text NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` text NOT NULL,
  `gender` text NOT NULL,
  `contact` text NOT NULL,
  `address` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `agent_list`
--

INSERT INTO `agent_list` (`id`, `firstname`, `middlename`, `lastname`, `gender`, `contact`, `address`, `email`, `password`, `avatar`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 'Mark', 'D', 'Cooper', 'Male', '09123456789', 'This is my sample address only.', 'mcooper@sample.com', 'e10adc3949ba59abbe56e057f20f883e', 'uploads/agents/1.jpg?v=1653055799', 1, 0, '2022-02-19 11:30:14', NULL),
(2, 'Sameh', 'tarek', 'sadx', 'Male', '01014789546', 'october', 'sad@sad.me', 'e10adc3949ba59abbe56e057f20f883e', 'uploads/agents/2.png?v=1653053686', 1, 0, '2022-05-14 12:25:20', NULL),
(3, 'Sameh', 'tarek', 'sadx', 'Male', '01014789546', 'octoberoctoberoctoberoctoberoctober', 'sad2@sad.me', 'e10adc3949ba59abbe56e057f20f883e', NULL, 0, 1, '2022-05-14 12:25:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `amenity_list`
--

CREATE TABLE `amenity_list` (
  `id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `type` tinyint(1) DEFAULT 1 COMMENT '1 = indoor, 2 = outdoor',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `amenity_list`
--

INSERT INTO `amenity_list` (`id`, `name`, `type`, `status`, `delete_flag`, `date_created`) VALUES
(1, 'Master Bed Room', 1, 1, 0, '2022-02-19 09:45:33'),
(2, 'Guest Room', 1, 1, 0, '2022-02-19 09:45:42'),
(3, 'Living Room', 1, 1, 0, '2022-02-19 09:45:48'),
(4, 'Chimnry', 1, 1, 0, '2022-02-19 09:45:56'),
(5, 'Kitchen', 1, 1, 0, '2022-02-19 09:46:17'),
(6, 'Garage', 2, 1, 0, '2022-02-19 09:47:08'),
(7, 'Balcony', 2, 1, 0, '2022-02-19 09:47:15'),
(8, 'Pool', 2, 1, 0, '2022-02-19 09:47:30'),
(9, 'Garden Space', 2, 1, 0, '2022-02-19 09:47:43'),
(10, 'Internet', 1, 1, 0, '2022-02-19 09:52:07'),
(11, 'Washing Machine', 1, 1, 0, '2022-02-19 09:52:15'),
(12, 'Kids Playing Area', 1, 1, 0, '2022-02-19 09:52:39');

-- --------------------------------------------------------

--
-- Table structure for table `docs`
--

CREATE TABLE `docs` (
  `id` int(100) NOT NULL,
  `fname` text NOT NULL,
  `lname` text NOT NULL,
  `phone` varchar(100) NOT NULL,
  `addrs` varchar(100) NOT NULL,
  `pdf` varchar(100) NOT NULL,
  `user_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `docs`
--

INSERT INTO `docs` (`id`, `fname`, `lname`, `phone`, `addrs`, `pdf`, `user_id`) VALUES
(1, 'Ahmed', 'Mosaa', '0144514741411', 'sad@sad.me', 'docs/sadx.pdf', 2),
(2, 'sameh', 'xxxx', '0111114', 'sad@sad.me', 'docs/FHD.pdf', 2);

-- --------------------------------------------------------

--
-- Table structure for table `real_estate_amenities`
--

CREATE TABLE `real_estate_amenities` (
  `real_estate_id` int(30) NOT NULL,
  `amenity_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `real_estate_amenities`
--

INSERT INTO `real_estate_amenities` (`real_estate_id`, `amenity_id`) VALUES
(3, 7),
(3, 4),
(3, 6),
(3, 9),
(3, 2),
(3, 10),
(3, 12),
(3, 5),
(3, 3),
(3, 1),
(3, 8),
(3, 11),
(6, 10),
(5, 7),
(5, 4),
(5, 6),
(5, 9),
(5, 2),
(5, 10),
(5, 12),
(5, 5),
(5, 3),
(5, 1),
(5, 8),
(5, 11);

-- --------------------------------------------------------

--
-- Table structure for table `real_estate_list`
--

CREATE TABLE `real_estate_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `name` text NOT NULL,
  `type_id` int(30) NOT NULL,
  `agent_id` int(30) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = Available, 2 = not Available',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `real_estate_list`
--

INSERT INTO `real_estate_list` (`id`, `code`, `name`, `type_id`, `agent_id`, `status`, `date_created`, `date_updated`) VALUES
(3, '20220500002', 'Sample Only 101', 3, 1, 1, '2022-02-19 16:00:19', '2022-05-20 16:05:37'),
(5, '20220500004', 'Real estate', 2, 2, 1, '2022-05-21 02:47:38', '2022-05-25 02:07:40'),
(6, '20220500001', 'Cars', 2, 2, 1, '2022-05-21 02:57:12', '2022-05-25 02:05:45');

-- --------------------------------------------------------

--
-- Table structure for table `real_estate_meta`
--

CREATE TABLE `real_estate_meta` (
  `real_estate_id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `real_estate_meta`
--

INSERT INTO `real_estate_meta` (`real_estate_id`, `meta_field`, `meta_value`) VALUES
(3, 'type', 'Single-Family (Detached)'),
(3, 'purpose', 'For Sale'),
(3, 'area', '350 sq. m.'),
(3, 'location', 'Sample'),
(3, 'sale_price', '300000'),
(3, 'coordinates', '10.686511407672004, 122.96388112114987'),
(3, 'description', '&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;font-size: 0.875rem;&quot;&gt;Sed ac pellentesque arcu, in facilisis neque. Aliquam erat volutpat. Suspendisse imperdiet odio ut neque condimentum, sed hendrerit lectus eleifend. Ut tempor molestie dui, laoreet tristique quam scelerisque at. Nulla elementum viverra ipsum, pharetra congue erat malesuada non. Nam commodo nisl vel sapien tincidunt tempor. Fusce vitae mi at enim convallis efficitur sed in justo.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;&quot;&gt;Aliquam nisi quam, interdum at aliquet vel, vehicula vitae justo. Vestibulum lobortis purus a urna condimentum auctor. Nulla venenatis pellentesque tortor nec viverra. Duis aliquet convallis tellus accumsan egestas. Integer maximus vitae magna a interdum. Nunc laoreet justo fermentum dui iaculis tristique. Nam consectetur vel elit id convallis.&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;&quot;&gt;Vivamus vestibulum id arcu non pulvinar. Donec ut metus sollicitudin, volutpat dui ut, faucibus turpis. Pellentesque rhoncus, eros sed suscipit dictum, dui risus elementum nisi, ut tempor erat libero a sapien. Nunc diam nibh, lobortis eget eros sit amet, vulputate tristique ipsum. Donec in augue massa. Nam pretium nisi in aliquam vehicula. Nam ligula est, accumsan sagittis sem at, vulputate volutpat nulla.&lt;/p&gt;'),
(3, 'thumbnail_path', 'uploads/thumbnails/3.jpg?v=1645258133'),
(6, 'type', 'Cars'),
(6, 'purpose', 'documentation'),
(6, 'area', 'Egypt'),
(6, 'location', 'Egypt'),
(6, 'sale_price', '0000000000000'),
(6, 'coordinates', '0148941544'),
(6, 'description', '&lt;p&gt;Ø§Ù„Ø§ÙˆØ±Ø§Ù‚ Ø§Ù„Ù…Ø·Ù„ÙˆØ¨Ù‡ Ù„Ù†Ù‚Ù„ Ù…Ù„ÙƒÙŠÙ‡ Ø§Ù„Ø³ÙŠØ§Ø±Ù‡ ÙˆØªÙˆØ«ÙŠÙ‚Ù‡Ø§&lt;br&gt;&lt;br&gt;1 - Ø¨Ø·Ø§Ù‚Ø© Ø§Ù„Ø±Ù‚Ù… Ø§Ù„Ù‚ÙˆÙ…ÙŠ + ØµÙˆØ±Ø© Ù…Ù†Ù‡Ø§&lt;br&gt;2 - Ø¹Ù‚Ø¯ Ø§Ù„Ø¨ÙŠØ¹ Ø§Ù„Ù…ÙˆØ«Ù‚ Ù…Ù† Ø§Ù„Ø´Ù‡Ø± Ø§Ù„Ø¹Ù‚Ø§Ø±ÙŠ&lt;br&gt;3 - Ø´Ù‡Ø§Ø¯Ø© Ù…Ø®Ø§Ù„ÙØ§Øª Ù…Ù† Ø§Ù„Ù†ÙŠØ§Ø¨Ø© ÙˆØºØ§Ù„Ø¨Ø§Ù‹ ÙŠÙ‚ÙˆÙ… Ø¨Ø§Ø¦Ø¹ Ø§Ù„Ø³ÙŠØ§Ø±Ø© Ø¨Ø¥Ø­Ø¶Ø§Ø± Ø´Ù‡Ø§Ø¯Ø© Ø§Ù„Ù…Ø®Ø§Ù„ÙØ§Øª Ù‚Ø¨Ù„ ØªÙˆØ«ÙŠÙ‚ Ø§Ù„Ø¹Ù‚Ø¯ Ø¨Ø§Ù„Ø´Ù‡Ø± Ø§Ù„Ø¹Ù‚Ø§Ø±ÙŠ&lt;br&gt;4 - Ø¯ÙØ¹ Ø§Ù„ØªØ£Ù…ÙŠÙ† Ø§Ù„Ø£Ø¬Ø¨Ø§Ø±Ù‰ Ø¹Ù„Ù‰ Ø§Ù„Ø³ÙŠØ§Ø±Ø© Ù„Ø¯Ù‰ Ø£Ø­Ø¯Ù‰ Ø´Ø±ÙƒØ§Øª Ø§Ù„ØªØ£Ù…ÙŠÙ† Ø§Ù„Ù…ÙˆØ¬ÙˆØ¯Ø© Ø¯Ø§Ø®Ù„ Ù…Ø¨Ù†Ù‰ Ø¥Ø¯Ø§Ø±Ø© Ø§Ù„Ù…Ø±ÙˆØ±&lt;br&gt;5 - ÙØ­Øµ Ø§Ù„Ø³ÙŠØ§Ø±Ø© ÙÙ†ÙŠØ§ Ù„Ù„ØªØ£ÙƒØ¯ Ù…Ù† Ù…Ø·Ø§Ø¨Ù‚Ø© Ø§Ù„Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ù…Ø¹Ø¯Ù„Ø© ÙˆØ§Ù„Ù…Ø«Ø¨ØªØ© Ø¨Ø§Ù„Ø±Ø®ØµØ©&lt;br&gt;6 - Ø¯ÙØ¹ Ø§Ù„Ø±Ø³ÙˆÙ… Ø§Ù„Ù…Ø·Ù„ÙˆØ¨Ø©&lt;br&gt;&lt;br&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;/span&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;&lt;/span&gt;&lt;/p&gt;'),
(6, 'thumbnail_path', 'uploads/thumbnails/6.jpeg?v=1653094633'),
(5, 'type', 'real estate'),
(5, 'purpose', 'documentation'),
(5, 'area', 'Egypt'),
(5, 'location', 'Egypt'),
(5, 'sale_price', '000000000000000000'),
(5, 'coordinates', '014785555'),
(5, 'description', '&lt;p&gt;&lt;/p&gt;&lt;p&gt;this is for documentation any Real estate and this is the paper needed for&amp;nbsp; documentation&lt;/p&gt;Ù„ØªÙˆØ«ÙŠÙ‚ Ø¹Ù‚Ø§Ø± &lt;p&gt;&lt;/p&gt;&lt;p&gt;1- Ù…Ù„Ø¡ Ù†Ù…ÙˆØ°Ø¬ Ø·Ù„Ø¨ Ø§Ù„Ø´Ù‡Ø± ÙˆØ¥Ø±ÙØ§Ù‚ Ø§Ù„Ù…Ø³ØªÙ†Ø¯Ø§Øª Ø§Ù„Ù…Ø·Ù„ÙˆØ¨Ø© Ø§Ù„Ø®Ø§ØµØ© Ø¨ÙƒÙ„ Ù†Ù…ÙˆØ°Ø¬.\r\n&lt;/p&gt;&lt;p&gt;2- ØµÙˆØ±Ø© Ø¨Ø·Ø§Ù‚Ø© Ø§Ù„Ø±Ù‚Ù… Ø§Ù„Ù‚ÙˆÙ…ÙŠ Ù„Ù…Ù‚Ø¯Ù… Ø§Ù„Ø·Ù„Ø¨ ÙˆØ£Ø·Ø±Ø§Ù Ø§Ù„ØªØ¹Ø§Ù…Ù„.&lt;/p&gt;\r\n&lt;p&gt;3- Ø§Ù„Ø¨ÙŠØ§Ù†Ø§Øª Ø§Ù„Ø¯Ø§Ù„Ø© Ø¹Ù„Ù‰ Ø´Ø®ØµÙŠØ© ÙƒÙ„ Ø·Ø±Ù.&lt;/p&gt;\r\n&lt;p&gt;4- Ø§Ù„Ø³Ù†Ø¯ Ø§Ù„Ù‚Ø§Ù†ÙˆÙ†ÙŠ Ù„Ø·Ù„Ø¨ Ø§Ù„ØªØ³Ø¬ÙŠÙ„.&lt;/p&gt;\r\n&lt;p&gt;5- Ø¨ÙŠØ§Ù† Ø±ÙØ¹ Ù…Ø³Ø§Ø­ÙŠ Ù…Ù† (Ø¥Ø¯Ø§Ø±Ø© Ø§Ù„Ù…Ø³Ø§Ø­Ø© Ø§Ù„Ø¹Ø³ÙƒØ±ÙŠØ©ØŒ Ø£Ùˆ ÙˆØ²Ø§Ø±Ø© Ø§Ù„ØªØ®Ø·ÙŠØ·ØŒ Ø£Ùˆ \r\nØ§Ù„Ø¬Ù‡Ø§Ø² Ø§Ù„Ù…Ø±ÙƒØ²ÙŠ Ù„Ù„ØªØ¹Ø¨Ø¦Ø© Ø§Ù„Ø¹Ø§Ù…Ø© ÙˆØ§Ù„Ø¥Ø­ØµØ§Ø¡ØŒ Ø£Ùˆ Ø£ÙŠ Ù…ÙƒØªØ¨ Ù…Ø³Ø§Ø­ÙŠ Ø¢Ø®Ø± ØªÙƒÙˆÙ† Ø£Ø¹Ù…Ø§Ù„Ù‡\r\n Ù…Ø¹ØªÙ…Ø¯Ø© Ù…Ù† Ù‡Ø°Ù‡ Ø§Ù„Ø¬Ù‡Ø§Øª).&lt;/p&gt;\r\n&lt;p&gt;6- Ø±Ø®ØµØ© Ù…Ø¨Ø§Ù†ÙŠ Ù„Ù„Ø¹Ù‚Ø§Ø± Ù…Ø­Ù„ Ø§Ù„Ø·Ù„Ø¨ Ø¥Ø°Ø§ ÙƒØ§Ù† Ù…Ù‚Ø§Ù…Ø§ Ø¨Ø¹Ø¯ 1 ÙŠÙˆÙ†ÙŠÙˆ 1992ØŒ Ø£Ùˆ Ø£ÙŠ Ù…Ø³ØªÙ†Ø¯ ÙŠÙÙŠØ¯ Ø¥Ù‚Ø§Ù…ØªÙ‡ Ù‚Ø¨Ù„ Ù‡Ø°Ø§ Ø§Ù„ØªØ§Ø±ÙŠØ®.&lt;/p&gt;'),
(5, 'thumbnail_path', 'uploads/thumbnails/5.jpg?v=1653094132');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Real Estate  System'),
(6, 'short_name', 'REAL SYSTEM'),
(11, 'logo', 'uploads/logo-1645233884.jpg?v=1645233884'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover-1645233884.jpg?v=1645233884');

-- --------------------------------------------------------

--
-- Table structure for table `type_list`
--

CREATE TABLE `type_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `type_list`
--

INSERT INTO `type_list` (`id`, `name`, `description`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 'Residential', 'Residential real estate refers to any property used for housing. These include family homes, cooperatives, duplexes, and condos where the investor or a party renting the property lives in. This type is ideal if you are looking to start building your dream home or begin a family. ', 1, 0, '2022-02-19 10:02:11', NULL),
(2, 'Commercial', 'Commercial real estate refers to any property where the main purpose is to host business operations and services. These properties typically include apartment complexes, stores, gas stations, hotels, hospitals, parking facilities, etc. ', 1, 0, '2022-02-19 10:02:33', NULL),
(3, 'Industrial', 'Industrial real estate refers to all lands, buildings, and other properties that accommodate industrial-sized activities. These activities include production, assembly, warehousing, manufacturing, research, and distribution of goods and products. ', 1, 0, '2022-02-19 10:02:48', NULL),
(4, 'Raw land', 'Raw land typically refers to undeveloped or agricultural land such as farms, ranches, and timberlands. Many investors look at these properties as a good investment because they are tangible and finite resources. Additionally, these properties save you from the trouble of running renovations and worrying over stolen or damaged goods. ', 1, 0, '2022-02-19 10:03:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'uploads/avatars/1.png?v=1645064505', NULL, 1, '2021-01-20 14:02:37', '2022-05-14 02:24:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agent_list`
--
ALTER TABLE `agent_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `amenity_list`
--
ALTER TABLE `amenity_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `docs`
--
ALTER TABLE `docs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `real_estate_amenities`
--
ALTER TABLE `real_estate_amenities`
  ADD KEY `real_estate_id` (`real_estate_id`),
  ADD KEY `amenity_id` (`amenity_id`);

--
-- Indexes for table `real_estate_list`
--
ALTER TABLE `real_estate_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_id` (`type_id`),
  ADD KEY `agent_id` (`agent_id`);

--
-- Indexes for table `real_estate_meta`
--
ALTER TABLE `real_estate_meta`
  ADD KEY `real_estate_id` (`real_estate_id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type_list`
--
ALTER TABLE `type_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agent_list`
--
ALTER TABLE `agent_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `amenity_list`
--
ALTER TABLE `amenity_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `docs`
--
ALTER TABLE `docs`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `real_estate_list`
--
ALTER TABLE `real_estate_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `type_list`
--
ALTER TABLE `type_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `real_estate_amenities`
--
ALTER TABLE `real_estate_amenities`
  ADD CONSTRAINT `real_estate_amenities_ibfk_1` FOREIGN KEY (`real_estate_id`) REFERENCES `real_estate_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `real_estate_amenities_ibfk_2` FOREIGN KEY (`amenity_id`) REFERENCES `amenity_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `real_estate_list`
--
ALTER TABLE `real_estate_list`
  ADD CONSTRAINT `real_estate_list_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `type_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `real_estate_list_ibfk_2` FOREIGN KEY (`agent_id`) REFERENCES `agent_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `real_estate_meta`
--
ALTER TABLE `real_estate_meta`
  ADD CONSTRAINT `real_estate_meta_ibfk_1` FOREIGN KEY (`real_estate_id`) REFERENCES `real_estate_list` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
