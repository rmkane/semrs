-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 25, 2012 at 07:01 PM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

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
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `fax` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `postal_code` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `notes` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `facility`
--

INSERT INTO `facility` (`id`, `name`, `phone`, `fax`, `street`, `postal_code`, `city`, `state`, `country`, `notes`) VALUES
(1, 'Hood College', '(301) 663-3131', 'N/A', '401 Rosemont Ave', '21701', 'Frederick', 'Md', 'USA', 'Home of the Blazers.'),
(2, 'My House', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a');

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
(193, 'south Africa', 'ZA', 'ZAF'),
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
-- Table structure for table `patient_data`
--

CREATE TABLE IF NOT EXISTS `patient_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `mname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `DOB` date NOT NULL,
  `street` varchar(255) NOT NULL,
  `postal_code` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `drivers_license` varchar(255) NOT NULL,
  `national_id` varchar(255) NOT NULL,
  `occupation` varchar(255) NOT NULL,
  `phone_home` varchar(255) NOT NULL,
  `phone_cell` varchar(255) NOT NULL,
  `pharmacy_id` bigint(20) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `sex` enum('m','f') NOT NULL,
  `ethnicity` varchar(255) NOT NULL,
  `race` varchar(255) NOT NULL,
  `homeless` varchar(255) NOT NULL,
  `mothers_name` varchar(255) NOT NULL,
  `guardians_name` varchar(255) NOT NULL,
  `deceased_date` datetime DEFAULT NULL,
  `deceased_reason` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `patient_data`
--

INSERT INTO `patient_data` (`id`, `title`, `language`, `fname`, `mname`, `lname`, `DOB`, `street`, `postal_code`, `city`, `state`, `country`, `drivers_license`, `national_id`, `occupation`, `phone_home`, `phone_cell`, `pharmacy_id`, `status`, `sex`, `ethnicity`, `race`, `homeless`, `mothers_name`, `guardians_name`, `deceased_date`, `deceased_reason`) VALUES
(1, 'Mr.', 'English', 'Ryan', 'M', 'Kane', '1989-06-11', '4986 Robin Ct.', '21703', 'Frederick', 'MD', 'USA', 'K500xxxxxxxxx', '1160804', 'Clerk', '(301) 829-8818', '(301) 518-2513', 1, 1, 'm', 'Non-hispanic', 'White', 'No', 'Michele', '', '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `pharmacy`
--

CREATE TABLE IF NOT EXISTS `pharmacy` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `fax` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `postal_code` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `notes` text NOT NULL,
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

--
-- Dumping data for table `photo`
--

INSERT INTO `photo` (`patient_id`, `data`, `timestamp`) VALUES
(1, 0xffd8ffe000104a46494600010101004800480000fffe00134372656174656420776974682047494d50ffdb0043000503040404030504040405050506070c08070707070f0b0b090c110f1212110f111113161c1713141a1511111821181a1d1d1f1f1f13172224221e241c1e1f1effdb0043010505050706070e08080e1e1411141e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1effc000110801f201f203012200021101031101ffc4001d000100010501010100000000000000000000070104050608020309ffc4004b100001030301060305040804030703050001000203040511060712213141511361710822328191142342a115526272b1c1d1f0334382921624e1536373a2b2c2f12534441726277483ffc4001b01010002030101000000000000000000000004050102030607ffc4003711000202010204030605020701010000000001020304112105123141135161227181a1b1f0143291c1d1e1f1061523243334425262ffda000c03010002110311003f00eca6e7aff155408802222008888022220088880222200888802222008888022220088880222200888802222008888022220088880222200888802222008888022220088880222200888802222008888022220088880222200bcbc13d0705e90a03c12fc9c35bfee3fd117a2880a84408802222008888022220088880222200888802222008888022220088880222200888802222008888022220088880222200888802222008888022220088880222200888802222008888022220088a8ee880ae42a6f054c80ee6b03adb56d83475a5d74d4171652c3c431b8cbe43d9ad1c49e5f5e2b318b93d226b2928a6dbd8cf19180125c0003273d1239192b37a3787b48c820e415c65b55db56a4d793fe83b1325b5daea1e2110c6efbea8c9c00f70e40e47ba3871e395d79a5edffa2b4f5bad9bdbdf64a48a9f3df71807f252b230e78f14eceafb1131736195392ad6cbbf9992288514426950881100444401111004444011110044440111100444401111004444011110044440111100444401111004444011110044440111100444401111004444011110044440111100444401111004c854240e6a8e3c79ac6a0aef0f3fa2f12bd806f39d8680724f0c05aa6d13681a6342dbcd4deee0c6cdba4c549161f3cc7c9bdbcce079ae4edab6da353eb712d1c4ff00d156571c7d9607fbcf6ffde3f817798e014ec4c0b72774b48f76c8197c42ac6f65ef2f25f7f7e44d5b5bf681b3d81d5169d24d65dae6dcb1f5038d3c2ef5fc647970f35cb5aab525df545de4b95fae3256d64b920c9c4307668e4d6fa2d5eb6ebef8a6a16896571dddfc6467f9ff0000b216ca391ae6b1be24f552b834e01739ee3c0340f538c79abac485309baf1d7369d65d97bbef428f3a57ce0acc97a6bf962bf7f2f8eefc8947d9af4c3b516d56def922dea5b67fce4e4f2cb7e01feec7d1770306015197b3c6cf7fe04d18d756b07e98b906cd5a7fecf87bb10fddc9cf992a4d6f23c553f12c95917eb1fcab645d70cc578f4252eaf77fc1528851402c4a84408802222008888022220088880222200888802222008888022220088880222200888802222008888022220088880222200888802222008888022220088880222200888802212151d8e05015c854c8caf8d54d0d342e9e796386360cbdef76eb40f3279284f697ed0fa7ac4e9a8b4bc22f95ec3ba65de2da68cf9bb9bf1d870f35da9c7b6f7a56b5385f935511e6b25a2fbe9e64cd77b95bed543257dcab29e8e9a21974b33c31adf995ce9b54f68d637c5b66838b7b9b5d729d9c079c6c3cff0079df42a0ad79aeb50eaeab35da8aeb24c1a498e3dedd863fdd6721f995a1dc2f7c1d1d1839cff8aefe9fcd5a47131b116b90f57e48a8797959cf971e3cb1f37f7fcb33da8efb53555b2dc2f35f356564a72e925797c8f3fc87e4b55abafaaaf9443134b5ae386b1bd7d4ff00615b430d4d74e4461d24878973ba799ec16cb6fb741451e5a43a6238bcf31fd02da33c8e26d287b3046650c6e170e797b537e7d7f4edf53c5a6deca38b78b9ae95c305c072f20baa3d983645353c906b7d4d4823781bf6ca47b78b73ca6783d71f08f3cf658ff678d894b57252eadd614dbb4bc25a2a0947bd2756bde3a0e440ebd782ea189a18375ad0d000000e402d7372eba61f86c7e8babfbfa8c1c3b2fb3f1393bbecbcbd4069e47b2f4061550aa52f4a1442880a8440880222200888802222008888022220088880222200888802222008888022220088880222200888802222008888022220088880222200888802222008888026532bcb8e0858d4152e1dd572159dc6ba8edd48fabb855c14b4d18cba495e18d1ea4a85f685ed1ba6acc26a4d2f4eebed6b7dd12e4c74cd3df3cdde807cc2ef4e3db7bd211d4e1764d542d6c9244df5351053c0f9aa2664513065ef7b835ad1e64f250ced23da174a69ef168f4fb7f4fdc5b91988eed3b0f9bff17a37ea17336beda3eadd62f749a82f323a94125b4d17ddc2cf468e7f3ca8febaf70c63c3a56b6477eb1e0dfa733f5568b031f192964cf7f25f7fd0aaff0030c8cb6e38b0dbcdfdff005244da0ed2b566b2739f7dba96d20e229213e1c0dff48e67d7eaa3aadbd45182ca56895c393dc30d1fccac3d55654551ccb21737a01c00f40382f8bdaf638b64696b870208c11e58e8b95dc4de9c942e48fd4ef47088a9789912e797af6fe4f75351354bcba691cf27a1e5f45f2c6422f7130c92b6368c971000f52aadb737abdcb7494569d91b169c80c7446521a1d2bb7fe4380fe657587b386c66dcfb5d06b6d4b18aca8a8689e8a89e3eee21f85cf07e2770c807805cdfa56d12ddefd6db1d3372faa9a3a768fde7019fcd7e8ad9a8a1b6dae9adf4ed0d869a16c4c6f60d18fe4af73ac962e3c298bd1bebf7d8f37815c7332acbe6b54ba170d691cc2f6111509e882144280a1442880a84408802222008888022220088880222200888802222008888022220088880222200888802222008888022220088880222200888802222008884a0190990bce78f12a9bc329aa31a9ef215379a7aad2f5ced3b45e906b9b78bc45f6919ff0095a7fbd989edba397cf0a00d79ed277fb8f894da4e863b440780a998096a08f21f0b7f3f552f1f06ebf78adbcdf421e4710a31f69bdfc96ece9dd4da8ec5a6e84d75f2e94b4100fc533c0def41cc9f4503ebff00698a483c4a4d196bfb5cb9dd15b5a0b631e6230438fcc8f9ae67d477fadb8d63ee17eba5456553f8ba49e42f79f2e3c71e8b5babbe38e594d1019fc6fe3f97f53f2560f17130ff00e69733f25f7f5d0af5959b9bff005e3cb1f37f7fc9bceb6d6da8b54d49add497c9aacf1dd639c1b130766b00dd1f21eab4badbe46df7295be23bf59df08f92c1cf34b3bf7e695cf3ddc56cfa3b40ea5d514cfafa3a58a92d311fbeb957c829e923f591dc09e7c064f92e36f149c97254b963e9f7b1228e115c5f3dcf9e5ebf7b9add554cf5077a795cf1e7c00f90e0b62d33a1ef379b7baef3882d56467f8973af7785001fb3d643e4d07a2d8c55ecdf43e7f4740cd777d60e15154c7456c81dddb1f07cc47ed61bc39715a76acd557fd535e2b2fb7296adcde11460064710fd5646dc358df21dbaaac6db7abdcb68ad128ae88beba5c6c36771a6d2a26aba803125dab2301eeffc18ce7c369e3ef1cbb97c3d758712e717389249c9279a79673e7dd5160db40b29a729fc5ac33387bb10e1fbc780fe67e4b19d479ad9ac3098adac71e05e77cfcfa7f053786d1e36447c96ff000fee57715bfc0c6979bdbe3fd89d7d91f4dfe97da51bbcd1efc16781d31c8e1e2bf2d67fee3f20bb1d9ccf0f550efb2569afd0bb31174963dda9bc4e6a1d91c7c36fbac1f404fcd4c4ceab3c4eff0017264d745b1a70ba3c1c68ebd5effaff0043d222280588428850142885101508811004444011110044440111100444401111004444011110044440111100444401111004444011110044440111100444401328bcbb070495805778671fc9090bc92339cad475c6d1f4669005b7abe53c7503ff00c588f8931ff4b788f9e16d084a6f48adcd276460b593d11b80703d55bdc6ba8a8295f555f57052d3b065d2ccf0c68f995ccbadfda6eae50fa6d216665383c055569de77ca31c3ea4fa2837586b0d43a9aa3ed7a92f9555873eeb669311b3f7583007c82b4a784db25cd6be54555dc66a4f96a4e4fd3a7dfc0eaed6fed0fa2ec864a7b3996fb54de1ff002e3762cf9bcff205407aef6ddaef55364a7fd202d140ee1f67a0cb387673fe23e7c403d9441597aa666594ed32bbe8d587abafaba9c87ca5acfd467c3ff55d7c6c1c5fc9ed48e7f87e2397bcdf247c8d8abeeb4d0e7c5904d2f50d1bcecfaac2d55eaaa5cb602211dc7bce563474d515952ca5a3a796a6a253bac862617b9c7c9a3895275b363375a1a08aefb43bc5168bb6bf058cac76fd5ca3b3606e5df5c731c945bf89645db6bcabc96dafbfb9371f85e363eea3abf37b9173dce73cb9ee738e789272b72d37b35d4b76b5fe9bae6d3d82c6389b95da4fb3c4e1fb00fbd27fa415b03f5b683d1a3c3d9e6956dc6e2ce02f77e6366734feb454ff00e1b4f62ec90b42d53a97506a9ba1b96a2bc565cea8f00f9a42ec0fd56b79347905017a162f75bf436f373d9d68d79162b7ff00c697866315f748cc54113bbb69c1de931dde40e5c39ad63586b2d4babaa44d7ebb54553183761a7e0c82168fc2c89b86b07a056f51a72e94fa660d432423ec5348580f503a38f91efe5e8b13ebe8b58d919747ae9f5f2367071d3543e6a88b64d2ba2ef7a8712d3c020a5e66a26cb58475c771e8b5b2c8d6b593d0cc62e4f448d6fc9166f534566a1985b6d2f7d5ba23f7d58fe01ceecc68e1ba38f1ebf2584cf0e2b64f996a838f2bd1b3ed4501a9aa8e01f8ce09ec3a95bfe9db54d79be505968dbf7b59511d3c63b171001f903f92d534c43f792d4b8706fb8df5e67f97d57457b1f697176d7951a82a22de82cf0e584f2f1a4c86fd1a1c7e8bd070f4b1f1a790fbff006fa9e6789c9e4e5d78ebb6efdfd7e48eb1b15be1b45968ad94adc43494ec8583c9a0057cc54046f633c57a6fe4a835e67af9ee5fa8f2ec551110d82144280a1442880a844088022220088880222200888802222008888022220088880222200888802222008888022220088880222f2ec70e2101eb2a9bc3cfe8bcef0ce17c2beb292869dd535b530d340c197492bc31a3d49e013be861eabb173909bc338ca88b587b40e83b18923a0a99afb50de01b44dfbbcffe21e1f4ca85f597b46eb3bc7894f648e96c74ee180e60f126c7ef3b803e814fa78664dbbf268bd76205fc531a9d9cb57e9b9d69a82fb66b0d19acbd5d292df001f1cf28667d33cfd0286b5a7b49e94b69921d3945557a9c0c36523c1873ea46f1fa2e50bf5e6bae5546bef775a8aca877f9d553991c7e678fd1606aaf90b779b4d1990f471e00ff003531e162637fd89eafc97f4fe84059d9997ff5ebd179bfbd3ea4bfadb6d5afb5436485f74fd1748fc834f6e063c8ec5d9de3f50a2cabb8d240f709e6df7976486f1764f52b5eaab9565402d7cdbac3d19c02b6862926919144c7bdef76eb1ac6e4b89e83b92b597158c172e3c3957a9d21c1e563e6cab1cbd1195abbecce1bb4f1888772727fa7f158b9a5967937a591d23cfeb1e3f452ce83f67bda0ea4a7170b8d243a6ad980e7555d0f84437bee7c5cbbe02d9fec1ecfdb3307edf5755b44be459cc30fb948d779fe13f577a2adbafb6e7ad92d4b6a31e9a1695452fafea43da27446acd695629b4c586b2e47203a48d988a3e38f79e7dd1f32a4ff00ff0048746e868db55b59d6f4d0d5e32db35a089ea5c7b39dc9bcb990073e2b15adb6ff00adaf546eb4583ecba4eca06e47496b8c46e0df3900cf961b80544b2cb2cb2be695ef92571cb9ef712e249e272727bae3a9df44c986bf6d349a7a8df6dd93695a3d2f03c61d7195a27af947efbb21bf98513de2e972bcdc65b8ddebea6e1592bb79f3d4485ef71f5395668b1bb1a059cd116293516a2a7b7b43bc0cefd43dbf8631cf07b9e4b0671c06799e8a7cd9169b163d3c2b2a1b8adaf02478c7f86cfc2dfe7f350b3f296354df47d895894f8f67a236aa9b751545add6a9a9e37d1ba3f04c4061bbb8e007a7f1507dcb66f7f8f51c96ea1a6f1a971bf1d538eeb0309e193fade5d54f43976fe21549c03c4eef3c13c3e8bcc62e7d98ae4e3dfebe65edf870b92d76d3ef4342d27b31b3dacc535cff00fa9558c7baf6e2269e7f0f5f9f65aeed575d8984b60b1cf881a376a278dd8de3fa8df2ee42bbdac6bbf044b60b2cf8938b2aea23e83ab1a7bf73ff0055117f2f2577858b6dfa5f95bbec9f6f52af27221527551b2eecaf90e483c864aa2bfb1d39a8b8c79196c677c83d71c82bcae0ec9282ea555b38d5094e5d12dccfdba9fecd471c071bc065c3b9eabb676176fb5ecdf6354d71bfd5c16f75666b6aa59dc1b82e1ee37cc868181cd71c5ae7869ae1054d453fda628e46bdd0976048060ee9f23d566b5e6b5d45ad2e1f6bbdd73a48a33f714acf76080740d6f2edc4e49eebd5e4e14adae144768aebea78dc6ce8d564ef92d66fa7a7dec8ea4d0fb661ae36a9069dd3f6e2db33209669aaa61bb2481ad1ba5ade83788e7c78a9963eab99fd8ab4f12fbeea9918705ada1a7711c08cefc983ea235d2f1671ef735e773ebaebbb92be897ccf47c3acb6da1596bddbd7e1d8f6888a193c2144280a1442880a844088022220088880222200888802222008888022220088880222200888802221e6100540e07ff85e5c7d555a3cca6a60f48480bc921bcc80b5bd51aeb47e9b04def515be8de01fbb74a1d21f460cbbf25b46129bd22b566b2b2305ac9a46cb91dd0b80385016aaf699d3345bf1e9eb4d75d641c04b362088f98ce5c7e81455aabda0f5f5e83a3a3a8a5b3c473c2963f7c0fde767f929f570bc9b37d34f7ff1bb2beee2f8d5eca5cdeefb48ec8b9dcedd6ca7754dc6ba9a8e16f392a2511b07cdc405166b0f682d9fd95ee8686b26bdced2462899f779fdf7601f96571e5eef375bcd41acbcdcaaeba5e92554ae7e3d33c07c960e7bbd1444b44ae99e3a33faf253170dc6a37c8b3efea417c532b236c6afe3d7fa1d01abfda4f56dc4ba2b0d0d259e1e923878d263be4f007e4a22d4fa9ef9a827fb5ea0bd55d73b9e6a6725a3d0721f2c2d2aa2f733c1f058c88773c4ff00d163669a699c1d2c8f79e993cbfa27f98e3d1ecd10d7d5fdea663c2f2f237c8b3e0bef4363aabc51c5f0174cec7e0f87d378ff00258aaabcd5cb911eec23a6064fd4ff0045f4d37a6b506a4ac6d2582cd5f729ddf869e073f87738e1f32a70d0fecadab2ba1fb76b4bb5169aa16b779ec0f6cd386f724618dff71502ee23917757a2f4d8b3c7e198b46f18eafd7739ee57be4797c8f73dfd4b8e4fe6b6bd0bb35d71ada76b34e69cadab877b0ea9733c3819eb23b0df90c9f253bd4d6fb37ecab2ca0a4935cdea3775709a26b86389790231cbf08711d968faebda4f5ddf29ff0047d87ecda5adad6ee322a068f1037b6f9031f2014227ebaec67a9f60da4343d24772db06bfa1a079687b6dd4326f4cfc00481c379dc78706e3cd7c2a36d5a1743b1f49b23d03494f500160bb5c99bf31e991cdde78c8f450156d55556d4beaeb6a67a9a990e5f2cb217b9c7cc9e257c560686d5ae768bad75b4ee9351ea0acab88938a60edc81a0f40c1c3eb95ab7f01d15110c844e99e43b95b5e94d057ebf164c21fb151bbfcf9c1191e4de6efe0b4b6c8d4b59bd17bcde35ce6f48ad4d57fbf45b5e94d037fbf6e4c2014546ee3e3d40233fbade67d79295f4b6cff004fd8fc399d07dbeadbfe75400403e4de43cb9adb71854595c6969a531d7d5ff05a51c3357ad8fe06a5a5b67da7ec9b933a135f56de3e354f100f937905b6fd511c4341248007125515b7d974b5b25ab2dabae105ec2d02a3da1ec2c7670e05a71d8aa82d2010e6907910729c4f2ce7a2e6b54f566db3d9b3997575a24b16a3adb6c8e2f11bf798f3cdec7710e3e673c7cf2b12a5edbd594494d477d8a300c47c09b039b4e7773e9c7eaa211c87a2f6d8390afa232d77ee797caadd5635d87cd6cba7a9bc1a233bb83e4e273cc81cbf9ad7a9a31354322739ad6b8e1c5dc80595acbb97344340d7018c07919240e1c3e8aeb02cae96edb3b6c979b29b89556e441535f7eafb2464eb2ba3a53ba32f989f7236f3c9eeaee829eaea1f0d3b58e96a66786b2360e25c4e0346162ecf6e34e7ed553c67772c9e2dff00affd5751fb2beca9f2cb0ebbbfd306c6c3bd6b81edc127fed883d3f57ebd95d2c8b2107917edff00ca28658b5cec58d46fff00d4befc89bb63da5468cd9edb2c6e6b7ed2c8fc4aa23f14afe2e3f9e3e4b706e7a8541c3a617a0bcbce6e72727dd9eaa10508a8aec111160dc2144280a1442880a8440880222200888802222008888022220088880222a3ba202b90990bc93e6551bd79fcd0c1ed32a84858fbadeacf6a81d3dcee9454513065cfa89dac03ea5126fa20da5d4c86426f0f3fa28b7516de766b682591de9d7397f528217480ff00ab01bf9a8cf51fb50cef0f669dd351c5c3025ad9778faeeb787e6a655c3f22c5aa83fbf790eee238f4fe692fafd0e9fc858fbc5eacf6780cf76ba515044064bea276c6dfab8ae26d49b6dda3def7a392fefa389ff828e3117e63defcd47f72aeabad9dd5372ac9aa253c4c95121713f3254faf82cb4d6d9a5f32b6ce3b0e9541b3b3b54fb40ecead1bcca5b8545e261c3768a12e693fbeedd6fcc12a2cd4ded3b7ba8de8f4f5828e859c4092a9e667f91c0c347e6b9ce6b9d0c59de9dae3cf0df789fcbf89563517e1ca9a9fe6f3fc82e9e1f0dc7fcd2e67fafd0d39f8ae52d631e55fa7d7724ad4db4fd79a89eefd23a9ab7c3767eea9dfe1307961985a6cd2b412f9a501c78973df827cd6af3dd2ba6e0662c07a3382b371dee2f3bde6eeab59717aeb5cb4c36f3378704b6c7cd7d9f03649ef54919223324ee1faa303ea78ac6d45eeaa4cf861908f2e27eabe9a7b4cea1d4552ca5b1d96e17195c78329e9dcff00e0387a9533e88f655da05e4366bf54d169da770ceec8ef1e7c6796e30ee83eae502de23936edcda2f4d8b1a385e253d21abf5dc81679e69cef4d23df9e592af2c564bcdfaa9b4765b5565ca7278454d0ba427e4d0bb3ed3ecf7b1dd09442e3ac2e62b9d10cba7b9d5b6188ff00a4607cb25596a1f690d9768ba17dab40d97f4898fdd67d92014d4b9efbc465dea1bf3509efbb27f45a2225d0decb9b42be3e29af6ea3d3d48705c677f89381d831a700fa90a4f1b24d82ecae9db59ae2f4cba5647c772b25c971e98823c9faa85b5ffb44ed2b5589208ee8db251bc63c1b78319c762fc971fa8512544b2d4543a7a895f34ae397492b8b9c4f99394f70d24fa9d49aafda8ed366a47da7663a469a9299a3763a9a989b1b787222267fee3f2502eb9da46b7d6d2b8ea2d415755113c29daef0e11e8c6e07e5f55a97e6b7bd92e92fd3973fd235d1e6dd48e04b4f299fd1be8399f92e575d1a6b7393d91d2aabc59a8451a33e3744f2c7b4b1c3982dc15e54adb72d361862d474b1e184362ab0d680dfd979c7238e1f20a29f5e05698d931c9a9590e8fe474be974d8eb7dbe613b79abeb45a2e777a8105b68a6a9793f819903cc9e43d49521e9ed92d4398da9d415cda71cdd04183f579e03e5958bf2e9a3f3cb4f98ae8b6dfcb1d48c638e495e191c6e7bc9c06b464aa3dae63cb1e0b5cd3820f3056f9abefd64b3b64b2e8ea4861c0dc9ae006f3dfddad71cf0f35a113939c95bd53764799c745ebd7dfe869646307ca9ea5f58ee935a2b055d3c14d2cadf84cf10786f980782dc61dac6a5600248686423a98c8fe0428fd16b6e3d566f6475330b650e8c92e9f6bf776f09ed542f1fb05c0fe654a1a4ee35976b0d3dcab68e3a37d40df6c4d793ee9e44e40c121413b38d3ced45a962a77b4fd960fbda9701f847e1ff0057253e5eee96eb0da9f595d3360a7846eb71cce3806b47572a0e2b5535ce35530f6df5d0b8c0b6e9c5d96cf645cd755d3d0d24957573321823197bdfc80feaa10da36bea9bf4afa1b63a4a7b603cc3887cde648e43cbcd6375eeb2afd5156e63b34f6f63beee99a79f9bbb95ab7553f87f0c547fa966f27f22266673b5f247a170dacac6e376b2a1b8e5891c3f9afbc579bbc4731dd2b1a4723e3b8e3f35608ad9c62fb15ea525d1993abd417caba475254ddab27a77e37e37ca4877158cee4e3b955e39208208e60f45ea18dd34ac89832e7b8001662b4f652f9094def29310c524f20862617c8e380d039ad96d36d8e9078cedd9263c8e38378721fd56434ed8a6a9aea7b55ae964aaacab788d8c6b779d238f4fcb3f25d6fb12d83d0e9ef02fbab5b157de07bf1d303bd0d31eff00b6ff003e43a679abc863d583156e46f2ecbc8f3b6e55dc41bab1b682eafccd23601b0d9eeafa7d53aca99d150370fa4a09061d51d43a4ea1bfb3ccf5e1cfaa608db14623631ac63461ad030001c82ab06386001d005efaaabcacab3267cd3f822d3131218b0e487c4a1f4caa84451c94111100428850142885101508811004444011110044440109c21202a1207741ae8572150903bfd153233c38fa2b7afaca3a181d515d5505342de724cf0c68f9958ebd0c37a752e72338424038518ea7db96ce6c6f7c46f26e53b3fcba18ccbc7f7be1fcd457a9fda86be4263d33a6e081a4709abe4321cfee3081ff00994cab0322ddd4745ebb10aee238d4fe69fe9b9d4591dd61effaa74e58e3325def941441b9c89676b4fd39ae23d4db59da16a2df6d76a4aa8617738a9710b31db0d009f992b46acacde7996a6b37deee6e95f927eaa7ae10a0b5bac4befd4af971be77a535b97ebfb6a7666a4f688d9ddacbd945515b7899bc00a4870c27f79e40c7a65465a93da76ff53e24760b0515bdbc9b25448e9de3cf0001f92e709af142cfc6f908e0431b9fe380aca5bf3f04414cd6f405ce2723d3a7e6b750e198eb77cdf3fa1a39715bfa2e45fa7f2c95f506d736877b25b57a9aae2638e4c74d885a7cbddc2d26b6a67a890cd5b532cf21e25f349bc4fccad464ba57499266ddee180355a3def90e5ee2ecf7e29fe6d557b5359b4782dd6ef759afdf9ff43699ae7431643a76b8e39338ff0005653dfd98c434ee3d8bdd8fc87f5581e002cad834e5feff0050d82c965afb8c8790a7a773ff003030a259c5b26c7b3d0995705c5abaae67eacf9cf79ad933bae642d3faadfe678ab19247c877a491cf3fb472a68d25eccbb4fbdbd8faca0a4b2404f17d64c3780fdd6ef1f97053068ff645d334b1c72eaad4570ba4c00df8a900823cfa9de711f30a14edb2c7ace4d9635d55d4b48452f71c6ad0490d68c927000e3f25b8e92d976bfd54e67e85d2d719e37f295f17871faef3b030bb9a9b496c6b6634c2a5f6fd3d672c01de3d5bdaf94f9ef3c9715a6eb2f6a5d9dd9237c1638ab6fd3b07b9f678fc3849fdf7638798057337d75231d15ec8da8ab0b27d59a868ed711f8a0a2678f2f98de3860ffcca60b26c2f635a0e99b5b77a682a5d18c9a9bc55023d774e1bf92e7dd6bed47b45bd97c366fb169da52780a56789363ce47ff26850ddfeff007bbfd51a9bdddab6e12bb897544ce7f5e5c490b1a8d0ed7d53ed1db28d194cfa0d3709bb4d17bada7b5c0d8a107cde703e603941dae3da8f6857c0f86caca3d3d4cec81f671e24b8fdf70e7e80281fa724432968642fb7abc5fab5d597aba565c6a09cefd44ae7ff0013c3e4163faaaaa73e5c7d13533a6bd02aaa7f1ecb2d63d397abdbb16db6cf3b738df0dc37fdc782c4a518ad64f446d14e4f48f51a4ec755a86f50dba9411bfef49263846ceae5d1f65b752da6d74f6ea3606410b0003bf73f3585d9de978b4c59bc376e3ae137bd5320efd1a3c805b370e9c9792e299bf89b3921f963f32ff0717c2af9a5d596d74a2a7b8dbaa286a981d0cf1963875e2b46d3db2ab2509135ce592e3234e434fb9181d38733d399520af13cd1d3c12544cf11c5134bdef3c9a0732a1d593755171ae5a6a49b28ae6d4a4ba1f16b286d742e73590525344dcb88018d0df3c286b697afe5bc3e4b5d9a47456e1c1f2805afa83dfc9bdbaab3da4eb69b51541a1a173a2b5c4fe0391988fc4ef2f25a4ff785e8787f0df0f4b6ede4fcca7cccce6ff4eada3e9dc0e1cb804445725685501c4e1a3de3cbd5516534cd5d0dbae4db8d6c06a4d30df869f936593f0ef1e801c13e98eab126d2d5194b564b3a6bf45ecef44b2aee64fdbab0091d10f8deec7bac1db1cb3cb9a8b356ea5b96a5af1555d2011b3fc185a72c8fd07f3e6ad2fb77b85eae2fafb8d419a771ce7a3464f068e402b003a01e985131f13c293b27bcdf7f2fbe848bafe75e1afca87a6703804459cd31a56fba8c4925b68f34917f8f5733c454f17efc8e21a391ebd3915308c60fcf202ce59f4d56d6d0fe94aa7c76db534e1d5b5590c77ecb00f7a4779341f9735999a4d1ba5435b4263d5b7a6f17544cc2cb742efd967074e477761871c8ad6eff007bbadfab7ed975ac92a651c1809dd6b0766b47bad1e402c98dcf9dd5f6e32322b5c530a78c604d311e24a7ab881c1a3b019c7524ac8e9ca42d61aa90105dc1991d3fbe1f358ab6d23aaea44407b8065e71c9bdbfe8a4ed9c694abd65abedfa76818582778f1641c44310f8dc7d07e7856bc2f1949bbe7f963f529b8be5b8a58f5fe697d09bfd8ff41196a26d77708bdc8f7a0b6b5c3af27c9ea38b47a95d38c0474563a76d34162b2d259ed908868e9221144c1d00fe7d5647aa839790f26e763f87b899878d1c7a635f97d4a0cf6550111472584444011110042885014288510150881100444401328bcbce08ca187b1e890153782b5b9d7d15b2866aeb855c34b4d0b77a4965786b183cc95cf9b4df690a6a6f16dfa168db5530e06e154d22203bb19c0bbd4e072e7d3bd18b7643d2b8ea70c8cbab1d6b64b43a0ee772a0b6d23aaee15b05253b065d24cf0c68f99510eb6f689d0d662f82cfe3dfaa5aec114e3c3881f37b871f902b94357eaebe6a3a97576a2bd5455bc92409a41ba3c9ac1c00f2016a5537d8984b69e332fed3bdd1f4ff00e159fe07171d7fb89eafc97dea55fe3f2f27feb57a2f37f7a7d49e3557b456bdbc17476cfb25960770029e3f12403f7dd9f2e41457a8752dd2ed39a8bede6a6b253ccd4d439ff912b48a8b9d6ce3065dd04fc2c1bbf9f33f35644e4e5ce1df27faac3e275d3ece3d6bdff7b995c1eeb7dac9b35d7b23649ef546ccb5a1f263f55bc3f3c2b39efb3bb220818c1ddc778ff45898d8f9646c5131d248ef858c0493e802deb4b6c7b693a958c96d9a4ae1e0bb044b50cf05b8efefe146b38964d9d65a7bb626d3c2b12aff00cebefdcd327afab981f12a1f83d33803f92b67b893979cf7cf1fe2ba2b4dfb256b9addd7de6f369b534f36b5ce9a403d1a00ff00cc149ba63d92344d0163eff7bbb5e2403de64645344ef90cb87fb94294a527ac9ea4e8f2c16915a238a090d1c4e079acc58b4bea5bec823b3586e75ee3ff00614cf70fae30bbeedfb3ad8ae858c4aeb3e9ea27c40666ae943e4e1dcc8495f0be6de7645a6a37c51ea0a69cc7c3c1b7c064fa6e8ddfcd6a65499cb3a63d9a36a779c3e7b65259e3233bf5d501a7fdadde77e414ada53d902dd196c9aa35654541ce5d0d0402307cb79d93f3c2fa6a8f6c0b4c3bf1e9ad255958fc7bb2d6d408599efbad0e27d3828ab557b4e6d4af2e78a2aea2b242efc1454e3787fadfbc53763da6753587621b22d27036a9da76df2ba21c6aae7278a7d4ef9ddfc97bd43b67d9268d81d4aed436ecc630296dcdf14fa00ce0b813506aad49a826335f2ff72b838bb27ed152f78e3cf009c0e9c96181e99231db983d937091d73abbdafe8d85f1e94d272cff00ab3dc660c1fec664ff00e650e6b1f682da96a50e8dfa85f6ba73c3c2b73443c3f7c7bc7eaa291e9c5163533a1f7adacabae9cd456d54f532b9d973e5797b8fcc95f01d3874ee88b3b99088abc7fb3858ea0a27f67c966ed166a0aadd7566a2b750c679ef6f3de3e407f30b75b1da765d4458fadbe8b94c3a485cd8f3fba07f12a35d950abb36fd17ee76ae873ffd2446f414359709845434b3544879089a5c56f361d955f2b7125ce68adf1119c13e249f41cbeaa45a2d59a1e82111515c6829a31c008dbbbfc02bf6eaed30e68c5f28b1ff0088aa7238965eba575b5ead3fec58d5858eb7b269fc4c769fd9ee99b410ff00b21ae987f995587f1f26f25b5b18c8e30c631ad68e01ad180be749534f594eca8a5999342f1963d87208eebeca8adbacb65ad8dbf7b2d6bae15ad2287cd510f04690e386b838f91cae5a1d3de1789e28e786482663648a46963d879381e60f9632bebbaec6774f1f254dd3cb1c7d3979a26e2f51b35a33993575a24b16a2acb63c973617fddbc8c6f30f169fa2c5298b6f16433d0535fa1881753fdd4c7bb09e1f427f350efe78e0bdb61642be9536f7e8fde796c9abc19b87628888a59c022120750b7dd19b25d67a9687f4a0a18ed1671c5f72ba49f66800ee0bb89f902b20d08f0e7c3d56c9a4343ea6d56d7cb68b6bdd4719fbead9c88a9a1c71cba47e1a31f55babe5d926826e2922936857f8f9493034f6a85ddf73e29be7c0e3a2d3b5a6bdd4fab4360bb57eed0467ee2dd4cc10d2c00720c89bee8c77e7e69a7918338f83675a3e170a8986b9be0f86189ce86d94e7f69fc1f360e783775be656b5aab575f352164771a96b28a23f71414cc10d3403b3236fba3973e7dcac0fff0027d551610e838f7278678aab438901a324f21dd53a80b35a7a8b78fdb641c0708f3dfbaef8f4caf9a847fb1c72b2238d5bb27d17cfd0c8daa8db454a1aee2f70cbcfe6bb4fd96f67c74b693fd3b70a60dbbdd58d79de187430f36b3cb3f11f92847d99f679ff00196af172b941bf65b5bdb24a08cb669471647e633c4f90c755da71f2569c4ee8d508e2d5dbafdfd4a4e1744af9cb2adefd3efe81a08e8bd0445485f8444401111004444010a214050a2144054220440111797903080a9701cce16a7b4cd7b60d0763fd27789f323b229a959fe2ceeecd1d071e27a2b8da1eb0b4689d3535eeeb21dc8fdd8a269f7e690fc2c68ee7f25c2fb42d5f76d69a86a2f97aa825c73e0c5bdf774ec1c98df21df99e65586060bc86e727a41772b388710fc325086f37d17ee64f6a7b49d47afae2e9ee952ea7b7c6edea7a18dd88a203a9eeefda3f928cee57a6b4785481af70e7211c3e43aff7cd595dee4eaa73a28896c238762ff3f458d5232788a4bc3c7f663f53961f0a6df8b95ed4fcbcbefe47b9a59267992691cf79eae395e390de3c0775246c7b637abf69352d9add4ff61b435f896e550088c770c1cde7c870ee42eb7d09b11d986cce8c5e2e8ca6adab85a0c971bb39bb8c7776b4fbadfa13e6aa35d5eacbad745a2390b67db19da1eb76b67b469f9a1a27f2abacfb988f982ee2e1e8ba0f42fb2459699ac9f58dfaa6be4e6ea6a1fb98fd37cfbc7e583e6b39b42f6a5d116032d2699a59b50d5b7807b3eea9c1fde2327e43e6b9f75e7b466d37547890c1756d868dc78456c0637e3b190fbdf4210c25a743b029ad1b21d9450efb69b4f69f0071925734ceff00325c4bddff0055a56adf6a6d9bd9b7a2b4b6e17d95a3ddfb3c7b9193fbeffe8b86eb2aaa6b6a1f5159513544cf76f3a496473dce3dc924927d57c8f3efe6b0394e91d4ded73abaa8be3d3da7ad56c8f9364a82e9e41e781bad1f9a8b352ed9f6a1a87c46dc758dc9b13f9c54ce14f1e3b6ec602d01167536d0fbd5d655d5c864aba99aa1eee6e9242e27e672be231e59ee42a2202aa89f30b3da274cd66a7bb8a48331c11fbd51391c236ff53d3e6b4b24ab8b94ba1b462e6d28f52ff671a3ea3535c83e60e8adb13b13499c171fd46ff5e8b63db4e95828a1a4bc5b69c454cd6b69a7634706e3831df4e1f20a55b3db692d36d86df4117854f0b70d1d7cc93d49eeab76a0a7b9db2a6df54dcc35113a37fcc731e639af312e2f296429ada2bb79978b874552e2ff0031cb248f9ff355208e630a59b46c85bbdbf75bafb993f754edc6474e27afd56e963d11a66d1b8ea6b5c524ade52ce03ddf9f0fa05677718c687e47cdeefe4afaf875d3ebb104d974cdfaf1836fb65448c3fe616eeb3ea782da1db3916ab79b96a8bcc541037fca85bbf238f61d33f929435a6acb6697a0dea97092a5edfb9a669e2ef519e0d502ea9d4172d45717565c662ee8c89a7dc8c760131efc9cc7cc972c57eafddfc99baba31fd9e6e697c8b2b8be89f527f47c12434ede0df11fbcf7799c60027b00ad93e68ad74d124c83df543fbe6abf3fcd5116dab3057d327e6b60d01a724d4ba823a43bcda68fdfa9900ceeb3b71ea792c153412d4cf1d3c0cf12595c1b1b3bb8f00ba374269b874cd8594606f5549efd4bcfe27903867b055dc433162d5a2fccfb7a799330f1bc79fa2ea66e9608a9a9a3a6a78dac8a2606b18d180d0382b1d437cb658681d5972a96c6c032d683973cf603a9fe0b55d79b46a1b297d15af72bab87370398a23cb8e399f20a18bc5d2beef5ceaeb954bea6777e279c803a003901e41536270ab2ff006ede9f37fc167939f1abd9abafc97f26c9adf5f5d75139d4d039f436fce442c7f17f9bcf5f4e4b5765756b0e59573b4f948e1fcd5b7f145e92aa2baa2a308e8524e729be6932f1b75b9b71bb70ab18e5f7cefeabef0ea0be42fde8ef15ed3fff0065cb19e9c50900649002e9c917d52fd11af335d1995a9d437eaaa492967bbd6cb4ef1efb1f338b4faf158a3c398c1eab77d07b28d7bad9ec363d3b54fa67ff00f953b7c2840ee1cee63d32a4893651b30d9f37c6da8ebc656d7b06f1b3598973c9c7273b98fa37af1598c54568ba1894f57b904db682bee75d1d0db68aa2b2ae438643044e7bdde8d032a5ab26c16f34d6f8ef5b42bddbb45da9c37bfe7250fa8781d1b183ff00c70590ba6df62b0d0c967d93e8fb5e94a420b7ed8f85b2d5bfcc93c33ebbdcd43b7fbe5e3505c5f71be5ceb2e558ff008a6aa99d23bd0139c0f2c2c9aeec969fadf657b3e263d9ee943a9aeece0dbd5f86f318ec1f7a384600e7c0f0f551ceb7d77ab75a569a9d497ba9ade3ee420ee4318cf00c8db86b47cb3dd6b489a99d07f7cd11100445ee28dd2c8d8d832f71c37b6563aec86eb73ef6ca37565488f25ac1c5eece3016fda52c55fa8af94561b4405d5355208e368180ceee3d9a064ff63385b7d2328a99b1819278bdd8e67fbfe6bb13d977666ed33641aa2f306ede2e11fdcc6f18753c0788cfedbb99f2c0eebd15718f0fc7739fe77d8f2d74e5c4f25575ff00c71fbd7e249fb3bd276ed17a4a8b4fdb9b9642dccb26306694fc4f3ea7e83016c518c742151bc071e6bd37995e76527396b2ea7a38c54172c7a15444437088880222200888802144280a1442880a84408806578908182790e6bd28d7da4b55c9a5765f5d2524de1575791474ee07de6eff00c4e1e61bbdf3216f5572b26a11ee73bac8d50739744734fb44ebf7eb5d6d34149366cf6d2e828f0ec87907df93e6791ed85095feb4be4751c670c61c4983f11ede8b2d719852d0492b40c81860ec4f2f92d4b249249c927249ea7bab9e256aa211c5afb7529384532bec96559bebd3efe43a7f7c3d14e1eccdb12975f560d4ba883a974bd1c9ef02775d58e6f36827933f59df21d7118eceb4ec7a9f5553dbaaab23a0b7460d45c6b2520329a999c64793df1c00ea480a40db1ed9ea6fd6c8b4568a64d64d1942c10450c67725ab6b7807484743cf7791cf1e2a8cf43e84e3b50f68fd29a1e8869bd9ed152dcea695be046f8c6ed15300318047c78ec3879ae53d7bafb576b9b81acd4d7aa8ace39641bdbb0c5e4d8c701ebc4faad6318edf2441a01cb963e5d511135321115707b14d18d4a20e39c71c2cb59b4ddfaf25a6db6aaa9d8e38f10330cff71c05bb5976477198b5f77b8434aceac846fbbf3e1951adcca29fcf35ee3b578f6d9f962dfd08cf98c8e23b857d6ab45d2eb2065ba82a2a8f7646777fddc829d6cfb3ad2b6fc39d426ba51c77ea9c5fff0097915b5411474f188a08d9131a301b18dd03d00559771cad6d5c5bf793eae1937bcde9e842765d955faac35d709e1a061e3c5dbef1f2e4a5bd2d62a1d3d688edd42df747191eef8a477527fa2ca22a6cacfbb27693d1791634e1d546e96aca9f5cf99ea8a88a1f7257bc7c9689b41da1525883e86d663abb8f16bcf36427cfb9f2faf9b6c77abd59ecb01b61f062a8798e69d8097b387003b678f15059249249cb8f127b9eeaf38670e8dd1574f75dbfa9559f9d2849d51ea7dee1595570ac92aeb6a249e790e5f23ce492adc222f48a2974452b6d8444593013cbba2fa40e632663a56788c0e04b338def240499b29b450d9edefd677e9994f1005b4664c631d5c075279058cd71b48b8de049436adfa1a0702d2e07ef651e67a7a2d4efb7aafbc4ec96b64f7221b90c2df759134726b474e9c79ac7e0e71c7e6143861a95be35bbbe8bd3dc49792e3050af65dca75f3551c4e0715716da0aeb956328edd47515953270643044e91e7fd20654cda0bd99368da8bc2a8bb53c1a7a91c41cd6bb7a523ff0dbc47cc85348dae9d0843238711c7971596d33a6b506a6ad147a7ecb5d739f2016d3c25dba7ccf26fcd747cba13d9f365ed2ed61a8a4d55768783e8a190bc0763916467038f473be4b0daa3da7aae8a83f42ecd34b5bb4e5be3f72291d0b4b9ad1c888db860f9e7e68635d4b2d37eccd7c8ededbbed07515b349db5a43a412c8d748076e2e0d07e7f25947ea7f67bd98e5ba62c12eb6bcc5c055d67bd0870ea3786efcdad3eaa06d57aaf526acae35da92f75b749cf2351292d6f935a3dd68f2002c37f1f458304a7b42dbded135831f4a6e82cb6d70dd1476d0626e3b177c4efa81e4a2d25ef7925ce73de789ce5c49f35e56f1b1ed3bfa6351b6baa230ea3a1fbc3bc383a4fc23e5cfe4b9dd6c6a839cba23b55539c941756690439a4b5c087038231c73fd551497b67d26286a1da868220da599dff32c03e090fe2f207f8ad0acd69b95e2ac52db28e6a99b3c98de0df327901eab9d1935dd52b53d8dada27558eb92dcb15734941575714f2c103dd140c2f9a4c61ac1e67929434f6cbe8e8e88dcf5556343221e2490b1fbb1b40193bcfea3d16a1ae354b2e98b559e9c50d92077dd411b773c423f1bc753eab4af2e374dc6add2efdbddeacde58f2ae3cd66cdf6ee6abf3455f9aa7452c8cc792d8ec54069e0353263c578f773f842b3b0d0099e2a670446df841ea56c2012ee5927a057dc2b075ff5acd976fe7e1f33cef19cf6bfdbc3af7fe3f9f2378d987fc2d64aa66aad5b2b6aa0a57efd0dae301d2d5480f02fe8d60233c799c702a60d96eb0d61b5dda8d354d549fa3f4f598fda9d474cfc35cfe2d6079e6fe3c7a0e0b9ae8e09aaaa22a4a785f3cf3383226306f39e5c701a3be49e4bbab619a0a3d03a261a09375f72a922a2be40739908f801fd568e1e6727aa91c4e55d517296f27b2f4f3d089c26365d3e58ed15bbf57d8df183872c2f4382a845e64f54111100444401111004444010a214050a21440542140850142572b7b6b5e1d36a0b1d8daf1e1d3d3baa5cdfda7bb03f26aea8e817147b5754baa36cf708dd8fb8a6a789b8edb9bdff00b95a70887364eafb2654719b39715a5dda4421aa25388601f0925c4f7e2b04392ca6a427f483467878631f52b16a367cf9b266df993786c3931609796a7d63a8a88a9e6a78a573629b77c4683c1fba7233f3e2be5c3a72445109ba044440111101f7a275332a5aeac8a4960fc4d63f749f9e16f9a7754e84b596bc69698cc3fcd91ed98e7d1c30a3c45cada636ad25ae9e8f43a576badeb1275a6daae96930d9595d00c606f421c07d0f0592a6da168e9dc1a2eed889e42485ed1f5ddc2e784fef0aba7c1a896e9b4fdfafd4991e25747d4e9883556999dcd6c77fb6973b90350d04fd4aca41514f38269ea22980e04b1e1d8fa2e5bb6d1555c6be1a2a389d2cf3bc318d6f7fe839fc9747e8ed3f4ba6ec915053b5a64237a7900e323cf339e6476555c43029c58a719eefb7eecb0c3cbb321f4d8cca7cc7d55247b638dcf91c1ac68cb8b8e001dc9e81473ac76a34740f7525858cad981e333b3e10f203812a063e35b92f48449575f5d0b59b2484e9950fd06d82ada00aeb341263ac52969f3e795b0dbf6afa6e72054c35b4671c498db201f31c7f25227c2f2a3ff8d7dc72867e3cbff5a1b56acb4c77cd3d596d9002658cee1ecf1c5a7eab99ea229209e4825696c91b8b1cd3d083c57465bb5ae95af0cf02f74ad7bb93647f86efa3b0a27db1daa1a4d49fa5289f1c94b5e37c989c1cd6c831bc091df20fcfc9597079cea94a99a6bcb620f118c6715641ebe668e89f921e0bd0150115e5aad771bb56368ed741535d50f386c5044e91c7e4d0a5ed13ecd1b4ed41bb35751d3e9fa67702faf931263ff0db93f5c20d485b07206319eebed41475770a9652d052cf573c870d8e18cbdcef4038aec6b27b34eccb47508ba6bcd4aeab647c5cea89db494fe98ce4fd578ba6ddf637b3aa77d0ecf74d4570a86f0dfa3804111f595c379df207d567431af910c686f66eda6ea5f0e6abb743a7e91dc7c4b8bf75f8fdc6e5df5c29629b609b21d9dd132e3b4bd5eda99060f8724a20639dcf0d6372f7fc945baebda5b693a8fc582df59069fa471203285bf79bbd8c8ec9fa6143d5f5b5770ac7d657d54d575321cbe699fbce77a9394ec373a96ebed1da0f4651496ad9668a88306409e58c41193df7465eeff510a17d7db6ada36b4f121b96a09e9a8a43c69284f811e3b1dde2ef99c28e872011351a038f5f9754fa0f44458d4ce9e4113e63bad9f4be86d417ff000e5829becd48e3ff00dc4fee823c8733f45a59646b5ac9e88da10737a47735da7826a8a88e9a08dcf9a5706b18d1ef124f05d27a32c7169ed3b4d6d660bc0df99c07c4f3cffa7c961b46ecf2cfa7aa22ad73e4acae8fe191fc1b192304b5bdd6e2392f31c538847274857d11798188ead673eacf9565343594b2d254c4d96199a58f63b939a7a7f3f50be143456db35018692182929636973b0034600f89c7bf7cf057aa37dbcd45ca1b0d2474f31650cd216d4b5a38b8f02d04f6e7c3d141c5ae5758a952d1364bbe6aa8bb74dd1a76d3b5ac9a82a8dba824732d713b391c0cee07838f9761f3ec568e390e9e5d93bf4e3c917b3a698510e482dbef73ccd9376be77d5857f68a035936f3f22069c38f73d82b6a58a2925fbf94451346f38e0924761e6b222b6a2a08a2b645e13397038763b93d14cc755a96b66ebc9772264cad51d2ad9f9f6465ea6b20a50da7634be4c06b618c65c7cbc97b81b2b99e2cc46f746b0fbad1e47a95f3b2da0b2463208dd5357290d1b8d25c49e8d1cc93f9aeb4d80ec323b50a7d4fac606cb72e1253503fde6d3f62feeef2e43cd7a09dce982b72767da28f315d4ad9bab177ff00ea4fef6fdcf8fb31ec866b6783ad753536e5639a5d6fa591b83103fe6b874711c8741c79ae896f0c85460201caf4179ebf225913e797e87a4c6c686356ab87db0888b892022220088880222200888802144280a1442880a842810a03cf45c51ed5b4cea7db45ca4c70a8a7a7947a6e06ff00ed5dae4725cbdeda960923bb59351c71131cd13a925701f89a4b9bf939df4567c227cb93a79a68a9e335b9e2ebe4d33947528c5731dd0c63f8958b5b06a6877a9e399b82633ba73e7fd95afae1c421c9933f5dff00525f0cb3c4c483f87e8111143270444401111004444011556d7b3eb4504d526f97e999059e8ddbc77f889e41c9807e21d4e3cbbad2cb15717266d08b94b44483b1cd266d542dbed746056d547f72d3fe546788f99ce72b3fac35a59b4dc4f6544a6a2b31ee5345827cb7bf57fbf351e6b1da8d656efd1e9f6be8a98f033bbfc570f4fc23cbf828ddef73de6491c5ef3924b8e493dd534386d99363bb276d7b7a1652cd8d35aae9dfd4d9757eb4bcea47f875328a7a4078534390df9f572d647000275c678af51b1d2bf722697b8f26b46495730ae308a8c568915b3b2527ccdee794e993cbfbeab7fd1fb1bda56aa31bad5a56b9b03f954550f022c77de7e33f2ca9a3477b2057c81936acd590d367e282dd0efb879191f8ff00d2b734e639633fad81ea79acce9bd29a9751ceda7b0582e7727939c535339c079938c0f52bbb34e6c27645a32945655dae9ea1d137deaabacfbe079e0e1bf92b4d5bed07b26d134eea0b55532e92c790ca5b3c2d31b4f2c17f060f9127c964c6a409a2bd94f68176f0a7bf555bf4fc0e0096ba4f1a703f7587741ff529974e7b346cb74ad30afd4d5935ccc3efc92d75408201dc968c003d495126b9f6afd65753241a66dd476380e43647fdfcd8ef92303e8a10d57ab352eaaa97546a2be57dd1e4e776a262e60f46fc23e880eccbd6dd7631b3ba475bf495253d7cadf74c368a76b23e1fad21003bd46f28675cfb546bbbc1920d3d4f49a7e99dc0398df1a6c7ef3b007d173faaac19d0c8ea0bf5f35157babafb76adb954bf9c955397ff001e03e4b1be67392b3160d3d70bd51dc6aa9232e8e86032bf2dc8771f8479e327ff009587f3072b0a69b6bed1b34f4d5208aaa9f30b3b98655517d20866a8944304524b23b9318d25c7d02fbdd2dd576c9db4f5b188a72d0e311397b41e5bc3a1f23c5635df975dfc8ca4cb5682e2034124f00005b8695d9ddfef7bb34b11b7d19c132ced3bcef4673f99c7cd6b36bb855db2b1b5745288a76fc2fdd071f5056d14fb4cd59139a5f590cd8e187c0de2b86478ed69469afa9da9f0b5d6dd49434cecff004f59376534ff006ea96ff995187007b86f21f45b6f2030a16a5dae5f1a4366b6d0cfd006873493f9a97ed33d454db29aa6b206d3d44b187c91b4e4349e99eabcb6763e4c1a9e43d75f5ee5f625b4cf5852b4d3aec5d7255c158dd477ab7d82d8fafb8ce238c0f75a0fbef3d9a3aa83b526d03505d6e46a29ab25b7c0de11c30bb000f33d4ad71387db94df2ec9776672732ba3aeece8258ad5f6765f74e565b1cdcba58f319c7278e2dfcd41749afb56d31f72f133fca4c387f0591a6da8ea98bfc596927c9e21f00c7e5853a3c1b2613528b4f4f7911f13a6716a4b6349918f8a47472b0b646121c0f3073d57957775ad7dcee7515ce8190be7937dcc887ba09e600e8afad7683201355821bcc47d4faff45ea71e89ded4608f3f91915e345ca6f44595badf3573f0dc322ce1cf3cbd0772b76d1fa5ee379b8c365d3f412d6564e721ace7e649e400ee7805b6ec9f65f7fd7f5cd8adf17d8ad5111e3d748c3e1c60736b47e37790e5d48ebd91b39d9fe9cd0b6914364a402470027aa938cb31eee3dbc8700ae1ba786ecbdab3cfc8a15f88e27ffe6af2f3352d8aec62d3a1a28eeb71dcb8ea0737de9f198e0cf48c1ffd478a961808ce42ab460e0f15e953dd6ced9b9cdead9774d30a60a105a245154222e67508888022220088880222200888802144280a1442880a84408801cad4b6b5a3e0d73a26b2c32b9b14cf1e252ccee514cdf85c7cba1f2256dabcbfa15b424e12528f54693846717192d533f36ef76aaab7d7d6d9ae74ee86a607ba09e278c16b874fe041eb90b48aea4968e7314993d9ddc2ef6f683d9047ada9ff004e58fc282fd0330e6bb836ad839309fd7e81c7d0f71c797bb44f4b532da6eb412c15303b7258a5696bd8e1e5cc7af1f9abfb210e295a9d6f49aec79eaacb3855ae33d5d72e9f7f546888b2b59659e325f4c44cce783c1dff005560fa5a967c54f281fba5525b8f6d4f49c5afbec7a0a72a9b92709a67c517d3c19b38f064cfee95f78edd5cf20369a419ea4602d14252e89fe8ff0083a4ac84776d16aa8b25fa12bbc32e2d8dae07e0dee3f5e4aceaa9a7a676268dcccf227883f3eab69d16416b38b5ef4695e4d563d2124fdcd1f1444c8eeb91d8af9f6e2bdbe69648990ba573a38f3b8d27dd07b81dff00a2df3673b1dd7faee463ecd64962a371e35b57f75081dc1232ef4682ba37407b2569ca0f0ea758de6a2f330c134d4c0c3083e673bce1f4430d9c6f494f51573b69e96096799c70238da5ce27d07152a688f67ada7ea8731e6c9fa1e91d826a2e4ef0863c9982e3f45dd5a4b44e93d270361d3d60b7db8018de8a11be7fd478fe6b3b24b1c513a59246b18d69739ce7600039927a2186d9cd9a23d91f4cd0864fab6fb59779860ba0a61e0420f6ce4b8fe4a67d3da1740688a1f1adb62b4db2385b9754c8c6ef3477323f8fe6a28db27b4ee9ed3134d69d1d0c57fb9b32d927de2296177ef0e2f3e9c3cd7276d0368dacb5d561a8d497ba8a9664ee53b0ee42c07a060e1d07304a05b9d9daf3da5f66ba6e4969a8aae7bfd5c7c37281998f3dbc4386fd32a09d69ed5daeeea5d169fa1a0b0407203837ed1363f79deee7d1ab9eff0034433a19ad51aaf52ea7a833ea0be57dc9c78e2798b9a3d1bc872e816142226a6740888802fbdbe92a2beba1a2a48dd24f33836368ea57c471380a61d89698fb3d29d475919124ed2da4047c2c3cdc3d790f2ca8d97931c6a9ce5f0f53be3d2ef9f2c4ddb485869b4ed860b6421af7637a778e523cf33e9dbcb0a05d7d66362d535742d69109778b0fee38923e9c42e93ebc7071dbae160eff00a52cb7db852d6dd29bc79299858d6ef10d70273ef6389c2f3583c47c1ba53b5ed25bfbfef62ef2f0fc5ae31afaa39e6cf67b9de2a053db6866a979fd56f01ea4f00a48d35b247b8366bfd696679d3d31e3f379fe414a7454b4d450369e9208e9e268c08e368681f45a9ed235ac1a6a8cd25196cb7599bee34f2841fc6ef3ec39a952e2791953e4a169afc7fb11e3835511e6b5eba186d6978b2e84a016ad39434f1dce56719400e7423f589393bc7a0fe0a1e9e69679e49a691d249238b9ce71c924aad54f355544953512be59a47173dee392e3dcaf92bbc6c654474eadf57d752aeeb9db2f441117d29a192a6a62a78585f2caf0c63473249c0c7cf0a4b6b4dfa1cba9ba6c7b4efe98d462b6a232ea3a1fbc391c1cff00c23cfba96b5a6aab7699a03354b8495320c414ed3c5e4f227b3739e2b54abbe5bf671a5a9ac74cd8eaeeee61924607706bcf373b1d8f003b05115d6e15974ae92b6bea1f3cf27c523f9fcbb0f2546f1a59d778935a4174f5f5f77a968ae8e2d7e1c7f3bebe9fd4bad4b7eb8ea1af35b719b7cf3646df8183b00b18a9d397f7d93f32aee30504a2ba79156e4e4f99f50bed4b4d3d4c9bb0b338f89c78068f33d15f5bad12cf8967de8e2f4e2ef25bf683d197cd557265ab4d5ae49dc080f78188e1f37b8f01f3e2acf17874ac8f8967b312a72f8a4697e1d5edcfd3a1ab5aad11c0e690d33541f75beee4e4f468eaba4762decfd5774305f75c325a5a4c87c56dceec928e9e27568f2e07d3aca7b1dd8b58343c51dc2b44774bee326a9ecf7213da369e5fbdcfd39295a3e5c975bb8846a8f858ab45e7e647a3874ed9f8b96f57e5e45adb2df496ca08686df49152d340d0c8e289a1ad68f20ae9a0827217a4550f77ab2e524968822221908888022220088880222200888802222008510a028510a202a1102200bcbc1c8c02bd2203c6eb89ecb49da66cc74c6bca42dbbd188ab0371156c3812b3b64fe21e456f2bcbce08e2b68592ae5cd07a3f434b2b8ce2e325aa38b35cec0f5d69d9a492dd4adbed103ee4d480f898e9bd19e20fa6428e6aec17ea499d0d559ee31480e087d33f39fa2fd01d57a86c9a62d0fbadf2be1a4a5603ef3cf179c7c2d1cdc4f60b9176c5b6dbd6b374b6cb4365b5590f0f0c63c6a819e7211d3f641c77cf4f47819b9393b4a29a5dfa1e633f071b1f75269bedd4898970c8dee47078af2f2030b9c5bba3a956370bac14996b7ef66fd56bb97cc7f058fb5505fb565e62b5da68ea2e35b23b11c14ec271c719c0e03d4aeb95c56aa5f2d7ed3fa1cf0f83db7fb567b2be6cb8acbdc2cf7695be311f8c8c37e5dd61aaeb2a6a8ef4f297e33d3007f45b4ed0f67f7ad1576b7592ece8a5bc5642257d0d3932be00e388daee8e73b8f00ba07609ecc4d7b69f516d2222ece1f0da1aee1e46623ff0040f3c9e87cfe466dd92f59cb6f23d2e361518ab482dfcc82b65db26d6bb44ab68b15b5d15083efd7d4e59030793b1ef1f26827d175e6c9bd9c34468d6c35d75886a2bc340267aa67dcb0fec47c71eae24a9968a929e8a9594b494d0d3411b4359144c0d6b40e800e1d02b81cd45256a786c6d8e36b23635ac68c35ad18007905eb92aab6b9565250504f5f5d3c7052d346e966964761ac63464b89e80632860b4d517db4e9bb1d4deaf75b151d053337e59243c3d0773d82e17dbd6df2ff00b41a99ed3677cf6ad36c710d85aedd96a803f14a47207f57977cab0f68fdaf56ed2b52be9a865922d3545216d1418c78c41e32bc7527a03c879a8a69609eaaa1b4d4b0cb512bbe18a2617bcfa01c4ace86523e780001c91666fda5eff61a5a7a8bd5ae7b77da3fc28ea5bb8f78efba78e3cc8586f4e4560d90444efe5cd004f4e38edc55cdbe82b6e35029e86965a8949c6ec6c271fd16f162d955eeb775d749a1b745cf749f124fa0feab8dd91553ff002492f8effa1d614d93fca88f9642d165badde511dba827a927ab19c3ebc94dd62d9b699b616c92d3bee130fc55272dcf93470fc96df0431c1108a1899146d180d60dd0079630aa6fe375adaa4dfab5a22c2be173d359b21ed37b28b9cb3c33df27869e9dae0e7c0c76fbde3f572380cf2383cb2a628a38e28db1c4c6b18d186b5a300003863b7a2f5fdf2c22a3c9ccb32a5acfa2e8bc8b4a31a142d22111146d7ccefa1a96d235847a66da23a60d92e338fb96b87bac1fae7d3b280ab2a6a2b2ae4aaaa95d34f2bb7a47b8e492a6adb8d9856e9b8eeb13333504837881c5d13b81cfa1dd3f22a0f1dbf35eaf83420a8528fe6ee79fe2529bb7965d1740888ad8af0afacb7292d557f6da78daea9634f82f71e113bf580ee06707a2b1446b5d8ca6d743e95134b513c93cf23a496471739ee765ce3dcaf9aab439c435a092790038acbdbecae7812551dc61fc00f13ebd975a28b2e7cb5afe0e17e455445cac968bebf0eba98da5a69aa64dc85993d4f41eab61b6daa2a6c177dfca7003b1900f9775b7e83d0d7fd5b5ccb669bb63e70080f931bb145e6e7f2fe6bac7645b0ed3fa344772bb08ef37b1ef09a46e6280ff00ddb4f5fda3c780c615b2a71f016b6fb52f2291e4657117a52b961e7f7f7ea431b1ed835eb54cb15db5309ad366c8708c8c54540fd907e01fb447a03d3ab34ae9ab3697b5476bb15ba1a2a58c603631c5c7bb8f371f55976b71c3185e95765665992fdad979762c71306ac58fb2b7eecf001030bd0185545149ba681111004444011110044440111100444401111004444010a214050a214405422044011151c71c49c2005cd1ccad436a5b40b0e81b09b8dd65324ef0452d230fde4efec3b0eee3c07d17ada96bab4e81d352ddee3f7b31cb29695aec3e7931c00ec3b9e9f92e1ad79aaeebab6fb55a82f955bd23ddee804f87037a35a0f2007d7ccab2c0c1791edcf682eacabe21c4163ffa70de6fa22f3693af2fbae2f2ebadfaa0363613e052b3222a76740d1d4fed1e278a8e6e7797c998690eeb07c4e0389ef81d95bddae4fab7963096403f0f53e67fa7aa90bd9d765159b4dd55bb3efd3d828087d754379bba88d9fb47bf41c79e16f99c439978546d05d3d7efe66b87c31c5f8d93ed4dfcbefe43615b18d43b4fb878eddfb758237e27b83db90e3d5b18fc678119e43af63dcdb37d9ee96d01676db74e5b59002078b50e01d34c4757bbafa0c01d0059fb1daedf65b5c16ab5d24549454cc11c50c4dc35a0057caab72dbb6844da2365ff00ff002c6a2da56a88229ae75156e8ad11121e29a9d8031b2751e238341fd9e3d4a961a0e4e7f8aaa20088880a1f45ce9ed4f77d53abee106c9b41d05456d4ccd64f779623bb1c4c3c591bddc9b9c6f633d02e8b70ce38678ab5a2a0a4a27cefa5a68a0754486595cc6e0bde79971ea7fe83a20399f675ec956a818caad77799abe63c4d1d138b231cb01cf3ef1e5d31ea565f6bbafb406c36d4ed3fa134f5a06a3999811c518229c1e4f99df138f50dce4f3e5cf6af698dafd3ecd34dfd92d8f8e5d4b5cc228e370de6c0de46678ea0746f523c8ae04b9d7565cee35170b8554b575751219269a576f3dee3cc93d50ca2e7515eeeda8af35178bdd74d5d5f52e2e96695d924f9761d80e4163d5110d877f4f92d934ed768fa28d8fba596e15f381c7efda23cf93463f3cad6d1693829ad1ff06d1972bd4992dbb50d2d4707854f67a9a3637e16431331f910b2316d5b4bb800efb6c7ff00f8e40fcd4149f5f92af9709c693d5a7afbdbfa92e3c42e82db4fd113f43b4cd24fc03573c649c61d03bfeab6fa79593c0c9e3cee48d0e6e460e0a81f649a6bf4e6a015751193434244921e8e77e16f9f753df5c70cf97f4eca8b8963d18d250af5d7beff002f796d856db745ce7d3b0270ab838e5d70b07abb53db34cd178f5d2ef4ce6e6181872f79e871d079a82b546aebd5fee1f69a9a97c0c667c2861710d8c76cf3279712987c36dc95cdf963e6672736143e5eafd0e912d23983f445cc105faf90ff008578af60ec2a1dfd56422d71ab620032fb5600e40ee9fe214b7c06ced35fa3232e2b1ef067445753455b453d14edde8aa23746f1dc1185cc379a096d775aab7cc087d3c85873d71c8fd30b64a6da56af81bbaeb8c73027fcc81a41fe0b01a86f1577ebabee35cd8454c8007784cdd1c3872561c3b0aec49494da69fbff0082266e4d790a328a6998e44c8ee87cd5a95faa5d42c8505aaa2a087387851feb3ba8f20b2b65b7c70c0c9a48c19dc33c78900f65d09b32f678beea08a9ee7a9aa45a2df235af6c230fa891a78f2e4ce1f3e3c95b55815d75ab72a5a27dbbb296fe25659374e2c756babec41d60b0cb535915059e866adac9080d6c4c2f91df4e41743ecc3d9bebab1d1dc35cd43a921e0efb053bc195c3b3dfc9a3d38fa2e80d13a1b4ce8da114b60b5414dc30f988de964f579e27f8792d918304f158b78a38c7c3c78f22f9b314f0be69789932e797c8c7e9fb25af4fdb22b5d96dd4f434717c1142ddd1e64f73e6789590683939185e915536dbd5f52dd4525a2081110c8444401111004444011110044440111100444401111004444010a214050a214405422042801e0b1da8aed4363b355ddee530869292274b2bcf403b773d00ea564095cb7ed85af3ed75b0686a09b3153913d796bb81791ee30fa6778f9e3b291898ef26d505f1226664ac6a9cdf5ec44bb5bd7971d7baaa7bbd5b9d0d1c59651539391045d3fd47993dcfa28aae7592dc2a5b4f4cd7b99bc18c63464bdd9c0e1df38e0aef5156f014719ce78cbd8fecff007e4ba67d8c764117830ed2351536fc99ff00e91048de0de86720f377ea9f9f62a7f11cb8ebf87ab68c76f8ff0042170bc47ff66ede52dfe1fd7e48d0eefb0bacd2bb20a7ba5de91d51abefd5f4f456fa169e148d79de20f7908183fabf5c75cec6f43d2ecff405bb4ec0d63a78d9e255cad18f1677717bbcf8f01e402da2ae8696adf4efaba78a67534a2681cf6e4c6f0080e1d8e1c7eaae5bc072c705505c1e8226426477401111004444016bdb44d596cd13a3ee1a96eafc53d1c7bc180fbd23cf06b1be64ad8091903232b9b3da46cbad76b1ada8f4169480b2cd6bdd96e55f30dda765439b96b49e6e735bf85bcb786501c97afb555d75a6acafd4b79943aaaae4c868e2d8983e18dbfb20701f32beba4f43eb0d567ffdbba72e7718f3c668e12221feb386fe6bb4b661ecd7a134a362abbcc1ff00115c9b876fd60fb963bf662e47fd59f45a3fb5e6d81967a49366da4276d3ce5819739a9fdc10c78ff01b8e448e78e9c3864e326c8e4bb8d1cb415f3514e6332c2f2c7f86f0e6870e0402381f92b741cbf8f0e68b064222200beb494d3d65545494cc324f33c32368e7bc4f05f2e99eca4fd8bd8e189b3eacb93e38a9a98ba3a7749c1b9fc4fcfcff00a725c726e5456e4faf6fd8eb4d4ec9a4493a32c30e9eb0535b2201d20f7a770fc721f88fd780f20b5dd7db43a3b1b64a2b6b995971e47ac709fdaee7cbeab54da06d2a5ae6cb6cd3ee920a6396bea7387c83b37b37f351a9392493c7bffd5536270b9d92f1b27abdf4fdd963919ea0bc2a7a79ff0007dee35d5771ac92b2bea24a8a89092f7b8e49fe815bf4fe888703392063babf492d8aaeac70ee02a904024823d56fdb3dd8f6d0f5bb99259ac13c546f3835957f73081dc177177c815311d886cc7661431de36b1ab7edb523de65ba8f2c337ec803ef1c38f703cd1a4635d0e72d35a7af9a96e6db6d82d35b72ab77f974d117103b93c9a3cce16e778d0566d130675ddf237dd4373fa0ed4f124cd38e02597e18fa67193cf82d8f5deddeadf6b974c6cd6cd4da374ff161fb23036a666f9c83e127cb27cd42ef739cf73e47191c4e5ce71c927bacfa0df5d4babad6b6b6a03a2a2a7a285a311c308e03d5c78b9dddc79f9725f6b1d09a9984d20fb961ea399ec969b63eb1c1f282d879e4f377905256cc742ddf5c5f63b25969c3226e0cf50e6fdd53b3bb8f7ec3993f3c59e0e0a9af1aeda0beff0042a388711f0df814ef37b7b8dc7d9bb67926b2d611dcaae226cb6b789273d2590716c43bf427cbd42ed58c0030d000002c2685d316cd1fa6a96c3698b729e9db82f3f14af3f13dc7a925675b9c951b372de559af65d0ed8184b16ae5eb27d58e2aa88a213822220088880222200888802222008888022220088880222200888802222008510a028510a202a10a04280c46aebd5369dd3370be559fb9a2a774ae19c6f10380f99c0f9afcf0d4b7aa8b8d7d7dfee2f1254d54cf9e5fda7b8f21f503e4bad3db1efaeb7ecf292cd13807dceac078cf36463788ff0076efd1714ea79488e285a781717fcc7f655de17fb7c49dfddec8a1cdff0073990c7ecb77f7fa19cd88e889f68bb4db7d89c1c695f21a8b84a3f0c2d20bc83dcf068f5f55fa4b6fa5a7a2a2868e9216434f046d8e28da3018d03000f2017377b0869265068db9ead9626f8f729fecf0bba8863e78f571fc974b3786552752fdf5d1152b94fdb6b59dd62d4fa734869dba55d15535aea89cd354ba22e73c86b1ae208e1c09e3dd7525ceba96dd6ea9b8564cc869a9627cd348e3c18c68c927e417e706b9a8bfed535edff5450513ea2396a70c697068645ca31c48ce1a1624d4536de822b57a17b61bb6d36975cdbf4ed46b6bd59aa6b67644da892b647c6038e1ae182723257676ceb45ed1ac3534cebf6d3a6bed2b1d99e9e5b7b7320c1e02427782e338edb5d5fa9344e8ea590565e69a7025f09fbe62de7b5db9907f0869257e8ac3c1b827240016954dce0a4fefd4ded8a8cb447d02264770995d0e611110147027185e03037386819393e657d15bdcaae9a82827adac9990d353c4e96591c7018c68c927c800808d3da4369f06cd7443e6a57c6fbed787436e85dc70ec71908fd56e73e67017e79d6d4d4d6d5cd5b593cb51533bdd24d2c8ecb9ef272493dfa9f55d01aa348ebfdbd6b2afd6d2402c5a4e26914759722591b295873bcd67c4ece0b89e033c32a00af652c55d3c74533e7a6648e6c52b99ba64683c1c474c8e8b26c8f8222aac192889e80a1c03824219d8f51ee788df137b73237b779e3aff007e8b37a9752565de08a8181b476ba76864148c386b5a3abbb9ebf356761b15eeff005828ac767afb9d43bfcaa5a774aef5c01cb8f3535686f659da0dedac9afd351e9ea67007766778b37fb5a703e656ae116d36ba053715a26409dcf4f3599d2da5751eaaad147a76c95d749b3c453c25c1be6e7726fccaed9d0decc5b3ad3ee6545d62a9d4352d19ff009c7eec44fee37f8124792d9f596d3f661b2da116f9eb2869a5886196db6c4d74a3d58ce0df9e16e69af6473b681f64dd5572f0ea356dd696cb4e78ba083efa623b673ba3ea54c1068ad866c4a81971bd7d89d5ac1964d7022a2a5e7f6230387a86fcd435b4bf6a9d557812d1e8fa48ec34aec8fb4bc896a0fa13eeb7e40e32b9faed71afbb57cb70ba56d4d6d5caede7cd51217c8e3ea72b00e8dda9fb565eee4d96dda0e81b67a62373edd5003e73fbade2d67af12b9ceef72b85e2e535c6eb5b515d5931cc93d43cbdeef5272ad3d70af2df6f9eb082d0191757bb91f4eeb7842763e582d5989ce152d66cb4635ce706b5ae7b9c70d0073f201676d966c06cd578711c980f0f9ac9d9ad2d6d4474f43049535531dc6868cbde4f4007f25d2bb1ef677927f02f1af5bb8ce0e6db1870e776f148e5fba15bd587562c3c4c87bfff003f7d7e851db9f6e64dd588b6ef2fbfee467b21d935ff0068158c9a16badf6563b12d6bd9eee3ab6369f8ce3e43a9e87b2f43e92b2e8eb1c567b1d18a7a78fde73b3974aeeae71ea4acc50d253d152c749490470411343638a3686b5a07400700bee3aa83979d3c97a748f91370f0218cb5eb27d59400af43994450c9e96811110044440111100444401111004444011110044440111100444401111004444010a214050a21440542a39542a3b86103d8e4ff006d5af925d6765b667eee9e81d301e6f7919ffc8b97b52126e039f08c0fccaeb5f6d3d3f29aab1ea886373a2dc7514e40f84e7799ff00b9727ea6a7944eca8206e6e86120f1cf1feaaeae5cfc361cbd13fe4a2c7d63c56c52ead6df23f43fd9f2db1da762da56923c1deb7c73b881ccc9ef9ffd4b79a873c44ef0b77c42d3bbbf9ddcf4cf92e01b07b456d1ac9a46d9a6ed3250430dba1f0639dd4fe248e603ee83bc48e03870ecb35a7bdaa368f6eab61bb416bbb439f798f87c2711d70e6f5f9154bddb2fb46fa225adb8d2fb42ea9b256e9ba2d31646daaa478734b417069925667e13e296900f0ce01fa2d2a5f667b2e9cd2f4977d59b481a6e67400d735db8236bb99635dbc37f1cb91cf455d7ded6b5f596b8e9b46584dbaaa58c78d535ae1218de79b58d1c0f9127e4a24669bd77b42af179d4d74a92d91dff00dc573dce7e39e18ce83e8173b6daea8eb635a1d2aae737ec2d7dc48fa4b685b19d8fd44b3e8db75df565e9cd2c75d2ac0823683d1991900f5f7788eaa970f69eda75fa6753e99b150d1ef0f70454ef9de3ea71fc96932d16ce347619565d79b837896603c8f503dd1f32ad66da7dce4961a7b3da696df44f9991fc1bd904f2e186e719e8a2aca9d9ff000d7aaf36f97ea7778d08bf6e5bf92ddfc5f42e75b6d5f6d51cd1b6fba9ae76f33c65cc8a02c8439b9c1f80647d72ba6f603b3aac3a76cfabae7b45d537892b69e3aa6c26b5cd8007341dd2d764bb9f92e67f6828985966a9e1bc7c5613d87ba54f1b32db4691d03ecf7a55b7aad353746d23a286df4b87ccf0d7b80dee8c1cbe2c7902bae1dd2be98cdad1bd7a6fdce5954aa6d705d0e9204648eaaa5cd1cc8e2b8635d7b53ebbbc4b245a7a0a4d3f48490ddc0269b1e6e70c03e8144f78d6fadefd2ef5cb545eab0b8f2354f03d30d207d14a4b57a2dce3a3efb1fa766a69c49e199e2dff00d5de19fa2f15b4d4970a47d2d5c30d4d3c9c1f1c8d0e63bc883c08f22bf2d0fe9d2448f75cf3fae5cffe7fd55c5b755eabb44bbd6fd4778a37768eb24181e994e592ea8c269f4675cfb6d6d0858b4845a12d92b5b5b776e6ab7387854c0fc27f788c7a02b8b7aac86a2be5df50dcdf74bedc6a2e15ae6b58e9e77ef38b5a30067c82dcf64fb1cd69b46a80fb550fd92dad7625b85582d89bdc347379f26fcc84365b11d8e2b6ad15b3ad6dace56b34e69baeae6138f1b737216fac8ec347d5766eccfd9af41e936c5557589fa92e2ce265ad68f081fd98f88c7ae4adf757ebed05a0687c3bcdf2d96c6c6df7292370f131d846de3f9218d4e62d25ec89a9aa8c536a7d476fb734e0be1a563a790796f1c37f8a99748fb356cbec3b9255dbea2f33378ef56ca4b09fdc6e028ff5c7b5ddbe2f129f46e9c96a9c321b55707ee33d7c36f13f32141facb6ebb4dd505ccaad4951434ee3fe0d00f01a076cb7de23e6b0343ba2e9a93677b3bb6f815973b169fa6601881859193dbdc68c93f225439ae3dad74b50f890693b456dde60086cf3fdc439ef83ef11ea02e319e596a2633d448f9a671cb9ef71738fccf1caf1f3250ce84a7b42dbded1f596fc135e1d6aa17f3a6b7661691d8bb8b8fd545a492e2e2e25ce39738f324f3e3c4aa226a6504457b6aa035b29decb6167c671f92e95d52b27c91dd9a59646b873c9e891f5b2db9d57289641f72d39f371ede8a5ad92ecdaf9b43b9be9ed8e8a9a869b06a6ae407c388746b40f88f97d563f663a12edadf5153d8ed3178710c3aa2720f874f1f5713df9e075fae3baf43696b5690d3b4f63b441b94f0378b8fc52bfabdddc92aeac9c38755e1c779bf97dfccf3d08cb8a5be24b6ad745e66bbb2ed94e98d05007d0539aab916e24aea800ca7b86f468f20b7e6823395519ebf5555496593b65cf37ab2f6baa1547920b445154222d0e81111004444011110044440111100444401111004444011110044440111100444401111004288501428851015cf05e2438c1e98e7d97aca897da835b3b4ae82750514e63b8ddc9a789cd387323c7bee1f2e1f35d29aa5758ab8f5671bee8d35cac974440bed27b4276b3d5c6d36f97ff00a2daa431c58f8669738749e63a0f219eaa03ba544b70af652c0d7c9ef8631ace25cfe5c077cff3591bed51a7a4f0a3e124bc011d0775bbec3f4cb1b03b5255c60b9e4b29011f08cf17fae54be399d5e151e043a47afabedfa7720f04c19e5ddf88b7acba7a2eeff8363d9ce8da4d336e1575a227dca4666697196c43ab1bfcff00e8ada82f7a4f5dd75559e7b5191d164b267c790e683cc387c3f3e79597da51ad7e929e96dc099eb258e9071c6048fc1e3d071c67cd79a0a3b3e83d24e95e5819047bd34c1befccf3d0799e83b2f06acf122ee9b6ec6f48eefb7a1ee7c3e492a925cb1ea62edda4f4a68aa69af1707f8c63717325a901c59d9ac6f572d0f59ebebd6a2926a6b5b26a5a0634b9cd8b3e239a399791c82c26a8bfdd356ddfc49c38460fdd5383ee463a7cfcd7ad25739b4beaa8669b0e84fdd55338eec913be2f97223cc2bba706c8c7c7bfdb9f9be8bd176d4a9b32eb9c9555fb31f9bfdccee84d3967abb732e53bfed92124ba33c1ac776c75ef93cc71598d73035f416aa68c06037385ac6b0000707741c15a51d30d31b41a8b431e4dbebda25a6392781c96e33fea6fcc2cb56422e3ae74f5b039c7c391d572803800df87f8387cd709cdbb158dfb3a36bf4fbf89ebaa962be0335082567328b7ddbd535bf5d345a96ded092b1a2cf4dc3878afcfecfba08519dbed9515877c0dc67ebb873f21dd6e1b70b87daf590a58c92da385b1e31f89def11f981f25f7d1f6592f178b5e9fa7788e5aa9a3a6648e697069271bd8f9ff00d42bbff0fe146da22ac7a24b57f17a9f3de3d9f2a26fc35aca4f4460e9ad34508e2df11c39171fe4b69b1691d4f7868fd0da76e554c771de8291ee6fd40c2ec0d9dec3f4569311d4cd4a6f3726e335358d0e01dfb2ce407d4f9ab8dbeebc8b40e8691f46e8db73ae069e8183f01c71931d9b91f3c2bd86754a4aac5afaf7286cc0ba5076e5d9d3b1c4f76b7d65a6e3516faf80c1574cfdc9a238de63bb1f3e2b59d49541c594adc38b3de713d3e7fdf4595bad6fd9e292aa4797cce24e5c725ce3d49e64f1e6ac341d8e9f51ea8829aeb7165bad919f1ee55d2728616f176075711ee8038927d56dc5f2924a95d5f5f4fee6381e236de43e9dbd7fb12afb2f6c424d7d5e3526a36be1d354726047f0bab641cdb9e8c1d4f3e83ae3a23691b76d9decd29058ed9e1dceba958238adb6ddd6c7081c035ce1eeb0790c9f25cddb54dbb55dc6d30e8ed9dc32e9cd274918822f0bdc9ea183ab88e2d07b03939e272a121fc4e4f1eabcf6a7a5d35262da2fb466d1756f8b4f4b5edb0d03f87816fcb5e479c87defa11e8a21a89a6a8a875454caf9a671cba491e5ce27d4f15f34436d071ea73ea494444011110c845557b6db74b5677cfb900f89f8e7e43cd6f5d729c9452d7539596c2b8b949e8977fe0f36ca092b652325b1378bdffc879a923677a2eebabef94d61b0d30de24191ee1f77033abdc7ebe67f83673a26ebabef74f62b0d28c9c7892107c3819d5ce3fd927d17716cc341d9741e9e65aed51efccec3aa6a9e3ef277f727b761d15db75f0daf97ad8fe5f7f3281f89c56de6e95af99f4d99e88b3e84d3acb3da227127dfa8a87e3c49e4c7171f2ec3a2da9a30839f0e4aaa8a537393937b97b0846b8a8c5689044458370888802222008888022220088880222200888802222008888022220088880222200888802222008510a028510a203c93c02e33f6b8bd4972dab3edfe2130db29a38433f55ee1beef99de6fe4bb308c8017117b4eda2a6d9b63bb4f335c62b808ea60711f134b1ad23d41691e802b6e0d14f21befa14dc6db58db74d483aa237dcb513291af037e76c0d7746f1009fae4fcd74b5be921a1a1828a9d9b90c0c11b1a0720173157534f6fabf12373da1aede8a50718e3c0e7a1525e98dad3590c74da828def7b460d4c0065c3b96f2cfa2f2bc73132721a715ae8db7faff07a8e117d14c34725d125fa7f24aef6b5c30f008041c11d41047e60150aedbefefacbe32cb0bc8a7a300bc03c1d211cfd40e1f5526db359699b8341a7bbd335dc0ee3dde191ea0a843683b916bab84c258e78a4984ad731e1c0b48ee157707c797e275b535a2db5f5ee4fe2574654fb0f5d5ee5c5a28db474401c788fe2ec0fc9596a8803a065501c41dc7f983cbf87e6b301cd91bbed702d3c410acaf833699cf4f738f6f7dabea1938f08e0f2c56c96abdebb9f33c5cab27c479e7d5bd1fbbcbe066af3526b742698d4249fb4dbaabec92c9cfdd04904f5e1bbf9ada3474905336f5aeebc86d3961868f7b86626e38ffa88016afa06e7a65ba26aed9a9aa5a6235c26653373bef01ad3d0722e0b1dadf574fa9df15aad948696d70102381a065f8e45d8e0001d3a715f3e78f65d278f08beaf7fff002da7a47cfc8fa1fe21421cce4bb3d35ee935abf2d11838659af1a866aea824992574f2127964e47f453dfb29585f78dabd3d6ba32e86d70baa643d03be06fcf27f23d943569a21490b59ba5f23c8df7019c9e98efd82ee4f66cd08ed19a19b3d743b975ba9153520f389b8f723f9024fab8af66a0b0309ebb4a7b7b97df7f33c5ce7fe639ca4b7843bfdf9bf91255c2b69a828a7acac99b05340c7492c8e3c1ad032495c1fb68d7336bbd67577795c63a18beea8637728e169e048eeef88f5cf0e8a66f6b9da20646dd09699f2e7e24b9b9a79379b62f9f323d1725ea1aee74711c8e05e7f92d30a31c3a1e4d9d64b45fcfc7efa9b663966e42c6adecb76ff006fbfd8c75d2acd655170e11b78301eddfd4ff456b93ba5a0b8077300ff002ebf354454f3b2536e727bb2fa15c6b5c91e887cbfbfef8fcd1116a6c11110044fef8aa805dc03493cb922d18d1aea82ab18e7b8318c2e71e4073592a2b34f2fbd3930b073cf33fd16f5a0b435eb5255fd874cd9a7ab79203a568c31bfbcf3c07a67a2b0a387db38f3cfd88f9beff02b3278a5354b920b9e5e4bf9fe0d36df6423765adc11cc333c3d495306c93645a975e4b14b1446db650417d74ac2011ff76dfc47cf90efde6ed95fb3b59ecae86e5abe58ef35c30e14807fcb46ef3eb21e5cf870e454ed4d0c7044d8618db1c4c01ac63060347603b2912cca7163e1e2adfbb222c2bf324a7972dbb451af6cff0044d8743d91b6ab0d2784c3c6699f832ccefd67bbafa7003a00b656823a2a845512939c9ca4f565cc60a11518ad904445836088880222200888802222008888022220088880222200888802222008888022220088880222200888802144280a1442880a007b2d0f6c7b33b56d1acb1d3d548692e14d975255b5a1c59cb2d70ead38191e4b7e0bcbfa2dab9cab92941e8d1cedae1645c66b547056d0b657acb47c8f173b4bea68da70daba606589c3cfab7e6028daa6cb4729cc4e744e279346f37cf82fd3b7343861c0381e6085a5ea9d93ecff0051b9f25cb4cd1f8cff008a6a7061793dc96104fcd5a3e2345dff00621afaa2a170dbb1deb8b668bc99f9d46c13171f0e7888e848209f900a82c351c84d0e3af3ce176e5c3d997434ef2fa4b8df28fb344d1bda3eaccfd4ab383d97b4ab5c3ed1a8ef4f6f0e0c1134e3af369596b864b7d646dcfc556cd47de723dba19e9e90412c8c7eee705b9e5f355ada7fb540202f31b739381c4f51c7b2edbb2fb3decdadcf6c93d056dc5cd3c0d656388f9b59ba0fd15e566c2765b532991fa6bc3278e22ac9d83e81f8525f12c4f0bc27cce3f7ea44ff002ccc76f8c9c54bafdec705c763a3681e24b2b80c672e0d07e4b63d33a72e576ac8e8b4f5a2a2ae52edd0da788b87d7a7ccaedbb66c5b6656f7efc5a569662397da247cc07c9c485bb5b6dd6fb6d3b69adb454d4708e0d64310637e8170fc7e2d3ff055bf9bfbd7f4243e1d977ad2fb76f24415b0fd82b6c55d06a5d6621a9b84587d35130ef4703ba39e7f13876e41493b63d754ba0746d45cdee0fae947854309c66490f23fbadce4fd3aad9752deedba7ac5537abad50a7a3a58cbe490f33d80ee4f203cd70a6d8b68557ae352cf7caedf868e1cb28a973910c7d063f58f327bf0e4173a233ceb5db73f663d7cb4f2474be55e0d4a9a17b4f65e7af9b34ed5379a99a7a9afad9df3d7d5c8e92491e72e73dc72e712b4d24b8971392799ee57d6b2a24aaa874d213c7e119e0d1d97c946cdca7936ebff0095d1137030d62d4a2f76f76fd4a2222864e08bd358e7bc31ad2e71fc239ac952596778de9ded81bd4733fdfcd75aa8b2e7a416a72bafae95ace4918b1c788e5dd7d218649ddbb146e90fec8cad969ed345116fdd195fddfc4fd397e4a49d07b23d6faab71d4366928e8de462a6afee6303b80789f905631e1528c79ae9a8fdfdf99552e3319cb971eb73225a4b1cae21d53208da79b5bc49fe4b77d07a0afba92a9b4da66cb3d4bb3874c1b863479c8780ebfd17516cff00d9cb4c59cc755a9a77dfaac71317f874cd3fbbcddf338f2534dba868edf4aca4a1a582969e3686b228581ad68f2013f158b8eb4a63ccfcd98fc2e5e53d6f972af25fb9006cebd9a68290c35dacebfedd28c3bec34c776269ea1cf3c5de8037d4a9eecd69b759a823a0b55053d152c630d8a08c35a3e415f808a05f956e43d672d4b0c7c5ab1d695ad0f38395e82228fa2240444590111100444401111004444011110044440111100444401111004444011110044440111100444401111004444010a214050a21440542a1550a8ecf440533ea848ce3aaf2e38e248181ccae7ddb07b42c168a99ec9a2e186b6ae3259257cbef40c7750c03e33e7cbd576a31edbe5cb0447c8c9ab1e1cd63fea7421202d1f6a9b4dd39a0681925ca6754d6cc0f8145060c92799fd51c4713f9ae2bd53b4ad59799de6f9ab2ba4de713e0b672c60ff433000f92d4ab6f7018df29aa754cd8c35a497177ccf45631e1f456f5bec5ee4564b88df6ad28a9af57d09b355fb43ebebc4ef6daa5a6b1d313ee329e312498f37b873f4016bd0ed8f69d0c8241ab2bc90793d91b87d0b146da4349eb6d7f5cea4d3b69abaf00e1ce8c6e411f939c7dd079f3591d73b26da1e82b6b6f17eb33e928b7db19a98666c8c697720774f0cfa22e218f17cb5d2b45ddff005365c36f9ad6cbdeafb2d74370936b5b473562576b2ba09b190cf11a07aee631f92df341fb466aab655c14faaa382ef404812ca19e1d434678b863dd38e7820725ce565d2da82f140eafa0a17cd0349f7f7c0c91cc004e4af8dbab6a286a4d1d6b5ed6b5dba5b26418ddd8e797ff00090e23897cfc39d697bbb7bc59c2f2f1e1e257636fd7bfbb726fdbd6d4ea75fdddb051992934fd1389a689eec199dff6b276ec01e43cca826f35df6b97c366440cf8472def33fd15c5eee3e2b8d2533b799f8dc38971fe99593be68eaab368da5bd57131d5d4d4002023fc38cb5c7defda240f45c388e7555a8e356f48eba7bdff00077e1b83749bc9bb79bf92355f5e88be94d04f5550c829a192795e70c646d2e73b8f60a9231f14ae8e4690e638870ec4730abdf93ea996bd774b63cac85bad535561f2e6284fe23ccfa2bcb3dac35a2a6adbef672d67eaf99fe8a72d8c6c56f1aedb15d6e0f7daec44e7c62dfbca9e3fe5b4f0c73f7b976cf1c5b63f0f8c61e364bd23e5dd94d95c4a72b3c1c55cd2f3ec88b74e69faab8d6476db15b66abab79c08a08cc8f3e671c879a9d7437b356a1b8363a9d4f738ad3190098211e2cbe878ee8fa95d25a2b4769fd1d6c6dbb4fdb61a48f00bdf8cc929eee71e27f97459f60c13c52de2b28ae4c75c8bea73ab84a9be7c9973b343d0db22d0fa43765b7d9a2a9ac6ff00f975804d2e7cb230dff480b7bdce3c97b45593b2763d64f565b57542b8f2c168bd0a638f240304e555169a1d0714444011110044440111100444401111004444011110044440111100444401111004444011110044440111100444401111004444010a214050a21440542a3b9aa85e5fd101097b58eb99b4f693874edb6a1d0d75df784af6120b29c7c5c472dee5df19ef95c517baf95b28a2a4c8792038b47bd93f840ea78a9e7daeea65a9dafba99e70ca7a08238ffd5971fe2b58f638d3b43a9f6ceeb85cd8c99b6ca77d6c713c643a42e0d69c75ddc93ea01e8aded9bc6c4ae10d9cf7653d15fe2b32c9c96aa1b247df677ecc5ae352d04573becf069da495bbc1950d3254169ea580e1bf339f251decdb434dacf6a94ba329277185f5723669c0c110464efbf07aee8e03b903aaeacf686f6868742dda4d2fa728a9ee5788da3ed524ce3e1419190c20712ec1cf3e0a00f652d594160dba5357de258a9e9ee8c9a99d33dd86c4f90ef37c80de686e4f2caa87a27ea5d7336770d9adda5f406938a8a9bec766b3d1478df9646c6d0073739c7192799279ae6df6c7dac696bfe8ba3d25a5eed47767555536a2ae5a776fb238e3e2d6e7b9760ffa7cd439ed11b49bbebfd775cd9ab1ff00a1686a5f15052b1df761ad25be2639179e7bdd3a755ae6ce69b4b54dd03752553e1dd7030b5c7113cf671e9cfd39ad2db3c38b9b5ae86610e7696bfa92f6cae89d41a1adcc91ae6c9283339a4f1f7893c71fdf25a5edeacf1c53d1df2184b5d2e62aa900c6f118dd738f21d467ae16e7aa75b69fb2daa534f70a4a9a86c65b0c34cf1271c70c96f00070e7d965edde1de74e533ebe08a56d553b1d2c6e00b4e403fc5795aedb68b5e5c93e56da6bcd1e865542c87e1e2d6a927af911a6c8b4478de16a1bbc5f740e692070f88febb81e9d8755206b5d3916a7b7c3413d4be18993895e58d0e73b008c0cace31ad8d8d6300631a035ad1c0340e40792c0ebad4d4da62caeaa930fa8972ca68bf5dfe7e43392b94b2aec9c952875ede88e91a2aa286a5d3abf534bd795964d0f6875934ed34515c6ae3c4b3e77e564479e5c78827a0e039f251f58edc4eed654007073183c4e7bf1fa2ad1c75177b84d75b948e95d23f78b9c38c8efe83fa29afd9f36612ebebf9adb835f1d8a81e0d49031e3bba44d3d8f53d01e8485f40e11c3a38f53c9c8dff77fc7a773c2f17e232badfc363ecdf9765fcfd0d8bd9d3639ff0014be2d53a9e170b2c6eff95a77641ab20f33ff00760fd7972caeb6a78a386311451b58c6801ad68c068030001d178a3a6868e9a3a5a58990c11303238d830d6b470000e8bee172cbca964cf99f4ec8ef87890c5af923d7bbf32bd502228c4b088880222200888802222008888022220088880222200888802222008888022220088880222200888802222008888022220088880222200888802144280a1442880a85476782a8547140ce4ef6c9d3d3d2eb1b6ea58a3260ada614ef701c04b19c8cfab48ff695086c735ccbb2cda7437af01f5140e6ba1aa818403242eea3b904023cc2efeda1693b5eb5d2f5361bab4f8730de8e568f7e178e4f6f98fcc642e1adabeccef9a3ae2fa1bed1b9d4dbc7ecd5d103e14adcf020f43cb20f2f4c2b6a92cca23527edc7a7aa29ec97e0b2656c96b5cfafa323fbe55cbaa35a5deece91e7edd5b35539eff8835ef2402072e7c978afb206c4d751e5c40c39a4f13c798fe2b236cb7b286490895ce6bf18de1c4633fd574b587d9a0dcf47dbee2fd4afa4b9d4c0d9df11837e26ef0c86f30780c025758e251451a64bd24d9ca79f7df91a627b518ad5f6d4e429619a23f7b13d84feb3485e3a7929bb69bb2bd59a17debbd1c735ba43e1b6b695dbd11279076465a7d40cf4ca88abed13d317be30d7c2d1bd9078b47f3513230655c55b4cb9a3e6bb13b1b88ab66eab63c92f27fb18f8dc1b2b5ee6b5fba793b91f25d2fa42ef497bd3f4d5f46c1130b375d1818f0dcde05ab998f4e19cf4eea5df67ea990d2dd288bb3135ed95a3cc820ff00bccf18a5594788969a6ff00aec7a2e1d6f25dc8fb9245eae34f69b554dc6a8b8450465cedd1924760b9f2f372add5fa8a4adac716c4380603eec4ce41adfcbcf3953b6b6a6157a42ed06378494af3f419fe4a04d2ae062a869c632d38faff0045b7f85f1a1759edadf5d3e1a1c7fc49936514eb17db5f99206cbb44d7eb7d534b61b76216603aa25232d8621c0bbccf41dcfcd778691d3f6bd3160a5b1d9a9c41474ac0d60eae3d5ce3d5c4f12544bec776cb7c3b38a8bac14ec15d555d247512f324331bad1d800738f353834804e4af4fc5325d96f84b68c76d0f39c2b1942af1a5bca5bea3071f0aa8e678264775504632ab0b60880e5100444401111004444011110044440111100444401111004444011110044440111100444401111004444011110044440111100444401111004444010a214050a21440542a119550880f25aad6e16fa4b8d2be92be961aaa778c3a29981ed3ea0f057888b67aa04537cd816ce6e92be665a25a091c73ff0029396373fbbc949d4903696962a78f3b913031b939e00602b854774ecba597d9624a72d74f339574d757e48e9a96973a2a6b8514b435b047514d330b258a46ef35ed3cc10b88fda1f67d4fa1f591a2a12e36baf88cf4ad278c6d248733e58e7d885dca481cf195ca1eda4ea91ae2cbbf9f03f47931faf8877bf929fc26c978fe1ebb496e8ade3105e078897b49ecce5ca3b356d6dea3b3d1c7e35448fdc601c411cf27cb993d949d6dd94d550363aba4d45241708c6f35d1c78635dfab9ce70b44d29a826d3faa25b8c744dac98b5f1b63777772c703dbe84add1bb49d4b6cac85fa834f9869251ee030be27eee39b4bbe22bce71059539b58fa68bfaec7a5c3963a8af15efb7d0939e25fd0f236bdf1be6fb33bc770e0d77bbc4f1e3dd73ae9b3ff003b525b8dc2dcf0e5f1705296d1f5bdba3d20c8ad950d96a2e716630d3c6261f89ce1d0f36e3cfc9473a52827746191445f3d548d643181c5c4f06803cc95dbfc298b35778962d357abedd3a917fc4d93058ee31f2e5f3d5b3b57d8f22963d92c8f7b70d96e73b987b80d6373f50548bb45d4b0e8ed0f77d4f3c7e28a0a632362271e23f38633e6e2d19f35e3659a71ba4f4059ec181e252d30f188eb2bb2e79ff712bebb49d32cd61a16eda69f39a735f4e6364a3fcb7820b1dc3980e00e3c958e558acba53ecdb21e2d6eaa6317d92397f59d6ea6b75eeabfe33b84b75b936d11dd6ad8351c96b6538909ff0097a68db86c8e6e399049cf25306c7b515e28752d3e92bc5c2aae56eba5a1979b1d4d6b40ab644ec6fc13600de733787bdcc85126b0a58aeb5b7276d3ad571b46a716aa6a0a29e0b44d5b0f8f4ef73db531c8c046ec9c32c3823aa98365943a8f55eb71b46d496875a21a6b60b75a69651bb2c8090e9277379b0388c069e2005c59df525d08a8dcf555583211110044440111100444401111004444011110044440111100444401111004444011110044440111100444401111004444011110044440111100428850142885101508811004444017894e31cd7b5e64f5e85618203dafedf6bb476a4b8e9ba1d351baaa971b95351504b1c0b410edc001c71e5bc392e5cda16d06e7aa6ef25d6f570757d5e37636338471373c0340e0079657527b53ecc2af51d3c5ab2c34e67afa48c47574ec1efcd10e21cdee5bdba8cae34a8b5d5d05c1b536fc07c0fde0c20031b81ce30e1dfa1e2aeeb93850acc58ad7a3eeca39c14f21d7953dbac7b27e8df9a26bf644d96deafdae29b5cde285f0596def3342f9998fb4cd8f77701e6d1cc9e5cb0a60f6d0d41a528b6632d92eec82aef158f69b7538e3242e04174b9e6d681919eb9c281e2f682db2b6d62db155d2c7bb1f86ca81451b5e00e441c6ee7e5851ed4c177d417e7dcefd5d5375b8543b2778992490f6efe8d1955d562dd73d12f8b5a167766514ae6935ee5b98bb1da1d3f872ccd7b8b88f0e20dcb9e79038e67b01d71f5eb7f66cd8d565056c1ac754d218258fdeb7d0bc0cb09e523c7438e4398e6bedecdbb1a9edb345abb5651f8752dc3adf4520e31f0ff15e3f5bb03cb8e574647d72a55f7c2883a297abef2f3f710e8a6cc99abf23b7e58f97abf50d0eea1570aa8ab0b5284128071ce1551068111100444401111004444011110044440111100444401111004444011110044440111100444401111004444011110044440111100444401111004444010a214050a21440542204401111005e5e092319eabd2203c1078705a36b2d92e85d5931a9bad898caa3cea299e6191dea5bcfe6b7c45bd764eb7ac5e8cd2cae1647966b5443349ecddb39865df95b78aa6e7fc396b303ff002b415be696d9f68fd2ee6bec7a7a8a96568c098337a4ff0073b256d48bad9977d8b49cdb5ef395789457bc2097c0f0d040e479775e87a61551473ba5a044443211110044440111100444401111004444011110044440111100444401111004444011110044440111100444401111004444011110044440111100444401111004288484050a273e2110143c95327ba220193dd327ba220193dd327ba220193dd327ba220193dd327ba220193dd327ba220193dd327ba220193dd327ba220193dd327ba220193dd327ba220193dd327ba220193dd327ba220193dd327ba220193dd327ba220193dd327ba220193dd327ba220193dd327ba220193dd327ba220193dd327ba220193dd327ba220193dd327ba220193dd327ba220193dd327ba220193dd327ba220193dd327ba220193dd327ba220193dd327ba220193dd327ba220193dd327ba220193dd327ba220193dd799490dc8273c7f8144407d511101fffd9, '2012-03-13 03:57:19');

-- --------------------------------------------------------

--
-- Table structure for table `prescriptions`
--

CREATE TABLE IF NOT EXISTS `prescriptions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `drug_name` varchar(255) DEFAULT NULL,
  `dosage` varchar(100) DEFAULT NULL,
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
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  `userlevel` int(1) NOT NULL,
  `fname` varchar(20) DEFAULT NULL,
  `mname` varchar(20) DEFAULT NULL,
  `lname` varchar(20) NOT NULL,
  `facility_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_ibfk_2` (`userlevel`),
  KEY `users_ibfk_1` (`facility_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `userlevel`, `fname`, `mname`, `lname`, `facility_id`) VALUES
(1, 'admin', '1a1dc91c907325c69271ddf0c944bc72', 0, NULL, NULL, 'Administrator', 1),
(2, 'ricky', '7694f4a66316e53c8cdd9d9954bd611d', 1, NULL, NULL, 'Orndorff', 1);

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
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`facility_id`) REFERENCES `facility` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`userlevel`) REFERENCES `level` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
