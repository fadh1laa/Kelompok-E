CREATE TABLE `users` (
  `id` bigint PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) UNIQUE NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `phone` varchar(20),
  `role` varchar(30) NOT NULL DEFAULT 'resident',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
);

CREATE TABLE `rusunawa` (
  `id` bigint PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `location` varchar(200) NOT NULL,
  `description` text,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
);

CREATE TABLE `units` (
  `id` bigint PRIMARY KEY AUTO_INCREMENT,
  `rusunawa_id` bigint NOT NULL,
  `unit_number` varchar(30) NOT NULL,
  `floor` int NOT NULL,
  `area_m2` decimal(6,2) NOT NULL,
  `bedrooms` int NOT NULL,
  `monthly_price` decimal(12,2) NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'available',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
);

CREATE TABLE `facilities` (
  `id` bigint PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
);

CREATE TABLE `rusunawa_facilities` (
  `id` bigint PRIMARY KEY AUTO_INCREMENT,
  `rusunawa_id` bigint NOT NULL,
  `facility_id` bigint NOT NULL,
  `created_at` timestamp NOT NULL
);

CREATE TABLE `applications` (
  `id` bigint PRIMARY KEY AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `unit_id` bigint NOT NULL,
  `application_number` varchar(30) UNIQUE NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'draft',
  `submitted_at` timestamp,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
);

CREATE TABLE `application_documents` (
  `id` bigint PRIMARY KEY AUTO_INCREMENT,
  `application_id` bigint NOT NULL,
  `document_type` varchar(50) NOT NULL,
  `file_url` text NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
);

CREATE TABLE `application_histories` (
  `id` bigint PRIMARY KEY AUTO_INCREMENT,
  `application_id` bigint NOT NULL,
  `status` varchar(30) NOT NULL,
  `note` text,
  `changed_at` timestamp NOT NULL
);

CREATE TABLE `reviews` (
  `id` bigint PRIMARY KEY AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `rusunawa_id` bigint NOT NULL,
  `rating` decimal(2,1) NOT NULL,
  `comment` text,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  UNIQUE (`user_id`, `rusunawa_id`)
);

ALTER TABLE `units` ADD FOREIGN KEY (`rusunawa_id`) REFERENCES `rusunawa` (`id`);

ALTER TABLE `rusunawa_facilities` ADD FOREIGN KEY (`rusunawa_id`) REFERENCES `rusunawa` (`id`);

ALTER TABLE `rusunawa_facilities` ADD FOREIGN KEY (`facility_id`) REFERENCES `facilities` (`id`);

ALTER TABLE `applications` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `applications` ADD FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`);

ALTER TABLE `application_documents` ADD FOREIGN KEY (`application_id`) REFERENCES `applications` (`id`);

ALTER TABLE `reviews` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `reviews` ADD FOREIGN KEY (`rusunawa_id`) REFERENCES `rusunawa` (`id`);

ALTER TABLE `application_histories` ADD FOREIGN KEY (`application_id`) REFERENCES `applications` (`id`);
