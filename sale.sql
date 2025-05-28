-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 28, 2025 at 02:12 PM
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
-- Database: `sale`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `user_id`, `created_at`, `updated_at`) VALUES
(5, 'mobile', 37, '2025-04-15 03:08:23', '2025-04-27 06:56:57'),
(22, 'Mouse', 53, '2025-04-27 06:04:11', '2025-05-25 07:10:08'),
(23, 'bike', 53, '2025-04-27 06:34:24', '2025-04-27 06:34:24'),
(24, 'Monitor', 53, '2025-04-27 07:22:36', '2025-04-27 07:22:36'),
(25, 'Electronic', 53, '2025-04-28 01:23:13', '2025-05-25 05:51:38');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `mobile`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Lutfor Rhaman', 'lutfor251588@gmail.com', '0198960830', 37, '2025-04-17 06:37:33', '2025-04-18 23:46:52'),
(2, 'Shanto Khan', 's@gmail.com', '01622555', 37, '2025-04-17 06:39:27', '2025-04-18 23:49:08'),
(7, 'Lutfor khan', 'lut200@gmail.com', '017985555', 53, '2025-04-28 00:57:14', '2025-04-28 00:57:14'),
(8, 'shanto khan', 's200@gmail.com', '017985555', 53, '2025-04-28 00:57:31', '2025-04-28 00:57:31'),
(10, 'alli', 'alli200@gmail.com', '01798960830', 53, '2025-04-28 00:58:08', '2025-04-28 00:58:08'),
(12, 'selina gomez 12', 'se200@gmail.com', '01798960830', 53, '2025-04-28 00:58:50', '2025-04-28 08:11:26'),
(13, 'Adline', 'ad200@gmail.com', '01798960830', 53, '2025-04-28 00:59:03', '2025-04-28 00:59:03'),
(14, 'amina', 'am200@gmail.com', '01798960830', 53, '2025-04-28 00:59:16', '2025-04-28 00:59:16'),
(15, 'Lutfor Rhaman Shanto', 'lu@gmail.com', '01798960830', 53, '2025-04-28 06:16:51', '2025-04-28 06:16:51'),
(16, 'Shanto', 'sd@gmail.com', '0195655', 53, '2025-04-28 06:19:13', '2025-04-28 06:39:01'),
(17, 'Lutfor Rhaman Santa', 'r1232@gmail.com', '0133014540', 53, '2025-04-28 06:19:51', '2025-04-28 06:38:58'),
(18, 'Imran Khan', 'Im88@gmail.com', '0146565696', 53, '2025-04-28 08:13:16', '2025-04-29 05:55:48'),
(19, 'Jaman', 'jaman@gmail.com', '01478555', 53, '2025-05-18 04:00:10', '2025-05-18 06:29:22'),
(20, 'Code Canva', 'fdd@gmail.com', '015466465', 53, '2025-05-25 05:53:29', '2025-05-25 07:11:01');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `total` varchar(50) NOT NULL,
  `discount` varchar(50) NOT NULL,
  `vat` varchar(50) NOT NULL,
  `payable` varchar(50) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `total`, `discount`, `vat`, `payable`, `user_id`, `customer_id`, `created_at`, `updated_at`) VALUES
(8, '12', '0.24', '0.6', '12.36', 53, 7, '2025-05-26 03:41:17', '2025-05-26 03:41:17'),
(10, '120', '1.2', '6', '124.8', 53, 15, '2025-05-26 04:00:39', '2025-05-26 04:00:39'),
(11, '250', '7.5', '12.5', '255', 53, 7, '2025-05-26 07:00:52', '2025-05-26 07:00:52'),
(12, '2500', '500', '125', '2125', 53, 18, '2025-05-26 07:04:06', '2025-05-26 07:04:06'),
(13, '120', '12', '42', '150', 53, 13, '2025-05-27 01:18:08', '2025-05-27 01:18:08'),
(14, '120', '12', '6', '114', 53, 12, '2025-05-27 04:03:01', '2025-05-27 04:03:01'),
(15, '240', '24', '12', '228', 53, 7, '2025-05-27 05:20:55', '2025-05-27 05:20:55');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_products`
--

CREATE TABLE `invoice_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `qty` varchar(50) NOT NULL,
  `sale_price` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_products`
--

INSERT INTO `invoice_products` (`id`, `invoice_id`, `product_id`, `user_id`, `qty`, `sale_price`, `created_at`, `updated_at`) VALUES
(12, 8, 22, 53, '1', '12', '2025-05-26 03:41:17', '2025-05-26 03:41:17'),
(14, 10, 23, 53, '1', '120', '2025-05-26 04:00:39', '2025-05-26 04:00:39'),
(15, 11, 25, 53, '1', '250', '2025-05-26 07:00:52', '2025-05-26 07:00:52'),
(16, 12, 24, 53, '1', '2500', '2025-05-26 07:04:06', '2025-05-26 07:04:06'),
(17, 13, 23, 53, '1', '120', '2025-05-27 01:18:08', '2025-05-27 01:18:08'),
(18, 14, 23, 53, '1', '120', '2025-05-27 04:03:01', '2025-05-27 04:03:01'),
(19, 15, 23, 53, '2', '120', '2025-05-27 05:20:55', '2025-05-27 05:20:55');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(8, '2025_04_14_074759_create_categories_table', 2),
(9, '2025_04_14_074811_create_customers_table', 2),
(10, '2025_04_14_074837_create_products_table', 3),
(11, '2025_04_14_074847_create_invoices_table', 2),
(12, '2025_04_14_074901_create_invoice_products_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` varchar(50) NOT NULL,
  `unit` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `user_id`, `category_id`, `name`, `price`, `unit`, `image`, `created_at`, `updated_at`) VALUES
