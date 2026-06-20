SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+08:00";

-- --------------------------------------------------------

--
-- Table structure for table `users`
--
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `full_name` varchar(120) NOT NULL,
  `email` varchar(180) NOT NULL,
  `password` varchar(255) NOT NULL,
  `university` varchar(150) DEFAULT NULL,
  `major` varchar(150) DEFAULT NULL,
  `academic_year` enum('Year 1','Year 2','Year 3','Year 4','Postgraduate') DEFAULT NULL,
  `role` enum('student','admin') NOT NULL DEFAULT 'student',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
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
(10, 'Luqman Hakim', 'luqman@siswa.um.edu.my', 'password123', 'Universiti Malaya', 'Medicine', 'Year 4', 'student', '2026-06-20 10:50:00', '2026-06-20 10:50:00');

COMMIT;
