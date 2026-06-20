-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 20, 2026 at 04:11 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `studygroup_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `discussions`
--

CREATE TABLE `discussions` (
  `message_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `content` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discussions`
--

INSERT INTO `discussions` (`message_id`, `group_id`, `user_id`, `parent_id`, `content`, `created_at`, `updated_at`) VALUES
(1, 1, 2, NULL, 'Hello everyone! Please review Big O notation before our next session.', '2026-06-20 22:03:41', '2026-06-20 22:03:41'),
(2, 1, 10, 1, 'Noted Syafiq! I will read chapter 3 of the textbook.', '2026-06-20 22:03:41', '2026-06-20 22:03:41'),
(3, 2, 3, NULL, 'Are we using Apache Tomcat for our deployment?', '2026-06-20 22:03:41', '2026-06-20 22:03:41'),
(4, 2, 6, 3, 'Yes, make sure you download Tomcat 9.', '2026-06-20 22:03:41', '2026-06-20 22:03:41'),
(5, 5, 7, NULL, 'Does anyone have good resources for PyTorch?', '2026-06-20 22:03:41', '2026-06-20 22:03:41'),
(6, 5, 8, 5, 'I found a great YouTube playlist, I will share the link during our meeting.', '2026-06-20 22:03:41', '2026-06-20 22:03:41');

-- --------------------------------------------------------

--
-- Table structure for table `memberships`
--

CREATE TABLE `memberships` (
  `membership_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `join_date` datetime NOT NULL DEFAULT current_timestamp(),
  `status` enum('active','pending','left') NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `memberships`
--

