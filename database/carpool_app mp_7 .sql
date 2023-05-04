-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2023 at 06:19 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `carpool_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `book_id` int(11) NOT NULL,
  `trip_id` int(11) NOT NULL,
  `pass_id` int(11) NOT NULL,
  `book_seat_location` varchar(20) NOT NULL,
  `book_pickup_barangay` varchar(255) NOT NULL,
  `book_pickup_city` varchar(255) NOT NULL,
  `book_pickup_province` varchar(255) NOT NULL,
  `book_pickup_description` varchar(255) DEFAULT NULL,
  `book_status` varchar(20) NOT NULL,
  `book_driver_confirmed_at` timestamp NULL DEFAULT NULL,
  `book_passenger_confirmed_at` timestamp NULL DEFAULT NULL,
  `book_created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `car_id` int(11) NOT NULL,
  `driv_id` int(11) NOT NULL,
  `car_plate_no` char(8) NOT NULL,
  `car_model` varchar(20) NOT NULL,
  `car_color` varchar(20) NOT NULL,
  `car_brand` varchar(20) NOT NULL,
  `car_rejected` tinyint(1) NOT NULL,
  `car_confirmed_at` timestamp NULL DEFAULT NULL,
  `car_created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`car_id`, `driv_id`, `car_plate_no`, `car_model`, `car_color`, `car_brand`, `car_rejected`, `car_confirmed_at`, `car_created_at`) VALUES
(1, 2, 'ABC-1234', 'Model', 'Blue', 'Toyota', 0, '2023-05-02 01:06:18', '2023-05-02 01:06:08'),
(2, 6, 'ABC-1234', 'Model', 'Blue', 'Toyota', 1, NULL, '2023-05-02 02:11:49'),
(3, 9, 'ABC-1234', 'Model', 'Blue', 'Toyota', 0, '2023-05-02 02:21:40', '2023-05-02 02:21:10'),
(4, 9, 'ABC-1234', 'Model', 'Yellow', 'Toyota', 1, NULL, '2023-05-02 02:22:41'),
(5, 10, 'ABC-1234', 'model', 'blue', 'brand', 0, '2023-05-03 08:25:03', '2023-05-03 08:24:47'),
(6, 10, 'ABC-1234', 'model', 'color', 'brand', 1, NULL, '2023-05-03 08:25:26'),
(7, 11, 'ABC-1234', 'Model', 'color', 'brand', 0, NULL, '2023-05-03 08:37:46');

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `driv_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `driv_license_no` char(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ewallets`
--

CREATE TABLE `ewallets` (
  `wallet_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `wallet_type` varchar(20) NOT NULL,
  `wallet_amount` float(9,2) NOT NULL,
  `wallet_status` varchar(20) NOT NULL,
  `wallet_reference` varchar(50) NOT NULL,
  `wallet_transaction_created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feedbacks`
--

CREATE TABLE `feedbacks` (
  `fdb_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `fdb_driver` varchar(255) NOT NULL,
  `fdb_driver_rating` char(5) NOT NULL,
  `fdb_passenger` varchar(255) NOT NULL,
  `fdb_passenger_rating` char(5) NOT NULL,
  `fdb_driver_created_at` timestamp NULL DEFAULT NULL,
  `fdb_passenger_created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `passengers`
--

CREATE TABLE `passengers` (
  `pass_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pass_id_type` varchar(20) DEFAULT NULL,
  `pass_id_number` varchar(20) DEFAULT NULL,
  `pass_id_rejected` tinyint(1) NOT NULL,
  `pass_id_confirmed_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `passengers`
--

INSERT INTO `passengers` (`pass_id`, `user_id`, `pass_id_type`, `pass_id_number`, `pass_id_rejected`, `pass_id_confirmed_at`) VALUES
(1, 4, '', '', 0, NULL),
(2, 5, 'driver', '12321', 0, '2023-05-02 01:46:26'),
(3, 6, '', '231dsa-dsad', 1, NULL),
(4, 7, '', '', 0, NULL),
(5, 8, 'driver', '321', 0, '2023-05-02 02:15:32'),
(6, 9, 'driver', '12345', 0, '2023-05-02 02:18:10'),
(7, 10, 'driver', '123', 0, '2023-05-03 08:24:17'),
(8, 11, 'driver', 'jeyym', 0, '2023-05-03 08:37:28');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `payment_amount` float(9,2) NOT NULL,
  `payment_status` varchar(8) NOT NULL,
  `payment_confirmed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rates`
--

CREATE TABLE `rates` (
  `rate_id` int(11) NOT NULL,
  `rate_front` float(9,2) NOT NULL,
  `rate_left` float(9,2) NOT NULL,
  `rate_right` float(9,2) NOT NULL,
  `rate_middle` float(9,2) NOT NULL,
  `rate_created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trips`
--

CREATE TABLE `trips` (
  `trip_id` int(11) NOT NULL,
  `car_id` int(11) NOT NULL,
  `rate_id` int(11) NOT NULL,
  `trip_departure_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `trip_start_barangay` varchar(255) NOT NULL,
  `trip_start_city` varchar(255) NOT NULL,
  `trip_start_province` varchar(255) NOT NULL,
  `trip_end_barangay` varchar(255) NOT NULL,
  `trip_end_city` varchar(255) NOT NULL,
  `trip_end_province` varchar(255) NOT NULL,
  `trip_status` varchar(20) NOT NULL,
  `trip_created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_type` varchar(10) DEFAULT NULL,
  `user_fname` varchar(255) NOT NULL,
  `user_mname` varchar(255) DEFAULT NULL,
  `user_lname` varchar(255) NOT NULL,
  `user_contact_no` char(13) DEFAULT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_barangay` varchar(255) NOT NULL,
  `user_city` varchar(255) NOT NULL,
  `user_province` varchar(255) NOT NULL,
  `user_verified_at` timestamp NULL DEFAULT NULL,
  `user_created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_type`, `user_fname`, `user_mname`, `user_lname`, `user_contact_no`, `user_email`, `user_password`, `user_barangay`, `user_city`, `user_province`, `user_verified_at`, `user_created_at`) VALUES
(1, 'admin', 'Jeyymz', '', 'Santos', '', 'jeyymsantos@gmail.com', '12345678', 'Corazon', 'Calumpit', 'Bulacan', '2023-05-01 23:42:01', '2023-05-01 23:18:39'),
(2, 'Driver', 'Caryl Rociel', NULL, 'Santiago', NULL, 'caryl@gmail.com', '12345678', 'Sta Cruz', 'Baliwag', 'Bulacan', '2023-05-02 23:57:08', '2023-05-01 23:57:47'),
(3, 'Passenger', 'VAL', 'GREGORIO', 'SANTOS', '', 'stimalolos049@gmail.com', '12345678', 'dfsde', 'BULACAN', 'dsadas', NULL, '2023-05-02 01:28:35'),
(4, 'Passenger', 'Jhon Mark', '', 'Santos', '09217456414', 'jeyymsantodsas@gmail.com', '12345678', 'fdsd', 'Calumpit', 'Bulacan', NULL, '2023-05-02 01:30:19'),
(5, 'Passenger', 'Nichole Joyce', '', 'Santos', '09217456414', 'nichole@gmail.com', '12345678', 'hey', 'you', 'dsaji', '2023-05-03 01:31:47', '2023-05-02 01:31:25'),
(6, 'Passenger', 'Brenley Ian', '', 'Robles', '', 'brenley@gmail.com', '12345678', 'hdisa', 'dhsai', 'Balite', '2023-05-02 01:41:19', '2023-05-02 01:41:07'),
(7, 'Passenger', 'Arabella', '', 'Flores', '', 'Arabella@gmail.com', '12345678', 'idsja', 'dsjai', 'dsjai', NULL, '2023-05-02 01:42:12'),
(8, 'Passenger', 'Sample', '', 'Account', '', 'sample@gmail.com', '12345678', 'Hey', 'You', 'Hey', '2023-05-02 02:13:02', '2023-05-02 02:12:50'),
(9, 'Driver', 'Sam', '', 'Espino Jr', '', 'sam@gmail.com', '12345678', 'Corazon', 'Baliwag', 'Bulacan', '2023-05-02 02:16:58', '2023-05-02 02:16:47'),
(10, 'Driver', 'Caryl Rociel', '', 'Santiago', '', 'caryl.santiago@gmail.com', '12345678', 'Corazon', 'Calumpit', 'Bulacan', '2023-05-03 08:23:57', '2023-05-03 08:22:47'),
(11, 'Passenger', 'Jhon Mark', '', 'Santos', '', '123@gmail.com', '12345678', 'rew', 'Calumpit', 'Bulacan', '2023-05-03 08:35:38', '2023-05-03 08:31:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `trip_id` (`trip_id`),
  ADD KEY `pass_id` (`pass_id`);

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`car_id`),
  ADD KEY `cars_ibfk_1` (`driv_id`);

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`driv_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `ewallets`
--
ALTER TABLE `ewallets`
  ADD PRIMARY KEY (`wallet_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `payment_id` (`payment_id`);

--
-- Indexes for table `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD PRIMARY KEY (`fdb_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `passengers`
--
ALTER TABLE `passengers`
  ADD PRIMARY KEY (`pass_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `rates`
--
ALTER TABLE `rates`
  ADD PRIMARY KEY (`rate_id`);

--
-- Indexes for table `trips`
--
ALTER TABLE `trips`
  ADD PRIMARY KEY (`trip_id`),
  ADD KEY `car_id` (`car_id`),
  ADD KEY `rate_id` (`rate_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `car_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `driv_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ewallets`
--
ALTER TABLE `ewallets`
  MODIFY `wallet_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedbacks`
--
ALTER TABLE `feedbacks`
  MODIFY `fdb_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `passengers`
--
ALTER TABLE `passengers`
  MODIFY `pass_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rates`
--
ALTER TABLE `rates`
  MODIFY `rate_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trips`
--
ALTER TABLE `trips`
  MODIFY `trip_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`trip_id`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`pass_id`) REFERENCES `passengers` (`pass_id`);

--
-- Constraints for table `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `cars_ibfk_1` FOREIGN KEY (`driv_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `drivers`
--
ALTER TABLE `drivers`
  ADD CONSTRAINT `drivers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `ewallets`
--
ALTER TABLE `ewallets`
  ADD CONSTRAINT `ewallets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `ewallets_ibfk_2` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`payment_id`);

--
-- Constraints for table `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD CONSTRAINT `feedbacks_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `bookings` (`book_id`);

--
-- Constraints for table `passengers`
--
ALTER TABLE `passengers`
  ADD CONSTRAINT `passengers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `bookings` (`book_id`);

--
-- Constraints for table `trips`
--
ALTER TABLE `trips`
  ADD CONSTRAINT `trips_ibfk_1` FOREIGN KEY (`car_id`) REFERENCES `cars` (`car_id`),
  ADD CONSTRAINT `trips_ibfk_2` FOREIGN KEY (`rate_id`) REFERENCES `rates` (`rate_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
