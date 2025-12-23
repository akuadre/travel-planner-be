-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 23, 2025 at 11:40 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `travel_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `destinations`
--

CREATE TABLE `destinations` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `departure_date` date NOT NULL,
  `budget` bigint NOT NULL,
  `duration_days` int NOT NULL,
  `is_achieved` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `destinations`
--

INSERT INTO `destinations` (`id`, `user_id`, `photo`, `title`, `departure_date`, `budget`, `duration_days`, `is_achieved`, `created_at`, `updated_at`) VALUES
(1, 1, 'bromo.png', 'Trip ke Gunung Bromo', '2026-03-15', 2500000, 3, 0, '2025-12-23 16:38:33', '2025-12-23 16:38:33'),
(2, 1, 'jakarta.png', 'City Tour Jakarta', '2026-06-01', 3000000, 4, 0, '2025-12-23 16:38:33', '2025-12-23 16:38:33'),
(3, 2, 'pantaibali.png', 'Liburan ke Pantai Kuta Bali', '2026-04-20', 5000000, 5, 0, '2025-12-23 16:38:33', '2025-12-23 16:38:33'),
(4, 2, 'bandung.png', 'Wisata Kuliner Bandung', '2026-07-12', 2000000, 3, 0, '2025-12-23 16:38:33', '2025-12-23 16:38:33'),
(5, 3, 'cikuray.png', 'Camping di Gunung Cikuray', '2026-05-10', 1500000, 2, 0, '2025-12-23 16:38:33', '2025-12-23 16:38:33'),
(6, 3, 'jogja.png', 'Backpacker Jogja', '2026-08-05', 1800000, 4, 0, '2025-12-23 16:38:33', '2025-12-23 16:38:33');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `itineraries`
--

CREATE TABLE `itineraries` (
  `id` bigint UNSIGNED NOT NULL,
  `destination_id` bigint UNSIGNED NOT NULL,
  `day_number` int NOT NULL,
  `location` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `schedule_time` time DEFAULT NULL,
  `activities` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `itineraries`
--

INSERT INTO `itineraries` (`id`, `destination_id`, `day_number`, `location`, `description`, `schedule_time`, `activities`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Stasiun Kereta - Malang', 'Berangkat dari Jakarta ke Malang', '07:00:00', 'Naik kereta dari Gambir, perjalanan menuju Malang', '2025-12-23 16:38:33', '2025-12-23 16:38:33'),
(2, 1, 1, 'Hotel Malang', 'Check-in hotel dan istirahat', '16:00:00', 'Check-in hotel, makan malam, persiapan pendakian', '2025-12-23 16:38:33', '2025-12-23 16:38:33'),
(3, 1, 2, 'Penanjakan Bromo', 'Sunrise view di Penanjakan', '04:00:00', 'Naik jeep menuju Penanjakan, foto sunrise', '2025-12-23 16:38:33', '2025-12-23 16:38:33'),
(4, 1, 2, 'Kawah Bromo', 'Trekking menuju kawah Bromo', '08:00:00', 'Trekking dari lautan pasir ke kawah Bromo', '2025-12-23 16:38:33', '2025-12-23 16:38:33'),
(5, 1, 3, 'Hotel Malang', 'Check-out dan persiapan pulang', '10:00:00', 'Packing, check-out hotel, makan siang', '2025-12-23 16:38:33', '2025-12-23 16:38:33'),
(6, 1, 3, 'Stasiun Kereta - Jakarta', 'Perjalanan pulang ke Jakarta', '14:00:00', 'Naik kereta kembali ke Jakarta', '2025-12-23 16:38:33', '2025-12-23 16:38:33'),
(7, 2, 1, 'Lokasi Day 1', 'Aktivitas hari ke-1 di City Tour Jakarta', '08:00:00', 'Check-in hotel dan istirahat', '2025-12-23 16:38:33', '2025-12-23 16:38:33'),
(8, 2, 2, 'Lokasi Day 2', 'Aktivitas hari ke-2 di City Tour Jakarta', '08:00:00', 'Explore tempat wisata sekitar', '2025-12-23 16:38:33', '2025-12-23 16:38:33'),
(9, 2, 3, 'Lokasi Day 3', 'Aktivitas hari ke-3 di City Tour Jakarta', '08:00:00', 'Makan di restoran lokal', '2025-12-23 16:38:33', '2025-12-23 16:38:33'),
(10, 2, 4, 'Lokasi Day 4', 'Aktivitas hari ke-4 di City Tour Jakarta', '08:00:00', 'Foto-foto di spot menarik', '2025-12-23 16:38:33', '2025-12-23 16:38:33'),
(11, 2, 4, 'Bandara/Stasiun', 'Perjalanan pulang', '14:00:00', 'Check-out, packing, transfer ke bandara/stasiun', '2025-12-23 16:38:33', '2025-12-23 16:38:33'),
(12, 3, 1, 'Bandara Ngurah Rai', 'Tiba di Bali dan check-in hotel', '12:00:00', 'Jemputan dari bandara, check-in hotel di Kuta', '2025-12-23 16:38:33', '2025-12-23 16:38:33'),
(13, 3, 2, 'Pantai Kuta', 'Bersantai di pantai Kuta', '09:00:00', 'Sunbathing, berenang, surfing lesson', '2025-12-23 16:38:33', '2025-12-23 16:38:33'),
(14, 3, 3, 'Ubud', 'Day trip ke Ubud', '08:00:00', 'Visit monkey forest, rice terrace, art market', '2025-12-23 16:38:33', '2025-12-23 16:38:33'),
(15, 3, 4, 'Tanah Lot', 'Sunset di Tanah Lot', '17:00:00', 'Foto sunset, visit temple, cultural performance', '2025-12-23 16:38:33', '2025-12-23 16:38:33'),
(16, 3, 5, 'Bandara Ngurah Rai', 'Check-out dan pulang', '10:00:00', 'Packing, check-out, transfer ke bandara', '2025-12-23 16:38:33', '2025-12-23 16:38:33'),
(17, 4, 1, 'Lokasi Day 1', 'Aktivitas hari ke-1 di Wisata Kuliner Bandung', '08:00:00', 'Check-in hotel dan istirahat', '2025-12-23 16:38:33', '2025-12-23 16:38:33'),
(18, 4, 2, 'Lokasi Day 2', 'Aktivitas hari ke-2 di Wisata Kuliner Bandung', '08:00:00', 'Explore tempat wisata sekitar', '2025-12-23 16:38:33', '2025-12-23 16:38:33'),
(19, 4, 3, 'Lokasi Day 3', 'Aktivitas hari ke-3 di Wisata Kuliner Bandung', '08:00:00', 'Makan di restoran lokal', '2025-12-23 16:38:33', '2025-12-23 16:38:33'),
(20, 4, 3, 'Bandara/Stasiun', 'Perjalanan pulang', '14:00:00', 'Check-out, packing, transfer ke bandara/stasiun', '2025-12-23 16:38:33', '2025-12-23 16:38:33'),
(21, 5, 1, 'Lokasi Day 1', 'Aktivitas hari ke-1 di Camping di Gunung Cikuray', '08:00:00', 'Check-in hotel dan istirahat', '2025-12-23 16:38:33', '2025-12-23 16:38:33'),
(22, 5, 2, 'Lokasi Day 2', 'Aktivitas hari ke-2 di Camping di Gunung Cikuray', '08:00:00', 'Explore tempat wisata sekitar', '2025-12-23 16:38:33', '2025-12-23 16:38:33'),
(23, 5, 2, 'Bandara/Stasiun', 'Perjalanan pulang', '14:00:00', 'Check-out, packing, transfer ke bandara/stasiun', '2025-12-23 16:38:33', '2025-12-23 16:38:33'),
(24, 6, 1, 'Lokasi Day 1', 'Aktivitas hari ke-1 di Backpacker Jogja', '08:00:00', 'Check-in hotel dan istirahat', '2025-12-23 16:38:33', '2025-12-23 16:38:33'),
(25, 6, 2, 'Lokasi Day 2', 'Aktivitas hari ke-2 di Backpacker Jogja', '08:00:00', 'Explore tempat wisata sekitar', '2025-12-23 16:38:33', '2025-12-23 16:38:33'),
(26, 6, 3, 'Lokasi Day 3', 'Aktivitas hari ke-3 di Backpacker Jogja', '08:00:00', 'Makan di restoran lokal', '2025-12-23 16:38:33', '2025-12-23 16:38:33'),
(27, 6, 4, 'Lokasi Day 4', 'Aktivitas hari ke-4 di Backpacker Jogja', '08:00:00', 'Foto-foto di spot menarik', '2025-12-23 16:38:33', '2025-12-23 16:38:33'),
(28, 6, 4, 'Bandara/Stasiun', 'Perjalanan pulang', '14:00:00', 'Check-out, packing, transfer ke bandara/stasiun', '2025-12-23 16:38:33', '2025-12-23 16:38:33');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_11_15_045606_create_personal_access_tokens_table', 1),
(5, '2025_11_15_045806_create_destinations_table', 1),
(6, '2025_11_15_045839_create_itineraries_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Adrenalin', 'adrenalin@gmail.com', NULL, '$2y$12$85XeZsgbW5AluT9JuxBJOeTMF0E78g3k/ogPQ3Fn0kiyufhYff8gC', NULL, '2025-12-23 16:38:32', '2025-12-23 16:38:32'),
(2, 'Andhika', 'andhika@gmail.com', NULL, '$2y$12$o2eRDrgV/244fhC2uJLLIu.nLpoKDy/RIj/W.zopcTfbA2615UJPy', NULL, '2025-12-23 16:38:32', '2025-12-23 16:38:32'),
(3, 'Reyva', 'reyva@gmail.com', NULL, '$2y$12$pEfuf3RH.gbtkoj3MJEoYux71lgXpZJ3YJeUULmeqW1Tjx5xWutQq', NULL, '2025-12-23 16:38:33', '2025-12-23 16:38:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `destinations`
--
ALTER TABLE `destinations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `destinations_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `itineraries`
--
ALTER TABLE `itineraries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `itineraries_destination_id_foreign` (`destination_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `destinations`
--
ALTER TABLE `destinations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `itineraries`
--
ALTER TABLE `itineraries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `destinations`
--
ALTER TABLE `destinations`
  ADD CONSTRAINT `destinations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `itineraries`
--
ALTER TABLE `itineraries`
  ADD CONSTRAINT `itineraries_destination_id_foreign` FOREIGN KEY (`destination_id`) REFERENCES `destinations` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