INSERT INTO `memberships` (`membership_id`, `user_id`, `group_id`, `join_date`, `status`) VALUES
(1, 2, 1, '2026-06-20 22:03:41', 'active'),
(2, 10, 1, '2026-06-20 22:03:41', 'active'),
(3, 3, 2, '2026-06-20 22:03:41', 'active'),
(4, 6, 2, '2026-06-20 22:03:41', 'active'),
(5, 4, 3, '2026-06-20 22:03:41', 'active'),
(6, 9, 3, '2026-06-20 22:03:41', 'active'),
(7, 6, 4, '2026-06-20 22:03:41', 'active'),
(8, 10, 4, '2026-06-20 22:03:41', 'active'),
(9, 2, 5, '2026-06-20 22:03:41', 'active'),
(10, 7, 5, '2026-06-20 22:03:41', 'active'),
(11, 8, 5, '2026-06-20 22:03:41', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `message` varchar(500) NOT NULL,
  `link` varchar(500) DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notification_id`, `user_id`, `message`, `link`, `is_read`, `created_at`) VALUES
(1, 10, 'New session scheduled: Graph Traversal Algorithms', '?page=group_detail&id=1', 0, '2026-06-20 22:03:41'),
(2, 6, 'Nurul Huda scheduled a new session: Servlets & JSP Setup', '?page=group_detail&id=2', 1, '2026-06-20 22:03:41'),
(3, 9, 'Amirul Asyraf replied to your discussion in Law Society Debates', '?page=group_detail&id=3', 0, '2026-06-20 22:03:41'),
(4, 2, 'Siti Aisyah joined your group AI & Machine Learning', '?page=group_detail&id=5', 0, '2026-06-20 22:03:41');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `rating` tinyint(3) UNSIGNED NOT NULL CHECK (`rating` between 1 and 5),
  `review_text` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`review_id`, `user_id`, `group_id`, `rating`, `review_text`, `created_at`) VALUES
(1, 10, 1, 5, 'Syafiq explains algorithms very clearly. Highly recommend this group!', '2026-06-20 22:03:41'),
(2, 6, 2, 4, 'Good practical sessions. The lab PCs are a bit slow though.', '2026-06-20 22:03:41'),
(3, 9, 3, 5, 'Debates are intense and very helpful for understanding cases.', '2026-06-20 22:03:41'),
(4, 8, 5, 5, 'Great discussion on AI topics.', '2026-06-20 22:03:41');

-- --------------------------------------------------------

--
-- Table structure for table `session_attendees`
--

CREATE TABLE `session_attendees` (
  `session_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `joined_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `session_attendees`
--

INSERT INTO `session_attendees` (`session_id`, `user_id`, `joined_at`) VALUES
(1, 2, '2026-06-20 22:03:41'),
(1, 10, '2026-06-20 22:03:41'),
(2, 3, '2026-06-20 22:03:41'),
(2, 6, '2026-06-20 22:03:41'),
(3, 4, '2026-06-20 22:03:41'),
(3, 9, '2026-06-20 22:03:41'),
(4, 2, '2026-06-20 22:03:41'),
(4, 7, '2026-06-20 22:03:41');

-- --------------------------------------------------------

--
-- Table structure for table `study_groups`
--

CREATE TABLE `study_groups` (
  `group_id` int(10) UNSIGNED NOT NULL,
  `group_name` varchar(150) NOT NULL,
  `subject` varchar(150) NOT NULL,
  `course_code` varchar(30) NOT NULL,
  `description` text DEFAULT NULL,
  `meeting_type` enum('Online','Physical','Hybrid') NOT NULL DEFAULT 'Online',
  `capacity` tinyint(3) UNSIGNED NOT NULL DEFAULT 10,
  `creator_id` int(10) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `study_groups`
--

INSERT INTO `study_groups` (`group_id`, `group_name`, `subject`, `course_code`, `description`, `meeting_type`, `capacity`, `creator_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'CS Algorithm Mastery', 'Data Structures & Algorithms', 'WIA2004', 'We focus on LeetCode problems and advanced sorting algorithms.', 'Online', 10, 2, 1, '2026-06-20 22:03:41', '2026-06-20 22:03:41'),
(2, 'Web Dev Bootcamp UM', 'Web Programming', 'WIA2001', 'Learning advanced Java Servlets, JSP, and MySQL integration.', 'Hybrid', 15, 3, 1, '2026-06-20 22:03:41', '2026-06-20 22:03:41'),
(3, 'Law Society Debates', 'Constitutional Law', 'LAW1001', 'Weekly debates and case study reviews.', 'Physical', 8, 4, 1, '2026-06-20 22:03:41', '2026-06-20 22:03:41'),
(4, 'Pharmacy Year 2 Revision', 'Pharmacology', 'PHM2001', 'Group study for the upcoming finals.', 'Online', 20, 6, 1, '2026-06-20 22:03:41', '2026-06-20 22:03:41'),
(5, 'AI & Machine Learning', 'Artificial Intelligence', 'WIA3001', 'Discussing neural networks and building small ML projects together.', 'Online', 12, 2, 1, '2026-06-20 22:03:41', '2026-06-20 22:03:41'),
(6, 'Pembangunan Aplikasi Web', 'PEMBANGUNAN APLIKASI BERASASKAN WEB', 'CSE3023', 'Membincangkan tugasan dan projek CSE3023.', 'Online', 15, 11, 1, '2026-06-20 22:09:19', '2026-06-20 22:09:19'),
(7, 'Pengujian Perisian', 'PENGUJIAN PERISIAN', 'CSE3413', 'Group study untuk Pengujian Perisian (Software Testing).', 'Online', 15, 11, 1, '2026-06-20 22:09:19', '2026-06-20 22:09:19'),
(8, 'Kesenibinaan Perisian', 'KESENIBINAAN PERISIAN', 'CSE3433', 'Perbincangan tentang Kesenibinaan Perisian (Software Architecture).', 'Online', 15, 12, 1, '2026-06-20 22:09:19', '2026-06-20 22:09:19'),
(9, 'Projek Akhir Aplikasi', 'PROJEK PEMBANGUNAN PERISIAN APLIKASI', 'CSE3953', 'Perbincangan projek akhir pembangunan aplikasi.', 'Online', 15, 12, 1, '2026-06-20 22:09:19', '2026-06-20 22:09:19'),
(10, 'Rangkaian Komputer', 'RANGKAIAN', 'CSF3223', 'Ulang kaji topik Rangkaian (Networking).', 'Online', 15, 13, 1, '2026-06-20 22:09:19', '2026-06-20 22:09:19'),
(11, 'Asas Keusahawanan', 'ASAS KEUSAHAWANAN', 'MPU3223', 'Group untuk subjek wajib MPU3223 Asas Keusahawanan.', 'Online', 15, 13, 1, '2026-06-20 22:09:19', '2026-06-20 22:09:19');