(21, 53, 22, 'vcbv', '12', '0', 'uploads/products/1745759714.png', '2025-04-27 12:28:09', '2025-05-18 02:15:28'),
(22, 53, 22, 'Tv', '12', '0', 'uploads/products/1745759324.jpg', '2025-04-27 07:08:44', '2025-05-26 03:41:17'),
(23, 53, 24, 'Asus', '120', '5', 'uploads/products/1745809730.jpg', '2025-04-27 21:08:25', '2025-05-27 05:20:55'),
(24, 53, 23, 'Honda', '2500', '3', 'uploads/products/1747640107.jpg', '2025-05-19 01:35:07', '2025-05-26 07:04:06'),
(25, 53, 25, 'Car', '250', '9', 'uploads/products/1748254921.jpg', '2025-05-26 04:22:01', '2025-05-26 07:00:52'),
(26, 53, 25, 'CPU', '25000', '12', 'uploads/products/1748409282.png', '2025-05-27 23:14:42', '2025-05-27 23:14:42');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('1GyY9KykiDezBdcjMysF2jcA6MaGWdqvZqQgZ0lN', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiYk9QRGY4MmZsc3QyTjNBejJvYlZoSGV0Q0g3ekRaaTFnQVFHbFlQNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9JbnZvaWNlTGlzdFBhZ2UiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjU6ImVtYWlsIjtzOjIyOiJsdXRmb3IyNTE1ODhAZ21haWwuY29tIjtzOjc6InVzZXJfaWQiO2k6NTM7fQ==', 1748433159),
('i20w5A2qXtNcTrOZiw3l2CQUobCj8qxSFrfxkJoI', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoia2ZKVlE3SlVsdEhIaEgwU0JSSW1qQnV5czZVQTNGbmJNMnhFRU9ndSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1748427680);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `otp` varchar(255) NOT NULL DEFAULT '0',
  `password` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `otp`, `password`, `mobile`, `remember_token`, `created_at`, `updated_at`) VALUES
(37, 'Admin', 'admin@gmail.com', NULL, '0', '1111', '01234567890', NULL, '2025-04-15 02:26:20', '2025-04-15 02:26:20'),
(49, 'Lutfor Rhaman Shanto', 'shanto01@gmail.com', NULL, '0', '$2y$12$R6ND9f2WFZ9cgkf72gvMTuFdk3eWVfMtXUuEweXMn1.EQeGa/lVrm', '2452454', NULL, '2025-04-20 09:12:30', '2025-04-20 09:12:30'),
(53, 'Lutfor Rhaman Shanto', 'lutfor251588@gmail.com', NULL, '0', '$2y$12$/rObOEvE7X3ZIEIljQCa.uR4feMG1kTtjMIBAZIKSTfpawe5.YA3e', '01798960834', NULL, '2025-04-21 08:51:35', '2025-05-28 05:52:39');

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
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_user_id_foreign` (`user_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customers_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_user_id_foreign` (`user_id`),
  ADD KEY `invoices_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `invoice_products`
--
ALTER TABLE `invoice_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_products_invoice_id_foreign` (`invoice_id`),
  ADD KEY `invoice_products_product_id_foreign` (`product_id`),
  ADD KEY `invoice_products_user_id_foreign` (`user_id`);

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
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_user_id_foreign` (`user_id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

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
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `invoice_products`
--
ALTER TABLE `invoice_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `invoice_products`
--
ALTER TABLE `invoice_products`
  ADD CONSTRAINT `invoice_products_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
