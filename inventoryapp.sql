-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 14, 2019 at 06:01 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventoryapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Electronic'),
(2, 'Furniture'),
(4, 'Drinks'),
(5, 'Foods'),
(6, 'Tools'),
(16, 'Vehicle');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `id_category` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `date_added` timestamp NULL DEFAULT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `image`, `id_category`, `quantity`, `date_added`, `date_updated`) VALUES
(3, 'KFC Food', 'Everyones favorite food', 'https://ichef.bbci.co.uk/news/320/cpsprodpb/66A2/production/_107847262_gettyimages-1152276563-594x594.jpg', 5, 108, '2019-08-14 17:00:00', '2019-08-24 17:00:00'),
(7, 'Coca Cola', 'Thirsty? Drink this', 'https://5.imimg.com/data5/EA/EQ/MY-17263151/coca-cola-500x500.png', 4, 11, '2019-09-05 23:17:57', '2019-09-09 11:53:18'),
(11, 'BMW', 'Do you want to look cool? just buy this car', 'https://imgd.aeplcdn.com/1056x594/cw/ec/20227/BMW-X1-Right-Front-Three-Quarter-65929.jpg?v=201711021421&q=80', 16, 53, '2019-09-06 00:19:50', '2019-09-13 01:04:20'),
(22, 'Hand Tool Kit Hammer', 'Everything\'s you need', 'https://images-na.ssl-images-amazon.com/images/I/81cAJuscIYL._SX425_.jpg', 6, 16, '2019-09-08 13:16:30', '2019-09-09 11:54:34'),
(38, 'ASUS ROG ', 'The best gaming laptop', 'https://img-us1.asus.com/A/show/AW000706/2019/0126/AM0000008/201901AM260000008_15487127373610820002557.jpg!t500x500', 1, 54, '2019-09-10 07:20:16', '2019-09-13 01:06:55'),
(41, 'ROG ASUS', 'The laptop of gamers', 'https://img-us1.asus.com/A/show/AW000706/2019/0126/AM0000008/201901AM260000008_15487127373610820002557.jpg!t500x500', 1, 5, '2019-09-10 08:05:19', '2019-09-13 01:07:16'),
(52, 'Burger King', 'Hungry? Eat this', 'http://fastfoodgeek.com/wp-content/uploads/2018/01/02568-2-BK_Web_DblQtrPndKing_500x540px_CR-500x500.png', 5, 6, '2019-09-10 15:59:10', '2019-09-10 15:59:10'),
(69, 'Spring Bed', 'The most comfortable place to lay down', 'https://id-test-11.slatic.net/p/3/spring-bed-comforta-super-fit-silver-uk120x200-komplit-set-5004-0418755-8bdf9fbf7114005ac027c4a89e198987-catalog.jpg_340x340q80.jpg_.webp', 2, 45, '2019-09-13 00:59:47', '2019-09-13 01:00:19'),
(70, 'Honda', 'Best engine performance', 'https://d2pa5gi5n2e1an.cloudfront.net/global/images/product/motorcycle/Honda_PCX150/Honda_PCX150_L_1.jpg', 16, 55, '2019-09-13 01:03:35', '2019-09-13 01:04:32'),
(71, 'Samsung Galaxy', 'a highly accomplished Android tablet', 'http://p.ipricegroup.com/uploaded_b694bf6202ff92232c444b2c8b8bce1e.jpg', 1, 26, '2019-09-13 01:03:54', '2019-09-13 01:06:28');

-- --------------------------------------------------------

--
-- Table structure for table `tb_users`
--