-- --------------------------------------------------------

--
-- Table structure for table `study_sessions`
--

CREATE TABLE `study_sessions` (
  `session_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `session_title` varchar(200) NOT NULL,
  `session_date` date NOT NULL,
  `session_time` time NOT NULL,
  `duration_mins` smallint(5) UNSIGNED NOT NULL DEFAULT 60,
  `location` varchar(255) DEFAULT NULL,
  `meeting_link` varchar(500) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `study_sessions`
--

INSERT INTO `study_sessions` (`session_id`, `group_id`, `session_title`, `session_date`, `session_time`, `duration_mins`, `location`, `meeting_link`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'Graph Traversal Algorithms', '2026-06-25', '20:00:00', 90, NULL, 'https://meet.google.com/abc-defg-hij', 2, '2026-06-20 22:03:41', '2026-06-20 22:03:41'),
(2, 2, 'Servlets & JSP Setup', '2026-06-22', '14:00:00', 120, 'FCSIT Lab 2', 'https://zoom.us/j/123456789', 3, '2026-06-20 22:03:41', '2026-06-20 22:03:41'),
(3, 3, 'Constitution Chapter 4', '2026-06-21', '10:00:00', 60, 'Law Library Discussion Room', NULL, 4, '2026-06-20 22:03:41', '2026-06-20 22:03:41'),
(4, 5, 'Neural Networks Intro', '2026-06-28', '21:00:00', 60, NULL, 'https://meet.google.com/xyz-abcd-efg', 2, '2026-06-20 22:03:41', '2026-06-20 22:03:41');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(120) NOT NULL,
  `email` varchar(180) NOT NULL,
  `password` varchar(255) NOT NULL,
  `university` varchar(150) DEFAULT NULL,
  `major` varchar(150) DEFAULT NULL,
  `academic_year` enum('Year 1','Year 2','Year 3','Year 4','Postgraduate') DEFAULT NULL,
  `role` enum('student','admin') NOT NULL DEFAULT 'student',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`, `university`, `major`, `academic_year`, `role`, `created_at`, `updated_at`) VALUES
