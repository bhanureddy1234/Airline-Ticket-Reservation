SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT;
SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS;
SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION;
SET NAMES utf8;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0; 

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";



--
-- Database: `airline_reservation`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`sushyuk`@`localhost` PROCEDURE `GetFlightStatistics` (IN `j_date` DATE)  BEGIN
 select flight_no,departure_date,IFNULL(no_of_passengers, 0) as no_of_passengers,total_capacity from (
select f.flight_no,f.departure_date,sum(t.no_of_passengers) as no_of_passengers,j.total_capacity 
from flight_details f left join ticket_details t 
on t.booking_status='CONFIRMED' 
and t.flight_no=f.flight_no 
and f.departure_date=t.journey_date 
inner join jet_details j on j.jet_id=f.jet_id
group by flight_no,journey_date) k where departure_date=j_date;
 END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` varchar(20) NOT NULL,
  `pwd` varchar(30) DEFAULT NULL,
  `staff_id` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `pwd`, `staff_id`, `name`, `email`) VALUES
('SushYuk', 'sushyuk', '101', 'sushyuk', 'sushyuk2000@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` varchar(20) NOT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(35) DEFAULT NULL,
  `phone_no` varchar(15) DEFAULT NULL,
  `address` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `pwd`, `name`, `email`, `phone_no`, `address`) VALUES
('Sushmitha', 'sush111', 'Sushmitha G', 'sushma@gmail.com', '8946579898', 'Hassan'),
('Yuktha', 'yuk126', 'Yuktha M', 'yuktha@gmail.com', '8798677879', 'Mangalore'),
('Adith', 'adith123', 'Adith', 'adith@gmail.com', '8973767879', 'Bangalore'),
('Abhi', 'abhi45', 'Abhijeeth', 'abhi11@gmail.com', '9185564764', 'Delhi'),
('Arpitha', 'arpi00', 'Arpitha', 'arpitha@gmail.com', '9934985701', 'Mysore'),
('Charles', 'ham879', 'Charles Ham', 'charles@gmail.com', '9090909090', 'Bangalore'),
('Chirag', 'chirag', 'Chirag Hegde', 'chirag@gmail.com', '8080808080', 'Chennai'),
('Harry', 'harry11', 'Harry Roshan', 'harryroshan1997@gmail.com', '9845713736', 'Hubli'),
('Aisha', 'aisha34', 'Aisha M', 'aisha00@gmail.com', '8975847589', 'Bangalore'),
('Abhilasha', 'abhi68', 'Abhilasha', 'abhilasha11@gmail.com', '9987864566', 'Hyderabad'),
('Meghana', 'meghana67', 'Meghana Shetty', 'meghana2000@gmail.com', '8974475678', 'Mysore'),
('Sam', 'sam0989', 'Sam Hanson', 'sam@gmail.com', '9076568789', 'Delhi'),
('Chandan', 'chan567', 'Chandan G', 'chandu@gmail.com', '8887675779', 'Bangalore'),
('Sujatha', 'suj123', 'Sujatha P', 'sujatha@gmail.com', '9845767568', 'Hubli');

-- --------------------------------------------------------

--
-- Table structure for table `flight_details`
--

