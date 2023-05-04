-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2023 at 11:35 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `car_id` int(11) NOT NULL,
  `driv_id` int(11) NOT NULL,
  `car_field_office` varchar(256) NOT NULL,
  `car_office_code` varchar(256) NOT NULL,
  `car_receipt_no` varchar(256) NOT NULL,
  `car_tin_no` varchar(256) DEFAULT NULL,
  `car_plate_no` char(8) NOT NULL,
  `car_model` varchar(20) NOT NULL,
  `car_color` varchar(20) NOT NULL,
  `car_brand` varchar(20) NOT NULL,
  `car_classification` varchar(256) NOT NULL,
  `car_engine_no` varchar(256) NOT NULL,
  `car_chassis_no` varchar(256) NOT NULL,
  `car_year` varchar(256) NOT NULL,
  `car_type` varchar(256) NOT NULL,
  `car_category` varchar(256) NOT NULL,
  `car_fuel` varchar(256) NOT NULL,
  `car_renewal_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `car_created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `driv_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `driv_license_no` char(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `passengers`
--

INSERT INTO `passengers` (`pass_id`, `user_id`, `pass_id_type`, `pass_id_number`, `pass_id_rejected`, `pass_id_confirmed_at`) VALUES
(1, 1, '', '', 0, NULL),
(2, 2, 'driver', '21312321', 0, '2023-05-03 18:34:18'),
(3, 3, '', '', 0, NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_type`, `user_fname`, `user_mname`, `user_lname`, `user_contact_no`, `user_email`, `user_password`, `user_barangay`, `user_city`, `user_province`, `user_verified_at`, `user_created_at`) VALUES
(1, 'admin', 'Jhon Mark', '', 'Santos', '09654106978', 'jeyymsantos@gmail.com', '12345678', 'Corazon', 'Calumpit', 'Bulacan', '2023-04-30 16:47:31', '2023-05-03 16:47:04'),
(2, 'Passenger', 'Caryl Rociel', '', 'Santiago', '', 'caryl@gmail.com', '12345678', 'Corazon', 'Calumpit', 'Bulacan', '2023-05-07 17:13:35', '2023-05-03 17:13:19'),
(3, 'Passenger', 'Casey Kent', 'Emmanuel', 'Salonga', '', 'casey@gmail.com', '12345678', 'Corazon', 'Calumpit', 'Bulacan', '2023-04-30 18:22:37', '2023-05-03 18:21:48');

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
  ADD KEY `driv_id` (`driv_id`);

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
  MODIFY `car_id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `pass_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  ADD CONSTRAINT `cars_ibfk_1` FOREIGN KEY (`driv_id`) REFERENCES `drivers` (`driv_id`);

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
