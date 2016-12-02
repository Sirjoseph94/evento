SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- --------------------------------------------------------

--
-- `categories` table
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(250) NOT NULL,
  `slug` varchar(300) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- `cities` table
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL auto_increment,
  `country_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `country_id` (`country_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- `comments` table
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `event_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `event_id` (`event_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- `countries` table
--

CREATE TABLE `countries` (
  `id` int(4) unsigned NOT NULL auto_increment,
  `name` varchar(80) NOT NULL,
  `slug` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- `events` table
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `category_id` int(11) default NULL,
  `venue_id` int(11) NOT NULL,
  `repeat_parent` int(11) DEFAULT NULL,
  `name` varchar(255) default NULL,
  `slug` varchar(255) NOT NULL,
  `logo` varchar(200) default NULL,
  `start_date` datetime default NULL,
  `end_date` datetime default NULL,
  `notes` text,
  `web` varchar(250) default NULL,
  `published` tinyint(1) NOT NULL default '1',
  `promoted` tinyint(1) NOT NULL default '0',
  `promoted_in_category` tinyint(1) NOT NULL default '0',
  `status` varchar(10) NOT NULL DEFAULT 'CONFIRMED',  
  `created` datetime default NULL,
  `modified` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `user_id` (`user_id`),
  KEY `category_id` (`category_id`),
  KEY `start_date` (`start_date`),
  KEY `venue_id` (`venue_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- `events_tags` table
--

CREATE TABLE `events_tags` (
  `id` int(11) NOT NULL auto_increment,
  `event_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `event_id` (`event_id`),
  KEY `tag_id` (`tag_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- `events_users` table
--

CREATE TABLE `events_users` (
  `id` int(11) NOT NULL auto_increment,
  `event_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `event_id` (`event_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- `photos` table
--

CREATE TABLE `photos` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `file` varchar(200) NOT NULL,
  `created` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `user_id` (`user_id`),
  KEY `event_id` (`event_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- `settings` table
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL auto_increment,
  `key` varchar(100) NOT NULL,
  `value` varchar(1000) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- `tags` table
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `created` datetime default NULL,
  `modified` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- `users` table
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `city_id` int(11) default NULL,
  `group_id` int(11) default NULL,
  `facebook_id` int(11) default NULL,
  `username` char(50) default NULL,
  `password` char(50) default NULL,
  `email` varchar(100) NOT NULL,
  `alter_email` varchar(100) default NULL,
  `slug` varchar(50) NOT NULL,
  `web` varchar(250) default NULL,
  `photo` varchar(60) default 'user_photo.jpg',
  `notification` tinyint(1) NOT NULL default '1',
  `validation_code` varchar(40) default NULL,
  `validation_date` datetime default NULL,
  `active` tinyint(1) NOT NULL default '1',
  `created` datetime default NULL,
  `modified` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `city_id` (`city_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- `venues` table
--

CREATE TABLE `venues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `slug` varchar(300) NOT NULL,
  `address` varchar(250) NOT NULL,
  `lat` float NOT NULL,
  `lng` float NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY `id` (`id`),
  KEY `city_id` (`city_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Insert default categories
--

INSERT INTO `categories` VALUES(1, 'Music', 'music');
INSERT INTO `categories` VALUES(2, 'Performing/Visual Arts', 'performing-visual-arts');
INSERT INTO `categories` VALUES(3, 'Media', 'media');
INSERT INTO `categories` VALUES(4, 'Social', 'social');
INSERT INTO `categories` VALUES(5, 'Education', 'education');
INSERT INTO `categories` VALUES(6, 'Commercial', 'commercial');
INSERT INTO `categories` VALUES(7, 'Festivals', 'festivals');
INSERT INTO `categories` VALUES(8, 'Sports', 'sports');
INSERT INTO `categories` VALUES(9, 'Other', 'other');
INSERT INTO `categories` VALUES(10, 'Comedy', 'comedy');
INSERT INTO `categories` VALUES(11, 'Politics', 'politics');
INSERT INTO `categories` VALUES(12, 'Family', 'family');

--
-- Insert default settings
--

INSERT INTO `settings` VALUES(1, 'googleMapKey', '');
INSERT INTO `settings` VALUES(2, 'appName', 'Evento');
INSERT INTO `settings` VALUES(3, 'appSlogan', 'your upcoming events');
INSERT INTO `settings` VALUES(4, 'adminEmail', 'admin@example.com');
INSERT INTO `settings` VALUES(5, 'systemEmail', 'system@example.com');
INSERT INTO `settings` VALUES(7, 'language', 'eng');
INSERT INTO `settings` VALUES(8, 'weekStart', 'monday');
INSERT INTO `settings` VALUES(9, 'htmlTop', '');
INSERT INTO `settings` VALUES(10, 'htmlBottom', '');
INSERT INTO `settings` VALUES(11, 'guestsCanAddEvents', '1');
INSERT INTO `settings` VALUES(12, 'validateEmails', '0');
INSERT INTO `settings` VALUES(13, 'moderateEvents', '0');
INSERT INTO `settings` VALUES(14, 'timeZone', '');
INSERT INTO `settings` VALUES(15, 'country_id', '');
INSERT INTO `settings` VALUES(16, 'city_name', '');
INSERT INTO `settings` VALUES(17, 'adminAddsUsers', '0');
INSERT INTO `settings` VALUES(18, 'timeFormat', '12');
INSERT INTO `settings` VALUES(19, 'adminVenues', '0');
INSERT INTO `settings` VALUES(20, 'dateFormat', 'd/m/Y');
INSERT INTO `settings` VALUES(21, 'recaptchaPublicKey', '');
INSERT INTO `settings` VALUES(22, 'recaptchaPrivateKey', '');
INSERT INTO `settings` values(23,'disableComments', '0');
INSERT INTO `settings` values(24,'disablePhotos', '0');
INSERT INTO `settings` values(25,'disableAttendees', '0');
INSERT INTO `settings` values(26,'theme', 'Evento');
INSERT INTO `settings` values(27,'facebookAppId', '');
INSERT INTO `settings` values(28,'facebookSecret', '');
INSERT INTO `settings` values(29,'paypalAPIUsername', '');
INSERT INTO `settings` values(30,'paypalAPIPassword', '');
INSERT INTO `settings` values(31,'paypalAPISignature', '');
INSERT INTO `settings` values(32,'paypalCurrency', '');
INSERT INTO `settings` values(33,'paypalAddEventPrice', '');
INSERT INTO `settings` values(34,'paypalAPISandbox', '');
INSERT INTO `settings` values(35,'twitterAccount', '');

--
-- Insert countries
--

INSERT INTO `countries` VALUES(1, 'Afghanistan', 'afghanistan');
INSERT INTO `countries` VALUES(2, 'Åland Islands', 'aland-islands');
INSERT INTO `countries` VALUES(3, 'Albania', 'albania');
INSERT INTO `countries` VALUES(4, 'Algeria', 'algeria');
INSERT INTO `countries` VALUES(5, 'American Samoa', 'american-samoa');
INSERT INTO `countries` VALUES(6, 'Andorra', 'andorra');
INSERT INTO `countries` VALUES(7, 'Angola', 'angola');
INSERT INTO `countries` VALUES(8, 'Anguilla', 'anguilla');
INSERT INTO `countries` VALUES(9, 'Antarctica', 'antarctica');
INSERT INTO `countries` VALUES(10, 'Antigua and Barbuda', 'antigua-and-barbuda');
INSERT INTO `countries` VALUES(11, 'Argentina', 'argentina');
INSERT INTO `countries` VALUES(12, 'Armenia', 'armenia');
INSERT INTO `countries` VALUES(13, 'Aruba', 'aruba');
INSERT INTO `countries` VALUES(14, 'Australia', 'australia');
INSERT INTO `countries` VALUES(15, 'Austria', 'austria');
INSERT INTO `countries` VALUES(16, 'Azerbaijan', 'azerbaijan');
INSERT INTO `countries` VALUES(17, 'Bahamas', 'bahamas');
INSERT INTO `countries` VALUES(18, 'Bahrain', 'bahrain');
INSERT INTO `countries` VALUES(19, 'Bangladesh', 'bangladesh');
INSERT INTO `countries` VALUES(20, 'Barbados', 'barbados');
INSERT INTO `countries` VALUES(21, 'Belarus', 'belarus');
INSERT INTO `countries` VALUES(22, 'Belgium', 'belgium');
INSERT INTO `countries` VALUES(23, 'Belize', 'belize');
INSERT INTO `countries` VALUES(24, 'Benin', 'benin');
INSERT INTO `countries` VALUES(25, 'Bermuda', 'bermuda');
INSERT INTO `countries` VALUES(26, 'Bhutan', 'bhutan');
INSERT INTO `countries` VALUES(27, 'Bolivia, Plurinational State of', 'bolivia-plurinational-state-of');
INSERT INTO `countries` VALUES(28, 'Bosnia and Herzegovina', 'bosnia-and-herzegovina');
INSERT INTO `countries` VALUES(29, 'Botswana', 'botswana');
INSERT INTO `countries` VALUES(30, 'Bouvet Island', 'bouvet-island');
INSERT INTO `countries` VALUES(31, 'Brazil', 'brazil');
INSERT INTO `countries` VALUES(32, 'British Indian Ocean Territory', 'british-indian-ocean-territory');
INSERT INTO `countries` VALUES(33, 'Brunei Darussalam', 'brunei-darussalam');
INSERT INTO `countries` VALUES(34, 'Bulgaria', 'bulgaria');
INSERT INTO `countries` VALUES(35, 'Burkina Faso', 'burkina-faso');
INSERT INTO `countries` VALUES(36, 'Burundi', 'burundi');
INSERT INTO `countries` VALUES(37, 'Cambodia', 'cambodia');
INSERT INTO `countries` VALUES(38, 'Cameroon', 'cameroon');
INSERT INTO `countries` VALUES(39, 'Canada', 'canada');
INSERT INTO `countries` VALUES(40, 'Cape Verde', 'cape-verde');
INSERT INTO `countries` VALUES(41, 'Cayman Islands', 'cayman-islands');
INSERT INTO `countries` VALUES(42, 'Central African Republic', 'central-african-republic');
INSERT INTO `countries` VALUES(43, 'Chad', 'chad');
INSERT INTO `countries` VALUES(44, 'Chile', 'chile');
INSERT INTO `countries` VALUES(45, 'China', 'china');
INSERT INTO `countries` VALUES(46, 'Christmas Island', 'christmas-island');
INSERT INTO `countries` VALUES(47, 'Cocos (Keeling) Islands', 'cocos-keeling-islands');
INSERT INTO `countries` VALUES(48, 'Colombia', 'colombia');
INSERT INTO `countries` VALUES(49, 'Comoros', 'comoros');
INSERT INTO `countries` VALUES(50, 'Congo', 'congo');
INSERT INTO `countries` VALUES(51, 'Congo, The Democratic Republic of the', 'congo-the-democratic-republic-of-the');
INSERT INTO `countries` VALUES(52, 'Cook Islands', 'cook-islands');
INSERT INTO `countries` VALUES(53, 'Costa Rica', 'costa-rica');
INSERT INTO `countries` VALUES(54, 'Côte D''Ivoire', 'cote-d-ivoire');
INSERT INTO `countries` VALUES(55, 'Croatia', 'croatia');
INSERT INTO `countries` VALUES(56, 'Cuba', 'cuba');
INSERT INTO `countries` VALUES(57, 'Cyprus', 'cyprus');
INSERT INTO `countries` VALUES(58, 'Czech Republic', 'czech-republic');
INSERT INTO `countries` VALUES(59, 'Denmark', 'denmark');
INSERT INTO `countries` VALUES(60, 'Djibouti', 'djibouti');
INSERT INTO `countries` VALUES(61, 'Dominica', 'dominica');
INSERT INTO `countries` VALUES(62, 'Dominican Republic', 'dominican-republic');
INSERT INTO `countries` VALUES(63, 'Ecuador', 'ecuador');
INSERT INTO `countries` VALUES(64, 'Egypt', 'egypt');
INSERT INTO `countries` VALUES(65, 'El Salvador', 'el-salvador');
INSERT INTO `countries` VALUES(66, 'Equatorial Guinea', 'equatorial-guinea');
INSERT INTO `countries` VALUES(67, 'Eritrea', 'eritrea');
INSERT INTO `countries` VALUES(68, 'Estonia', 'estonia');
INSERT INTO `countries` VALUES(69, 'Ethiopia', 'ethiopia');
INSERT INTO `countries` VALUES(70, 'Falkland Islands (Malvinas)', 'falkland-islands-malvinas');
INSERT INTO `countries` VALUES(71, 'Faroe Islands', 'faroe-islands');
INSERT INTO `countries` VALUES(72, 'Fiji', 'fiji');
INSERT INTO `countries` VALUES(73, 'Finland', 'finland');
INSERT INTO `countries` VALUES(74, 'France', 'france');
INSERT INTO `countries` VALUES(75, 'French Guiana', 'french-guiana');
INSERT INTO `countries` VALUES(76, 'French Polynesia', 'french-polynesia');
INSERT INTO `countries` VALUES(77, 'French Southern Territories', 'french-southern-territories');
INSERT INTO `countries` VALUES(78, 'Gabon', 'gabon');
INSERT INTO `countries` VALUES(79, 'Gambia', 'gambia');
INSERT INTO `countries` VALUES(80, 'Georgia', 'georgia');
INSERT INTO `countries` VALUES(81, 'Germany', 'germany');
INSERT INTO `countries` VALUES(82, 'Ghana', 'ghana');
INSERT INTO `countries` VALUES(83, 'Gibraltar', 'gibraltar');
INSERT INTO `countries` VALUES(84, 'Greece', 'greece');
INSERT INTO `countries` VALUES(85, 'Greenland', 'greenland');
INSERT INTO `countries` VALUES(86, 'Grenada', 'grenada');
INSERT INTO `countries` VALUES(87, 'Guadeloupe', 'guadeloupe');
INSERT INTO `countries` VALUES(88, 'Guam', 'guam');
INSERT INTO `countries` VALUES(89, 'Guatemala', 'guatemala');
INSERT INTO `countries` VALUES(90, 'Guernsey', 'guernsey');
INSERT INTO `countries` VALUES(91, 'Guinea', 'guinea');
INSERT INTO `countries` VALUES(92, 'Guinea-Bissau', 'guinea-bissau');
INSERT INTO `countries` VALUES(93, 'Guyana', 'guyana');
INSERT INTO `countries` VALUES(94, 'Haiti', 'haiti');
INSERT INTO `countries` VALUES(95, 'Heard Island and Mcdonald Islands', 'heard-island-and-mcdonald-islands');
INSERT INTO `countries` VALUES(96, 'Holy See (Vatican City State)', 'holy-see-vatican-city-state');
INSERT INTO `countries` VALUES(97, 'Honduras', 'honduras');
INSERT INTO `countries` VALUES(98, 'Hong Kong', 'hong-kong');
INSERT INTO `countries` VALUES(99, 'Hungary', 'hungary');
INSERT INTO `countries` VALUES(100, 'Iceland', 'iceland');
INSERT INTO `countries` VALUES(101, 'India', 'india');
INSERT INTO `countries` VALUES(102, 'Indonesia', 'indonesia');
INSERT INTO `countries` VALUES(103, 'Iran, Islamic Republic of', 'iran-islamic-republic-of');
INSERT INTO `countries` VALUES(104, 'Iraq', 'iraq');
INSERT INTO `countries` VALUES(105, 'Ireland', 'ireland');
INSERT INTO `countries` VALUES(106, 'Isle of Man', 'isle-of-man');
INSERT INTO `countries` VALUES(107, 'Israel', 'israel');
INSERT INTO `countries` VALUES(108, 'Italy', 'italy');
INSERT INTO `countries` VALUES(109, 'Jamaica', 'jamaica');
INSERT INTO `countries` VALUES(110, 'Japan', 'japan');
INSERT INTO `countries` VALUES(111, 'Jersey', 'jersey');
INSERT INTO `countries` VALUES(112, 'Jordan', 'jordan');
INSERT INTO `countries` VALUES(113, 'Kazakhstan', 'kazakhstan');
INSERT INTO `countries` VALUES(114, 'Kenya', 'kenya');
INSERT INTO `countries` VALUES(115, 'Kiribati', 'kiribati');
INSERT INTO `countries` VALUES(116, 'Korea, Democratic People''s Republic of', 'korea-democratic-people-s-republic-of');
INSERT INTO `countries` VALUES(117, 'Korea, Republic of', 'korea-republic-of');
INSERT INTO `countries` VALUES(118, 'Kuwait', 'kuwait');
INSERT INTO `countries` VALUES(119, 'Kyrgyzstan', 'kyrgyzstan');
INSERT INTO `countries` VALUES(120, 'Lao People''s Democratic Republic', 'lao-people-s-democratic-republic');
INSERT INTO `countries` VALUES(121, 'Latvia', 'latvia');
INSERT INTO `countries` VALUES(122, 'Lebanon', 'lebanon');
INSERT INTO `countries` VALUES(123, 'Lesotho', 'lesotho');
INSERT INTO `countries` VALUES(124, 'Liberia', 'liberia');
INSERT INTO `countries` VALUES(125, 'Libya', 'libya');
INSERT INTO `countries` VALUES(126, 'Liechtenstein', 'liechtenstein');
INSERT INTO `countries` VALUES(127, 'Lithuania', 'lithuania');
INSERT INTO `countries` VALUES(128, 'Luxembourg', 'luxembourg');
INSERT INTO `countries` VALUES(129, 'Macao', 'macao');
INSERT INTO `countries` VALUES(130, 'Macedonia, The Former Yugoslav Republic of', 'macedonia-the-former-yugoslav-republic-of');
INSERT INTO `countries` VALUES(131, 'Madagascar', 'madagascar');
INSERT INTO `countries` VALUES(132, 'Malawi', 'malawi');
INSERT INTO `countries` VALUES(133, 'Malaysia', 'malaysia');
INSERT INTO `countries` VALUES(134, 'Maldives', 'maldives');
INSERT INTO `countries` VALUES(135, 'Mali', 'mali');
INSERT INTO `countries` VALUES(136, 'Malta', 'malta');
INSERT INTO `countries` VALUES(137, 'Marshall Islands', 'marshall-islands');
INSERT INTO `countries` VALUES(138, 'Martinique', 'martinique');
INSERT INTO `countries` VALUES(139, 'Mauritania', 'mauritania');
INSERT INTO `countries` VALUES(140, 'Mauritius', 'mauritius');
INSERT INTO `countries` VALUES(141, 'Mayotte', 'mayotte');
INSERT INTO `countries` VALUES(142, 'Mexico', 'mexico');
INSERT INTO `countries` VALUES(143, 'Micronesia, Federated States of', 'micronesia-federated-states-of');
INSERT INTO `countries` VALUES(144, 'Moldova, Republic of', 'moldova-republic-of');
INSERT INTO `countries` VALUES(145, 'Monaco', 'monaco');
INSERT INTO `countries` VALUES(146, 'Mongolia', 'mongolia');
INSERT INTO `countries` VALUES(147, 'Montenegro', 'montenegro');
INSERT INTO `countries` VALUES(148, 'Montserrat', 'montserrat');
INSERT INTO `countries` VALUES(149, 'Morocco', 'morocco');
INSERT INTO `countries` VALUES(150, 'Mozambique', 'mozambique');
INSERT INTO `countries` VALUES(151, 'Myanmar', 'myanmar');
INSERT INTO `countries` VALUES(152, 'Namibia', 'namibia');
INSERT INTO `countries` VALUES(153, 'Nauru', 'nauru');
INSERT INTO `countries` VALUES(154, 'Nepal', 'nepal');
INSERT INTO `countries` VALUES(155, 'Netherlands', 'netherlands');
INSERT INTO `countries` VALUES(156, 'New Caledonia', 'new-caledonia');
INSERT INTO `countries` VALUES(157, 'New Zealand', 'new-zealand');
INSERT INTO `countries` VALUES(158, 'Nicaragua', 'nicaragua');
INSERT INTO `countries` VALUES(159, 'Niger', 'niger');
INSERT INTO `countries` VALUES(160, 'Nigeria', 'nigeria');
INSERT INTO `countries` VALUES(161, 'Niue', 'niue');
INSERT INTO `countries` VALUES(162, 'Norfolk Island', 'norfolk-island');
INSERT INTO `countries` VALUES(163, 'Northern Mariana Islands', 'northern-mariana-islands');
INSERT INTO `countries` VALUES(164, 'Norway', 'norway');
INSERT INTO `countries` VALUES(165, 'Oman', 'oman');
INSERT INTO `countries` VALUES(166, 'Pakistan', 'pakistan');
INSERT INTO `countries` VALUES(167, 'Palau', 'palau');
INSERT INTO `countries` VALUES(168, 'Palestinian Territory, Occupied', 'palestinian-territory-occupied');
INSERT INTO `countries` VALUES(169, 'Panama', 'panama');
INSERT INTO `countries` VALUES(170, 'Papua New Guinea', 'papua-new-guinea');
INSERT INTO `countries` VALUES(171, 'Paraguay', 'paraguay');
INSERT INTO `countries` VALUES(172, 'Peru', 'peru');
INSERT INTO `countries` VALUES(173, 'Philippines', 'philippines');
INSERT INTO `countries` VALUES(174, 'Pitcairn', 'pitcairn');
INSERT INTO `countries` VALUES(175, 'Poland', 'poland');
INSERT INTO `countries` VALUES(176, 'Portugal', 'portugal');
INSERT INTO `countries` VALUES(177, 'Puerto Rico', 'puerto-rico');
INSERT INTO `countries` VALUES(178, 'Qatar', 'qatar');
INSERT INTO `countries` VALUES(179, 'Réunion', 'reunion');
INSERT INTO `countries` VALUES(180, 'Romania', 'romania');
INSERT INTO `countries` VALUES(181, 'Russian Federation', 'russian-federation');
INSERT INTO `countries` VALUES(182, 'Rwanda', 'rwanda');
INSERT INTO `countries` VALUES(183, 'Saint Barthélemy', 'saint-barthelemy');
INSERT INTO `countries` VALUES(184, 'Saint Helena, Ascension and Tristan da Cunha', 'saint-helena-ascension-and-tristan-da-cunha');
INSERT INTO `countries` VALUES(185, 'Saint Kitts and Nevis', 'saint-kitts-and-nevis');
INSERT INTO `countries` VALUES(186, 'Saint Lucia', 'saint-lucia');
INSERT INTO `countries` VALUES(187, 'Saint Martin (French part)', 'saint-martin-french-part');
INSERT INTO `countries` VALUES(188, 'Saint Pierre and Miquelon', 'saint-pierre-and-miquelon');
INSERT INTO `countries` VALUES(189, 'Saint Vincent and the Grenadines', 'saint-vincent-and-the-grenadines');
INSERT INTO `countries` VALUES(190, 'Samoa', 'samoa');
INSERT INTO `countries` VALUES(191, 'San Marino', 'san-marino');
INSERT INTO `countries` VALUES(192, 'Sao Tome and Principe', 'sao-tome-and-principe');
INSERT INTO `countries` VALUES(193, 'Saudi Arabia', 'saudi-arabia');
INSERT INTO `countries` VALUES(194, 'Senegal', 'senegal');
INSERT INTO `countries` VALUES(195, 'Serbia', 'serbia');
INSERT INTO `countries` VALUES(196, 'Seychelles', 'seychelles');
INSERT INTO `countries` VALUES(197, 'Sierra Leone', 'sierra-leone');
INSERT INTO `countries` VALUES(198, 'Singapore', 'singapore');
INSERT INTO `countries` VALUES(199, 'Sint Maarten (Dutch part)', 'sint-maarten-dutch-part');
INSERT INTO `countries` VALUES(200, 'Slovakia', 'slovakia');
INSERT INTO `countries` VALUES(201, 'Slovenia', 'slovenia');
INSERT INTO `countries` VALUES(202, 'Solomon Islands', 'solomon-islands');
INSERT INTO `countries` VALUES(203, 'Somalia', 'somalia');
INSERT INTO `countries` VALUES(204, 'South Africa', 'south-africa');
INSERT INTO `countries` VALUES(205, 'South Georgia and The South Sandwich Islands', 'south-georgia-and-the-south-sandwich-islands');
INSERT INTO `countries` VALUES(206, 'Spain', 'spain');
INSERT INTO `countries` VALUES(207, 'Sri Lanka', 'sri-lanka');
INSERT INTO `countries` VALUES(208, 'Sudan', 'sudan');
INSERT INTO `countries` VALUES(209, 'Suriname', 'suriname');
INSERT INTO `countries` VALUES(210, 'Svalbard and Jan Mayen', 'svalbard-and-jan-mayen');
INSERT INTO `countries` VALUES(211, 'Swaziland', 'swaziland');
INSERT INTO `countries` VALUES(212, 'Sweden', 'sweden');
INSERT INTO `countries` VALUES(213, 'Switzerland', 'switzerland');
INSERT INTO `countries` VALUES(214, 'Syrian Arab Republic', 'syrian-arab-republic');
INSERT INTO `countries` VALUES(215, 'Taiwan, Province of China', 'taiwan-province-of-china');
INSERT INTO `countries` VALUES(216, 'Tajikistan', 'tajikistan');
INSERT INTO `countries` VALUES(217, 'Tanzania, United Republic of', 'tanzania-united-republic-of');
INSERT INTO `countries` VALUES(218, 'Thailand', 'thailand');
INSERT INTO `countries` VALUES(219, 'Timor-Leste', 'timor-leste');
INSERT INTO `countries` VALUES(220, 'Togo', 'togo');
INSERT INTO `countries` VALUES(221, 'Tokelau', 'tokelau');
INSERT INTO `countries` VALUES(222, 'Tonga', 'tonga');
INSERT INTO `countries` VALUES(223, 'Trinidad and Tobago', 'trinidad-and-tobago');
INSERT INTO `countries` VALUES(224, 'Tunisia', 'tunisia');
INSERT INTO `countries` VALUES(225, 'Turkey', 'turkey');
INSERT INTO `countries` VALUES(226, 'Turkmenistan', 'turkmenistan');
INSERT INTO `countries` VALUES(227, 'Turks and Caicos Islands', 'turks-and-caicos-islands');
INSERT INTO `countries` VALUES(228, 'Tuvalu', 'tuvalu');
INSERT INTO `countries` VALUES(229, 'Uganda', 'uganda');
INSERT INTO `countries` VALUES(230, 'Ukraine', 'ukraine');
INSERT INTO `countries` VALUES(231, 'United Arab Emirates', 'united-arab-emirates');
INSERT INTO `countries` VALUES(232, 'United Kingdom', 'united-kingdom');
INSERT INTO `countries` VALUES(233, 'United States', 'united-states');
INSERT INTO `countries` VALUES(234, 'United States Minor Outlying Islands', 'united-states-minor-outlying-islands');
INSERT INTO `countries` VALUES(235, 'Uruguay', 'uruguay');
INSERT INTO `countries` VALUES(236, 'Uzbekistan', 'uzbekistan');
INSERT INTO `countries` VALUES(237, 'Vanuatu', 'vanuatu');
INSERT INTO `countries` VALUES(238, 'Venezuela, Bolivarian Republic of', 'venezuela-bolivarian-republic-of');
INSERT INTO `countries` VALUES(239, 'Viet Nam', 'viet-nam');
INSERT INTO `countries` VALUES(240, 'Virgin Islands, British', 'virgin-islands-british');
INSERT INTO `countries` VALUES(241, 'Virgin Islands, U.S.', 'virgin-islands-u-s');
INSERT INTO `countries` VALUES(242, 'Wallis and Futuna', 'wallis-and-futuna');
INSERT INTO `countries` VALUES(243, 'Western Sahara', 'western-sahara');
INSERT INTO `countries` VALUES(244, 'Yemen', 'yemen');
INSERT INTO `countries` VALUES(245, 'Zambia', 'zambia');
INSERT INTO `countries` VALUES(246, 'Zimbabwe', 'zimbabwe');
INSERT INTO `countries` VALUES(247, 'Kosovo', 'kosovo');
INSERT INTO `countries` VALUES(248, 'Bonaire, Sint Eustatius and Saba', 'bonaire-sint-eustatius-and-saba');
INSERT INTO `countries` VALUES(249, 'Curaçao', 'curacao');
INSERT INTO `countries` VALUES(250, 'South Sudan', 'south-sudan');

-- --------------------------------------------------------

--
-- `groups` table
--

DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `groups` WRITE;
INSERT INTO `groups` (`id`, `name`, `created`, `modified`)
VALUES
	(1,'Administrators','2016-02-16 17:33:21','2016-02-15 15:00:00'),
	(2,'Event Managers','2016-02-16 17:33:21','2016-02-15 15:00:00'),
	(3,'Guests','2016-02-16 17:33:21','2016-02-15 15:00:00');
UNLOCK TABLES;

-- --------------------------------------------------------

--
-- `acos` table
--

DROP TABLE IF EXISTS `acos`;
CREATE TABLE `acos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) DEFAULT NULL,
  `model` varchar(255) DEFAULT '',
  `foreign_key` int(10) unsigned DEFAULT NULL,
  `alias` varchar(255) DEFAULT '',
  `lft` int(10) DEFAULT NULL,
  `rght` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `acos` WRITE;
INSERT INTO `acos` (`id`, `parent_id`, `model`, `foreign_key`, `alias`, `lft`, `rght`)
VALUES
	(1,NULL,'',NULL,'controllers',1,4),
	(2,1,'',NULL,'Events',2,3),
	(3,NULL,'',NULL,'admin',5,6);
UNLOCK TABLES;

-- --------------------------------------------------------

--
-- `aros` table
--

DROP TABLE IF EXISTS `aros`;
CREATE TABLE `aros` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) DEFAULT NULL,
  `model` varchar(255) DEFAULT '',
  `foreign_key` int(10) unsigned DEFAULT NULL,
  `alias` varchar(255) DEFAULT '',
  `lft` int(10) DEFAULT NULL,
  `rght` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `aros` WRITE;
INSERT INTO `aros` (`id`, `parent_id`, `model`, `foreign_key`, `alias`, `lft`, `rght`)
VALUES
	(1,NULL,'Group',1,'',1,2),
	(2,NULL,'Group',2,'',3,4),
	(3,NULL,'Group',3,'',5,6);
UNLOCK TABLES;

-- --------------------------------------------------------

--
-- `aros_acos` table
--

DROP TABLE IF EXISTS `aros_acos`;
CREATE TABLE `aros_acos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `aro_id` int(10) unsigned NOT NULL,
  `aco_id` int(10) unsigned NOT NULL,
  `_create` char(2) NOT NULL DEFAULT '0',
  `_read` char(2) NOT NULL DEFAULT '0',
  `_update` char(2) NOT NULL DEFAULT '0',
  `_delete` char(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `aros_acos` WRITE;
INSERT INTO `aros_acos` (`id`, `aro_id`, `aco_id`, `_create`, `_read`, `_update`, `_delete`)
VALUES
	(1,1,3,'1','1','1','1'),
	(2,1,2,'1','1','1','1'),
	(3,2,3,'-1','-1','-1','-1'),
	(4,2,2,'1','1','1','1'),
	(5,3,3,'-1','-1','-1','-1'),
	(6,3,2,'1','1','1','1');
UNLOCK TABLES;

-- --------------------------------------------------------

--
-- Create ACL indexes
--

CREATE INDEX idx_acos_lft_rght ON `acos` (`lft`, `rght`);
CREATE INDEX idx_acos_alias ON `acos` (`alias`);
CREATE INDEX idx_aros_lft_rght ON `aros` (`lft`, `rght`);
CREATE INDEX idx_aros_alias ON `aros` (`alias`);
CREATE INDEX idx_aco_id ON `aros_acos` (`aco_id`);

