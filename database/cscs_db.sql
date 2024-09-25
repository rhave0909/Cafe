-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2022 at 10:14 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cscs_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `category_list`
--

CREATE TABLE `category_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_list`
--

INSERT INTO `category_list` (`id`, `name`, `description`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 'Hot Drinks', 'Hot Coffee', 1, 0, '2024-09-15 09:59:46', '2024-09-15 09:59:46'),
(2, 'Cold Drinks', 'Cold Coffee and Non-Coffee', 1, 0, '2024-09-15 09:59:46', '2024-09-15 09:59:46'),
(3, 'Desserts', 'Desserts', 1, 0, '2024-09-15 10:01:06', '2024-09-15 10:01:06'),
(4, 'Salad', 'Salad', 1, 0, '2024-09-15 10:01:06', '2024-09-15 10:01:06'),
(5, 'Meals', 'Hearty Meals', 1, 0, '2024-09-15 10:01:06', '2024-09-15 10:01:06'),
(6, 'Whiches', 'Wiches', 1, 0, '2024-09-15 10:01:06', '2024-09-15 10:01:06'),
(7, 'Bread, Cookie & Biscuit', 'Breads', 1, 0, '2024-09-15 10:01:06', '2024-09-15 10:01:06'),
(8, 'Pzza', 'Pizza', 1, 0, '2024-09-15 10:01:06', '2024-09-15 10:01:06');


-- --------------------------------------------------------
CREATE TABLE `inventory_list` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `unit` varchar(50) NOT NULL, -- For example, 'pcs', 'packs', etc.
  `date_range` varchar(50) NOT NULL,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `inventory_list` (`name`, `quantity`, `unit`, `delete_flag`,`date_range`, `date_created`, `date_updated`) VALUES
('Cup', 500, 'pcs',0,'2 weeks', NOW(), NOW()),
('Cake Plate', 200, 'pcs',0,'2 weeks', NOW(), NOW()),
('Pizza Plate', 100, 'pcs',0,'2 weeks', NOW(), NOW());

--
-- Table structure for table `product_list`
--