CREATE TABLE `tb_users` (
  `userid` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `level` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_users`
--

INSERT INTO `tb_users` (`userid`, `username`, `fullname`, `password`, `email`, `level`, `created`) VALUES
(1, 'fahrulr', 'Fahrul Rozi', '4cfe7d93a8c3663676fb7be0b69820656c00c367cf3cd80e03f999ea93e14ca6', 'fahrul@gmail.com', 'regular', '2019-09-03 08:55:44'),
(2, 'kappa', 'Fahrul Rozi', '1b6ea8e6a270e86da3651ca8e1cbee425895bca272e4c6fc9436d264e8116742', 'kappa@gmail.com', 'regular', '2019-09-03 10:48:55'),
(48, 'FahrulRozi', 'Fahrul Rozi', 'adf1e49e2c5f298ce535fdab91d30096f4704b379b66c87e7b1229b3fe35ef71', 'fahrulrozi@gmail.com', 'regular', '2019-09-10 09:46:17'),
(49, 'fighting', 'asdasd', '66b1132a0173910b01ee3a15ef4e69583bbf2f7f1e4462c99efbe1b9ab5bf808', 'asdasd@gmail.com', 'regular', '2019-09-10 11:52:42'),
(50, 'fahrulrrr', 'fahrulrrr', '247c1debb5e7ea9fdebb11a32ee499477e490789fc67ad8c49916d2d912f44df', 'fahrulrrr@gmail.com', 'regular', '2019-09-10 13:05:34'),
(51, 'fahrulrozi123', 'Fahrul Rozi', 'adf1e49e2c5f298ce535fdab91d30096f4704b379b66c87e7b1229b3fe35ef71', 'fahrulrozi123@gmail.com', 'regular', '2019-09-10 13:16:04'),
(52, 'test', 'test', '37268335dd6931045bdcdf92623ff819a64244b53d0e746d438797349d4da578', 'test@test.com', 'regular', '2019-09-10 15:47:34'),
(53, 'test123', 'test123', '1b6ea8e6a270e86da3651ca8e1cbee425895bca272e4c6fc9436d264e8116742', 'test@gmail.com', 'regular', '2019-09-10 15:55:35'),
(54, 'kimi', 'dayo kimi nandayo', '1942b8a8fa459156c3f3cbd49e4f3da115d46093f44b26cd7faefa70498317fa', 'oshiete@kureta.com', 'regular', '2019-09-10 16:27:25'),
(55, 'fahrul321', 'Fahrul Rozi', '9df5c4f912ba9b56816ce3cf25be56ef0eb6131046a61ece090fa8b24d1cd4d1', 'Fahrul321@gmail.com', 'regular', '2019-09-10 16:29:20'),
(56, 'asasdasd', 'fahrul rozi', '90a49b8fc3b27d72fc8b56565291135318a2186e115f4e588afbafba8d0881ce', 'fahrulasd@gmail.com', 'regular', '2019-09-12 09:04:12'),
(57, 'asasdasd1', 'fahrul rozi', '90a49b8fc3b27d72fc8b56565291135318a2186e115f4e588afbafba8d0881ce', 'fahrulasd1@gmail.com', 'regular', '2019-09-12 09:06:47'),
(58, 'asdad', 'asdasd', 'd8a928b2043db77e340b523547bf16cb4aa483f0645fe0a290ed1f20aab76257', 'asddsa@gmail.com', 'regular', '2019-09-12 09:08:07'),
(59, 'asdasd111', 'asdasd', 'd8a928b2043db77e340b523547bf16cb4aa483f0645fe0a290ed1f20aab76257', 'asdasd11@gmail.com', 'regular', '2019-09-12 09:08:50'),
(60, 'kumaha', 'kumha', '2ad12ed231e7f84fd9f7bd5ed53a7bf392ca8dd8953a1bb8e44667d16eb82e5b', 'kumaha@gmail.com', 'regular', '2019-09-12 09:09:37'),
(61, 'fahrulrj', 'Fahrul Rozi', 'd9f7c48a3b491f5c8fc6e8963c409154db5a7f82e59c6ec443640c9adcb57b37', 'fahrulr@gmail.com', 'regular', '2019-09-12 13:56:42'),
(62, 'fahrulr123', 'Fahrul Rozi', '109fc2e2aec9f2b10997dd617b1a85f621776ef7e69700c5a309a016adadfe0e', 'fahrulr123@gmail.com', 'regular', '2019-09-12 13:57:39'),
(63, 'Edward', 'Edward Elric', 'e988331f4561195c978ced98c3bf6e97681390e9f137a86e0b4aa63f808df99c', 'edward@gmail.com', 'regular', '2019-09-13 00:56:20'),
(64, 'rozifahrul', 'rozi fahrul', 'a4045fdc4fb9ad8d18e9baf160efc58017eab583c1ed68721b92fc4d603b6138', 'rozifahrul@gmail.com', 'regular', '2019-09-13 03:09:55'),
(65, 'asdasdasd1', 'asdasdasd', 'd8a928b2043db77e340b523547bf16cb4aa483f0645fe0a290ed1f20aab76257', 'asdasd1@gmail.com', 'regular', '2019-09-13 03:23:57'),
(66, 'fahrulrozi1231', 'Fahrul Rozi', '5df030ccbd839f08ec64ea15207234f54ef58661d76fcafb1910e4c33c1a9c2e', 'fahrulrozi1231@gmail.com', 'regular', '2019-09-14 08:54:53'),
(67, 'kappa123', 'Fahrul Rozi', '1b6ea8e6a270e86da3651ca8e1cbee425895bca272e4c6fc9436d264e8116742', 'kappa123@gmail.com', 'regular', '2019-09-14 12:27:04');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `created`) VALUES
(10, 'fahrul', 'rozi', 'kappa@gmail.com', '$2a$10$4gjbGxL0W0klIz881IVkJu76XAZB/4VW/oCoc0yqs7Tg8bp/xWGjy', '2019-08-29 09:40:50'),
(71, 'fahrul', 'rozi', 'fahrul@gmail.com', '$2a$10$WZAjLiLJgusWgNaCClIRhuCQ.OPx3RA3M0dmVUDq/Tg0Q8hutEq1.', '2019-09-02 15:02:53'),
(72, 'fahrul', 'rozi', 'fahrul1@gmail.com', '$2a$10$SH/MontrFePyigd3aPpzRuvZ1aQOluz3/GmpzN716DprwUgrXI4Ua', '2019-09-02 15:03:23'),
(73, 'kaka', 'kaka', 'kaka@gmail.com', '$2a$10$sygwTxjqU243HnfJpZ.i1O.BaMAXr/QaEu.jzx3QFTK/EL87OmIue', '2019-09-02 16:27:15'),
(74, 'asd', 'asd', 'kaka', '$2a$10$x1/9tz1gbh/nZvN.I8it/OU7RBrn0ylsnD3pLIA.gBmwqpTb/xa9S', '2019-09-02 16:28:45'),
(75, 'asd', 'asd', 'kaka@gmail.coms', '$2a$10$y5CvocvpjS7HUuxCnC23Luar9aX//ZcI2RH/NPYLnsqgwfYEU8VGO', '2019-09-02 16:30:17'),
(76, 'asd', 'asd', 'kaka@gmail.comsa', '$2a$10$STCrR2Gkmi8i7oacP3tivuC1sS2k2Vzm6dK9e1wzSADyX1e5e9QZS', '2019-09-02 16:30:20'),
(77, 'asd', 'asd', 'asd@aaa.ss', '$2a$10$GJ54VD8mzUVygsvmsUkBiukNYrb3lpjqiVU4LVVWnb/LKwQHqj0m6', '2019-09-02 16:30:51'),
(78, 'dsa', 'dsa', 'dsa@asd', '$2a$10$nR/ErBzc7xV2d/Gv741DBuTCvPr.T/ONDL5n0nxTy8meDm8vuycO2', '2019-09-02 16:31:27'),
(79, 'dsa', 'asd', 'asd', '$2a$10$4sMqrdKvI0A8NHm5nxPTjuGTrek1b4WF2TYDrTf8IIzcwP5Y3E7GO', '2019-09-02 16:32:07'),
(80, 'fahrul', 'fahrul', 'fahrulfahrul@gmail.com', '$2a$10$E/WrdJOTcRBPBOsxtYRmQ.P0WqFa1yiZkyORW.TxPiQIgX1Csps3O', '2019-09-02 16:43:06'),
(81, 'asdasd', 'asdasd', 'asdasd@aaa', '$2a$10$UNU5M99niv/STaV7Dy9vx.Pep0bwviw8CveH2cW3KWiMQUAgBRFV.', '2019-09-02 18:49:44'),
(82, 'Fahrul', 'Rozi', 'rozi123@gmail.com', '$2a$10$us9PXqLivDiAJNBHrsGAneaeU7/aMreK3dNMMIQZxZz/Tui1CS.LS', '2019-09-03 02:56:12'),
(83, 'fahrul', 'rozi', 'fahrul@rozi.com', '$2a$10$p5bGWCwqs.DdUn2nIS3tM.evOBS6xFzI1.99lDdBCng2gq26Lw2Qe', '2019-09-03 07:00:23'),
(84, 'kappa', 'test', 'test@test.com2\n', '$2a$10$UsidAYL0DDv2lZ7UNym6.uWEsTdQaonfr/mqyVv7yOCEnN1GWKNaC', '2019-09-03 07:35:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`id_category`);

--
-- Indexes for table `tb_users`
--
ALTER TABLE `tb_users`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `tb_users`
--
ALTER TABLE `tb_users`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
