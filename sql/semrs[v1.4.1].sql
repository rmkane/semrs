-- phpMyAdmin SQL Dump
-- version 3.4.10.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 19, 2012 at 11:08 AM
-- Server version: 5.5.20
-- PHP Version: 5.3.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `semrs`
--

-- --------------------------------------------------------

--
-- Table structure for table `facility`
--

CREATE TABLE IF NOT EXISTS `facility` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `phone` varchar(255) NOT NULL DEFAULT '',
  `fax` varchar(255) NOT NULL DEFAULT '',
  `street` varchar(255) NOT NULL DEFAULT '',
  `postal_code` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(255) NOT NULL DEFAULT '',
  `country` varchar(255) NOT NULL DEFAULT '',
  `notes` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `facility`
--

INSERT INTO `facility` (`id`, `name`, `phone`, `fax`, `street`, `postal_code`, `city`, `state`, `country`, `notes`) VALUES
(1, 'Hood College', '(301) 663-3131', 'N/A', '401 Rosemont Ave', '21701', 'Frederick', 'Md', 'USA', 'Home of the Blazers.'),
(2, 'My House', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a'),
(3, 'A Clinic', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a');

-- --------------------------------------------------------

--
-- Table structure for table `geo_country_reference`
--

CREATE TABLE IF NOT EXISTS `geo_country_reference` (
  `countries_id` int(5) NOT NULL AUTO_INCREMENT,
  `countries_name` varchar(64) DEFAULT NULL,
  `countries_iso_code_2` char(2) NOT NULL DEFAULT '',
  `countries_iso_code_3` char(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`countries_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=240 ;

--
-- Dumping data for table `geo_country_reference`
--

INSERT INTO `geo_country_reference` (`countries_id`, `countries_name`, `countries_iso_code_2`, `countries_iso_code_3`) VALUES
(1, 'Afghanistan', 'AF', 'AFG'),
(2, 'Albania', 'AL', 'ALB'),
(3, 'Algeria', 'DZ', 'DZA'),
(4, 'American Samoa', 'AS', 'ASM'),
(5, 'Andorra', 'AD', 'AND'),
(6, 'Angola', 'AO', 'AGO'),
(7, 'Anguilla', 'AI', 'AIA'),
(8, 'Antarctica', 'AQ', 'ATA'),
(9, 'Antigua and Barbuda', 'AG', 'ATG'),
(10, 'Argentina', 'AR', 'ARG'),
(11, 'Armenia', 'AM', 'ARM'),
(12, 'Aruba', 'AW', 'ABW'),
(13, 'Australia', 'AU', 'AUS'),
(14, 'Austria', 'AT', 'AUT'),
(15, 'Azerbaijan', 'AZ', 'AZE'),
(16, 'Bahamas', 'BS', 'BHS'),
(17, 'Bahrain', 'BH', 'BHR'),
(18, 'Bangladesh', 'BD', 'BGD'),
(19, 'Barbados', 'BB', 'BRB'),
(20, 'Belarus', 'BY', 'BLR'),
(21, 'Belgium', 'BE', 'BEL'),
(22, 'Belize', 'BZ', 'BLZ'),
(23, 'Benin', 'BJ', 'BEN'),
(24, 'Bermuda', 'BM', 'BMU'),
(25, 'Bhutan', 'BT', 'BTN'),
(26, 'Bolivia', 'BO', 'BOL'),
(27, 'Bosnia and Herzegowina', 'BA', 'BIH'),
(28, 'Botswana', 'BW', 'BWA'),
(29, 'Bouvet Island', 'BV', 'BVT'),
(30, 'Brazil', 'BR', 'BRA'),
(31, 'British Indian Ocean Territory', 'IO', 'IOT'),
(32, 'Brunei Darussalam', 'BN', 'BRN'),
(33, 'Bulgaria', 'BG', 'BGR'),
(34, 'Burkina Faso', 'BF', 'BFA'),
(35, 'Burundi', 'BI', 'BDI'),
(36, 'Cambodia', 'KH', 'KHM'),
(37, 'Cameroon', 'CM', 'CMR'),
(38, 'Canada', 'CA', 'CAN'),
(39, 'Cape Verde', 'CV', 'CPV'),
(40, 'Cayman Islands', 'KY', 'CYM'),
(41, 'Central African Republic', 'CF', 'CAF'),
(42, 'Chad', 'TD', 'TCD'),
(43, 'Chile', 'CL', 'CHL'),
(44, 'China', 'CN', 'CHN'),
(45, 'Christmas Island', 'CX', 'CXR'),
(46, 'Cocos (Keeling) Islands', 'CC', 'CCK'),
(47, 'Colombia', 'CO', 'COL'),
(48, 'Comoros', 'KM', 'COM'),
(49, 'Congo', 'CG', 'COG'),
(50, 'Cook Islands', 'CK', 'COK'),
(51, 'Costa Rica', 'CR', 'CRI'),
(52, 'Cote D Ivoire', 'CI', 'CIV'),
(53, 'Croatia', 'HR', 'HRV'),
(54, 'Cuba', 'CU', 'CUB'),
(55, 'Cyprus', 'CY', 'CYP'),
(56, 'Czech Republic', 'CZ', 'CZE'),
(57, 'Denmark', 'DK', 'DNK'),
(58, 'Djibouti', 'DJ', 'DJI'),
(59, 'Dominica', 'DM', 'DMA'),
(60, 'Dominican Republic', 'DO', 'DOM'),
(61, 'East Timor', 'TP', 'TMP'),
(62, 'Ecuador', 'EC', 'ECU'),
(63, 'Egypt', 'EG', 'EGY'),
(64, 'El Salvador', 'SV', 'SLV'),
(65, 'Equatorial Guinea', 'GQ', 'GNQ'),
(66, 'Eritrea', 'ER', 'ERI'),
(67, 'Estonia', 'EE', 'EST'),
(68, 'Ethiopia', 'ET', 'ETH'),
(69, 'Falkland Islands (Malvinas)', 'FK', 'FLK'),
(70, 'Faroe Islands', 'FO', 'FRO'),
(71, 'Fiji', 'FJ', 'FJI'),
(72, 'Finland', 'FI', 'FIN'),
(73, 'France', 'FR', 'FRA'),
(74, 'France, MEtropolitan', 'FX', 'FXX'),
(75, 'French Guiana', 'GF', 'GUF'),
(76, 'French Polynesia', 'PF', 'PYF'),
(77, 'French Southern Territories', 'TF', 'ATF'),
(78, 'Gabon', 'GA', 'GAB'),
(79, 'Gambia', 'GM', 'GMB'),
(80, 'Georgia', 'GE', 'GEO'),
(81, 'Germany', 'DE', 'DEU'),
(82, 'Ghana', 'GH', 'GHA'),
(83, 'Gibraltar', 'GI', 'GIB'),
(84, 'Greece', 'GR', 'GRC'),
(85, 'Greenland', 'GL', 'GRL'),
(86, 'Grenada', 'GD', 'GRD'),
(87, 'Guadeloupe', 'GP', 'GLP'),
(88, 'Guam', 'GU', 'GUM'),
(89, 'Guatemala', 'GT', 'GTM'),
(90, 'Guinea', 'GN', 'GIN'),
(91, 'Guinea-bissau', 'GW', 'GNB'),
(92, 'Guyana', 'GY', 'GUY'),
(93, 'Haiti', 'HT', 'HTI'),
(94, 'Heard and Mc Donald Islands', 'HM', 'HMD'),
(95, 'Honduras', 'HN', 'HND'),
(96, 'Hong Kong', 'HK', 'HKG'),
(97, 'Hungary', 'HU', 'HUN'),
(98, 'Iceland', 'IS', 'ISL'),
(99, 'India', 'IN', 'IND'),
(100, 'Indonesia', 'ID', 'IDN'),
(101, 'Iran (Islamic Republic of)', 'IR', 'IRN'),
(102, 'Iraq', 'IQ', 'IRQ'),
(103, 'Ireland', 'IE', 'IRL'),
(104, 'Israel', 'IL', 'ISR'),
(105, 'Italy', 'IT', 'ITA'),
(106, 'Jamaica', 'JM', 'JAM'),
(107, 'Japan', 'JP', 'JPN'),
(108, 'Jordan', 'JO', 'JOR'),
(109, 'Kazakhstan', 'KZ', 'KAZ'),
(110, 'Kenya', 'KE', 'KEN'),
(111, 'Kiribati', 'KI', 'KIR'),
(112, 'Korea, Democratic Peoples Republic of', 'KP', 'PRK'),
(113, 'Korea, Republic of', 'KR', 'KOR'),
(114, 'Kuwait', 'KW', 'KWT'),
(115, 'Kyrgyzstan', 'KG', 'KGZ'),
(116, 'Lao Peoples Democratic Republic', 'LA', 'LAO'),
(117, 'Latvia', 'LV', 'LVA'),
(118, 'Lebanon', 'LB', 'LBN'),
(119, 'Lesotho', 'LS', 'LSO'),
(120, 'Liberia', 'LR', 'LBR'),
(121, 'Libyan Arab Jamahiriya', 'LY', 'LBY'),
(122, 'Liechtenstein', 'LI', 'LIE'),
(123, 'Lithuania', 'LT', 'LTU'),
(124, 'Luxembourg', 'LU', 'LUX'),
(125, 'Macau', 'MO', 'MAC'),
(126, 'Macedonia, The Former Yugoslav Republic of', 'MK', 'MKD'),
(127, 'Madagascar', 'MG', 'MDG'),
(128, 'Malawi', 'MW', 'MWI'),
(129, 'Malaysia', 'MY', 'MYS'),
(130, 'Maldives', 'MV', 'MDV'),
(131, 'Mali', 'ML', 'MLI'),
(132, 'Malta', 'MT', 'MLT'),
(133, 'Marshall Islands', 'MH', 'MHL'),
(134, 'Martinique', 'MQ', 'MTQ'),
(135, 'Mauritania', 'MR', 'MRT'),
(136, 'Mauritius', 'MU', 'MUS'),
(137, 'Mayotte', 'YT', 'MYT'),
(138, 'Mexico', 'MX', 'MEX'),
(139, 'Micronesia, Federated States of', 'FM', 'FSM'),
(140, 'Moldova, Republic of', 'MD', 'MDA'),
(141, 'Monaco', 'MC', 'MCO'),
(142, 'Mongolia', 'MN', 'MNG'),
(143, 'Montserrat', 'MS', 'MSR'),
(144, 'Morocco', 'MA', 'MAR'),
(145, 'Mozambique', 'MZ', 'MOZ'),
(146, 'Myanmar', 'MM', 'MMR'),
(147, 'Namibia', 'NA', 'NAM'),
(148, 'Nauru', 'NR', 'NRU'),
(149, 'Nepal', 'NP', 'NPL'),
(150, 'Netherlands', 'NL', 'NLD'),
(151, 'Netherlands Antilles', 'AN', 'ANT'),
(152, 'New Caledonia', 'NC', 'NCL'),
(153, 'New Zealand', 'NZ', 'NZL'),
(154, 'Nicaragua', 'NI', 'NIC'),
(155, 'Niger', 'NE', 'NER'),
(156, 'Nigeria', 'NG', 'NGA'),
(157, 'Niue', 'NU', 'NIU'),
(158, 'Norfolk Island', 'NF', 'NFK'),
(159, 'Northern Mariana Islands', 'MP', 'MNP'),
(160, 'Norway', 'NO', 'NOR'),
(161, 'Oman', 'OM', 'OMN'),
(162, 'Pakistan', 'PK', 'PAK'),
(163, 'Palau', 'PW', 'PLW'),
(164, 'Panama', 'PA', 'PAN'),
(165, 'Papua New Guinea', 'PG', 'PNG'),
(166, 'Paraguay', 'PY', 'PRY'),
(167, 'Peru', 'PE', 'PER'),
(168, 'Philippines', 'PH', 'PHL'),
(169, 'Pitcairn', 'PN', 'PCN'),
(170, 'Poland', 'PL', 'POL'),
(171, 'Portugal', 'PT', 'PRT'),
(172, 'Puerto Rico', 'PR', 'PRI'),
(173, 'Qatar', 'QA', 'QAT'),
(174, 'Reunion', 'RE', 'REU'),
(175, 'Romania', 'RO', 'ROM'),
(176, 'Russian Federation', 'RU', 'RUS'),
(177, 'Rwanda', 'RW', 'RWA'),
(178, 'Saint Kitts and Nevis', 'KN', 'KNA'),
(179, 'Saint Lucia', 'LC', 'LCA'),
(180, 'Saint Vincent and the Grenadines', 'VC', 'VCT'),
(181, 'Samoa', 'WS', 'WSM'),
(182, 'San Marino', 'SM', 'SMR'),
(183, 'Sao Tome and Principe', 'ST', 'STP'),
(184, 'Saudi Arabia', 'SA', 'SAU'),
(185, 'Senegal', 'SN', 'SEN'),
(186, 'Seychelles', 'SC', 'SYC'),
(187, 'Sierra Leone', 'SL', 'SLE'),
(188, 'Singapore', 'SG', 'SGP'),
(189, 'Slovakia (Slovak Republic)', 'SK', 'SVK'),
(190, 'Slovenia', 'SI', 'SVN'),
(191, 'Solomon Islands', 'SB', 'SLB'),
(192, 'Somalia', 'SO', 'SOM'),
(193, 'South Africa', 'ZA', 'ZAF'),
(194, 'South Georgia and the South Sandwich Islands', 'GS', 'SGS'),
(195, 'Spain', 'ES', 'ESP'),
(196, 'Sri Lanka', 'LK', 'LKA'),
(197, 'St. Helena', 'SH', 'SHN'),
(198, 'St. Pierre and Miquelon', 'PM', 'SPM'),
(199, 'Sudan', 'SD', 'SDN'),
(200, 'Suriname', 'SR', 'SUR'),
(201, 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM'),
(202, 'Swaziland', 'SZ', 'SWZ'),
(203, 'Sweden', 'SE', 'SWE'),
(204, 'Switzerland', 'CH', 'CHE'),
(205, 'Syrian Arab Republic', 'SY', 'SYR'),
(206, 'Taiwan, Province of China', 'TW', 'TWN'),
(207, 'Tajikistan', 'TJ', 'TJK'),
(208, 'Tanzania, United Republic of', 'TZ', 'TZA'),
(209, 'Thailand', 'TH', 'THA'),
(210, 'Togo', 'TG', 'TGO'),
(211, 'Tokelau', 'TK', 'TKL'),
(212, 'Tonga', 'TO', 'TON'),
(213, 'Trinidad and Tobago', 'TT', 'TTO'),
(214, 'Tunisia', 'TN', 'TUN'),
(215, 'Turkey', 'TR', 'TUR'),
(216, 'Turkmenistan', 'TM', 'TKM'),
(217, 'Turks and Caicos Islands', 'TC', 'TCA'),
(218, 'Tuvalu', 'TV', 'TUV'),
(219, 'Uganda', 'UG', 'UGA'),
(220, 'Ukraine', 'UA', 'UKR'),
(221, 'United Arab Emirates', 'AE', 'ARE'),
(222, 'United Kingdom', 'GB', 'GBR'),
(223, 'United States', 'US', 'USA'),
(224, 'United States Minor Outlying Islands', 'UM', 'UMI'),
(225, 'Uruguay', 'UY', 'URY'),
(226, 'Uzbekistan', 'UZ', 'UZB'),
(227, 'Vanuatu', 'VU', 'VUT'),
(228, 'Vatican City State (Holy See)', 'VA', 'VAT'),
(229, 'Venezuela', 'VE', 'VEN'),
(230, 'Viet Nam', 'VN', 'VNM'),
(231, 'Virgin Islands (British)', 'VG', 'VGB'),
(232, 'Virgin Islands (U.S.)', 'VI', 'VIR'),
(233, 'Wallis and Futuna Islands', 'WF', 'WLF'),
(234, 'Western Sahara', 'EH', 'ESH'),
(235, 'Yemen', 'YE', 'YEM'),
(236, 'Yugoslavia', 'YU', 'YUG'),
(237, 'Zaire', 'ZR', 'ZAR'),
(238, 'Zambia', 'ZM', 'ZMB'),
(239, 'Zimbabwe', 'ZW', 'ZWE');

-- --------------------------------------------------------

--
-- Table structure for table `history_data`
--

CREATE TABLE IF NOT EXISTS `history_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coffee` longtext,
  `tobacco` longtext,
  `alcohol` longtext,
  `sleep_patterns` longtext,
  `exercise_patterns` longtext,
  `seatbelt_use` longtext,
  `counseling` longtext,
  `hazardous_activities` longtext,
  `recreational_drugs` longtext,
  `last_breast_exam` varchar(255) DEFAULT NULL,
  `last_mammogram` varchar(255) DEFAULT NULL,
  `last_gynocological_exam` varchar(255) DEFAULT NULL,
  `last_rectal_exam` varchar(255) DEFAULT NULL,
  `last_prostate_exam` varchar(255) DEFAULT NULL,
  `last_physical_exam` varchar(255) DEFAULT NULL,
  `last_sigmoidoscopy_colonoscopy` varchar(255) DEFAULT NULL,
  `last_ecg` varchar(255) DEFAULT NULL,
  `last_cardiac_echo` varchar(255) DEFAULT NULL,
  `last_retinal` varchar(255) DEFAULT NULL,
  `last_fluvax` varchar(255) DEFAULT NULL,
  `last_pneuvax` varchar(255) DEFAULT NULL,
  `last_ldl` varchar(255) DEFAULT NULL,
  `last_hemoglobin` varchar(255) DEFAULT NULL,
  `last_psa` varchar(255) DEFAULT NULL,
  `last_exam_results` varchar(255) DEFAULT NULL,
  `history_mother` longtext,
  `history_father` longtext,
  `history_siblings` longtext,
  `history_offspring` longtext,
  `history_spouse` longtext,
  `relatives_cancer` longtext,
  `relatives_tuberculosis` longtext,
  `relatives_diabetes` longtext,
  `relatives_high_blood_pressure` longtext,
  `relatives_heart_problems` longtext,
  `relatives_stroke` longtext,
  `relatives_epilepsy` longtext,
  `relatives_mental_illness` longtext,
  `relatives_suicide` longtext,
  `cataract_surgery` datetime DEFAULT NULL,
  `tonsillectomy` datetime DEFAULT NULL,
  `cholecystestomy` datetime DEFAULT NULL,
  `heart_surgery` datetime DEFAULT NULL,
  `hysterectomy` datetime DEFAULT NULL,
  `hernia_repair` datetime DEFAULT NULL,
  `hip_replacement` datetime DEFAULT NULL,
  `knee_replacement` datetime DEFAULT NULL,
  `appendectomy` datetime DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `patient_id` bigint(20) NOT NULL DEFAULT '0',
  `additional_history` text,
  `exams` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `patient_id` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `immunizations`
--

CREATE TABLE IF NOT EXISTS `immunizations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `patient_id` bigint(20) DEFAULT NULL,
  `administered_date` date DEFAULT NULL,
  `immunization_id` int(11) DEFAULT NULL,
  `cvx_code` int(11) DEFAULT NULL,
  `manufacturer` varchar(100) DEFAULT NULL,
  `lot_number` varchar(50) DEFAULT NULL,
  `administered_by` bigint(20) DEFAULT NULL,
  `education_date` date DEFAULT NULL,
  `vis_date` date DEFAULT NULL COMMENT 'Date of VIS Statement',
  `note` text,
  `create_date` datetime DEFAULT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patient_id` (`patient_id`),
  KEY `administered_by` (`administered_by`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `insurance_companies`
--

CREATE TABLE IF NOT EXISTS `insurance_companies` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `attn` varchar(255) DEFAULT NULL,
  `cms_id` varchar(15) DEFAULT NULL,
  `freeb_type` tinyint(2) DEFAULT NULL,
  `x12_receiver_id` varchar(25) DEFAULT NULL,
  `x12_default_partner_id` int(11) DEFAULT NULL,
  `alt_cms_id` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `insurance_data`
--

CREATE TABLE IF NOT EXISTS `insurance_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` enum('primary','secondary','tertiary') DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `plan_name` varchar(255) DEFAULT NULL,
  `policy_number` varchar(255) DEFAULT NULL,
  `group_number` varchar(255) DEFAULT NULL,
  `subscriber_lname` varchar(255) DEFAULT NULL,
  `subscriber_mname` varchar(255) DEFAULT NULL,
  `subscriber_fname` varchar(255) DEFAULT NULL,
  `subscriber_relationship` varchar(255) DEFAULT NULL,
  `subscriber_ss` varchar(255) DEFAULT NULL,
  `subscriber_DOB` date DEFAULT NULL,
  `subscriber_street` varchar(255) DEFAULT NULL,
  `subscriber_postal_code` varchar(255) DEFAULT NULL,
  `subscriber_city` varchar(255) DEFAULT NULL,
  `subscriber_state` varchar(255) DEFAULT NULL,
  `subscriber_country` varchar(255) DEFAULT NULL,
  `subscriber_phone` varchar(255) DEFAULT NULL,
  `subscriber_employer` varchar(255) DEFAULT NULL,
  `subscriber_employer_street` varchar(255) DEFAULT NULL,
  `subscriber_employer_postal_code` varchar(255) DEFAULT NULL,
  `subscriber_employer_state` varchar(255) DEFAULT NULL,
  `subscriber_employer_country` varchar(255) DEFAULT NULL,
  `subscriber_employer_city` varchar(255) DEFAULT NULL,
  `copay` varchar(255) DEFAULT NULL,
  `date` date NOT NULL DEFAULT '0000-00-00',
  `patient_id` bigint(20) NOT NULL,
  `subscriber_sex` varchar(25) DEFAULT NULL,
  `accept_assignment` varchar(5) NOT NULL DEFAULT 'TRUE',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pid_type_date` (`patient_id`,`type`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `insurance_numbers`
--

CREATE TABLE IF NOT EXISTS `insurance_numbers` (
  `id` int(11) NOT NULL DEFAULT '0',
  `provider_id` int(11) NOT NULL DEFAULT '0',
  `insurance_company_id` int(11) DEFAULT NULL,
  `provider_number` varchar(20) DEFAULT NULL,
  `rendering_provider_number` varchar(20) DEFAULT NULL,
  `group_number` varchar(20) DEFAULT NULL,
  `provider_number_type` varchar(4) DEFAULT NULL,
  `rendering_provider_number_type` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE IF NOT EXISTS `level` (
  `id` int(1) NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`id`, `type`) VALUES
(0, 'Administrator'),
(1, 'Physician'),
(2, 'Receptionist'),
(3, 'Pharmacist');

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE IF NOT EXISTS `log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `event` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `level_id` int(1) DEFAULT NULL,
  `comments` longtext,
  `user_notes` longtext,
  `patient_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `log_ibfk_1` (`user_id`),
  KEY `log_ibfk_2` (`level_id`),
  KEY `log_ibfk_3` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `patient_data`
--

CREATE TABLE IF NOT EXISTS `patient_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `language` varchar(255) NOT NULL DEFAULT '',
  `fname` varchar(255) NOT NULL DEFAULT '',
  `mname` varchar(255) NOT NULL DEFAULT '',
  `lname` varchar(255) NOT NULL DEFAULT '',
  `DOB` date DEFAULT NULL,
  `street` varchar(255) NOT NULL DEFAULT '',
  `postal_code` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(255) NOT NULL DEFAULT '',
  `country` varchar(255) NOT NULL DEFAULT '',
  `drivers_license` varchar(255) NOT NULL DEFAULT '',
  `national_id` varchar(255) NOT NULL DEFAULT '',
  `occupation` longtext NOT NULL,
  `phone_home` varchar(255) NOT NULL DEFAULT '',
  `phone_cell` varchar(255) NOT NULL DEFAULT '',
  `pharmacy_id` bigint(20) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `sex` varchar(255) NOT NULL DEFAULT '',
  `ethnicity` varchar(255) NOT NULL DEFAULT '',
  `race` varchar(255) NOT NULL DEFAULT '',
  `homeless` varchar(255) NOT NULL DEFAULT '',
  `mothers_name` varchar(255) NOT NULL DEFAULT '',
  `guardians_name` varchar(255) NOT NULL DEFAULT '',
  `deceased_date` datetime DEFAULT NULL,
  `deceased_reason` varchar(255) DEFAULT NULL,
  `regdate` date DEFAULT NULL COMMENT 'Registration Date',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `pharmacy`
--

CREATE TABLE IF NOT EXISTS `pharmacy` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `phone` varchar(255) NOT NULL DEFAULT '',
  `fax` varchar(255) NOT NULL DEFAULT '',
  `street` varchar(255) NOT NULL DEFAULT '',
  `postal_code` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(255) NOT NULL DEFAULT '',
  `country` varchar(255) NOT NULL DEFAULT '',
  `notes` text NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `photo`
--

CREATE TABLE IF NOT EXISTS `photo` (
  `patient_id` bigint(20) NOT NULL,
  `data` longblob,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prescriptions`
--

CREATE TABLE IF NOT EXISTS `prescriptions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `drug_name` varchar(255) NOT NULL DEFAULT '',
  `dosage` varchar(100) NOT NULL DEFAULT '',
  `count` int(11) unsigned DEFAULT NULL,
  `refill` int(11) unsigned DEFAULT NULL,
  `refill_limit` int(11) unsigned DEFAULT NULL,
  `filled_date` date DEFAULT NULL,
  `notes` text,
  `date_added` date DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  `patient_id` bigint(20) DEFAULT NULL,
  `physician_id` bigint(20) DEFAULT NULL,
  `pharmacist_id` bigint(20) DEFAULT NULL,
  `pharmacy_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patient_id` (`patient_id`),
  KEY `physician_id` (`physician_id`),
  KEY `pharmacist_id` (`pharmacist_id`),
  KEY `pharmacy_id` (`pharmacy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT '',
  `password` varchar(50) NOT NULL DEFAULT '',
  `userlevel` int(1) NOT NULL,
  `fname` varchar(20) DEFAULT '',
  `mname` varchar(20) DEFAULT '',
  `lname` varchar(20) NOT NULL DEFAULT '',
  `facility_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_ibfk_2` (`userlevel`),
  KEY `users_ibfk_1` (`facility_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `userlevel`, `fname`, `mname`, `lname`, `facility_id`) VALUES
(1, 'admin', '1a1dc91c907325c69271ddf0c944bc72', 0, NULL, NULL, 'Administrator', 1),
(2, 'physician', '1a1dc91c907325c69271ddf0c944bc72', 1, NULL, NULL, 'Physician', 1),
(3, 'receptionist', '1a1dc91c907325c69271ddf0c944bc72', 2, NULL, NULL, 'Receptionist', 1),
(4, 'pharmacist', '1a1dc91c907325c69271ddf0c944bc72', 3, NULL, NULL, 'Pharmacist', 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `history_data`
--
ALTER TABLE `history_data`
  ADD CONSTRAINT `history_data_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient_data` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `immunizations`
--
ALTER TABLE `immunizations`
  ADD CONSTRAINT `immunizations_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient_data` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `immunizations_ibfk_2` FOREIGN KEY (`administered_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `immunizations_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `immunizations_ibfk_4` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `insurance_data`
--
ALTER TABLE `insurance_data`
  ADD CONSTRAINT `insurance_data_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient_data` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `log_ibfk_2` FOREIGN KEY (`level_id`) REFERENCES `level` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `log_ibfk_3` FOREIGN KEY (`patient_id`) REFERENCES `patient_data` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `photo`
--
ALTER TABLE `photo`
  ADD CONSTRAINT `photo_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient_data` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD CONSTRAINT `prescriptions_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient_data` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `prescriptions_ibfk_2` FOREIGN KEY (`physician_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `prescriptions_ibfk_3` FOREIGN KEY (`pharmacist_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `prescriptions_ibfk_4` FOREIGN KEY (`pharmacy_id`) REFERENCES `pharmacy` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`facility_id`) REFERENCES `facility` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`userlevel`) REFERENCES `level` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
