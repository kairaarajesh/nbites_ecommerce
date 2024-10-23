-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2024 at 06:30 AM
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
-- Database: `nbites`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `slug`, `photo`, `description`, `status`, `created_at`, `updated_at`) VALUES
(8, 'bites', 'bites', 'https://res.cloudinary.com/dspp2vqid/image/upload/v1729017649/x6t1a6ww2pmwn9gjew6u.png', NULL, 'active', '2024-10-15 13:10:50', '2024-10-15 13:10:50'),
(9, 'nbite', 'n', 'https://res.cloudinary.com/dspp2vqid/image/upload/v1729065571/nssajervncowybn0kfpx.png', NULL, 'active', '2024-10-15 13:52:27', '2024-10-16 02:29:32'),
(10, 'banner', 'banner', 'https://res.cloudinary.com/dspp2vqid/image/upload/v1729020271/hzr3jqrcqgg5ewlvfwgz.png', NULL, 'active', '2024-10-15 13:54:31', '2024-10-15 13:54:31'),
(11, 'banner', 'banner-2410160302-504', 'https://res.cloudinary.com/dspp2vqid/image/upload/v1729054980/kh1ygj0blgv5n82tprri.png', NULL, 'active', '2024-10-15 23:33:02', '2024-10-15 23:33:02');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(7, 'n bites', 'n-bites', 'active', '2024-10-10 06:06:22', '2024-10-10 06:06:22');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `status` enum('new','progress','delivered','cancel') NOT NULL DEFAULT 'new',
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `summary` text DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `is_parent` tinyint(1) NOT NULL DEFAULT 1,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `summary`, `photo`, `is_parent`, `parent_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(16, 'millet cookies', 'millet cookies', '<p>millet cookies<br></p>', 'http://127.0.0.1:8000/storage/photos/1/varagu5.jfif', 1, NULL, NULL, 'active', '2024-10-16 01:29:11', '2024-10-16 01:30:22'),
(18, 'sdsd', 'sdsd', '<p>dsd</p>', 'https://res.cloudinary.com/dspp2vqid/image/upload/v1729657535/zwqfpulcreas8upiuard.webp', 1, NULL, NULL, 'active', '2024-10-22 22:55:37', '2024-10-22 22:55:37');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `type` enum('fixed','percent') NOT NULL DEFAULT 'fixed',
  `value` decimal(20,2) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `status`, `created_at`, `updated_at`) VALUES
(1, 'abc123', 'fixed', 300.00, 'active', NULL, NULL),
(2, '111111', 'percent', 10.00, 'active', NULL, NULL),
(5, 'abcd', 'fixed', 250.00, 'active', '2020-08-17 20:54:58', '2020-08-17 20:54:58');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `medially_type` varchar(191) NOT NULL,
  `medially_id` bigint(20) UNSIGNED NOT NULL,
  `file_url` text NOT NULL,
  `file_name` varchar(191) NOT NULL,
  `file_type` varchar(191) DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `subject` text NOT NULL,
  `email` varchar(191) NOT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `message` longtext NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `name`, `subject`, `email`, `photo`, `phone`, `message`, `read_at`, `created_at`, `updated_at`) VALUES
(1, 'Prajwal Rai', 'About price', 'prajwal.iar@gmail.com', NULL, '9807009999', 'Hello sir i am from kathmandu nepal.', '2020-08-14 08:25:46', '2020-08-14 08:00:01', '2020-08-14 08:25:46');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_07_10_021010_create_brands_table', 1),
(5, '2020_07_10_025334_create_banners_table', 1),
(6, '2020_07_10_112147_create_categories_table', 1),
(7, '2020_07_11_063857_create_products_table', 1),
(8, '2020_07_12_073132_create_post_categories_table', 1),
(9, '2020_07_12_073701_create_post_tags_table', 1),
(10, '2020_07_12_083638_create_posts_table', 1),
(11, '2020_07_13_151329_create_messages_table', 1),
(12, '2020_07_14_023748_create_shippings_table', 1),
(13, '2020_07_15_054356_create_orders_table', 1),
(14, '2020_07_15_102626_create_carts_table', 1),
(15, '2020_07_16_041623_create_notifications_table', 1),
(16, '2020_07_16_053240_create_coupons_table', 1),
(17, '2020_07_23_143757_create_wishlists_table', 1),
(18, '2020_07_24_074930_create_product_reviews_table', 1),
(19, '2020_07_24_131727_create_post_comments_table', 1),
(20, '2020_08_01_143408_create_settings_table', 1),
(21, '2019_12_14_000001_create_personal_access_tokens_table', 2),
(22, '2020_06_14_000001_create_media_table', 2),
(23, '2023_06_21_164432_create_jobs_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('2145a8e3-687d-444a-8873-b3b2fb77a342', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-15 07:31:21', '2020-08-15 07:31:21');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(191) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_total` double(8,2) NOT NULL,
  `shipping_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon` double(8,2) DEFAULT NULL,
  `total_amount` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `payment_method` enum('cod','paypal') NOT NULL DEFAULT 'cod',
  `payment_status` enum('paid','unpaid') NOT NULL DEFAULT 'unpaid',
  `status` enum('new','process','delivered','cancel') NOT NULL DEFAULT 'new',
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `country` varchar(191) NOT NULL,
  `post_code` varchar(191) DEFAULT NULL,
  `address1` text NOT NULL,
  `address2` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `sub_total`, `shipping_id`, `coupon`, `total_amount`, `quantity`, `payment_method`, `payment_status`, `status`, `first_name`, `last_name`, `email`, `phone`, `country`, `post_code`, `address1`, `address2`, `created_at`, `updated_at`) VALUES
