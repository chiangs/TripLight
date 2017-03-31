-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema TripLight
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `username` VARCHAR(45) NULL,
  `currlocation_id` VARCHAR(45) NULL,
  `review_id` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `post`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `post` ;

CREATE TABLE IF NOT EXISTS `post` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `place_id` INT NULL,
  `review` VARCHAR(140) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `country` ;

CREATE TABLE IF NOT EXISTS `country` (
  `country_code` VARCHAR(2) NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`country_code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `place`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `place` ;

CREATE TABLE IF NOT EXISTS `place` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `user_id` VARCHAR(45) NULL,
  `country_code` VARCHAR(45) NULL,
  `url` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `city`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `city` ;

CREATE TABLE IF NOT EXISTS `city` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `country_code` VARCHAR(2) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `country`
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO `country` (`country_code`, `name`) VALUES ('AD', 'Andorra');
INSERT INTO `country` (`country_code`, `name`) VALUES ('AE', 'United Arab Emirates');
INSERT INTO `country` (`country_code`, `name`) VALUES ('AF', 'Afghanistan');
INSERT INTO `country` (`country_code`, `name`) VALUES ('AG', 'Antigua and Barbuda');
INSERT INTO `country` (`country_code`, `name`) VALUES ('AI', 'Anguilla');
INSERT INTO `country` (`country_code`, `name`) VALUES ('AL', 'Albania');
INSERT INTO `country` (`country_code`, `name`) VALUES ('AM', 'Armenia');
INSERT INTO `country` (`country_code`, `name`) VALUES ('AO', 'Angola');
INSERT INTO `country` (`country_code`, `name`) VALUES ('AQ', 'Antarctica');
INSERT INTO `country` (`country_code`, `name`) VALUES ('AR', 'Argentina');
INSERT INTO `country` (`country_code`, `name`) VALUES ('AS', 'American Samoa');
INSERT INTO `country` (`country_code`, `name`) VALUES ('AT', 'Austria');
INSERT INTO `country` (`country_code`, `name`) VALUES ('AU', 'Australia');
INSERT INTO `country` (`country_code`, `name`) VALUES ('AW', 'Aruba');
INSERT INTO `country` (`country_code`, `name`) VALUES ('AX', '�land Islands');
INSERT INTO `country` (`country_code`, `name`) VALUES ('AZ', 'Azerbaijan');
INSERT INTO `country` (`country_code`, `name`) VALUES ('BA', 'Bosnia and Herzegovina');
INSERT INTO `country` (`country_code`, `name`) VALUES ('BB', 'Barbados');
INSERT INTO `country` (`country_code`, `name`) VALUES ('BD', 'Bangladesh');
INSERT INTO `country` (`country_code`, `name`) VALUES ('BE', 'Belgium');
INSERT INTO `country` (`country_code`, `name`) VALUES ('BF', 'Burkina Faso');
INSERT INTO `country` (`country_code`, `name`) VALUES ('BG', 'Bulgaria');
INSERT INTO `country` (`country_code`, `name`) VALUES ('BH', 'Bahrain');
INSERT INTO `country` (`country_code`, `name`) VALUES ('BI', 'Burundi');
INSERT INTO `country` (`country_code`, `name`) VALUES ('BJ', 'Benin');
INSERT INTO `country` (`country_code`, `name`) VALUES ('BL', 'Saint Barth�lemy');
INSERT INTO `country` (`country_code`, `name`) VALUES ('BM', 'Bermuda');
INSERT INTO `country` (`country_code`, `name`) VALUES ('BN', 'Brunei Darussalam');
INSERT INTO `country` (`country_code`, `name`) VALUES ('BO', 'Bolivia');
INSERT INTO `country` (`country_code`, `name`) VALUES ('BQ', 'Caribbean Netherlands ');
INSERT INTO `country` (`country_code`, `name`) VALUES ('BR', 'Brazil');
INSERT INTO `country` (`country_code`, `name`) VALUES ('BS', 'Bahamas');
INSERT INTO `country` (`country_code`, `name`) VALUES ('BT', 'Bhutan');
INSERT INTO `country` (`country_code`, `name`) VALUES ('BV', 'Bouvet Island');
INSERT INTO `country` (`country_code`, `name`) VALUES ('BW', 'Botswana');
INSERT INTO `country` (`country_code`, `name`) VALUES ('BY', 'Belarus');
INSERT INTO `country` (`country_code`, `name`) VALUES ('BZ', 'Belize');
INSERT INTO `country` (`country_code`, `name`) VALUES ('CA', 'Canada');
INSERT INTO `country` (`country_code`, `name`) VALUES ('CC', 'Cocos (Keeling) Islands');
INSERT INTO `country` (`country_code`, `name`) VALUES ('CD', 'Congo, Democratic Republic of');
INSERT INTO `country` (`country_code`, `name`) VALUES ('CF', 'Central African Republic');
INSERT INTO `country` (`country_code`, `name`) VALUES ('CG', 'Congo');
INSERT INTO `country` (`country_code`, `name`) VALUES ('CH', 'Switzerland');
INSERT INTO `country` (`country_code`, `name`) VALUES ('CI', 'C�te d\'Ivoire');
INSERT INTO `country` (`country_code`, `name`) VALUES ('CK', 'Cook Islands');
INSERT INTO `country` (`country_code`, `name`) VALUES ('CL', 'Chile');
INSERT INTO `country` (`country_code`, `name`) VALUES ('CM', 'Cameroon');
INSERT INTO `country` (`country_code`, `name`) VALUES ('CN', 'China');
INSERT INTO `country` (`country_code`, `name`) VALUES ('CO', 'Colombia');
INSERT INTO `country` (`country_code`, `name`) VALUES ('CR', 'Costa Rica');
INSERT INTO `country` (`country_code`, `name`) VALUES ('CU', 'Cuba');
INSERT INTO `country` (`country_code`, `name`) VALUES ('CV', 'Cape Verde');
INSERT INTO `country` (`country_code`, `name`) VALUES ('CW', 'Cura�ao');
INSERT INTO `country` (`country_code`, `name`) VALUES ('CX', 'Christmas Island');
INSERT INTO `country` (`country_code`, `name`) VALUES ('CY', 'Cyprus');
INSERT INTO `country` (`country_code`, `name`) VALUES ('CZ', 'Czech Republic');
INSERT INTO `country` (`country_code`, `name`) VALUES ('DE', 'Germany');
INSERT INTO `country` (`country_code`, `name`) VALUES ('DJ', 'Djibouti');
INSERT INTO `country` (`country_code`, `name`) VALUES ('DK', 'Denmark');
INSERT INTO `country` (`country_code`, `name`) VALUES ('DM', 'Dominica');
INSERT INTO `country` (`country_code`, `name`) VALUES ('DO', 'Dominican Republic');
INSERT INTO `country` (`country_code`, `name`) VALUES ('DZ', 'Algeria');
INSERT INTO `country` (`country_code`, `name`) VALUES ('EC', 'Ecuador');
INSERT INTO `country` (`country_code`, `name`) VALUES ('EE', 'Estonia');
INSERT INTO `country` (`country_code`, `name`) VALUES ('EG', 'Egypt');
INSERT INTO `country` (`country_code`, `name`) VALUES ('EH', 'Western Sahara');
INSERT INTO `country` (`country_code`, `name`) VALUES ('ER', 'Eritrea');
INSERT INTO `country` (`country_code`, `name`) VALUES ('ES', 'Spain');
INSERT INTO `country` (`country_code`, `name`) VALUES ('ET', 'Ethiopia');
INSERT INTO `country` (`country_code`, `name`) VALUES ('FI', 'Finland');
INSERT INTO `country` (`country_code`, `name`) VALUES ('FJ', 'Fiji');
INSERT INTO `country` (`country_code`, `name`) VALUES ('FK', 'Falkland Islands');
INSERT INTO `country` (`country_code`, `name`) VALUES ('FM', 'Micronesia, Federated States of');
INSERT INTO `country` (`country_code`, `name`) VALUES ('FO', 'Faroe Islands');
INSERT INTO `country` (`country_code`, `name`) VALUES ('FR', 'France');
INSERT INTO `country` (`country_code`, `name`) VALUES ('GA', 'Gabon');
INSERT INTO `country` (`country_code`, `name`) VALUES ('GB', 'United Kingdom');
INSERT INTO `country` (`country_code`, `name`) VALUES ('GD', 'Grenada');
INSERT INTO `country` (`country_code`, `name`) VALUES ('GE', 'Georgia');
INSERT INTO `country` (`country_code`, `name`) VALUES ('GF', 'French Guiana');
INSERT INTO `country` (`country_code`, `name`) VALUES ('GG', 'Guernsey');
INSERT INTO `country` (`country_code`, `name`) VALUES ('GH', 'Ghana');
INSERT INTO `country` (`country_code`, `name`) VALUES ('GI', 'Gibraltar');
INSERT INTO `country` (`country_code`, `name`) VALUES ('GL', 'Greenland');
INSERT INTO `country` (`country_code`, `name`) VALUES ('GM', 'Gambia');
INSERT INTO `country` (`country_code`, `name`) VALUES ('GN', 'Guinea');
INSERT INTO `country` (`country_code`, `name`) VALUES ('GP', 'Guadeloupe');
INSERT INTO `country` (`country_code`, `name`) VALUES ('GQ', 'Equatorial Guinea');
INSERT INTO `country` (`country_code`, `name`) VALUES ('GR', 'Greece');
INSERT INTO `country` (`country_code`, `name`) VALUES ('GS', 'South Georgia and the South Sandwich Islands');
INSERT INTO `country` (`country_code`, `name`) VALUES ('GT', 'Guatemala');
INSERT INTO `country` (`country_code`, `name`) VALUES ('GU', 'Guam');
INSERT INTO `country` (`country_code`, `name`) VALUES ('GW', 'Guinea-Bissau');
INSERT INTO `country` (`country_code`, `name`) VALUES ('GY', 'Guyana');
INSERT INTO `country` (`country_code`, `name`) VALUES ('HK', 'Hong Kong');
INSERT INTO `country` (`country_code`, `name`) VALUES ('HM', 'Heard and McDonald Islands');
INSERT INTO `country` (`country_code`, `name`) VALUES ('HN', 'Honduras');
INSERT INTO `country` (`country_code`, `name`) VALUES ('HR', 'Croatia');
INSERT INTO `country` (`country_code`, `name`) VALUES ('HT', 'Haiti');
INSERT INTO `country` (`country_code`, `name`) VALUES ('HU', 'Hungary');
INSERT INTO `country` (`country_code`, `name`) VALUES ('ID', 'Indonesia');
INSERT INTO `country` (`country_code`, `name`) VALUES ('IE', 'Ireland');
INSERT INTO `country` (`country_code`, `name`) VALUES ('IL', 'Israel');
INSERT INTO `country` (`country_code`, `name`) VALUES ('IM', 'Isle of Man');
INSERT INTO `country` (`country_code`, `name`) VALUES ('IN', 'India');
INSERT INTO `country` (`country_code`, `name`) VALUES ('IO', 'British Indian Ocean Territory');
INSERT INTO `country` (`country_code`, `name`) VALUES ('IQ', 'Iraq');
INSERT INTO `country` (`country_code`, `name`) VALUES ('IR', 'Iran');
INSERT INTO `country` (`country_code`, `name`) VALUES ('IS', 'Iceland');
INSERT INTO `country` (`country_code`, `name`) VALUES ('IT', 'Italy');
INSERT INTO `country` (`country_code`, `name`) VALUES ('JE', 'Jersey');
INSERT INTO `country` (`country_code`, `name`) VALUES ('JM', 'Jamaica');
INSERT INTO `country` (`country_code`, `name`) VALUES ('JO', 'Jordan');
INSERT INTO `country` (`country_code`, `name`) VALUES ('JP', 'Japan');
INSERT INTO `country` (`country_code`, `name`) VALUES ('KE', 'Kenya');
INSERT INTO `country` (`country_code`, `name`) VALUES ('KG', 'Kyrgyzstan');
INSERT INTO `country` (`country_code`, `name`) VALUES ('KH', 'Cambodia');
INSERT INTO `country` (`country_code`, `name`) VALUES ('KI', 'Kiribati');
INSERT INTO `country` (`country_code`, `name`) VALUES ('KM', 'Comoros');
INSERT INTO `country` (`country_code`, `name`) VALUES ('KN', 'Saint Kitts and Nevis');
INSERT INTO `country` (`country_code`, `name`) VALUES ('KP', 'North Korea');
INSERT INTO `country` (`country_code`, `name`) VALUES ('KR', 'South Korea');
INSERT INTO `country` (`country_code`, `name`) VALUES ('KW', 'Kuwait');
INSERT INTO `country` (`country_code`, `name`) VALUES ('KY', 'Cayman Islands');
INSERT INTO `country` (`country_code`, `name`) VALUES ('KZ', 'Kazakhstan');
INSERT INTO `country` (`country_code`, `name`) VALUES ('LA', 'Lao People\'s Democratic Republic');
INSERT INTO `country` (`country_code`, `name`) VALUES ('LB', 'Lebanon');
INSERT INTO `country` (`country_code`, `name`) VALUES ('LC', 'Saint Lucia');
INSERT INTO `country` (`country_code`, `name`) VALUES ('LI', 'Liechtenstein');
INSERT INTO `country` (`country_code`, `name`) VALUES ('LK', 'Sri Lanka');
INSERT INTO `country` (`country_code`, `name`) VALUES ('LR', 'Liberia');
INSERT INTO `country` (`country_code`, `name`) VALUES ('LS', 'Lesotho');
INSERT INTO `country` (`country_code`, `name`) VALUES ('LT', 'Lithuania');
INSERT INTO `country` (`country_code`, `name`) VALUES ('LU', 'Luxembourg');
INSERT INTO `country` (`country_code`, `name`) VALUES ('LV', 'Latvia');
INSERT INTO `country` (`country_code`, `name`) VALUES ('LY', 'Libya');
INSERT INTO `country` (`country_code`, `name`) VALUES ('MA', 'Morocco');
INSERT INTO `country` (`country_code`, `name`) VALUES ('MC', 'Monaco');
INSERT INTO `country` (`country_code`, `name`) VALUES ('MD', 'Moldova');
INSERT INTO `country` (`country_code`, `name`) VALUES ('ME', 'Montenegro');
INSERT INTO `country` (`country_code`, `name`) VALUES ('MF', 'Saint-Martin (France)');
INSERT INTO `country` (`country_code`, `name`) VALUES ('MG', 'Madagascar');
INSERT INTO `country` (`country_code`, `name`) VALUES ('MH', 'Marshall Islands');
INSERT INTO `country` (`country_code`, `name`) VALUES ('MK', 'Macedonia');
INSERT INTO `country` (`country_code`, `name`) VALUES ('ML', 'Mali');
INSERT INTO `country` (`country_code`, `name`) VALUES ('MM', 'Myanmar');
INSERT INTO `country` (`country_code`, `name`) VALUES ('MN', 'Mongolia');
INSERT INTO `country` (`country_code`, `name`) VALUES ('MO', 'Macau');
INSERT INTO `country` (`country_code`, `name`) VALUES ('MP', 'Northern Mariana Islands');
INSERT INTO `country` (`country_code`, `name`) VALUES ('MQ', 'Martinique');
INSERT INTO `country` (`country_code`, `name`) VALUES ('MR', 'Mauritania');
INSERT INTO `country` (`country_code`, `name`) VALUES ('MS', 'Montserrat');
INSERT INTO `country` (`country_code`, `name`) VALUES ('MT', 'Malta');
INSERT INTO `country` (`country_code`, `name`) VALUES ('MU', 'Mauritius');
INSERT INTO `country` (`country_code`, `name`) VALUES ('MV', 'Maldives');
INSERT INTO `country` (`country_code`, `name`) VALUES ('MW', 'Malawi');
INSERT INTO `country` (`country_code`, `name`) VALUES ('MX', 'Mexico');
INSERT INTO `country` (`country_code`, `name`) VALUES ('MY', 'Malaysia');
INSERT INTO `country` (`country_code`, `name`) VALUES ('MZ', 'Mozambique');
INSERT INTO `country` (`country_code`, `name`) VALUES ('NA', 'Namibia');
INSERT INTO `country` (`country_code`, `name`) VALUES ('NC', 'New Caledonia');
INSERT INTO `country` (`country_code`, `name`) VALUES ('NE', 'Niger');
INSERT INTO `country` (`country_code`, `name`) VALUES ('NF', 'Norfolk Island');
INSERT INTO `country` (`country_code`, `name`) VALUES ('NG', 'Nigeria');
INSERT INTO `country` (`country_code`, `name`) VALUES ('NI', 'Nicaragua');
INSERT INTO `country` (`country_code`, `name`) VALUES ('NL', 'The Netherlands');
INSERT INTO `country` (`country_code`, `name`) VALUES ('NO', 'Norway');
INSERT INTO `country` (`country_code`, `name`) VALUES ('NP', 'Nepal');
INSERT INTO `country` (`country_code`, `name`) VALUES ('NR', 'Nauru');
INSERT INTO `country` (`country_code`, `name`) VALUES ('NU', 'Niue');
INSERT INTO `country` (`country_code`, `name`) VALUES ('NZ', 'New Zealand');
INSERT INTO `country` (`country_code`, `name`) VALUES ('OM', 'Oman');
INSERT INTO `country` (`country_code`, `name`) VALUES ('PA', 'Panama');
INSERT INTO `country` (`country_code`, `name`) VALUES ('PE', 'Peru');
INSERT INTO `country` (`country_code`, `name`) VALUES ('PF', 'French Polynesia');
INSERT INTO `country` (`country_code`, `name`) VALUES ('PG', 'Papua New Guinea');
INSERT INTO `country` (`country_code`, `name`) VALUES ('PH', 'Philippines');
INSERT INTO `country` (`country_code`, `name`) VALUES ('PK', 'Pakistan');
INSERT INTO `country` (`country_code`, `name`) VALUES ('PL', 'Poland');
INSERT INTO `country` (`country_code`, `name`) VALUES ('PM', 'St. Pierre and Miquelon');
INSERT INTO `country` (`country_code`, `name`) VALUES ('PN', 'Pitcairn');
INSERT INTO `country` (`country_code`, `name`) VALUES ('PR', 'Puerto Rico');
INSERT INTO `country` (`country_code`, `name`) VALUES ('PS', 'Palestine, State of');
INSERT INTO `country` (`country_code`, `name`) VALUES ('PT', 'Portugal');
INSERT INTO `country` (`country_code`, `name`) VALUES ('PW', 'Palau');
INSERT INTO `country` (`country_code`, `name`) VALUES ('PY', 'Paraguay');
INSERT INTO `country` (`country_code`, `name`) VALUES ('QA', 'Qatar');
INSERT INTO `country` (`country_code`, `name`) VALUES ('RE', 'R�union');
INSERT INTO `country` (`country_code`, `name`) VALUES ('RO', 'Romania');
INSERT INTO `country` (`country_code`, `name`) VALUES ('RS', 'Serbia');
INSERT INTO `country` (`country_code`, `name`) VALUES ('RU', 'Russian Federation');
INSERT INTO `country` (`country_code`, `name`) VALUES ('RW', 'Rwanda');
INSERT INTO `country` (`country_code`, `name`) VALUES ('SA', 'Saudi Arabia');
INSERT INTO `country` (`country_code`, `name`) VALUES ('SB', 'Solomon Islands');
INSERT INTO `country` (`country_code`, `name`) VALUES ('SC', 'Seychelles');
INSERT INTO `country` (`country_code`, `name`) VALUES ('SD', 'Sudan');
INSERT INTO `country` (`country_code`, `name`) VALUES ('SE', 'Sweden');
INSERT INTO `country` (`country_code`, `name`) VALUES ('SG', 'Singapore');
INSERT INTO `country` (`country_code`, `name`) VALUES ('SH', 'Saint Helena');
INSERT INTO `country` (`country_code`, `name`) VALUES ('SI', 'Slovenia');
INSERT INTO `country` (`country_code`, `name`) VALUES ('SJ', 'Svalbard and Jan Mayen Islands');
INSERT INTO `country` (`country_code`, `name`) VALUES ('SK', 'Slovakia');
INSERT INTO `country` (`country_code`, `name`) VALUES ('SL', 'Sierra Leone');
INSERT INTO `country` (`country_code`, `name`) VALUES ('SM', 'San Marino');
INSERT INTO `country` (`country_code`, `name`) VALUES ('SN', 'Senegal');
INSERT INTO `country` (`country_code`, `name`) VALUES ('SO', 'Somalia');
INSERT INTO `country` (`country_code`, `name`) VALUES ('SR', 'Suriname');
INSERT INTO `country` (`country_code`, `name`) VALUES ('SS', 'South Sudan');
INSERT INTO `country` (`country_code`, `name`) VALUES ('ST', 'Sao Tome and Principe');
INSERT INTO `country` (`country_code`, `name`) VALUES ('SV', 'El Salvador');
INSERT INTO `country` (`country_code`, `name`) VALUES ('SX', 'Sint Maarten (Dutch part)');
INSERT INTO `country` (`country_code`, `name`) VALUES ('SY', 'Syria');
INSERT INTO `country` (`country_code`, `name`) VALUES ('SZ', 'Swaziland');
INSERT INTO `country` (`country_code`, `name`) VALUES ('TC', 'Turks and Caicos Islands');
INSERT INTO `country` (`country_code`, `name`) VALUES ('TD', 'Chad');
INSERT INTO `country` (`country_code`, `name`) VALUES ('TF', 'French Southern Territories');
INSERT INTO `country` (`country_code`, `name`) VALUES ('TG', 'Togo');
INSERT INTO `country` (`country_code`, `name`) VALUES ('TH', 'Thailand');
INSERT INTO `country` (`country_code`, `name`) VALUES ('TJ', 'Tajikistan');
INSERT INTO `country` (`country_code`, `name`) VALUES ('TK', 'Tokelau');
INSERT INTO `country` (`country_code`, `name`) VALUES ('TL', 'Timor-Leste');
INSERT INTO `country` (`country_code`, `name`) VALUES ('TM', 'Turkmenistan');
INSERT INTO `country` (`country_code`, `name`) VALUES ('TN', 'Tunisia');
INSERT INTO `country` (`country_code`, `name`) VALUES ('TO', 'Tonga');
INSERT INTO `country` (`country_code`, `name`) VALUES ('TR', 'Turkey');
INSERT INTO `country` (`country_code`, `name`) VALUES ('TT', 'Trinidad and Tobago');
INSERT INTO `country` (`country_code`, `name`) VALUES ('TV', 'Tuvalu');
INSERT INTO `country` (`country_code`, `name`) VALUES ('TW', 'Taiwan');
INSERT INTO `country` (`country_code`, `name`) VALUES ('TZ', 'Tanzania');
INSERT INTO `country` (`country_code`, `name`) VALUES ('UA', 'Ukraine');
INSERT INTO `country` (`country_code`, `name`) VALUES ('UG', 'Uganda');
INSERT INTO `country` (`country_code`, `name`) VALUES ('UM', 'United States Minor Outlying Islands');
INSERT INTO `country` (`country_code`, `name`) VALUES ('US', 'United States');
INSERT INTO `country` (`country_code`, `name`) VALUES ('UY', 'Uruguay');
INSERT INTO `country` (`country_code`, `name`) VALUES ('UZ', 'Uzbekistan');
INSERT INTO `country` (`country_code`, `name`) VALUES ('VA', 'Vatican');
INSERT INTO `country` (`country_code`, `name`) VALUES ('VC', 'Saint Vincent and the Grenadines');
INSERT INTO `country` (`country_code`, `name`) VALUES ('VE', 'Venezuela');
INSERT INTO `country` (`country_code`, `name`) VALUES ('VG', 'Virgin Islands (British)');
INSERT INTO `country` (`country_code`, `name`) VALUES ('VI', 'Virgin Islands (U.S.)');
INSERT INTO `country` (`country_code`, `name`) VALUES ('VN', 'Vietnam');
INSERT INTO `country` (`country_code`, `name`) VALUES ('VU', 'Vanuatu');
INSERT INTO `country` (`country_code`, `name`) VALUES ('WF', 'Wallis and Futuna Islands');
INSERT INTO `country` (`country_code`, `name`) VALUES ('WS', 'Samoa');
INSERT INTO `country` (`country_code`, `name`) VALUES ('YE', 'Yemen');
INSERT INTO `country` (`country_code`, `name`) VALUES ('YT', 'Mayotte');
INSERT INTO `country` (`country_code`, `name`) VALUES ('ZA', 'South Africa');
INSERT INTO `country` (`country_code`, `name`) VALUES ('ZM', 'Zambia');
INSERT INTO `country` (`country_code`, `name`) VALUES ('ZW', 'Zimbabwe');

COMMIT;

