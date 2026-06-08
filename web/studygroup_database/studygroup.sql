-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 08, 2026 at 06:40 AM
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
(1, 1, 2, NULL, 'Welcome everyone! Let\'s start with Big O notation review.', '2026-06-07 00:19:09', '2026-06-07 00:19:09'),
(2, 1, 3, 1, 'Great idea! I suggest we also cover space complexity.', '2026-06-07 00:19:09', '2026-06-07 00:19:09'),
(3, 1, 4, 1, 'I found a great resource on Coursera for this topic.', '2026-06-07 00:19:09', '2026-06-07 00:19:09'),
(4, 2, 3, NULL, 'What framework are we using for the frontend — Bootstrap or Tailwind?', '2026-06-07 00:19:09', '2026-06-07 00:19:09'),
(5, 2, 4, 4, 'Let\'s stick with Bootstrap 5 since most of us know it already.', '2026-06-07 00:19:09', '2026-06-07 00:19:09'),
(7, 4, 4, NULL, 'Has anyone read the new GPT-4 technical paper?', '2026-06-07 00:19:09', '2026-06-07 00:19:09'),
(8, 5, 5, NULL, 'Lab equipment is booked for Tuesday. Please be on time.', '2026-06-07 00:19:09', '2026-06-07 00:19:09'),
(9, 8, 2, NULL, 'hehe siuuu', '2026-06-07 12:47:33', '2026-06-07 12:47:33');

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
(1, 2, 1, '2026-06-07 00:19:09', 'active'),
(2, 3, 1, '2026-06-07 00:19:09', 'active'),
(3, 4, 1, '2026-06-07 00:19:09', 'active'),
(4, 3, 2, '2026-06-07 00:19:09', 'active'),
(5, 4, 2, '2026-06-07 00:19:09', 'active'),
(6, 5, 2, '2026-06-07 00:19:09', 'active'),
(9, 4, 4, '2026-06-07 00:19:09', 'active'),
(10, 5, 4, '2026-06-07 00:19:09', 'active'),
(11, 5, 5, '2026-06-07 00:19:09', 'active'),
(12, 2, 5, '2026-06-07 00:19:09', 'left'),
(13, 2, 6, '2026-06-07 01:01:44', 'active'),
(14, 2, 2, '2026-06-07 02:30:43', 'left'),
(15, 2, 4, '2026-06-07 02:30:59', 'left'),
(20, 5, 1, '2026-06-07 10:34:32', 'active'),
(21, 5, 8, '2026-06-07 10:35:20', 'active'),
(22, 2, 8, '2026-06-07 12:47:19', 'active'),
(24, 2, 9, '2026-06-07 16:15:37', 'active'),
(37, 6, 10, '2026-06-08 12:29:16', 'active'),
(38, 7, 10, '2026-06-08 12:29:16', 'active'),
(39, 7, 11, '2026-06-08 12:29:16', 'active'),
(40, 8, 11, '2026-06-08 12:29:16', 'active'),
(41, 9, 11, '2026-06-08 12:29:16', 'active'),
(42, 8, 12, '2026-06-08 12:29:16', 'active'),
(43, 10, 12, '2026-06-08 12:29:16', 'active'),
(44, 9, 13, '2026-06-08 12:29:16', 'active'),
(45, 6, 13, '2026-06-08 12:29:16', 'active'),
(46, 10, 14, '2026-06-08 12:29:16', 'active'),
(47, 6, 14, '2026-06-08 12:29:16', 'active'),
(48, 8, 14, '2026-06-08 12:29:16', 'active'),
(49, 2, 10, '2026-06-08 12:30:14', 'active');

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
(1, 2, 'New session scheduled: Sorting Algorithms Deep Dive', '?page=group_detail&id=1', 1, '2026-06-07 00:19:09'),
(2, 3, 'Bob Williams joined Web Dev Warriors', '?page=group_detail&id=2', 0, '2026-06-07 00:19:09'),
(3, 4, 'New post in AI Study Circle discussion board', '?page=group_detail&id=4', 0, '2026-06-07 00:19:09'),
(4, 5, 'Wireshark Lab Session has been scheduled', '?page=group_detail&id=5', 1, '2026-06-07 00:19:09'),
(5, 2, 'New post in CS Algorithm Crew discussion board', '?page=group_detail&id=1', 1, '2026-06-07 00:19:09'),
(6, 3, 'Alice Johnson joined your group: Web Dev Warriors', '/WebBro/groups?action=detail&id=2', 0, '2026-06-07 02:30:43'),
(7, 4, 'Alice Johnson joined your group: AI Study Circle', '/WebBro/groups?action=detail&id=4', 0, '2026-06-07 02:30:59'),
(8, 2, 'Alice Johnson joined your group: Siuuu', '/WebBro/groups?action=detail&id=7', 1, '2026-06-07 09:58:28'),
(9, 2, 'Alice Johnson joined your group: Siuuu', '/WebBro/groups?action=detail&id=7', 1, '2026-06-07 09:58:37'),
(10, 3, 'New session scheduled in \'Web Dev Warriors\': kl;fjalsfdas', '/WebBro/groups?action=detail&id=2&tab=sessions', 0, '2026-06-07 10:02:22'),
(11, 4, 'New session scheduled in \'Web Dev Warriors\': kl;fjalsfdas', '/WebBro/groups?action=detail&id=2&tab=sessions', 0, '2026-06-07 10:02:22'),
(12, 5, 'New session scheduled in \'Web Dev Warriors\': kl;fjalsfdas', '/WebBro/groups?action=detail&id=2&tab=sessions', 1, '2026-06-07 10:02:22'),
(13, 2, 'David Lee joined your group: Siuuu', '/WebBro/groups?action=detail&id=7', 1, '2026-06-07 10:13:13'),
(14, 2, 'David Lee joined your group: CS Algorithm Crew', '/WebBro/groups?action=detail&id=1', 1, '2026-06-07 10:34:32'),
(15, 5, 'Alice Johnson joined your group: Cristiano Messi', '/WebBro/groups?action=detail&id=8', 0, '2026-06-07 11:05:18'),
(16, 5, 'Alice Johnson joined your group: Cristiano Messi', '/WebBro/groups?action=detail&id=8', 0, '2026-06-07 12:47:19'),
(17, 5, 'Alice Johnson posted in \'Cristiano Messi\'', '/WebBro/groups?action=detail&id=8&tab=discussion', 0, '2026-06-07 12:47:33'),
(18, 6, 'Alice Johnson joined your group: Mobile App Devs', '/WebBro/groups?action=detail&id=10', 0, '2026-06-08 12:30:14');

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
(1, 3, 1, 5, 'Amazing group! Alice keeps everything organized and we make great progress every session.', '2026-06-07 00:19:09'),
(2, 4, 1, 4, 'Very helpful sessions. Sometimes we run over time but the content is excellent.', '2026-06-07 00:19:09'),
(3, 4, 2, 5, 'Web Dev Warriors is the best study group I have joined. Very collaborative!', '2026-06-07 00:19:09'),
(5, 2, 5, 5, 'Lab sessions are very practical. David runs them very professionally.', '2026-06-07 00:19:09'),
(6, 2, 10, 5, 'this group is so fun!', '2026-06-08 12:30:41');

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
(8, 2, '2026-06-07 14:53:52');

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
(1, 'CS Algorithm Crew', 'Data Structures & Algorithms', 'CSE2012', 'We solve LeetCode problems and prepare for technical interviews.', 'Online', 8, 2, 1, '2026-06-07 00:19:09', '2026-06-07 00:19:09'),
(2, 'Web Dev Warriors', 'Web Application Development', 'CSE3023', 'Building real-world full-stack projects together.', 'Hybrid', 10, 3, 1, '2026-06-07 00:19:09', '2026-06-07 00:19:09'),
(4, 'AI Study Circle', 'Artificial Intelligence', 'CSE4010', 'Discussing ML models, neural networks and AI ethics.', 'Online', 12, 4, 1, '2026-06-07 00:19:09', '2026-06-07 00:19:09'),
(5, 'Networks & Security', 'Computer Networks', 'CSE3031', 'Hands-on labs for networking protocols and cyber security.', 'Physical', 8, 5, 1, '2026-06-07 00:19:09', '2026-06-07 00:19:09'),
(6, 'Siuuu', 'Computer Science', 'CSC303', 'this course is fun bro', 'Online', 15, 2, 1, '2026-06-07 01:01:44', '2026-06-07 01:01:44'),
(8, 'Cristiano Messi', 'Football', 'FUT123', 'About the fans of messi and ronaldo', 'Online', 20, 5, 1, '2026-06-07 10:35:20', '2026-06-07 10:35:20'),
(9, 'Test Group', 'Gaming', 'GEM123', 'HEHEHEHEHHEHEHEHHEHEHE', 'Online', 30, 2, 1, '2026-06-07 16:15:37', '2026-06-07 16:15:37'),
(10, 'Mobile App Devs', 'Mobile App Development', 'CSE3040', 'Learning Flutter and Dart to build awesome mobile apps.', 'Hybrid', 10, 6, 1, '2026-06-07 16:41:13', '2026-06-07 16:41:13'),
(11, 'Cloud Computing Group', 'Cloud Architecture', 'CSE4020', 'Preparing for AWS Solutions Architect certification.', 'Online', 15, 7, 1, '2026-06-07 16:41:13', '2026-06-07 16:41:13'),
(12, 'UI/UX Designers', 'Human Computer Interaction', 'CSE3050', 'Figma prototyping and user interface design principles.', 'Physical', 8, 8, 1, '2026-06-07 16:41:13', '2026-06-07 16:41:13'),
(13, 'CyberSec Enthusiasts', 'Cybersecurity', 'CSE4030', 'Practicing CTF challenges and ethical hacking.', 'Online', 12, 9, 1, '2026-06-07 16:41:13', '2026-06-07 16:41:13'),
(14, 'Game Dev Guild', 'Game Development', 'CSE3060', 'Unity and C# game jam prep and project showcase.', 'Hybrid', 10, 10, 1, '2026-06-07 16:41:13', '2026-06-07 16:41:13');

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
(1, 1, 'Sorting Algorithms Deep Dive', '2026-06-10', '14:00:00', 90, NULL, 'https://meet.google.com/abc-def-ghi', 2, '2026-06-07 00:19:09', '2026-06-07 00:19:09'),
(2, 1, 'Graph Traversal Problems', '2026-06-17', '14:00:00', 90, NULL, 'https://meet.google.com/abc-def-ghi', 2, '2026-06-07 00:19:09', '2026-06-07 00:19:09'),
(3, 2, 'PHP MVC Project Kickoff', '2026-06-08', '10:00:00', 120, NULL, 'https://zoom.us/j/1234567890', 3, '2026-06-07 00:19:09', '2026-06-07 00:19:09'),
(5, 4, 'Intro to Neural Networks', '2026-06-11', '16:00:00', 90, NULL, 'https://teams.microsoft.com/l/xyz', 4, '2026-06-07 00:19:09', '2026-06-07 00:19:09'),
(6, 5, 'Wireshark Lab Session', '2026-06-09', '09:00:00', 120, 'Lab 204', NULL, 5, '2026-06-07 00:19:09', '2026-06-07 00:19:09'),
(7, 2, 'kl;fjalsfdas', '2026-06-07', '00:31:00', 60, 'libarry', '', 2, '2026-06-07 10:02:22', '2026-06-07 10:02:22'),
(8, 8, 'kl;fjalsfdas', '2026-06-07', '12:46:00', 60, 'libarry', '', 5, '2026-06-07 12:46:10', '2026-06-07 12:46:10');

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
  `profile_pic` varchar(255) DEFAULT 'default.png',
  `role` enum('student','admin') NOT NULL DEFAULT 'student',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`, `university`, `major`, `academic_year`, `profile_pic`, `role`, `created_at`, `updated_at`) VALUES
(1, 'Admin User', 'admin@studygroup.com', 'password', 'State University', 'Computer Science', 'Year 4', 'default.png', 'admin', '2026-06-07 00:19:08', '2026-06-07 00:19:08'),
(2, 'Alice Johnson', 'alice@student.com', 'password', 'State University', 'Computer Science', 'Year 1', 'default.png', 'student', '2026-06-07 00:19:08', '2026-06-07 11:06:09'),
(3, 'Bob Williams', 'bob@student.com', 'password', 'State University', 'Software Engineering', 'Year 3', 'default.png', 'student', '2026-06-07 00:19:08', '2026-06-07 00:19:08'),
(4, 'Carol Smith', 'carol@student.com', 'password', 'State University', 'Information Systems', 'Year 1', 'default.png', 'student', '2026-06-07 00:19:08', '2026-06-07 00:19:08'),
(5, 'David Lee', 'david@student.com', 'password', 'State University', 'Computer Science', 'Year 3', 'default.png', 'student', '2026-06-07 00:19:08', '2026-06-07 01:38:30'),
(6, 'Eve Davis', 'eve@student.com', 'password', 'State University', 'Information Systems', 'Year 2', 'default.png', 'student', '2026-06-07 16:41:13', '2026-06-07 16:41:13'),
(7, 'Frank Miller', 'frank@student.com', 'password', 'State University', 'Computer Science', 'Year 3', 'default.png', 'student', '2026-06-07 16:41:13', '2026-06-07 16:41:13'),
(8, 'Grace Wilson', 'grace@student.com', 'password', 'State University', 'Software Engineering', 'Year 1', 'default.png', 'student', '2026-06-07 16:41:13', '2026-06-07 16:41:13'),
(9, 'Henry Moore', 'henry@student.com', 'password', 'State University', 'Computer Science', 'Year 4', 'default.png', 'student', '2026-06-07 16:41:13', '2026-06-07 16:41:13'),
(10, 'Ivy Taylor', 'ivy@student.com', 'password', 'State University', 'Information Systems', 'Year 2', 'default.png', 'student', '2026-06-07 16:41:13', '2026-06-07 16:41:13');

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
  MODIFY `message_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `memberships`
--
ALTER TABLE `memberships`
  MODIFY `membership_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `study_groups`
--
ALTER TABLE `study_groups`
  MODIFY `group_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `study_sessions`
--
ALTER TABLE `study_sessions`
  MODIFY `session_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