(2, 'ORD-YFF8BF0YBK', 2, 1939.03, 1, NULL, 2039.03, 1, 'cod', 'unpaid', 'delivered', 'Sandhya', 'Rai', 'user@gmail.com', '90000000990', 'NP', NULL, 'Lalitpur', NULL, '2020-08-14 22:14:49', '2020-08-14 22:15:19');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('picknow@gmail.com', '$2y$10$G84pf7HCoBh/..axtIOLxO/x4W.DChp9Qv/cIR4Cw.RFA7aK8NHWO', '2024-10-10 07:09:56'),
('picknow@gmail.com', '$2y$10$G84pf7HCoBh/..axtIOLxO/x4W.DChp9Qv/cIR4Cw.RFA7aK8NHWO', '2024-10-10 07:09:56');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\User', 42, 'auth_token', 'f5ac71bf58e23c5b374131a0b2e9dcf57aa3130f16d5f85cb3dbbe7728f15d4c', '[\"*\"]', NULL, NULL, '2024-10-18 07:28:25', '2024-10-18 07:28:25'),
(2, 'App\\User', 43, 'auth_token', 'bc014fe9a024ed66a4cba43999c7cc97369cd1f2d46cec93cffbbcf8d913a36a', '[\"*\"]', NULL, NULL, '2024-10-18 10:20:56', '2024-10-18 10:20:56'),
(3, 'App\\User', 44, 'auth_token', '6ddf291a8ef179f280a072d8e8013534529ff5a75c05678be87a48d514cdb4bb', '[\"*\"]', NULL, NULL, '2024-10-18 10:31:13', '2024-10-18 10:31:13');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `summary` text NOT NULL,
  `description` longtext DEFAULT NULL,
  `quote` text DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `tags` varchar(191) DEFAULT NULL,
  `post_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_tag_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `summary`, `description`, `quote`, `photo`, `tags`, `post_cat_id`, `post_tag_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(5, 'The standard Lorem Ipsum passage,', 'the-standard-lorem-ipsum-passage', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,</span><br></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">The standard Lorem Ipsum passage, used since the 1500s</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p>', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,</span><br></p>', '/storage/photos/1/Blog/blog2.jpg', ',Enjoy,2020,Visit nepal 2020', 1, NULL, 1, 'active', '2020-08-15 06:58:45', '2020-08-15 06:58:45'),
(6, 'Lorem Ipsum is simply', 'lorem-ipsum-is-simply', '<p><strong style=\"margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem Ipsum</strong><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry.</span><br></p>', '<h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and</p><h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and</p><h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and</p><hr><h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and</p><h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and</p>', NULL, '/storage/photos/1/Blog/blog3.jpg', 'Enjoy,2020', 2, NULL, 1, 'active', '2020-08-17 20:54:19', '2020-08-17 20:54:19');

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Travel', 'contrary', 'active', '2020-08-14 01:51:03', '2020-08-14 01:51:39'),
(2, 'Electronics', 'richard', 'active', '2020-08-14 01:51:22', '2020-08-14 01:52:00');

-- --------------------------------------------------------

--
-- Table structure for table `post_comments`
--

CREATE TABLE `post_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `comment` text NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `replied_comment` text DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_comments`
--

INSERT INTO `post_comments` (`id`, `user_id`, `post_id`, `comment`, `status`, `replied_comment`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'Testing comment edited', 'active', NULL, NULL, '2020-08-14 07:08:42', '2020-08-15 06:59:58'),
(2, NULL, NULL, 'testing 2', 'active', NULL, 1, '2020-08-14 07:11:03', '2020-08-14 07:11:03'),
(3, 2, NULL, 'That\'s cool', 'active', NULL, 2, '2020-08-14 07:12:27', '2020-08-14 07:12:27'),
(4, 1, NULL, 'nice', 'active', NULL, NULL, '2020-08-15 07:31:19', '2020-08-15 07:31:19'),
(5, NULL, 5, 'nice blog', 'active', NULL, NULL, '2020-08-15 07:51:01', '2020-08-15 07:51:01'),
(6, 2, NULL, 'nice', 'active', NULL, NULL, '2020-08-17 21:13:29', '2020-08-17 21:13:29'),
(7, 2, NULL, 'really', 'active', NULL, 6, '2020-08-17 21:13:51', '2020-08-17 21:13:51');

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE `post_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tags`
--

INSERT INTO `post_tags` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Enjoy', 'enjoy', 'active', '2020-08-14 01:53:52', '2020-08-14 01:53:52'),
(4, 'Tag', 'tag', 'active', '2020-08-15 06:59:31', '2020-08-15 06:59:31');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `summary` text DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `photo` text NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 1,
  `size` varchar(191) DEFAULT 'M',
  `condition` enum('default','new','hot') NOT NULL DEFAULT 'default',
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `price` double(8,2) NOT NULL,
  `discount` double(8,2) NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `child_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `size`, `condition`, `status`, `price`, `discount`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(13, 'Sorghum Millet Biscuit (Cholam)', 'sorghum-millet-biscuit-cholam', '<span style=\"color: rgb(51, 51, 51); font-family: Poppins, sans-serif; font-size: 14px;\">Cholam cookies are made from sorghum, a cereal grain that is a staple crop in India. Sorghum is also known as jowar in Hindi, and is a gluten-free grain that is safe for people with celiac disease or gluten allergies. Cholam cookies are chewy, nutty, and slightly sweet, and pair well with tea or milk.</span>', '<p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: Poppins, sans-serif; font-size: 14px;\">Cholam, also known as jowar, cookies are a healthy snack that can be part of many diets, including gluten-free, vegan, and low-fat. They are high in fiber and contain many minerals, including calcium, which is good for bones and teeth. Cholam cookies can be beneficial for a number of reasons.<br style=\"margin: 0px; padding: 0px;\"></p><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: Poppins, sans-serif; font-size: 14px;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700; font-family: var(--primary-font); font-size: 0.875rem;\">Benefits :</span><br style=\"margin: 0px; padding: 0px;\"></p><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: Poppins, sans-serif; font-size: 14px;\"><span style=\"margin: 0px; padding: 0px; font-family: var(--primary-font); font-size: 0.875rem;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\">Eye health:</span>&nbsp;Cholam contains antioxidants that can protect the eyes from damage and prevent vision disorders&nbsp;</span></p><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: Poppins, sans-serif; font-size: 14px;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\">Bone health:</span>&nbsp;Cholam is a good source of calcium, which can help strengthen bones in children&nbsp;</p><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: Poppins, sans-serif; font-size: 14px;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\">Blood sugar:&nbsp;</span>Cholam can help lower blood sugar levels in people with diabetes&nbsp;</p><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: Poppins, sans-serif; font-size: 14px;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\">Heart health:&nbsp;</span>Cholam is cholesterol and sodium free&nbsp;</p><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: Poppins, sans-serif; font-size: 14px;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\">Blood pressure:</span>&nbsp;Cholam is rich in potassium, which can help lower blood pressure&nbsp;</p><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: Poppins, sans-serif; font-size: 14px;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\">Digestion:</span>&nbsp;Cholam is high in fiber, which can help with digestion and constipation&nbsp;</p><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: Poppins, sans-serif; font-size: 14px;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\">Protein:&nbsp;</span>Cholam is a good source of protein, which helps build muscles, skin, and organs&nbsp;</p><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: Poppins, sans-serif; font-size: 14px;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\">Weight loss:</span>&nbsp;Cholam\'s high fiber content can help with weight loss</p><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: Poppins, sans-serif; font-size: 14px;\"><br style=\"margin: 0px; padding: 0px;\"></p><p class=\"selectable-text copyable-text x15bjb6t x1n2onr6\" dir=\"ltr\" style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: Poppins, sans-serif; font-size: 14px;\"><span class=\"selectable-text copyable-text\" style=\"margin: 0px; padding: 0px; white-space-collapse: preserve;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\">Why Choose the Nbitez Millet Cookies?</span></span></p><p class=\"selectable-text copyable-text x15bjb6t x1n2onr6\" dir=\"ltr\" style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: Poppins, sans-serif; font-size: 14px;\"><span class=\"selectable-text copyable-text\" style=\"margin: 0px; padding: 0px; white-space-collapse: preserve;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\">Protein: </span>Ragi is a natural source of protein that helps with muscle growth and repair. </span></p><p class=\"selectable-text copyable-text x15bjb6t x1n2onr6\" dir=\"ltr\" style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: Poppins, sans-serif; font-size: 14px;\"><span class=\"selectable-text copyable-text\" style=\"margin: 0px; padding: 0px; white-space-collapse: preserve;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\">Calcium and iron: </span>Ragi is rich in calcium and iron, which helps strengthen bones and teeth. </span></p><p class=\"selectable-text copyable-text x15bjb6t x1n2onr6\" dir=\"ltr\" style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: Poppins, sans-serif; font-size: 14px;\"><span class=\"selectable-text copyable-text\" style=\"margin: 0px; padding: 0px; white-space-collapse: preserve;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\">Fiber: </span>Ragi\'s high fiber content promotes healthy digestion and can help with weight management. </span></p><p class=\"selectable-text copyable-text x15bjb6t x1n2onr6\" dir=\"ltr\" style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: Poppins, sans-serif; font-size: 14px;\"><span class=\"selectable-text copyable-text\" style=\"margin: 0px; padding: 0px; white-space-collapse: preserve;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\">Energy: </span>Ragi is a traditional staple diet that can provide long-lasting energy. </span></p><p class=\"selectable-text copyable-text x15bjb6t x1n2onr6\" dir=\"ltr\" style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: Poppins, sans-serif; font-size: 14px;\"><span class=\"selectable-text copyable-text\" style=\"margin: 0px; padding: 0px; white-space-collapse: preserve;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\">Nutrients: </span>Ragi cookies are packed with essential nutrients, including vitamins and minerals.</span></p>', 'https://res.cloudinary.com/dspp2vqid/image/upload/v1729058830/iohwokqhcamrpgdxhkqn.webp', 2, '', 'new', 'active', 65.00, 2.00, 1, 16, NULL, 7, '2024-10-15 14:01:36', '2024-10-16 02:40:32'),
(14, 'Kodo Millet Biscuit (Varagu)', 'kodo-millet-biscuit-varagu', '<p><span style=\"color: rgb(51, 51, 51); font-family: Poppins, sans-serif; font-size: 14px;\">Varagu millet biscuits, also known as kodo millet cookies, are a healthy snack made from kodo millet flour. Kodo millet is a grain that is high in protein, fiber, iron, magnesium, phosphorous, and potassium.</span><br></p>', '<p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: Poppins, sans-serif; font-size: 14px;\"><span style=\"margin: 0px; padding: 0px; font-family: Verdana;\">Varagu millet biscuits, also known as kodo millet cookies, are&nbsp;</span><mark class=\"QVRyCf\" style=\"margin: 0px; padding: 0px 2px; border-radius: 4px;\"><span style=\"margin: 0px; padding: 0px; font-family: Verdana;\">a&nbsp;<span style=\"margin: 0px; padding: 0px; font-weight: 700;\">healthy snack made from kodo millet flour</span></span></mark><span style=\"margin: 0px; padding: 0px; font-family: Verdana;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\">.</span>&nbsp;Kodo millet is a grain that is high in protein, fiber, iron, magnesium, phosphorous, and potassium.&nbsp;Helps to Reduce Cholesterol &amp; Lowers Blood Pressure. Helps in the Development &amp; Repair of Body Cells &amp; Tissues.</span></p><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: Poppins, sans-serif; font-size: 14px;\"><span style=\"margin: 0px; padding: 0px; font-family: var(--primary-font); font-size: 0.875rem; font-weight: 700;\">Benefits :</span><span style=\"margin: 0px; padding: 0px; font-family: var(--primary-font); font-size: 0.875rem;\">&nbsp;</span><br style=\"margin: 0px; padding: 0px;\"></p><ol style=\"margin-right: 0px; margin-left: 0px; padding: 0px 0px 0px 2rem; list-style-position: initial; list-style-image: initial; color: rgb(51, 51, 51); font-family: Poppins, sans-serif; font-size: 14px;\"><li style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; color: rgb(0, 29, 53); font-family: &quot;Comic Sans MS&quot;; font-size: 18px;\">Helps to reduce cholesterol &amp; lowers blood pressure.</span></li><li style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; color: rgb(0, 29, 53); font-family: &quot;Comic Sans MS&quot;; font-size: 18px;\">Rich in Calcium, Protein, Iron</span></li><li style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; color: rgb(0, 29, 53); font-family: &quot;Comic Sans MS&quot;; font-size: 18px;\">Excellent source of dietary Fiber,</span></li></ol><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: Poppins, sans-serif; font-size: 14px;\"><span style=\"margin: 0px; padding: 0px; color: rgb(0, 29, 53); font-family: &quot;Comic Sans MS&quot;; font-size: 18px;\"><br style=\"margin: 0px; padding: 0px;\"></span></p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: Poppins, sans-serif; font-size: 14px;\"><span style=\"margin: 0px; padding: 0px; color: rgb(0, 29, 53); font-family: &quot;Comic Sans MS&quot;; font-size: 18px;\"></span></p><h1 style=\"margin-right: 0px; margin-bottom: 4.4pt; margin-left: 0px; padding: 0px; font-weight: 700; line-height: 12pt; font-family: Poppins, sans-serif; color: rgb(51, 51, 51); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"margin: 0px; padding: 0px; font-size: 14px;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px;\">Why Choose the Nbitez Millet Cookies?</span></p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px;\"></span></p><ul jscontroller=\"M2ABbc\" jsaction=\"jZtoLb:SaHfyb\" data-hveid=\"CCYQAQ\" data-ved=\"2ahUKEwjVuIrVkoGJAxXnwTgGHSAcH3oQm_YKegQIJhAB\" style=\"margin: 10px 0px 20px; padding: 0px 0px 0px 24px; list-style: none; font-size: 16px; line-height: 22px; color: rgb(0, 29, 53); font-family: &quot;Google Sans&quot;, &quot;Helvetica Neue&quot;, sans-serif;\"><li class=\"PZPZlf\" data-attrid=\"SGEListItem\" style=\"margin: 0px 0px 8px; padding: 0px 0px 0px 4px; position: relative; list-style: inherit;\">Protein:<span style=\"margin: 0px; padding: 0px; font-weight: 400;\">&nbsp;Ragi is a natural source of protein that helps with muscle growth and repair.</span><span class=\"UV3uM\" style=\"margin: 0px; padding: 0px; font-weight: 400; text-wrap: nowrap;\">&nbsp;<div data-cid=\"_YGIGZ9WINeeD4-EPoLj80Ac_49\" class=\"NPrrbc\" style=\"margin: 0px 6px 0px 0px; padding: 0px; display: inline-flex; vertical-align: middle;\"><div jsname=\"HtgYJd\" class=\"BMebGe btku5b k0Jjg fCrZyc LwdV0e FR7ZSc OJeuxf\" jsaction=\"click:trigger.YbaXcb;\" aria-label=\"Expand\" role=\"button\" tabindex=\"0\" data-hveid=\"CDIQAQ\" data-ved=\"2ahUKEwjVuIrVkoGJAxXnwTgGHSAcH3oQ3fYKegQIMhAB\" style=\"margin: 0px; padding: 0px; display: inline-block; vertical-align: middle; outline: 0px; -webkit-tap-highlight-color: transparent; color: var(--rrJJUc);\"><div class=\"niO4u\" style=\"margin: 0px auto; padding: 0px; display: flex; justify-content: center; position: relative; align-items: stretch; width: 28px; outline: 1px solid var(--Yi4Nb); background-color: transparent; border-radius: 9999px; outline-offset: -1px; height: 20px; min-height: 20px;\"><div class=\"kHtcsd\" style=\"margin: 0px; padding: 0px; display: flex; align-items: center; justify-content: center; width: 28px; border-radius: 9999px; height: 20px;\"><span class=\"d3o3Ad gJdC8e Hkv2Pe\" style=\"margin: 0px; padding: 0px; color: rgb(11, 87, 208); display: flex; align-items: center; background: unset !important;\"><span class=\"iPjmzb Sorfoc gNGSDf\" style=\"margin: 0px; padding: 0px; display: flex; height: unset; rotate: 135deg;\"><span class=\"z1asCe Sb7k4e\" style=\"margin: 0px; padding: 0px; display: inline-block; fill: currentcolor; height: 18px; line-height: 18px; position: relative; width: 18px;\"><svg focusable=\"false\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 24 24\"><path d=\"M3.9 12c0-1.71 1.39-3.1 3.1-3.1h4V7H7c-2.76 0-5 2.24-5 5s2.24 5 5 5h4v-1.9H7c-1.71 0-3.1-1.39-3.1-3.1zM8 13h8v-2H8v2zm9-6h-4v1.9h4c1.71 0 3.1 1.39 3.1 3.1s-1.39 3.1-3.1 3.1h-4V17h4c2.76 0 5-2.24 5-5s-2.24-5-5-5z\"></path></svg></span></span></span></div></div></div></div></span><div class=\"acn1Z Kwoiqd\" style=\"margin: 0px; padding: 0px; font-weight: 400; display: inline;\"><div class=\"Kwoiqd\" style=\"margin: 0px; padding: 0px;\"></div></div></li><li class=\"PZPZlf\" data-attrid=\"SGEListItem\" style=\"margin: 0px 0px 8px; padding: 0px 0px 0px 4px; position: relative; list-style: inherit;\">Calcium and iron:<span style=\"margin: 0px; padding: 0px; font-weight: 400;\">&nbsp;Ragi is rich in calcium and iron, which helps strengthen bones and teeth.<span class=\"UV3uM\" style=\"margin: 0px; padding: 0px; text-wrap: nowrap;\">&nbsp;<div data-cid=\"_YGIGZ9WINeeD4-EPoLj80Ac_51\" class=\"NPrrbc\" style=\"margin: 0px 6px 0px 0px; padding: 0px; display: inline-flex; vertical-align: middle;\"><div jsname=\"HtgYJd\" class=\"BMebGe btku5b k0Jjg fCrZyc LwdV0e FR7ZSc OJeuxf\" jsaction=\"click:trigger.YbaXcb;\" aria-label=\"Expand\" role=\"button\" tabindex=\"0\" data-hveid=\"CDUQAQ\" data-ved=\"2ahUKEwjVuIrVkoGJAxXnwTgGHSAcH3oQ3fYKegQINRAB\" style=\"margin: 0px; padding: 0px; display: inline-block; vertical-align: middle; outline: 0px; -webkit-tap-highlight-color: transparent; color: var(--rrJJUc);\"><div class=\"niO4u\" style=\"margin: 0px auto; padding: 0px; display: flex; justify-content: center; position: relative; align-items: stretch; width: 28px; outline: 1px solid var(--Yi4Nb); background-color: transparent; border-radius: 9999px; outline-offset: -1px; height: 20px; min-height: 20px;\"><div class=\"kHtcsd\" style=\"margin: 0px; padding: 0px; display: flex; align-items: center; justify-content: center; width: 28px; border-radius: 9999px; height: 20px;\"><span class=\"d3o3Ad gJdC8e Hkv2Pe\" style=\"margin: 0px; padding: 0px; color: rgb(11, 87, 208); display: flex; align-items: center; background: unset !important;\"><span class=\"iPjmzb Sorfoc gNGSDf\" style=\"margin: 0px; padding: 0px; display: flex; height: unset; rotate: 135deg;\"><span class=\"z1asCe Sb7k4e\" style=\"margin: 0px; padding: 0px; display: inline-block; fill: currentcolor; height: 18px; line-height: 18px; position: relative; width: 18px;\"><svg focusable=\"false\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 24 24\"><path d=\"M3.9 12c0-1.71 1.39-3.1 3.1-3.1h4V7H7c-2.76 0-5 2.24-5 5s2.24 5 5 5h4v-1.9H7c-1.71 0-3.1-1.39-3.1-3.1zM8 13h8v-2H8v2zm9-6h-4v1.9h4c1.71 0 3.1 1.39 3.1 3.1s-1.39 3.1-3.1 3.1h-4V17h4c2.76 0 5-2.24 5-5s-2.24-5-5-5z\"></path></svg></span></span></span></div></div></div></div></span><div class=\"acn1Z Kwoiqd\" style=\"margin: 0px; padding: 0px; display: inline;\"><div class=\"Kwoiqd\" style=\"margin: 0px; padding: 0px;\"></div></div></span></li><li class=\"PZPZlf\" data-attrid=\"SGEListItem\" style=\"margin: 0px 0px 8px; padding: 0px 0px 0px 4px; position: relative; list-style: inherit;\">Fiber:<span style=\"margin: 0px; padding: 0px; font-weight: 400;\">&nbsp;Ragi\'s high fiber content promotes healthy digestion and can help with weight management.<span class=\"UV3uM\" style=\"margin: 0px; padding: 0px; text-wrap: nowrap;\">&nbsp;<div data-cid=\"_YGIGZ9WINeeD4-EPoLj80Ac_47\" class=\"NPrrbc\" style=\"margin: 0px 6px 0px 0px; padding: 0px; display: inline-flex; vertical-align: middle;\"><div jsname=\"HtgYJd\" class=\"BMebGe btku5b k0Jjg fCrZyc LwdV0e FR7ZSc OJeuxf\" jsaction=\"click:trigger.YbaXcb;\" aria-label=\"Expand\" role=\"button\" tabindex=\"0\" data-hveid=\"CCwQAQ\" data-ved=\"2ahUKEwjVuIrVkoGJAxXnwTgGHSAcH3oQ3fYKegQILBAB\" style=\"margin: 0px; padding: 0px; display: inline-block; vertical-align: middle; outline: 0px; -webkit-tap-highlight-color: transparent; color: var(--rrJJUc);\"><div class=\"niO4u\" style=\"margin: 0px auto; padding: 0px; display: flex; justify-content: center; position: relative; align-items: stretch; width: 28px; outline: 1px solid var(--Yi4Nb); background-color: transparent; border-radius: 9999px; outline-offset: -1px; height: 20px; min-height: 20px;\"><div class=\"kHtcsd\" style=\"margin: 0px; padding: 0px; display: flex; align-items: center; justify-content: center; width: 28px; border-radius: 9999px; height: 20px;\"><span class=\"d3o3Ad gJdC8e Hkv2Pe\" style=\"margin: 0px; padding: 0px; color: rgb(11, 87, 208); display: flex; align-items: center; background: unset !important;\"><span class=\"iPjmzb Sorfoc gNGSDf\" style=\"margin: 0px; padding: 0px; display: flex; height: unset; rotate: 135deg;\"><span class=\"z1asCe Sb7k4e\" style=\"margin: 0px; padding: 0px; display: inline-block; fill: currentcolor; height: 18px; line-height: 18px; position: relative; width: 18px;\"><svg focusable=\"false\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 24 24\"><path d=\"M3.9 12c0-1.71 1.39-3.1 3.1-3.1h4V7H7c-2.76 0-5 2.24-5 5s2.24 5 5 5h4v-1.9H7c-1.71 0-3.1-1.39-3.1-3.1zM8 13h8v-2H8v2zm9-6h-4v1.9h4c1.71 0 3.1 1.39 3.1 3.1s-1.39 3.1-3.1 3.1h-4V17h4c2.76 0 5-2.24 5-5s-2.24-5-5-5z\"></path></svg></span></span></span></div></div></div></div></span><div class=\"acn1Z Kwoiqd\" style=\"margin: 0px; padding: 0px; display: inline;\"><div class=\"Kwoiqd\" style=\"margin: 0px; padding: 0px;\"></div></div></span></li><li class=\"PZPZlf\" data-attrid=\"SGEListItem\" style=\"margin: 0px 0px 8px; padding: 0px 0px 0px 4px; position: relative; list-style: inherit;\">Energy:<span style=\"margin: 0px; padding: 0px; font-weight: 400;\">&nbsp;Ragi is a traditional staple diet that can provide long-lasting energy.<span class=\"UV3uM\" style=\"margin: 0px; padding: 0px; text-wrap: nowrap;\">&nbsp;<div data-cid=\"_YGIGZ9WINeeD4-EPoLj80Ac_45\" class=\"NPrrbc\" style=\"margin: 0px 6px 0px 0px; padding: 0px; display: inline-flex; vertical-align: middle;\"><div jsname=\"HtgYJd\" class=\"BMebGe btku5b k0Jjg fCrZyc LwdV0e FR7ZSc OJeuxf\" jsaction=\"click:trigger.YbaXcb;\" aria-label=\"Expand\" role=\"button\" tabindex=\"0\" data-hveid=\"CCkQAQ\" data-ved=\"2ahUKEwjVuIrVkoGJAxXnwTgGHSAcH3oQ3fYKegQIKRAB\" style=\"margin: 0px; padding: 0px; display: inline-block; vertical-align: middle; outline: 0px; -webkit-tap-highlight-color: transparent; color: var(--rrJJUc);\"><div class=\"niO4u\" style=\"margin: 0px auto; padding: 0px; display: flex; justify-content: center; position: relative; align-items: stretch; width: 28px; outline: 1px solid var(--Yi4Nb); background-color: transparent; border-radius: 9999px; outline-offset: -1px; height: 20px; min-height: 20px;\"><div class=\"kHtcsd\" style=\"margin: 0px; padding: 0px; display: flex; align-items: center; justify-content: center; width: 28px; border-radius: 9999px; height: 20px;\"><span class=\"d3o3Ad gJdC8e Hkv2Pe\" style=\"margin: 0px; padding: 0px; color: rgb(11, 87, 208); display: flex; align-items: center; background: unset !important;\"><span class=\"iPjmzb Sorfoc gNGSDf\" style=\"margin: 0px; padding: 0px; display: flex; height: unset; rotate: 135deg;\"><span class=\"z1asCe Sb7k4e\" style=\"margin: 0px; padding: 0px; display: inline-block; fill: currentcolor; height: 18px; line-height: 18px; position: relative; width: 18px;\"><svg focusable=\"false\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 24 24\"><path d=\"M3.9 12c0-1.71 1.39-3.1 3.1-3.1h4V7H7c-2.76 0-5 2.24-5 5s2.24 5 5 5h4v-1.9H7c-1.71 0-3.1-1.39-3.1-3.1zM8 13h8v-2H8v2zm9-6h-4v1.9h4c1.71 0 3.1 1.39 3.1 3.1s-1.39 3.1-3.1 3.1h-4V17h4c2.76 0 5-2.24 5-5s-2.24-5-5-5z\"></path></svg></span></span></span></div></div></div></div></span><div class=\"acn1Z Kwoiqd\" style=\"margin: 0px; padding: 0px; display: inline;\"><div class=\"Kwoiqd\" style=\"margin: 0px; padding: 0px;\"></div></div></span></li><div class=\"bsmXxe\" id=\"YGIGZ9WINeeD4-EPoLj80Ac__69\" style=\"margin: 0px; padding: 0px; display: contents;\"><li class=\"PZPZlf\" data-attrid=\"SGEListItem\" style=\"margin: 0px 0px 20px; padding: 0px 0px 0px 4px; position: relative; list-style: inherit;\">Nutrients:&nbsp;<span style=\"margin: 0px; padding: 0px; font-weight: normal;\">Ragi cookies are packed with essential nutrients, including vitamins and minerals.</span></li></div></ul></span></h1>', 'https://res.cloudinary.com/dspp2vqid/image/upload/v1729021414/ju0xivyiibioqll0aupj.jpg', 1, '', 'new', 'active', 64.00, 3.00, 1, 16, NULL, 7, '2024-10-15 14:13:34', '2024-10-16 02:40:13');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rate` tinyint(4) NOT NULL DEFAULT 0,
  `review` text DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `user_id`, `product_id`, `rate`, `review`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 5, 'nice product', 'active', '2020-08-15 07:44:05', '2020-08-15 07:44:05'),
(2, 2, NULL, 5, 'nice', 'active', '2020-08-17 21:08:14', '2020-08-17 21:18:31');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` longtext NOT NULL,
  `short_des` text NOT NULL,
  `logo` varchar(191) NOT NULL,
  `photo` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `description`, `short_des`, `logo`, `photo`, `address`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspiciatis unde sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspiciatis unde omnis iste natus error sit voluptatem Excepteu\r\n\r\n                            sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspiciatis Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspi deserunt mollit anim id est laborum. sed ut perspi.', 'Praesent dapibus, neque id cursus ucibus, tortor neque egestas augue, magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus.', 'http://127.0.0.1:8000/storage/photos/1/varagu5.jfif', 'http://127.0.0.1:8000/storage/photos/1/1612870846-feb-14.jpeg', 'NO. 342 - London Oxford Street, 012 United Kingdom', '+91 7092771118', 'nbites@gmail.com', NULL, '2024-10-22 06:52:53');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `type`, `price`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Kahtmandu', 100.00, 'active', '2020-08-14 04:22:17', '2020-08-14 04:22:17'),
(2, 'Out of valley', 300.00, 'active', '2020-08-14 04:22:41', '2020-08-14 04:22:41'),
(3, 'Pokhara', 400.00, 'active', '2020-08-15 06:54:04', '2020-08-15 06:54:04'),
(4, 'Dharan', 400.00, 'active', '2020-08-17 20:50:48', '2020-08-17 20:50:48');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `provider` varchar(191) DEFAULT NULL,
  `provider_id` varchar(191) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `role`, `provider`, `provider_id`, `status`, `remember_token`, `created_at`, `updated_at`, `phone`) VALUES
(1, 'N-Bites', 'admin@gmail.com', NULL, '$2y$10$GOGIJdzJydYJ5nAZ42iZNO3IL1fdvXoSPdUOH3Ajy5hRmi0xBmTzm', 'http://127.0.0.1:8000/storage/photos/1/varagu5.jfif', 'admin', NULL, NULL, 'active', '5xrlBoqFM96LB7NtZCGcWUvGz6syxjs0hRHXs9SkLquJ3us2rsPwuRzwKzNI', NULL, '2024-10-19 04:00:47', NULL),
(2, 'User', 'user@gmail.com', NULL, '$2y$10$10jB2lupSfvAUfocjguzSeN95LkwgZJUM7aQBdb2Op7XzJ.BhNoHq', '/storage/photos/1/users/user2.jpg', 'user', NULL, NULL, 'active', NULL, NULL, '2020-08-15 07:30:07', NULL),
(40, 'John Doe', 'janedoe@example.com', NULL, '$2y$10$9asOvzJRJhjb./UahUYfSuXqH0Fg7TDN9onWVNti0mE4eJGiyX/De', NULL, 'user', NULL, NULL, 'active', NULL, '2024-10-18 06:46:07', '2024-10-18 06:46:07', '9876543210'),
(41, 'rajesh', 'raje123@gmail.com', NULL, '$2y$10$YVqwXnZ5MSYOoBqj3a31Fe9ZlUUZu7xmKyuIoF3FHSDIG6YTwCYhu', NULL, 'user', NULL, NULL, 'active', NULL, '2024-10-18 06:53:48', '2024-10-18 06:53:48', '9080411050'),
(44, 'lokesh', 'lokesh@gmail.com', NULL, '$2y$10$Di8Y9DFQGXVOqXONckDZcuwWP3VXpz1hqsWiwQGm7M.P0Taq1BNVS', NULL, 'user', NULL, NULL, 'active', NULL, '2024-10-18 10:31:13', '2024-10-18 10:31:13', '9624556635');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `banners_slug_unique` (`slug`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_order_id_foreign` (`order_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`),
  ADD KEY `categories_added_by_foreign` (`added_by`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_medially_type_medially_id_index` (`medially_type`,`medially_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_shipping_id_foreign` (`shipping_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_post_cat_id_foreign` (`post_cat_id`),
  ADD KEY `posts_post_tag_id_foreign` (`post_tag_id`),
  ADD KEY `posts_added_by_foreign` (`added_by`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_categories_slug_unique` (`slug`);

--
-- Indexes for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_comments_user_id_foreign` (`user_id`),
  ADD KEY `post_comments_post_id_foreign` (`post_id`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_tags_slug_unique` (`slug`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_cat_id_foreign` (`cat_id`),
  ADD KEY `products_child_cat_id_foreign` (`child_cat_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_cart_id_foreign` (`cart_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `post_comments`
--
ALTER TABLE `post_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_shipping_id_foreign` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_cat_id_foreign` FOREIGN KEY (`post_cat_id`) REFERENCES `post_categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_tag_id_foreign` FOREIGN KEY (`post_tag_id`) REFERENCES `post_tags` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD CONSTRAINT `post_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `post_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_child_cat_id_foreign` FOREIGN KEY (`child_cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