CREATE TABLE `flight_details` (
  `flight_no` varchar(10) NOT NULL,
  `from_city` varchar(20) DEFAULT NULL,
  `to_city` varchar(20) DEFAULT NULL,
  `departure_date` date NOT NULL,
  `arrival_date` date DEFAULT NULL,
  `departure_time` time DEFAULT NULL,
  `arrival_time` time DEFAULT NULL,
  `seats_economy` int(5) DEFAULT NULL,
  `seats_business` int(5) DEFAULT NULL,
  `price_economy` int(10) DEFAULT NULL,
  `price_business` int(10) DEFAULT NULL,
  `jet_id` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flight_details`
--

INSERT INTO `flight_details` (`flight_no`, `from_city`, `to_city`, `departure_date`, `arrival_date`, `departure_time`, `arrival_time`, `seats_economy`, `seats_business`, `price_economy`, `price_business`, `jet_id`) VALUES
('AA101', 'Bangalore', 'Mumbai', '2020-12-25', '2020-12-24', '21:00:00', '01:00:00', 195, 96, 5000, 7500, '10001'),
('AA102', 'Bangalore', 'Mumbai', '2020-12-25', '2020-12-25', '10:00:00', '20:00:00', 200, 73, 5500, 8000, '10002'),
('AA103', 'Bangalore', 'Chennai', '2020-12-25', '2020-12-24', '17:00:00', '17:45:00', 150, 75, 2000, 5000, '10004'),
('AA104', 'Bangalore', 'Mysore', '2020-12-25', '2020-12-24', '09:00:00', '09:17:00', 37, 4, 1500, 1750, '10003'),
('AA105', 'Bangalore', 'Hyderabad', '2020-12-25', '2020-12-24', '13:00:00', '14:00:00', 150, 75, 3000, 3750, '10004'),
('AA101', 'Chennai', 'Mumbai', '2020-12-27', '2020-12-24', '21:00:00', '01:00:00', 200, 73, 5000, 7500, '10002'),
('AA102', 'Chennai', 'Mumbai', '2020-12-26', '2020-12-25', '10:00:00', '20:00:00', 37, 4, 5500, 8000, '10003'),
('AA103', 'Chennai', 'Bangalore', '2020-12-26', '2020-12-26', '7:00:00', '17:45:00', 150, 75, 2000, 5000, '10004'),
('AA104', 'Chennai', 'Mysore', '2020-12-26', '2020-12-25', '20:00:00', '09:17:00', 195, 96, 1500, 1750, '10001'),
('AA105', 'Chennai', 'Hyderabad', '2020-12-26', '2020-12-24', '03:00:00', '04:00:00', 150, 75, 3000, 3750, '10004'),
('AA106', 'Chennai', 'Goa', '2020-12-25', '2020-12-25', '21:00:00', '01:00:00', 195, 96, 5000, 7500, '10001'),
('AA107', 'Chennai', 'Hyderabad', '2020-12-26', '2020-12-25', '10:00:00', '12:00:00', 200, 73, 2500, 3000, '10002'),
('AI106', 'Hyderabad', 'Bangalore', '2020-12-25', '2020-12-25', '21:00:00', '01:00:00', 195, 96, 5000, 7500, '10001'),
('AI107', 'Goa', 'Hyderabad', '2020-12-26', '2020-12-25', '10:00:00', '12:00:00', 200, 73, 2500, 3000, '10002'),
('AI108', 'Hyderabad', 'Chennai', '2020-12-26', '2020-12-25', '17:00:00', '17:45:00', 150, 75, 2000, 3500, '10004'),
('AI109', 'Hyderabad', 'Mysore', '2020-12-26', '2020-12-25', '09:00:00', '09:17:00', 37, 4, 3500, 4750, '10003'),
('AA108', 'Goa', 'Chennai', '2020-12-26', '2020-12-25', '7:00:00', '12:45:00', 150, 75, 3000, 5000, '10004'),
('AA109', 'Mumbai', 'Mysore', '2020-12-26', '2020-12-25', '09:00:00', '09:17:00', 37, 4, 2500, 3500, '10003'),
('SJ101', 'Mumbai', 'Bangalore', '2020-12-25', '2020-12-25', '21:00:00', '01:00:00', 195, 96, 5000, 7500, '10001'),
('SJ102', 'Mumbai', 'Hyderabad', '2020-12-26', '2020-12-25', '10:00:00', '12:00:00', 200, 73, 2500, 3000, '10002'),
('SJ103', 'Mumbai', 'Chennai', '2020-12-26', '2020-12-25', '17:00:00', '17:45:00', 150, 75, 3000, 5000, '10004'),
('SJ104', 'Mumbai', 'Mysore', '2020-12-26', '2020-12-25', '09:00:00', '09:17:00', 37, 4, 2500, 3750, '10003'),
('SJ105', 'Mumbai', 'Delhi', '2020-12-26', '2020-12-25', '13:00:00', '14:00:00', 150, 75, 8000, 9000, '10004'),
('SJ106', 'Bangalore', 'Mumbai', '2020-12-25', '2020-12-24', '21:00:00', '01:00:00', 195, 96, 5000, 7500, '10001'),
('SJ107', 'Bangalore', 'Mumbai', '2020-12-25', '2020-12-24', '10:00:00', '12:00:00', 200, 73, 2500, 3000, '10002'),
('SJ108', 'Bangalore', 'Chennai', '2020-12-25', '2020-12-24', '17:00:00', '17:45:00', 150, 75, 1200, 1500, '10004'),
('AA108', 'Bangalore', 'Chennai', '2020-12-25', '2020-12-24', '17:00:00', '17:45:00', 150, 75, 1200, 1500, '10004'),
('AI101', 'Bangalore', 'Mumbai', '2020-12-25', '2020-12-24', '21:00:00', '01:00:00', 195, 96, 5000, 7500, '10001'),
('AI102', 'Bangalore', 'Mumbai', '2020-12-25', '2020-12-24', '10:00:00', '12:00:00', 200, 73, 2500, 3000, '10002'),
('AI103', 'Bangalore', 'Chennai', '2020-12-25', '2020-12-24', '17:00:00', '17:45:00', 150, 75, 1200, 1500, '10004'),
('AI104', 'Bangalore', 'Mysore', '2020-12-25', '2020-12-24', '09:00:00', '09:17:00', 200, 50, 1500, 1750, '10007'),
('SJ107', 'Goa', 'Mumbai', '2020-12-27', '2020-12-26', '10:00:00', '12:00:00', 200, 73, 2500, 3000, '10002'),
('SJ108', 'Pune', 'Chennai', '2020-12-26', '2020-12-25', '17:00:00', '17:45:00', 150, 75, 1200, 1500, '10004'),
('AI101', 'Thiruvanathapuram', 'Mumbai', '2020-12-26', '2020-12-24', '21:00:00', '01:00:00', 195, 96, 5000, 7500, '10001'),
('AI102', 'Pune', 'Mumbai', '2020-12-27', '2020-12-24', '10:00:00', '12:00:00', 200, 73, 2500, 3000, '10002'),
('AI103', 'Goa', 'Chennai', '2020-12-26', '2020-12-24', '17:00:00', '17:45:00', 150, 75, 1200, 1500, '10004'),
('AI104', 'Pune', 'Mysore', '2020-12-28', '2020-12-27', '09:00:00', '09:17:00', 37, 4, 1500, 1750, '10003'),
('AI105', 'Bangalore', 'Hyderabad', '2020-12-25', '2020-12-24', '13:00:00', '14:00:00', 150, 75, 3000, 3750, '10004'),
('AI106', 'Mumbai', 'Bangalore', '2020-12-27', '2020-12-25', '21:00:00', '01:00:00', 195, 96, 5000, 7500, '10001'),
('AI107', 'Mumbai', 'Hyderabad', '2020-12-28', '2020-12-25', '10:00:00', '12:00:00', 200, 73, 2500, 3000, '10002'),
('AI108', 'Mumbai', 'Chennai', '2020-12-27', '2020-12-25', '17:00:00', '17:45:00', 150, 75, 2000, 3500, '10004'),
('AI109', 'Mumbai', 'Mysore', '2020-12-28', '2020-12-25', '09:00:00', '09:17:00', 37, 4, 3500, 4750, '10003'),
('AI110', 'Chennai', 'Mysore', '2020-12-26', '2020-12-26', '09:00:00', '21:00:00', 100, 57, 2500, 4500, '10007');


-- --------------------------------------------------------

--
-- Table structure for table `frequent_flier_details`
--

CREATE TABLE `frequent_flier_details` (
  `frequent_flier_no` varchar(20) NOT NULL,
  `customer_id` varchar(20) DEFAULT NULL,
  `mileage` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `frequent_flier_details`
--

INSERT INTO `frequent_flier_details` (`frequent_flier_no`, `customer_id`, `mileage`) VALUES
('1000', 'Yuktha', 375),
('2000', 'Sushmitha', 150),
('3000', 'Abhi', 250),
('4000', 'Charles', 452),
('5000', 'Chandan', 123),
('6000', 'Aisha', 232);


-- --------------------------------------------------------

--
-- Table structure for table `jet_details`
--

CREATE TABLE `jet_details` (
  `jet_id` varchar(10) NOT NULL,
  `jet_type` varchar(20) DEFAULT NULL,
  `total_capacity` int(5) DEFAULT NULL,
  `active` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jet_details`
--

INSERT INTO `jet_details` (`jet_id`, `jet_type`, `total_capacity`, `active`) VALUES
('10001', 'Dreamliner', 300, 'Yes'),
('10002', 'Airbus A380', 275, 'Yes'),
('10003', 'ATR', 50, 'Yes'),
('10004', 'Boeing 737', 225, 'Yes'),
('10007', 'Test_Model', 250, 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `passengers`
--

CREATE TABLE `passengers` (
  `passenger_id` int(10) NOT NULL,
  `pnr` varchar(15) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  `gender` varchar(8) DEFAULT NULL,
  `meal_choice` varchar(5) DEFAULT NULL,
  `frequent_flier_no` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passengers`
--

INSERT INTO `passengers` (`passenger_id`, `pnr`, `name`, `age`, `gender`, `meal_choice`, `frequent_flier_no`) VALUES
(1122, '1669050', 'Sushmitha G', 20, 'female', 'yes', '2000'),
(1122, '2369143', 'Charles Ham', 40, 'male', 'yes', 4000),
(1122, '3027167', 'Harry Roshan', 21, 'male', 'yes', NULL),
(1122, '3773951', 'Chirag Hegde', 31, 'male', 'yes', NULL),
(1122, '4797983', 'Abhijeeth', 34, 'male', 'yes', 3000),
(1334, '4797983', 'Arpitha', 28, 'female', 'yes', NULL),
(1334, '5421865', 'Chandan G', 18, 'male', 'yes', 5000),
(1334, '8503285', 'Aisha', 20, 'female', 'yes', '6000'),
(2234, '1669050', 'Sujatha P', 45, 'female', 'yes', NULL),
(2234, '2369143', 'Harry Roshan', 21, 'male', 'yes', NULL),
(2234, '3027167', 'Abhijeeth', 34, 'male', 'yes', 3000),
(2234, '3773951', 'Yuktha M', 20, 'female', 'yes', 1000),
(2222, '4797983', 'Charles Ham', 40, 'male', 'yes', '4000'),
(2222, '5421865', 'Sujatha P', 45, 'female', 'yes', NULL),
(2222, '6980157', 'Sushmitha G', 20, 'female', 'yes', 2000),
(2222, '8503285', 'Akash', 20, 'male', 'yes', NULL),
(3345, '1669050', 'Anjan', 10, 'male', 'yes', NULL),
(3345, '2369143', 'Bharath', 10, 'male', 'yes', NULL),
(3345, '3773951', 'Yuktha M', 20, 'female', 'yes', '1000'),
(3123, '4797983', 'Sushmitha G', 20, 'female', 'yes', '2000'),
(3123, '5421865', 'Chirag Hegde', 31, 'male', 'yes', NULL),
(3123, '3773954', 'Yuktha M', 20, 'female', 'yes', '1000'),
(2544, '5423465', 'Sujatha P', 45, 'female', 'yes', NULL),
(2544, '6924157', 'Srujan', 17, 'male', 'yes', NULL),
(2675, '2133285', 'Sandhya', 20, 'female', 'yes', NULL),
(3344, '1669050', 'Pranav', 10, 'male', 'yes', NULL),
(3344, '2369143', 'Swathi Shetty', 10, 'female', 'yes', NULL),
(4000, '2369143', 'Arpitha', 28, 'female', 'yes', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment_details`
--

CREATE TABLE `payment_details` (
  `payment_id` varchar(20) NOT NULL,
  `pnr` varchar(15) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_amount` int(6) DEFAULT NULL,
  `payment_mode` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_details`
--

INSERT INTO `payment_details` (`payment_id`, `pnr`, `payment_date`, `payment_amount`, `payment_mode`) VALUES
('120000248', '4797983', '2020-12-10', 4200, 'credit card'),
('142539461', '3773951', '2020-12-13', 4050, 'credit card'),
('165125569', '8503285', '2020-12-12', 7500, 'net banking'),
('467972527', '2369143', '2020-12-12', 33400, 'debit card'),
('557778944', '6980157', '2020-12-09', 11700, 'credit card'),
('620041544', '1669050', '2020-12-20', 4800, 'debit card'),
('665360715', '5421865', '2020-12-21', 15750, 'net banking'),
('862686553', '3027167', '2020-12-07', 10700, 'debit card');

--
-- Triggers `payment_details`
--
DELIMITER $$
CREATE TRIGGER `update_ticket_after_payment` AFTER INSERT ON `payment_details` FOR EACH ROW UPDATE ticket_details
     SET booking_status='CONFIRMED', payment_id= NEW.payment_id
   WHERE pnr = NEW.pnr
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_details`
--

CREATE TABLE `ticket_details` (
  `pnr` varchar(15) NOT NULL,
  `date_of_reservation` date DEFAULT NULL,
  `flight_no` varchar(10) DEFAULT NULL,
  `journey_date` date DEFAULT NULL,
  `class` varchar(10) DEFAULT NULL,
  `booking_status` varchar(20) DEFAULT NULL,
  `no_of_passengers` int(5) DEFAULT NULL,
  `lounge_access` varchar(5) DEFAULT NULL,
  `priority_checkin` varchar(5) DEFAULT NULL,
  `insurance` varchar(5) DEFAULT NULL,
  `payment_id` varchar(20) DEFAULT NULL,
  `customer_id` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket_details`
--

INSERT INTO `ticket_details` (`pnr`, `date_of_reservation`, `flight_no`, `journey_date`, `class`, `booking_status`, `no_of_passengers`, `lounge_access`, `priority_checkin`, `insurance`, `payment_id`, `customer_id`) VALUES
('1669050', '2020-12-12', 'AA104', '2020-12-25', 'business', 'CONFIRMED', 3, 'yes', 'yes', 'yes', '620041544', 'Yuktha'),
('2369143', '2020-12-13', 'AA101', '2020-12-25', 'business', 'CONFIRMED', 4, 'yes', 'yes', 'yes', '467972527', 'Sushmitha'),
('3027167', '2020-12-10', 'AA101', '2020-12-26', 'economy', 'CONFIRMED', 2, 'no', 'no', 'yes', '862686553', 'Abhi'),
('3773951', '2020-12-09', 'AA104', '2020-12-25', 'economy', 'CONFIRMED', 3, 'yes', 'yes', 'yes', '142539461', 'Yuktha'),
('4797983', '2020-12-13', 'AA104', '2020-12-26', 'business', 'CONFIRMED', 3, 'yes', 'no', 'yes', '120000248', 'Charles'),
('5421865', '2020-12-12', 'AI101', '2020-12-26', 'economy', 'CONFIRMED', 3, 'no', 'no', 'no', '665360715', 'Chandan'),
('6980157', '2020-12-21', 'SJ101', '2020-12-25', 'economy', 'CANCELED', 2, 'yes', 'yes', 'yes', '557778944', 'Sushmitha'),
('8503285', '2020-12-10', 'AI102', '2020-12-25', 'business', 'CONFIRMED', 2, 'yes', 'yes', 'no', '165125569', 'Aisha');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `flight_details`
--
ALTER TABLE `flight_details`
  ADD PRIMARY KEY (`flight_no`,`departure_date`),
  ADD KEY `jet_id` (`jet_id`);

--
-- Indexes for table `frequent_flier_details`
--
ALTER TABLE `frequent_flier_details`
  ADD PRIMARY KEY (`frequent_flier_no`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `jet_details`
--
ALTER TABLE `jet_details`
  ADD PRIMARY KEY (`jet_id`);

--
-- Indexes for table `passengers`
--
ALTER TABLE `passengers`
  ADD PRIMARY KEY (`passenger_id`,`pnr`),
  ADD KEY `pnr` (`pnr`),
  ADD KEY `frequent_flier_no` (`frequent_flier_no`);

--
-- Indexes for table `payment_details`
--
ALTER TABLE `payment_details`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `pnr` (`pnr`);

--
-- Indexes for table `ticket_details`
--
ALTER TABLE `ticket_details`
  ADD PRIMARY KEY (`pnr`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `journey_date` (`journey_date`),
  ADD KEY `flight_no` (`flight_no`),
  ADD KEY `flight_no_2` (`flight_no`,`journey_date`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `flight_details`
--
ALTER TABLE `flight_details`
  ADD CONSTRAINT `flight_details_ibfk_1` FOREIGN KEY (`jet_id`) REFERENCES `jet_details` (`jet_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `frequent_flier_details`
--
ALTER TABLE `frequent_flier_details`
  ADD CONSTRAINT `frequent_flier_details_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `passengers`
--
ALTER TABLE `passengers`
  ADD CONSTRAINT `passengers_ibfk_1` FOREIGN KEY (`pnr`) REFERENCES `ticket_details` (`pnr`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `passengers_ibfk_2` FOREIGN KEY (`frequent_flier_no`) REFERENCES `frequent_flier_details` (`frequent_flier_no`) ON UPDATE CASCADE;

--
-- Constraints for table `payment_details`
--
ALTER TABLE `payment_details`
  ADD CONSTRAINT `payment_details_ibfk_1` FOREIGN KEY (`pnr`) REFERENCES `ticket_details` (`pnr`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ticket_details`
--
ALTER TABLE `ticket_details`
  ADD CONSTRAINT `ticket_details_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_details_ibfk_3` FOREIGN KEY (`flight_no`,`journey_date`) REFERENCES `flight_details` (`flight_no`, `departure_date`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT;
SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS;
SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION;
SET SQL_NOTES=@OLD_SQL_NOTES;