(1, 'Ahmad Fauzi (Admin)', 'admin@studygroup.my', 'password123', 'Universiti Malaya', 'Computer Science', 'Year 4', 'admin', '2026-06-20 10:00:00', '2026-06-20 10:00:00'),
(2, 'Muhammad Syafiq', 'syafiq@siswa.um.edu.my', 'password123', 'Universiti Malaya', 'Software Engineering', 'Year 2', 'student', '2026-06-20 10:05:00', '2026-06-20 10:05:00'),
(3, 'Nurul Huda', 'nurul.huda@uitm.edu.my', 'password123', 'Universiti Teknologi MARA', 'Accounting', 'Year 3', 'student', '2026-06-20 10:15:00', '2026-06-20 10:15:00'),
(4, 'Amirul Asyraf', 'amirul@siswa.ukm.edu.my', 'password123', 'Universiti Kebangsaan Malaysia', 'Law', 'Year 1', 'student', '2026-06-20 10:20:00', '2026-06-20 10:20:00'),
(5, 'Siti Aisyah', 'aisyah@student.upm.edu.my', 'password123', 'Universiti Putra Malaysia', 'Agriculture', 'Year 4', 'student', '2026-06-20 10:25:00', '2026-06-20 10:25:00'),
(6, 'Farid Kamil', 'farid@student.usm.my', 'password123', 'Universiti Sains Malaysia', 'Pharmacy', 'Year 2', 'student', '2026-06-20 10:30:00', '2026-06-20 10:30:00'),
(7, 'Aminah Hassan', 'aminah@utm.my', 'password123', 'Universiti Teknologi Malaysia', 'Mechanical Engineering', 'Year 3', 'student', '2026-06-20 10:35:00', '2026-06-20 10:35:00'),
(8, 'Hafiz Suip', 'hafiz@uum.edu.my', 'password123', 'Universiti Utara Malaysia', 'Business Administration', 'Year 1', 'student', '2026-06-20 10:40:00', '2026-06-20 10:40:00'),
(9, 'Intan Najwa', 'intan@uitm.edu.my', 'password123', 'Universiti Teknologi MARA', 'Mass Communication', 'Year 2', 'student', '2026-06-20 10:45:00', '2026-06-20 10:45:00'),
(10, 'Luqman Hakim', 'luqman@siswa.um.edu.my', 'password123', 'Universiti Malaya', 'Medicine', 'Year 4', 'student', '2026-06-20 10:50:00', '2026-06-20 10:50:00'),
(11, 'Safirul Hassan', 'safirul@gmail.com', 'password', 'University Malaysia Terengganu', 'Computer Science', 'Year 2', 'student', '2026-06-20 22:01:29', '2026-06-20 22:01:29'),
(12, 'Adry Aqmawi', 'ad@gmail.com', 'password', 'UMT', 'Computer Science', 'Year 2', 'student', '2026-06-20 22:05:52', '2026-06-20 22:05:52'),
(13, 'Muhammad Aiman', 'aiman@gmail.com', 'password', 'UMT', 'Computer Science', 'Year 2', 'student', '2026-06-20 22:05:52', '2026-06-20 22:05:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `discussions`
--
ALTER TABLE `discussions`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `fk_disc_group` (`group_id`),
  ADD KEY `fk_disc_user` (`user_id`),
  ADD KEY `fk_disc_parent` (`parent_id`);

--
-- Indexes for table `memberships`
--
ALTER TABLE `memberships`
  ADD PRIMARY KEY (`membership_id`),
  ADD UNIQUE KEY `uq_user_group` (`user_id`,`group_id`),
  ADD KEY `fk_mem_group` (`group_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `fk_notif_user` (`user_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD UNIQUE KEY `uq_review_user_group` (`user_id`,`group_id`),
  ADD KEY `fk_rev_group` (`group_id`);

--
-- Indexes for table `session_attendees`
--
ALTER TABLE `session_attendees`
  ADD PRIMARY KEY (`session_id`,`user_id`),
  ADD KEY `fk_sa_user` (`user_id`);

--
-- Indexes for table `study_groups`
--
ALTER TABLE `study_groups`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `fk_group_creator` (`creator_id`);

--
-- Indexes for table `study_sessions`
--
ALTER TABLE `study_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `fk_sess_group` (`group_id`),
  ADD KEY `fk_sess_creator` (`created_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `discussions`
--
ALTER TABLE `discussions`
  MODIFY `message_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `memberships`
--
ALTER TABLE `memberships`
  MODIFY `membership_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `study_groups`
--
ALTER TABLE `study_groups`
  MODIFY `group_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `study_sessions`
--
ALTER TABLE `study_sessions`
  MODIFY `session_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `discussions`
--
ALTER TABLE `discussions`
  ADD CONSTRAINT `fk_disc_group` FOREIGN KEY (`group_id`) REFERENCES `study_groups` (`group_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_disc_parent` FOREIGN KEY (`parent_id`) REFERENCES `discussions` (`message_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_disc_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `memberships`
--
ALTER TABLE `memberships`
  ADD CONSTRAINT `fk_mem_group` FOREIGN KEY (`group_id`) REFERENCES `study_groups` (`group_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_mem_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `fk_notif_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `fk_rev_group` FOREIGN KEY (`group_id`) REFERENCES `study_groups` (`group_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_rev_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `session_attendees`
--
ALTER TABLE `session_attendees`
  ADD CONSTRAINT `fk_sa_session` FOREIGN KEY (`session_id`) REFERENCES `study_sessions` (`session_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_sa_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `study_groups`
--
ALTER TABLE `study_groups`
  ADD CONSTRAINT `fk_group_creator` FOREIGN KEY (`creator_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `study_sessions`
--
ALTER TABLE `study_sessions`
  ADD CONSTRAINT `fk_sess_creator` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_sess_group` FOREIGN KEY (`group_id`) REFERENCES `study_groups` (`group_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
