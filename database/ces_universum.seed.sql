SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
USE ces_universum;
SET time_zone = "+00:00";

CREATE TABLE `activities` (
  `id` int NOT NULL,
  `name` varchar(55) COLLATE utf8mb4_general_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `objetive` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `evidence` longtext COLLATE utf8mb4_general_ci,
  `indicators` longtext COLLATE utf8mb4_general_ci,
  `slug` varchar(55) COLLATE utf8mb4_general_ci NOT NULL,
  `dba` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dba2` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `performance_levels` longtext COLLATE utf8mb4_general_ci,
  `reinforce` tinyint NOT NULL DEFAULT '0',
  `zone` int NOT NULL,
  `subject_id` int DEFAULT NULL,
  `grade_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `activities` (`id`, `name`, `description`, `objetive`, `evidence`, `indicators`, `slug`, `dba`, `dba2`, `performance_levels`, `reinforce`, `zone`, `subject_id`, `grade_id`) VALUES
(1, 'In the Rescue of the Rules', 'The student arrives at the planets street and, while there, must decide the right moment to cross the traffic light.', 'Develop the students capability to make decisions in response to presented circumstances.', 'Some consequences of the decisions you make can be anticipated.', 'Number of successful moves when crossing.\r\nNumber of unsuccessful moves when crossing.\r\nNumber of times the game was played.\r\nTime taken to make the decision.', 'al_rescate_de_las_normas', 'Make decisions in response to everyday situations.', NULL, 'Low: Needs assistance in addressing straightforward queries.\r\nBasic: Provides responses to simple questions posed to them.\r\nHigh: Distinguishes between correct and incorrect situations in daily life.\r\nSuperior: Demonstrates decision-making abilities in everyday situations.', 0, 1, 1, 10),
(17, 'The Adventures of Water', 'In this game, the student embarks on a race where they must overcome various challenges related to the states of water. Each challenge requires overcoming an obstacle. As they progress, they gain information about the current state of water. They have to overcome each obstacle by transforming the water from one state to another.', 'Interpret the various states of matter and generate solutions when needed.', 'Classify materials from their surroundings according to their state (solid, liquid, or gas) based on their basic properties (whether they have a definite shape or take the shape of the container, if they flow, among other characteristics).', 'Number of correct answers.\r\nNumber of mistakes.\r\nTime spent on the activity.', 'las_aventuras_del_agua', 'Understands that substances can exist in different states (solid, liquid, and gas).', NULL, 'Low: Requires support to recognize the states of matter.\r\nBasic: Recognizes the states of matter.\r\nHigh: Describes with their own characteristics the different states in which matter can exist.\r\nSuperior: Proposes alternatives that allow for modifying the states of matter as needed.', 0, 1, 8, 12),
(33, 'Circuits', 'The students mission is to assist a neighbor who experienced a short circuit, resulting in a power outage. They must think of a solution and provide help. Various tools are provided to form a circuit for testing and lighting up a light bulb. The elements include: battery, copper, plastic, iron, light bulb, radio, switch. The student must take these elements and arrange them in the correct order for the flow of current: Battery, copper, switch, iron, and light bulb. (The light bulb can also be replaced by a radio)', 'Dealing with Communication and Conflicts (Approach the problem calmly, assessing and brainstorming solutions.', 'Generate solutions to situations affecting others, using simple elements.', 'Number of correct responses.\r\nNumber of mistakes.\r\nTime spent on the activity.', 'circuitos', 'Conflict management', NULL, 'Low: Requires support to identify elements that can generate electrical current.\r\nBasic: Identifies simple elements that can generate electrical current.\r\nHigh: Analyzes situations affecting others and generates solutions with elements that produce electrical current.\r\nSuperior: Proposes solutions to situations affecting others and organizes elements appropriately to generate electrical current.', 0, 2, 13, 14);

CREATE TABLE `activities_century_skills` (
  `activities_id` int NOT NULL,
  `century_skills_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `activities_century_skills` (`activities_id`, `century_skills_id`) VALUES
(1, 1),(17, 1),(17, 2),(17, 3),(33, 1),(33, 2),(33, 3);

CREATE TABLE `activities_thinking_skills` (
  `activities_id` int NOT NULL,
  `thinking_skills_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `activities_thinking_skills` (`activities_id`, `thinking_skills_id`) VALUES
(1, 1),(17, 2),(33, 2);

CREATE TABLE `avatars` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `slug` char(1) COLLATE utf8mb4_general_ci NOT NULL,
  `skin_tone` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `customizes` json NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `branches` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `dane_code` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `town_id` int DEFAULT NULL,
  `institution_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `branches` (`id`, `name`, `dane_code`, `town_id`, `institution_id`) VALUES
(365, 'CES Default Branch', '27640000060902', 17, 114);

CREATE TABLE `cashes` (
  `id` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `snip` varchar(155) COLLATE utf8mb4_general_ci NOT NULL,
  `type_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `cashes` (`id`, `name`, `snip`, `type_id`) VALUES
(1, 'Moneda Universum', 'universum_coin', 1);

CREATE TABLE `cashes_finances` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `amount` int NOT NULL,
  `finance_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cash_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `cashes_finances` (`id`, `amount`, `finance_id`, `cash_id`) VALUES
('0259b685-2b74-46b5-ae36-8db3a17d4948', 4000, '7bd323ec-58df-436d-bcfc-388c3a467ae3', 1),
('3a2078f2-77a3-44f2-a48c-265075ac3284', 4000, 'd557ce0f-2cfc-4e19-b4f4-b012bd839b6e', 1),
('c9ba7abd-5967-47a2-b983-c6b37eb81dea', 4000, 'c2cc0cda-35ee-48b8-a02c-8a041adaded6', 1),
('f31142d3-48da-4b8f-89e2-ea98895cb0cf', 4000, '284661f6-45fd-467d-8478-0df17f6f2294', 1);

CREATE TABLE `cash_types` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `cash_types` (`id`, `name`) VALUES
(1, 'univ_coin'),(2, 'univ_badge');

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Educational'),(2, 'Personal'),(3, 'Reward');

CREATE TABLE `century_skills` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `century_skills` (`id`, `name`) VALUES
(1, 'Decision making'),(2, 'Troubleshooting'),(3, 'Critical thinking'),(4, 'Reading and writing');

CREATE TABLE `countries` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `countries` (`id`, `name`) VALUES (1, 'CES Default Country');

CREATE TABLE `departments` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `dane_code` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `country_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `departments` (`id`, `name`, `dane_code`, `country_id`) VALUES (1, 'CES Default Department', '76', 1);

CREATE TABLE `enrolments` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `institution_id` int DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `school_year_id` int DEFAULT NULL,
  `grade_group_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `enrolments` (`id`, `name`, `institution_id`, `branch_id`, `school_year_id`, `grade_group_id`) VALUES
('3611f43a-8cd7-456d-833a-a8295a2f6acc', 'Enrol-8vwqsevRqv', 144, 365, 2, 1),
('3c0f6ea4-b148-4f81-9b4f-1a849a3042e6', 'Enrol-yWspXw8ei2', 144, NULL, 2, NULL),
('787ac8a9-58de-4e21-9de8-539a02956073', 'Enrol-JA1BE2PEDY', 144, NULL, 2, NULL),
('d4a67b86-4fd6-4683-b8e6-27a887641bc5', 'Enrol-THmwpUmHbs', 114, 365, 2, 1);

CREATE TABLE `finances` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `finances` (`id`) VALUES
('284661f6-45fd-467d-8478-0df17f6f2294'),('7bd323ec-58df-436d-bcfc-388c3a467ae3'),('c2cc0cda-35ee-48b8-a02c-8a041adaded6'),('d557ce0f-2cfc-4e19-b4f4-b012bd839b6e');

CREATE TABLE `gameplays` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `data` json NOT NULL,
  `time` int NOT NULL,
  `score` int NOT NULL,
  `errors` json DEFAULT NULL,
  `abort` tinyint NOT NULL,
  `finish` tinyint NOT NULL,
  `created_on` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `activity_id` int DEFAULT NULL,
  `enrolment_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `gameplay_learning_results` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `result` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `performance_level` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `gameplay_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `activity_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `grades` (
  `id` int NOT NULL,
  `num` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `grades` (`id`, `num`, `name`) VALUES
(10, 0, 'Transition'),(11, 1, 'First'),(12, 2, 'Second'),(13, 3, 'Third'),(14, 4, 'Fourth'),(15, 5, 'Fifth'),(16, 6, 'Sixth'),(17, 7, 'Seventh'),(18, 8, 'Eighth'),(19, 9, 'Ninth'),(20, 10,'Tenth'),(21, 11,'Eleventh');

CREATE TABLE `grades_groups` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `grade_id` int DEFAULT NULL,
  `group_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `grades_groups` (`id`, `name`, `grade_id`, `group_id`) VALUES (1, '8-801', 18, 1);

CREATE TABLE `groups` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `groups` (`id`, `name`) VALUES (1, '801');

CREATE TABLE `imgs` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `hashable` varchar(55) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `imgs_users` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `img_id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `institutions` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `dane_code` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `institutions` (`id`, `name`, `dane_code`) VALUES (144, 'CES Default Institutions', '276845000102');

CREATE TABLE `inventories` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `inventories` (`id`) VALUES
('16121ebd-e66e-4bb9-9bd3-a5405c94d434'),('2665601f-afbf-47ff-89c0-8a73c0721488'),('cf81b233-992b-479a-8a6c-7a4d91ed892d'),('dd1b2c83-eb80-4834-9f62-1f3c0db16a17');

CREATE TABLE `items` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `snip` varchar(155) COLLATE utf8mb4_general_ci NOT NULL,
  `value` int NOT NULL,
  `properties` text COLLATE utf8mb4_general_ci,
  `category_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `items` (`id`, `name`, `snip`, `value`, `properties`, `category_id`) VALUES
(1, 'Apple', 'apple_gather', 750, NULL, 1),
(2, 'Grape', 'grapes_gather', 750, NULL, 1),
(3, 'Pear seeds', 'pear_seed', 500, NULL, 1),
(4, 'Corn seeds', 'corn_seed', 500, 'clima_calido', 1),
(5, 'Cabbage seeds', 'cabbage_seed', 500, 'clima_frio', 1),
(6, 'Tomato seeds', 'tomatoes_seed', 500, 'clima_calido', 1),
(7, 'Carrot seeds', 'carrot_seed', 500, 'clima_frio', 1),
(8, 'Tomato', 'tomatoes_gather', 750, NULL, 1),
(9, 'Papaya seeds', 'papaya_seed', 500, 'clima_calido', 1),
(10, 'Potato seeds', 'potatoes_seed', 500, 'clima_frio', 1),
(11, 'Pear', 'pear_gather', 750, 'clima_frio', 1),
(12, 'Radish seeds', 'radish_seed', 500, NULL, 1),
(13, 'Orange seeds', 'orange_seed', 500, 'clima_calido', 1),
(14, 'Avocado seeds', 'avocado_seed', 1500, 'clima_calido', 1),
(15, 'Blackberry', 'blackberry_gather', 750, NULL, 1),
(16, 'Radish', 'radish_gather', 750, NULL, 1),
(17, 'Carrot', 'carrot_gather', 750, NULL, 1),
(18, 'Blackberry seeds', 'blackberry_seed', 500, 'clima_frio', 1),
(19, 'Bean seeds', 'greenbean_seed', 300, 'clima_frio', 1),
(20, 'Watermelon seeds', 'watermelon_seed', 500, 'clima_calido', 1),
(21, 'Apple sedss', 'apple_seeds', 500, 'clima_frio', 1),
(22, 'Grape seeds', 'grapes_seed', 500, NULL, 1),
(23, 'Potato', 'potatoe_gather', 750, NULL, 1),
(24, 'Cabbage', 'cabbage_gather', 750, NULL, 1),
(25, 'Watermelons', 'watermelon_gather', 500, NULL, 1),
(26, 'Gold Badge', 'gold_badge', 1500, 'badge', 3),
(27, 'Silver Badge', 'plate_badge', 1000, 'badge', 3),
(28, 'Bronze Badge', 'bronze_badge', 500, 'badge', 3),
(29, 'Papaya', 'papaya_gather', 250, NULL, 1),
(30, 'Corn', 'corn_gather', 350, NULL, 1);

CREATE TABLE `items_inventories` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `is_showed` tinyint NOT NULL,
  `amount` int NOT NULL,
  `inventory_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `items_inventories` (`id`, `is_showed`, `amount`, `inventory_id`, `item_id`) VALUES
('1199b37b-820e-4ada-9dd8-46dccc19f0e5', 0, 10, '2665601f-afbf-47ff-89c0-8a73c0721488', 20),
('12b00861-95f9-4929-8909-738266bac192', 0, 10, 'dd1b2c83-eb80-4834-9f62-1f3c0db16a17', 7),
('1bfe9b6b-768e-4660-aaf7-5ae459fc7987', 0, 10, 'dd1b2c83-eb80-4834-9f62-1f3c0db16a17', 18),
('1e9e811b-07c0-417b-9fac-8ba33486c05d', 0, 10, '16121ebd-e66e-4bb9-9bd3-a5405c94d434', 20),
('312ae2d8-d36b-4630-b78c-f4f718f5f466', 0, 10, 'cf81b233-992b-479a-8a6c-7a4d91ed892d', 14),
('64c89367-e662-407b-82c0-8f989a762b4b', 0, 10, 'cf81b233-992b-479a-8a6c-7a4d91ed892d', 18),
('700e9dc6-a1ea-4e54-b573-7f8e12b768f6', 0, 10, '16121ebd-e66e-4bb9-9bd3-a5405c94d434', 18),
('7f3537c4-e5c5-46c0-8d3e-410c68206a48', 0, 10, 'cf81b233-992b-479a-8a6c-7a4d91ed892d', 7),
('8647e3af-ec92-40dc-b3fa-352838b2f1f7', 0, 10, 'dd1b2c83-eb80-4834-9f62-1f3c0db16a17', 9),
('8f56501d-309d-4129-8931-3ad2fb09fd1d', 0, 10, '16121ebd-e66e-4bb9-9bd3-a5405c94d434', 14),
('8f5a07b5-6b65-45db-8cd4-5fa8f392cb60', 0, 10, 'dd1b2c83-eb80-4834-9f62-1f3c0db16a17', 14),
('940c18ff-a0b5-4b11-8349-531a28e3beb4', 0, 10, '16121ebd-e66e-4bb9-9bd3-a5405c94d434', 9),
('9728ba12-f2c9-46ea-9ee9-5e681fe458b6', 0, 10, '2665601f-afbf-47ff-89c0-8a73c0721488', 14),
('a419c3ba-d266-4c15-9da4-38ac2f3801f2', 0, 10, 'cf81b233-992b-479a-8a6c-7a4d91ed892d', 9),
('a9ce10ef-81c5-4016-9e74-96935545765f', 0, 10, '2665601f-afbf-47ff-89c0-8a73c0721488', 7),
('acd1261a-111f-4f71-808d-836cbf8c763f', 0, 10, '2665601f-afbf-47ff-89c0-8a73c0721488', 18),
('c3d45860-d5db-41dd-9bc8-ba8110305ed1', 0, 10, '16121ebd-e66e-4bb9-9bd3-a5405c94d434', 7),
('c5023b10-0ed5-445f-8441-5c15fd00a40e', 0, 10, '2665601f-afbf-47ff-89c0-8a73c0721488', 9),
('c52f22dc-167e-4997-ae55-8ea3d7f4f65e', 0, 10, 'dd1b2c83-eb80-4834-9f62-1f3c0db16a17', 20),
('f58ccc10-505c-4e45-98d6-10229767b7fd', 0, 10, 'cf81b233-992b-479a-8a6c-7a4d91ed892d', 20);

CREATE TABLE `licenses` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `serial` varchar(55) COLLATE utf8mb4_general_ci NOT NULL,
  `owner` int NOT NULL,
  `expired_date` date NOT NULL,
  `tumlab_name` varchar(155) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `licenses` (`id`, `serial`, `owner`, `expired_date`, `tumlab_name`) VALUES
('2dcc714b-4b47-4b6b-88b0-44b15f8297df', 'key-rhRzGagAn9OshOpFTVS-ZQZk', 121621, '2025-12-12', 'TL-00:15:5d:4f:74:70'),
('628d1dc4-e0a1-4045-9637-c5b56980d061', 'key-ATtb1NZvFEB-qPso4qJeF4Hk', 1000000, '2025-12-12', 'TL-00:15:5d:4f:74:70'),
('aa11c800-30d6-4ab7-bb75-916d7f494cad', 'key-X8LrJHsb5eYlSqytpCIt2Yq1', 36492, '2025-12-12', 'TL-00:15:5d:4f:74:70'),
('d8c3b676-782f-11ee-8f83-2cf05d8dbc0d', 'serialadminuv', 999999, '2030-10-31', 'admintumlab'),
('f8110c48-ed4d-4427-95af-0dc730b7db10', 'key-h3flhofET_tACbkFt6x_Qv2J', 1000001, '2025-12-12', 'TL-00:15:5d:4f:74:70');

CREATE TABLE `login_record` (
  `id` int NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `role` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `loginSuccess` tinyint NOT NULL,
  `loginAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `ipAddress` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `profiles` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(55) COLLATE utf8mb4_general_ci NOT NULL,
  `lastname` varchar(55) COLLATE utf8mb4_general_ci NOT NULL,
  `gender` varchar(1) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `birth` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `age` int DEFAULT NULL,
  `disability` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `profiles` (`id`, `name`, `lastname`, `gender`, `birth`, `age`, `disability`) VALUES
('188c23ff-66be-11ee-8cc1-7085c296afc1', 'Universum', 'Admin', NULL, NULL, NULL, NULL),
('2e67087e-b0e2-4cd8-b1d5-21d1c6b48f84', 'CES', 'User1', NULL, '2004-09-13T00:00:00.000Z', 19, 'NO APLICA'),
('afbdcba2-fdb2-4fb0-a31f-dad1dc11a815', 'CES', 'User2', 'F', '2006-09-13T00:00:00.000Z', 17, 'NO APLICA'),
('b80e6370-e103-41d5-9ea0-8300e73d8ad8', 'CES', 'Teacher1', NULL, '1999-09-13T00:00:00.000Z', 24, 'NO APLICA'),
('e358dd56-1d59-4b83-be01-036eec8e1cb6', 'CES', 'Teacher1', 'F', '1997-08-20T00:00:00.000Z', 26, 'NO APLICA');

CREATE TABLE `roles` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `display` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `roles` (`id`, `name`, `display`) VALUES
(1, 'coordinator', 'Coordinador'),
(2, 'secretary', 'Secretaria'),
(3, 'township', 'Municipio'),
(4, 'rector', 'Rector'),
(5, 'parent', 'Padre'),
(6, 'support', 'Soporte'),
(7, 'student', 'Estudiante'),
(8, 'teacher', 'Docente'),
(9, 'admin', 'Administrador');

CREATE TABLE `school_years` (
  `id` int NOT NULL,
  `name` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `school_years` (`id`, `name`) VALUES
(1, 2023),(2, 2024),(3, 2025);

CREATE TABLE `subjects` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `snip` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `subjects` (`id`, `name`, `snip`) VALUES
(1, 'Ethics', 'ethics'),(8, 'Natural Sciences', 'natural'),(13, 'Conflict Resolution', 'conflict_management');

CREATE TABLE `thinking_skills` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `thinking_skills` (`id`, `name`) VALUES
(1, 'Remember'),(2, 'Apply'),(3, 'Evaluate'),(4, 'Understand'),(5, 'Analyze'),(6, 'Create');

CREATE TABLE `towns` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `dane_code` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `department_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `towns` (`id`, `name`, `dane_code`, `department_id`) VALUES (17, 'CES Default Town', '400', 1);

CREATE TABLE `transactions` (
  `id` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `transaction_id` varchar(55) COLLATE utf8mb4_general_ci NOT NULL,
  `amount` int NOT NULL,
  `currency` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `status` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `buyer` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `product` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `users` (
  `id` int NOT NULL,
  `keycloak_sub_id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(55) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `active` tinyint NOT NULL DEFAULT '0',
  `activation_token` varchar(55) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `reset_password_token` varchar(55) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pic_pass` tinyint NOT NULL,
  `first_login` tinyint NOT NULL DEFAULT '1',
  `first_select_avatar` tinyint NOT NULL DEFAULT '1',
  `validated_by_parent` tinyint NOT NULL DEFAULT '0',
  `created_on` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `profile_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `enrolment_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `inventory_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `finance_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `avatar_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `role_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `users` (`id`, `keycloak_sub_id`, `username`, `email`, `password`, `active`, `activation_token`, `reset_password_token`, `pic_pass`, `first_login`, `first_select_avatar`, `validated_by_parent`, `created_on`, `profile_id`, `enrolment_id`, `inventory_id`, `finance_id`, `avatar_id`, `role_id`) VALUES
(36492, '2b25b867-8a41-4a41-abdc-f108bbc8b86c', 'cesuser001', 'cesuser001@localhost.com', '$2a$10$xqBFidMJMqm8nT8E/o5kV.5u85fGf.ZRdI5JTwwEk8pabQAJfUPsq', 1, NULL, NULL, 0, 1, 1, 0, '2023-12-12 11:34:52.412585', 'e358dd56-1d59-4b83-be01-036eec8e1cb6', '3611f43a-8cd7-456d-833a-a8295a2f6acc', '2665601f-afbf-47ff-89c0-8a73c0721488', 'c2cc0cda-35ee-48b8-a02c-8a041adaded6', NULL, 7),
(121621, '9a1e4819-a72d-4216-93d8-c31204473951', 'cesuser002', 'cesuser002@localhost.com', '$2a$10$xqBFidMJMqm8nT8E/o5kV.5u85fGf.ZRdI5JTwwEk8pabQAJfUPsq', 1, NULL, NULL, 0, 1, 1, 0, '2023-12-12 11:34:52.416789', 'afbdcba2-fdb2-4fb0-a31f-dad1dc11a815', 'd4a67b86-4fd6-4683-b8e6-27a887641bc5', '16121ebd-e66e-4bb9-9bd3-a5405c94d434', 'd557ce0f-2cfc-4e19-b4f4-b012bd839b6e', NULL, 7),
(999999, '', 'uvadmin2023', 'uvadmin2023@yopmail.com', '$2a$10$xqBFidMJMqm8nT8E/o5kV.5u85fGf.ZRdI5JTwwEk8pabQAJfUPsq', 1, NULL, NULL, 0, 0, 0, 0, '2023-10-01 10:04:10.069000', '188c23ff-66be-11ee-8cc1-7085c296afc1', NULL, NULL, NULL, NULL, 9),
(1000000, '7968fcdc-17f6-4747-8ad7-db323c6a8868', 'cesteacher001', 'juanogr8@gmail.com', '$2a$10$xqBFidMJMqm8nT8E/o5kV.5u85fGf.ZRdI5JTwwEk8pabQAJfUPsq', 1, NULL, NULL, 0, 1, 1, 0, '2023-12-12 11:35:28.662940', 'b80e6370-e103-41d5-9ea0-8300e73d8ad8', '3c0f6ea4-b148-4f81-9b4f-1a849a3042e6', 'dd1b2c83-eb80-4834-9f62-1f3c0db16a17', '284661f6-45fd-467d-8478-0df17f6f2294', NULL, 8),
(1000001, 'ec323dd5-ed78-483d-b3d9-f7bb68b5907e', 'cesteacher002', 'marucha_209@hotmail.com', '$2a$10$xqBFidMJMqm8nT8E/o5kV.5u85fGf.ZRdI5JTwwEk8pabQAJfUPsq', 1, NULL, NULL, 0, 1, 1, 0, '2023-12-12 11:35:28.664447', '2e67087e-b0e2-4cd8-b1d5-21d1c6b48f84', '787ac8a9-58de-4e21-9de8-539a02956073', 'cf81b233-992b-479a-8a6c-7a4d91ed892d', '7bd323ec-58df-436d-bcfc-388c3a467ae3', NULL, 8);

ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `IDX_c9ee662a4db2641eeac1bd3358` (`slug`),
  ADD KEY `FK_b18bcb61a2746e8282cd8a20b55` (`subject_id`),
  ADD KEY `FK_32e72bfadedb3eac1672f732936` (`grade_id`);

ALTER TABLE `activities_century_skills`
  ADD PRIMARY KEY (`activities_id`,`century_skills_id`),
  ADD KEY `IDX_ec02145cb9125a0258e5b307cd` (`activities_id`),
  ADD KEY `IDX_dc467f8c015cb71092528e88c1` (`century_skills_id`);

ALTER TABLE `activities_thinking_skills`
  ADD PRIMARY KEY (`activities_id`,`thinking_skills_id`),
  ADD KEY `IDX_5a34086998568f38af49858ee7` (`activities_id`),
  ADD KEY `IDX_758ce3f8cc68ce5d727bf1aa7e` (`thinking_skills_id`);

ALTER TABLE `avatars`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_22973db823ebe1d988a3d542598` (`town_id`),
  ADD KEY `FK_319f0f63c7ef90bec51825bcd37` (`institution_id`);

ALTER TABLE `cashes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `IDX_1d66df4c5d40f2f45b46833a23` (`name`),
  ADD KEY `FK_bcbb317ca78697b31fe275b6e1b` (`type_id`);

ALTER TABLE `cashes_finances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_0f759acb130005f382d6fb28411` (`finance_id`),
  ADD KEY `FK_92ddfb1cf09ad56cc392e688ffe` (`cash_id`);

ALTER TABLE `cash_types`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `century_skills`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_7563404890a1ef1966595352f21` (`country_id`);

ALTER TABLE `enrolments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_11eb233073f8da2d94cad4eed85` (`institution_id`),
  ADD KEY `FK_8818b828078792c218cd46d692b` (`branch_id`),
  ADD KEY `FK_cfa5c13ea91f035553b009f9265` (`school_year_id`),
  ADD KEY `FK_6cf24e9e41e56c2df8013cf8122` (`grade_group_id`);

ALTER TABLE `finances`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `gameplays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_8c12bddd84fa0f6b44bb83123f` (`abort`),
  ADD KEY `IDX_59874813154f78667784983347` (`finish`),
  ADD KEY `FK_77446cd3c9923062927eaacf18f` (`activity_id`),
  ADD KEY `FK_8aef9125a8789ad4decf04465eb` (`enrolment_id`);

ALTER TABLE `gameplay_learning_results`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `REL_97069f0f34a31de25c5f47e1bd` (`gameplay_id`),
  ADD KEY `FK_9441820a6da8c57a3e4a89f4e8c` (`activity_id`);

ALTER TABLE `grades`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `grades_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_a1e350dccd27965938f37940e81` (`grade_id`),
  ADD KEY `FK_76bd13c6676bc7673103a47937a` (`group_id`);

ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `imgs`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `imgs_users`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `institutions`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `inventories`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_0c4aa809ddf5b0c6ca45d8a8e80` (`category_id`);

ALTER TABLE `items_inventories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_68a029b369f6367740a75b763f8` (`inventory_id`),
  ADD KEY `FK_fa4e1a4530c6642f3d610b758d0` (`item_id`);

ALTER TABLE `licenses`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `login_record`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `IDX_648e3f5447f725579d7d4ffdfb` (`name`);

ALTER TABLE `school_years`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `thinking_skills`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `towns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_9622a3805504447b728dd24844d` (`department_id`);

ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `IDX_4454cae6e1c2a60b0fe85086c5` (`keycloak_sub_id`),
  ADD UNIQUE KEY `IDX_fe0bb3f6520ee0469504521e71` (`username`),
  ADD UNIQUE KEY `IDX_97672ac88f789774dd47f7c8be` (`email`),
  ADD UNIQUE KEY `IDX_89a1c9adfee558c580dd8a2b6a` (`activation_token`),
  ADD UNIQUE KEY `IDX_ee6419219542371563e0592db5` (`reset_password_token`),
  ADD UNIQUE KEY `REL_23371445bd80cb3e413089551b` (`profile_id`),
  ADD UNIQUE KEY `REL_dce0197c9fc4a3a30182fb15b9` (`enrolment_id`),
  ADD UNIQUE KEY `REL_e5ec5b6c6b9cf5160b55b6e5d2` (`inventory_id`),
  ADD UNIQUE KEY `REL_8ad9356cce5c4297be3226c513` (`finance_id`),
  ADD UNIQUE KEY `REL_c3401836efedec3bec459c8f81` (`avatar_id`),
  ADD KEY `FK_a2cecd1a3531c0b041e29ba46e1` (`role_id`);


ALTER TABLE `activities`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

ALTER TABLE `branches`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1172;

ALTER TABLE `cashes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `cash_types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `century_skills`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `countries`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `departments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `grades`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

ALTER TABLE `grades_groups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `groups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `institutions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=245;

ALTER TABLE `items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

ALTER TABLE `login_record`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

ALTER TABLE `school_years`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `subjects`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

ALTER TABLE `thinking_skills`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `towns`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000002;


ALTER TABLE `activities`
  ADD CONSTRAINT `FK_32e72bfadedb3eac1672f732936` FOREIGN KEY (`grade_id`) REFERENCES `grades` (`id`),
  ADD CONSTRAINT `FK_b18bcb61a2746e8282cd8a20b55` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`);

ALTER TABLE `activities_century_skills`
  ADD CONSTRAINT `FK_dc467f8c015cb71092528e88c1d` FOREIGN KEY (`century_skills_id`) REFERENCES `century_skills` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ec02145cb9125a0258e5b307cd4` FOREIGN KEY (`activities_id`) REFERENCES `activities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `activities_thinking_skills`
  ADD CONSTRAINT `FK_5a34086998568f38af49858ee7b` FOREIGN KEY (`activities_id`) REFERENCES `activities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_758ce3f8cc68ce5d727bf1aa7ef` FOREIGN KEY (`thinking_skills_id`) REFERENCES `thinking_skills` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `branches`
  ADD CONSTRAINT `FK_22973db823ebe1d988a3d542598` FOREIGN KEY (`town_id`) REFERENCES `towns` (`id`),
  ADD CONSTRAINT `FK_319f0f63c7ef90bec51825bcd37` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`id`);

ALTER TABLE `cashes`
  ADD CONSTRAINT `FK_bcbb317ca78697b31fe275b6e1b` FOREIGN KEY (`type_id`) REFERENCES `cash_types` (`id`);

ALTER TABLE `cashes_finances`
  ADD CONSTRAINT `FK_0f759acb130005f382d6fb28411` FOREIGN KEY (`finance_id`) REFERENCES `finances` (`id`),
  ADD CONSTRAINT `FK_92ddfb1cf09ad56cc392e688ffe` FOREIGN KEY (`cash_id`) REFERENCES `cashes` (`id`);

ALTER TABLE `departments`
  ADD CONSTRAINT `FK_7563404890a1ef1966595352f21` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`);

ALTER TABLE `enrolments`
  ADD CONSTRAINT `FK_11eb233073f8da2d94cad4eed85` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`id`),
  ADD CONSTRAINT `FK_6cf24e9e41e56c2df8013cf8122` FOREIGN KEY (`grade_group_id`) REFERENCES `grades_groups` (`id`),
  ADD CONSTRAINT `FK_8818b828078792c218cd46d692b` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`),
  ADD CONSTRAINT `FK_cfa5c13ea91f035553b009f9265` FOREIGN KEY (`school_year_id`) REFERENCES `school_years` (`id`);

ALTER TABLE `gameplays`
  ADD CONSTRAINT `FK_77446cd3c9923062927eaacf18f` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`),
  ADD CONSTRAINT `FK_8aef9125a8789ad4decf04465eb` FOREIGN KEY (`enrolment_id`) REFERENCES `enrolments` (`id`);

ALTER TABLE `gameplay_learning_results`
  ADD CONSTRAINT `FK_9441820a6da8c57a3e4a89f4e8c` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`),
  ADD CONSTRAINT `FK_97069f0f34a31de25c5f47e1bd4` FOREIGN KEY (`gameplay_id`) REFERENCES `gameplays` (`id`);

ALTER TABLE `grades_groups`
  ADD CONSTRAINT `FK_76bd13c6676bc7673103a47937a` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  ADD CONSTRAINT `FK_a1e350dccd27965938f37940e81` FOREIGN KEY (`grade_id`) REFERENCES `grades` (`id`);

ALTER TABLE `items`
  ADD CONSTRAINT `FK_0c4aa809ddf5b0c6ca45d8a8e80` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

ALTER TABLE `items_inventories`
  ADD CONSTRAINT `FK_68a029b369f6367740a75b763f8` FOREIGN KEY (`inventory_id`) REFERENCES `inventories` (`id`),
  ADD CONSTRAINT `FK_fa4e1a4530c6642f3d610b758d0` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`);

ALTER TABLE `towns`
  ADD CONSTRAINT `FK_9622a3805504447b728dd24844d` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`);

ALTER TABLE `users`
  ADD CONSTRAINT `FK_23371445bd80cb3e413089551bf` FOREIGN KEY (`profile_id`) REFERENCES `profiles` (`id`),
  ADD CONSTRAINT `FK_8ad9356cce5c4297be3226c5136` FOREIGN KEY (`finance_id`) REFERENCES `finances` (`id`),
  ADD CONSTRAINT `FK_a2cecd1a3531c0b041e29ba46e1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `FK_c3401836efedec3bec459c8f818` FOREIGN KEY (`avatar_id`) REFERENCES `avatars` (`id`),
  ADD CONSTRAINT `FK_dce0197c9fc4a3a30182fb15b91` FOREIGN KEY (`enrolment_id`) REFERENCES `enrolments` (`id`),
  ADD CONSTRAINT `FK_e5ec5b6c6b9cf5160b55b6e5d28` FOREIGN KEY (`inventory_id`) REFERENCES `inventories` (`id`);
SET FOREIGN_KEY_CHECKS=1;
COMMIT;