CREATE TABLE `product_list` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `price` float(15,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_list`
--

INSERT INTO `product_list` (`id`, `category_id`, `name`, `description`, `price`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 1, 'Espresso', 'A strong, rich coffee brewed by forcing hot water through finely-ground coffee beans.', 85.00, 1, 0, '2022-04-22 10:16:50', '2022-04-22 10:22:07'),
(2, 1, 'Macchiato D Marius', 'A bold espresso with a small amount of steamed milk, creating a balanced coffee with a creamy texture.', 125.00, 1, 0, '2022-04-22 10:17:20', '2022-04-22 10:22:11'),
(3, 1, 'Cafe Cream D Haellena', 'A smooth and creamy coffee with a velvety texture, perfect for a luxurious coffee experience.', 135.00, 1, 0, '2022-04-22 10:17:54', '2022-04-22 10:17:54'),
(4, 1, 'Bullet Proof Coffee', 'A rich blend of coffee mixed with butter and MCT oil for a creamy and energy-boosting drink.', 115.00, 1, 0, '2022-04-22 10:18:15', '2022-04-22 10:18:15'),
(5, 1, 'Holte Mocha Breve', 'A delicious mocha coffee with steamed milk and a touch of chocolate, creating a decadent and creamy drink.', 140.00, 1, 0, '2022-04-22 10:19:18', '2022-04-22 10:19:18'),
(6, 1, 'Americano', 'A simple and classic coffee made by adding hot water to espresso, resulting in a light and flavorful cup.', 105.00, 1, 0, '2022-04-22 10:19:47', '2022-04-22 10:19:47'),
(7, 1, 'Latte D Clyde', 'An espresso-based drink with steamed milk and a thin layer of foam, offering a creamy and smooth taste.', 135.00, 1, 0, '2022-04-22 10:20:06', '2022-04-22 10:20:06'),
(8, 1, 'Coppuccino D Miguel', 'A classic cappuccino with equal parts espresso, steamed milk, and foam, topped with a sprinkling of cinnamon.', 135.00, 1, 0, '2022-04-22 10:20:26', '2022-04-22 10:20:26'),
(9, 2, 'Vanilla Iced Coffee', 'A refreshing iced coffee with a hint of vanilla flavor, perfect for cooling down on a warm day.', 145.00, 1, 0, '2022-04-22 10:20:53', '2022-04-22 10:20:53'),
(10, 2, 'Caramel On D Rocks', 'A chilled latte with espresso, milk, and a touch of caramel syrup, served over ice for a sweet treat.', 155.00, 1, 0, '2022-04-22 10:21:17', '2022-04-22 10:21:17'),
(11, 2, 'Spanish Latte', 'A rich and creamy latte made with sweetened condensed milk, offering a unique and indulgent flavor.', 145.00, 1, 0, '2022-04-22 10:21:17', '2022-04-22 10:21:17'),
(12, 2, 'Mickey Icey Mocha', 'A cold brew coffee with a chocolatey twist, offering a smooth and less bitter flavor than regular iced coffee.', 155.00, 1, 0, '2022-04-22 10:21:42', '2022-04-22 10:21:42'),
(13, 2, 'Raspberry Lemonade', 'A refreshing lemonade infused with the sweet and tart flavor of raspberries.', 140.00, 1, 0, '2022-04-22 10:21:17', '2022-04-22 10:21:17'),
(14, 2, 'Lemon Lime', 'A zesty and tangy drink combining the flavors of lemon and lime for a refreshing boost.', 140.00, 1, 0, '2022-04-22 10:21:17', '2022-04-22 10:21:17'),
(15, 2, 'Straw Banana', 'A fruity and refreshing drink with the flavors of strawberries and bananas blended together.', 140.00, 1, 0, '2022-04-22 10:21:17', '2022-04-22 10:21:17'),
(16, 2, 'Strawberry', 'A chilled and fruity drink with the sweet and refreshing taste of strawberries.', 165.00, 1, 0, '2022-04-22 10:21:17', '2022-04-22 10:21:17'),
(17, 2, 'Go For Kiwi', 'A refreshing iced drink with the unique and tangy flavor of kiwi, perfect for a summer day.', 165.00, 1, 0, '2022-04-22 10:21:17', '2022-04-22 10:21:17'),
(18, 2, 'Watermelon', 'A chilled drink with the sweet and juicy flavor of watermelon, ideal for quenching your thirst.', 165.00, 1, 0, '2022-04-22 10:21:17', '2022-04-22 10:21:17'),
(19, 2, 'Lemon Iced Tea', 'A classic iced tea with a hint of lemon for a refreshing and energizing beverage.', 165.00, 1, 0, '2022-04-22 10:21:17', '2022-04-22 10:21:17'),
(20, 2, 'Ginger Peppermint', 'A unique and refreshing drink combining the spiciness of ginger with the coolness of peppermint.', 165.00, 1, 0, '2022-04-22 10:21:17', '2022-04-22 10:21:17'),
(21, 2, 'Iced Tea', 'A simple and classic iced tea, brewed to perfection and served chilled for a refreshing taste.', 165.00, 1, 0, '2022-04-22 10:21:17', '2022-04-22 10:21:17'),
(22, 3, 'Burnt Cheesecake', 'A creamy and rich cheesecake with a caramelized top, offering a unique and delicious dessert experience.', 85.00, 1, 0, '2022-04-22 10:21:17', '2022-04-22 10:21:17'),
(23, 3, 'Lemon Glazed Chia Seeds Cake', 'A moist and flavorful cake with a lemon glaze and chia seeds, adding a delightful crunch.', 110.00, 1, 0, '2022-04-22 10:21:17', '2022-04-22 10:21:17'),
(24, 3, 'Cinnamon & Walnut Cake', 'A spiced cake with cinnamon and walnut pieces, offering a warm and comforting dessert.', 112.00, 1, 0, '2022-04-22 10:21:17', '2022-04-22 10:21:17'),
(25, 3, 'Carrot Cake', 'A moist and spiced carrot cake with a hint of cinnamon and nutmeg, topped with cream cheese frosting.', 160.00, 1, 0, '2022-04-22 10:21:17', '2022-04-22 10:21:17'),
(26, 3, 'Pecan Pie', 'A rich and sweet pie filled with pecans and a gooey caramel-like filling, perfect for dessert lovers.', 145.00, 1, 0, '2022-04-22 10:21:17', '2022-04-22 10:21:17'),
(27, 3, 'BlueBerry Muffin', 'A soft and fluffy muffin bursting with juicy blueberries, ideal for a quick snack or breakfast.', 90.00, 1, 0, '2022-04-22 10:21:17', '2022-04-22 10:21:17'),
(28, 3, 'Chocolate Chip Muffin', 'A classic muffin filled with rich chocolate chips for a sweet and indulgent treat.', 110.00, 1, 0, '2022-04-22 10:21:17', '2022-04-22'),
(29, 4, 'Meaty Salad', 'The chilled version of a latte is simply espresso and milk over ice.', 265.00, 1, 0, '2022-04-22 10:21:17', '2022-04-22 10:21:17'),
(30, 4, 'Chicken Salad', 'The chilled version of a latte is simply espresso and milk over ice.', 247.00, 1, 0, '2022-04-22 10:21:17', '2022-04-22 10:21:17'),
(31, 4, 'Millets Salad', 'The chilled version of a latte is simply espresso and milk over ice.', 210.00, 1, 0, '2022-04-22 10:21:17', '2022-04-22 10:21:17'),
(32, 5, 'Sausage', 'Healhty and tasty special hungarian sausage or frankfurter sausage with almond pancakes and sunny side up eggs.', 205.00, 1, 0, '2022-04-22 10:21:17', '2022-04-22 10:21:17'),
(33, 5, 'Porky', 'seasoned greaseless pork chop with eggroll and shiratake rice.', 292.00, 1, 0, '2022-04-22 10:21:17', '2022-04-22 10:21:17'),
(34, 5, 'Chickey Eggroll', 'A well seasoned fried chicken with lettuce topped with toasted sesame and eggroll at the side.', 255.00, 1, 0, '2022-04-22 10:21:17', '2022-04-22 10:21:17'),
(35, 5, 'Egg & Pancake', 'Choice of poached egg or sunny side up egg served with healthy almond pancake, salad and bacon chicken.', 225.00, 1, 0, '2022-04-22 10:21:17', '2022-04-22 10:21:17'),
(36, 5, 'Rice', 'Shiratake rice.', 40.00, 1, 0, '2022-04-22 10:21:17', '2022-04-22 10:21:17'),
(37, 6, 'Panwich Chicken', 'Almond pancake with seasoned grilled chicken topped with lettuce, cheese, and fried egg.', 210.00, 1, 0, '2022-04-22 10:21:17', '2022-04-22 10:21:17'),
(38, 6, 'Pancwich Bacon', 'Almond pancake with delicious bacon topped with lettuce, cheese, and fried egg.', 225.00, 1, 0, '2022-04-22 10:21:17', '2022-04-22 10:21:17'),
(39, 6, 'Unwich Chicken', 'Grilled chicken topped with cucumber sliced tomato, cheese, and mayo wrapped in lettuce.', 225.00, 1, 0, '2022-04-22 10:21:17', '2022-04-22 10:21:17'),
(40, 6, 'Unwich Beef', 'Deliciously marinated beef topped with cucumber, sliced tomato, cheese and mayo wrapped in lettuce.', 260.00, 1, 0, '2022-04-22 10:21:17', '2022-04-22 10:21:17'),
(41, 6, 'Bacon Wrap', 'Mouth watering bacon, carrots, cucumber, stick, cheese and mayo sauce in an appetizing wrap.', 300.00, 1, 0, '2022-04-22 10:21:17', '2022-04-22 10:21:17'),
(42, 6, 'Cheicken Wrap', 'Flavorful grilled chicken with carrots, cucumber stick, cheese and mayo sauce in an appetizing wrap.', 290.00, 1, 0, '2022-04-22 10:21:17', '2022-04-22 10:21:17'),
(43, 6, 'Beef Enchilada With Bread Roll', 'Italian beef enchilada topped with tomato sauce and overflowing mozzarella cheese in a satisfying cabbage wrap.', 237.00, 1, 0, '2022-04-22 10:21:17', '2022-04-22 10:21:17'),
(44, 7, 'Pandesal (Pack of 4)', 'Italian beef enchilada topped with tomato sauce and overflowing mozzarella cheese in a satisfying cabbage wrap.', 120.00, 1, 0, '2022-04-22 10:21:17', '2022-04-22 10:21:17'),
(45, 7, 'Cinnamon Roll Biscotti (pack of 3)', 'Italian beef enchilada topped with tomato sauce and overflowing mozzarella cheese in a satisfying cabbage wrap.', 110.00, 1, 0, '2022-04-22 10:21:17', '2022-04-22 10:21:17'),
(46, 7, 'Maple Walnut Biscotti (pack of 3 )', 'Italian beef enchilada topped with tomato sauce and overflowing mozzarella cheese in a satisfying cabbage wrap.', 120.00, 1, 0, '2022-04-22 10:21:17', '2022-04-22 10:21:17'),
(47, 7, 'Chocolate Chip Cookie (pack of 3)', 'Italian beef enchilada topped with tomato sauce and overflowing mozzarella cheese in a satisfying cabbage wrap.', 350.00, 1, 0, '2022-04-22 10:21:17', '2022-04-22 10:21:17'),
(48, 7, 'Almond Loaf Bread', 'Italian beef enchilada topped with tomato sauce and overflowing mozzarella cheese in a satisfying cabbage wrap.', 480.00, 1, 0, '2022-04-22 10:21:17', '2022-04-22 10:21:17'),
(49, 7, 'Almond Chia Cheeds Loaf Bread', 'Italian beef enchilada topped with tomato sauce and overflowing mozzarella cheese in a satisfying cabbage wrap.', 550.00, 1, 0, '2022-04-22 10:21:17', '2022-04-22 10:21:17'),
(50, 8, 'California Pepperoni Pizza', 'Fresh Pizza made of almond dough brushed with marinara sauce loaded with pepperoni, parmesan and mozarella cheese.', 670.00, 1, 0, '2022-04-22 10:21:17', '2022-04-22 10:21:17'),
(51, 8, 'Detroit Pizza ', 'Our golden baked lowcab pizza made of almond dough topped with bell pepper, red onion, olives, tomatoes and spinach, loaded with mozarella cheese.', 625.00, 1, 0, '2022-04-22 10:21:17', '2022-04-22 10:21:17'),
(52, 8, 'New York Cheesy Pizza ', 'Delicious healthy pizza made of almond dough topped with parmesan, blue cheese and mozarella cheese.', 690.00, 1, 0, '2022-04-22 10:21:17', '2022-04-22 10:21:17');

-- --------------------------------------------------------
--
-- Table structure for table `sale_list`
--

CREATE TABLE `sale_list` (
  `id` int(30) NOT NULL,
  `user_id` int(30) DEFAULT NULL,
  `code` varchar(100) NOT NULL,
  `client_name` text NOT NULL,
  `amount` float(15,2) NOT NULL DEFAULT 0.00,
  `tendered` float(15,2) NOT NULL DEFAULT 0.00,
  `payment_type` tinyint(1) NOT NULL COMMENT '1 = Cash,\r\n2 = Debit Card,\r\n3 = Credit Card',
  `payment_code` text DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sale_list`
--

INSERT INTO `sale_list` (`id`, `user_id`, `code`, `client_name`, `amount`, `tendered`, `payment_type`, `payment_code`, `date_created`, `date_updated`) VALUES
(1, 1, '202204220001', 'Guest', 710.00, 1000.00, 1, '', '2024-09-15 13:54:44', '2024-09-15 13:54:44');

-- --------------------------------------------------------

--
-- Table structure for table `sale_products`
--

CREATE TABLE `sale_products` (
  `sale_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `qty` int(10) NOT NULL,
  `price` float(15,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sale_products`
--

INSERT INTO `sale_products` (`sale_id`, `product_id`, `qty`, `price`) VALUES
(1, 11, 3, 145.00);

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Skin Metro Low Carb Cafe'),
(6, 'short_name', 'pos & inventory'),
(11, 'logo', 'uploads/logo.png?v=1650590302'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover.png?v=1650590309');

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
  `date_updated` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/avatars/1.png?v=1649834664', NULL, 1, '2021-01-20 14:02:37', '2022-04-13 15:24:24'),
(2, 'Mark', 'Cooper', 'cashier', '0c4635c5af0f173c26b0d85b6c9b398b', 'uploads/avatars/2.png?v=1650520142', NULL, 3, '2022-04-21 13:49:02', '2022-04-21 13:49:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_list`
--
ALTER TABLE `product_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `sale_list`
--
ALTER TABLE `sale_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `sale_products`
--
ALTER TABLE `sale_products`
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
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
-- AUTO_INCREMENT for table `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_list`
--
ALTER TABLE `product_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sale_list`
--
ALTER TABLE `sale_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product_list`
--
ALTER TABLE `product_list`
  ADD CONSTRAINT `category_id_fk_pl` FOREIGN KEY (`category_id`) REFERENCES `category_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `sale_list`
--
ALTER TABLE `sale_list`
  ADD CONSTRAINT `user_id_fk_sl` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `sale_products`
--
ALTER TABLE `sale_products`
  ADD CONSTRAINT `product_id_fk_sp` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `sale_id_fk_sp` FOREIGN KEY (`sale_id`) REFERENCES `sale_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
