-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema TripLight
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `TripLight` ;

-- -----------------------------------------------------
-- Schema TripLight
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `TripLight` DEFAULT CHARACTER SET utf8 ;
USE `TripLight` ;

-- -----------------------------------------------------
-- Table `country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `country` ;

CREATE TABLE IF NOT EXISTS `country` (
  `countryCode` VARCHAR(2) NOT NULL DEFAULT 'US',
  `name` VARCHAR(45) NOT NULL DEFAULT 'United States',
  PRIMARY KEY (`countryCode`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  `adminFlag` INT(1) NOT NULL DEFAULT 0,
  `email` VARCHAR(45) NOT NULL,
  `country_countryCode` VARCHAR(2) NOT NULL DEFAULT 'US',
  `photo_url` VARCHAR(140) NOT NULL DEFAULT 'http://res.cloudinary.com/chiangs/image/upload/v1491241630/SD%20projects/travel.png',
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_user_country1`
    FOREIGN KEY (`country_countryCode`)
    REFERENCES `country` (`countryCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_user_country1_idx` ON `user` (`country_countryCode` ASC);


-- -----------------------------------------------------
-- Table `city`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `city` ;

CREATE TABLE IF NOT EXISTS `city` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `country_countryCode` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_city_country1`
    FOREIGN KEY (`country_countryCode`)
    REFERENCES `country` (`countryCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_city_country1_idx` ON `city` (`country_countryCode` ASC);


-- -----------------------------------------------------
-- Table `place`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `place` ;

CREATE TABLE IF NOT EXISTS `place` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `url` VARCHAR(45) NULL,
  `city_id` INT NOT NULL,
  `country_countryCode` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_place_city1`
    FOREIGN KEY (`city_id`)
    REFERENCES `city` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_place_country1`
    FOREIGN KEY (`country_countryCode`)
    REFERENCES `country` (`countryCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_place_city1_idx` ON `place` (`city_id` ASC);

CREATE INDEX `fk_place_country1_idx` ON `place` (`country_countryCode` ASC);


-- -----------------------------------------------------
-- Table `post`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `post` ;

CREATE TABLE IF NOT EXISTS `post` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `review` VARCHAR(250) NOT NULL,
  `user_id` INT NOT NULL,
  `place_id` INT NOT NULL,
  `post_date` DATE NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_post_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_post_place1`
    FOREIGN KEY (`place_id`)
    REFERENCES `place` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_post_user_idx` ON `post` (`user_id` ASC);

CREATE INDEX `fk_post_place1_idx` ON `post` (`place_id` ASC);

SET SQL_MODE = '';
GRANT USAGE ON *.* TO admin@localhost;
 DROP USER admin@localhost;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'solarkisses';

GRANT ALL ON * TO 'admin'@'localhost';
GRANT SELECT, INSERT, TRIGGER ON TABLE * TO 'admin'@'localhost';
GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'admin'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `country`
-- -----------------------------------------------------
START TRANSACTION;
USE `TripLight`;
INSERT INTO `country` (`countryCode`, `name`) VALUES ('AD', 'Andorra');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('AE', 'United Arab Emirates');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('AF', 'Afghanistan');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('AG', 'Antigua and Barbuda');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('AI', 'Anguilla');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('AL', 'Albania');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('AM', 'Armenia');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('AO', 'Angola');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('AQ', 'Antarctica');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('AR', 'Argentina');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('AS', 'American Samoa');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('AT', 'Austria');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('AU', 'Australia');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('AW', 'Aruba');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('AX', '�land Islands');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('AZ', 'Azerbaijan');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('BA', 'Bosnia and Herzegovina');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('BB', 'Barbados');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('BD', 'Bangladesh');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('BE', 'Belgium');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('BF', 'Burkina Faso');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('BG', 'Bulgaria');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('BH', 'Bahrain');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('BI', 'Burundi');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('BJ', 'Benin');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('BL', 'Saint Barth�lemy');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('BM', 'Bermuda');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('BN', 'Brunei Darussalam');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('BO', 'Bolivia');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('BQ', 'Caribbean Netherlands ');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('BR', 'Brazil');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('BS', 'Bahamas');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('BT', 'Bhutan');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('BV', 'Bouvet Island');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('BW', 'Botswana');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('BY', 'Belarus');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('BZ', 'Belize');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('CA', 'Canada');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('CC', 'Cocos (Keeling) Islands');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('CD', 'Congo, Democratic Republic of');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('CF', 'Central African Republic');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('CG', 'Congo');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('CH', 'Switzerland');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('CI', 'C�te d\'Ivoire');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('CK', 'Cook Islands');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('CL', 'Chile');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('CM', 'Cameroon');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('CN', 'China');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('CO', 'Colombia');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('CR', 'Costa Rica');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('CU', 'Cuba');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('CV', 'Cape Verde');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('CW', 'Cura�ao');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('CX', 'Christmas Island');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('CY', 'Cyprus');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('CZ', 'Czech Republic');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('DE', 'Germany');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('DJ', 'Djibouti');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('DK', 'Denmark');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('DM', 'Dominica');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('DO', 'Dominican Republic');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('DZ', 'Algeria');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('EC', 'Ecuador');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('EE', 'Estonia');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('EG', 'Egypt');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('EH', 'Western Sahara');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('ER', 'Eritrea');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('ES', 'Spain');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('ET', 'Ethiopia');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('FI', 'Finland');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('FJ', 'Fiji');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('FK', 'Falkland Islands');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('FM', 'Micronesia, Federated States of');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('FO', 'Faroe Islands');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('FR', 'France');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('GA', 'Gabon');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('GB', 'United Kingdom');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('GD', 'Grenada');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('GE', 'Georgia');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('GF', 'French Guiana');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('GG', 'Guernsey');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('GH', 'Ghana');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('GI', 'Gibraltar');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('GL', 'Greenland');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('GM', 'Gambia');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('GN', 'Guinea');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('GP', 'Guadeloupe');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('GQ', 'Equatorial Guinea');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('GR', 'Greece');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('GS', 'South Georgia and the South Sandwich Islands');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('GT', 'Guatemala');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('GU', 'Guam');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('GW', 'Guinea-Bissau');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('GY', 'Guyana');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('HK', 'Hong Kong');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('HM', 'Heard and McDonald Islands');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('HN', 'Honduras');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('HR', 'Croatia');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('HT', 'Haiti');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('HU', 'Hungary');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('ID', 'Indonesia');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('IE', 'Ireland');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('IL', 'Israel');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('IM', 'Isle of Man');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('IN', 'India');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('IO', 'British Indian Ocean Territory');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('IQ', 'Iraq');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('IR', 'Iran');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('IS', 'Iceland');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('IT', 'Italy');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('JE', 'Jersey');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('JM', 'Jamaica');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('JO', 'Jordan');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('JP', 'Japan');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('KE', 'Kenya');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('KG', 'Kyrgyzstan');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('KH', 'Cambodia');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('KI', 'Kiribati');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('KM', 'Comoros');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('KN', 'Saint Kitts and Nevis');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('KP', 'North Korea');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('KR', 'South Korea');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('KW', 'Kuwait');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('KY', 'Cayman Islands');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('KZ', 'Kazakhstan');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('LA', 'Lao People\'s Democratic Republic');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('LB', 'Lebanon');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('LC', 'Saint Lucia');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('LI', 'Liechtenstein');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('LK', 'Sri Lanka');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('LR', 'Liberia');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('LS', 'Lesotho');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('LT', 'Lithuania');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('LU', 'Luxembourg');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('LV', 'Latvia');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('LY', 'Libya');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('MA', 'Morocco');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('MC', 'Monaco');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('MD', 'Moldova');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('ME', 'Montenegro');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('MF', 'Saint-Martin (France)');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('MG', 'Madagascar');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('MH', 'Marshall Islands');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('MK', 'Macedonia');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('ML', 'Mali');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('MM', 'Myanmar');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('MN', 'Mongolia');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('MO', 'Macau');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('MP', 'Northern Mariana Islands');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('MQ', 'Martinique');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('MR', 'Mauritania');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('MS', 'Montserrat');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('MT', 'Malta');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('MU', 'Mauritius');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('MV', 'Maldives');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('MW', 'Malawi');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('MX', 'Mexico');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('MY', 'Malaysia');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('MZ', 'Mozambique');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('NA', 'Namibia');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('NC', 'New Caledonia');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('NE', 'Niger');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('NF', 'Norfolk Island');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('NG', 'Nigeria');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('NI', 'Nicaragua');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('NL', 'The Netherlands');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('NO', 'Norway');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('NP', 'Nepal');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('NR', 'Nauru');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('NU', 'Niue');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('NZ', 'New Zealand');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('OM', 'Oman');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('PA', 'Panama');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('PE', 'Peru');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('PF', 'French Polynesia');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('PG', 'Papua New Guinea');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('PH', 'Philippines');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('PK', 'Pakistan');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('PL', 'Poland');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('PM', 'St. Pierre and Miquelon');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('PN', 'Pitcairn');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('PR', 'Puerto Rico');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('PS', 'Palestine, State of');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('PT', 'Portugal');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('PW', 'Palau');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('PY', 'Paraguay');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('QA', 'Qatar');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('RE', 'R�union');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('RO', 'Romania');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('RS', 'Serbia');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('RU', 'Russian Federation');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('RW', 'Rwanda');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('SA', 'Saudi Arabia');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('SB', 'Solomon Islands');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('SC', 'Seychelles');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('SD', 'Sudan');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('SE', 'Sweden');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('SG', 'Singapore');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('SH', 'Saint Helena');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('SI', 'Slovenia');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('SJ', 'Svalbard and Jan Mayen Islands');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('SK', 'Slovakia');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('SL', 'Sierra Leone');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('SM', 'San Marino');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('SN', 'Senegal');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('SO', 'Somalia');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('SR', 'Suriname');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('SS', 'South Sudan');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('ST', 'Sao Tome and Principe');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('SV', 'El Salvador');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('SX', 'Sint Maarten (Dutch part)');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('SY', 'Syria');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('SZ', 'Swaziland');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('TC', 'Turks and Caicos Islands');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('TD', 'Chad');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('TF', 'French Southern Territories');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('TG', 'Togo');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('TH', 'Thailand');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('TJ', 'Tajikistan');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('TK', 'Tokelau');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('TL', 'Timor-Leste');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('TM', 'Turkmenistan');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('TN', 'Tunisia');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('TO', 'Tonga');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('TR', 'Turkey');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('TT', 'Trinidad and Tobago');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('TV', 'Tuvalu');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('TW', 'Taiwan');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('TZ', 'Tanzania');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('UA', 'Ukraine');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('UG', 'Uganda');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('UM', 'United States Minor Outlying Islands');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('US', 'United States');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('UY', 'Uruguay');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('UZ', 'Uzbekistan');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('VA', 'Vatican');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('VC', 'Saint Vincent and the Grenadines');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('VE', 'Venezuela');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('VG', 'Virgin Islands (British)');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('VI', 'Virgin Islands (U.S.)');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('VN', 'Vietnam');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('VU', 'Vanuatu');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('WF', 'Wallis and Futuna Islands');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('WS', 'Samoa');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('YE', 'Yemen');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('YT', 'Mayotte');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('ZA', 'South Africa');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('ZM', 'Zambia');
INSERT INTO `country` (`countryCode`, `name`) VALUES ('ZW', 'Zimbabwe');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `TripLight`;
INSERT INTO `user` (`id`, `firstName`, `lastName`, `username`, `password`, `adminFlag`, `email`, `country_countryCode`, `photo_url`) VALUES (1, 'admin', 'user', 'admin', 'solarkisses', 1, 'admin@triplight.com', 'US', 'http://res.cloudinary.com/chiangs/image/upload/v1491241630/SD%20projects/travel.png');
INSERT INTO `user` (`id`, `firstName`, `lastName`, `username`, `password`, `adminFlag`, `email`, `country_countryCode`, `photo_url`) VALUES (2, 'Dennis', 'Carrasquillo', 'dcarras', 'westword4', 0, 'dennisc@gmail.com', 'US', 'http://res.cloudinary.com/chiangs/image/upload/v1491241630/SD%20projects/travel.png');
INSERT INTO `user` (`id`, `firstName`, `lastName`, `username`, `password`, `adminFlag`, `email`, `country_countryCode`, `photo_url`) VALUES (3, 'Aaron', 'Aguil', 'aguila', 'flyinghawaiian6', 0, 'aguila@yahoo.com', 'CN', 'http://res.cloudinary.com/chiangs/image/upload/v1491241630/SD%20projects/travel.png');

COMMIT;


-- -----------------------------------------------------
-- Data for table `city`
-- -----------------------------------------------------
START TRANSACTION;
USE `TripLight`;
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (1, 'Shanghai', 'CN');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (2, 'Lagos', 'NG');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (3, 'Istanbul', 'TR');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (4, 'Karachi', 'AF');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (5, 'Mumbai', 'IN');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (6, 'Moscow', 'RU');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (7, 'Sao Paolo', 'BR');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (8, 'Beijing', 'CN');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (9, 'Guangzhou', 'CN');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (10, 'Delhi', 'IN');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (11, 'Lahore', 'IN');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (12, 'Shenzhen', 'CN');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (13, 'Seoul', 'KR');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (14, 'Jakarta', 'ID');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (15, 'Tianjin', 'CN');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (16, 'Chennai', 'IN');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (17, 'Tokyo', 'JP');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (18, 'Cairo', 'EG');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (19, 'Dhaka', 'BD');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (20, 'Mexico City', 'MX');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (21, 'Kinshasa', 'CD');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (22, 'Bangalore', 'IN');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (23, 'New York', 'US');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (24, 'London', 'GB');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (25, 'Bangkok', 'TH');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (26, 'Tehran', 'IR');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (27, 'Dongguan', 'CN');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (28, 'Ho Chi Minh City', 'VN');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (29, 'Bogota', 'CO');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (30, 'Lima', 'PE');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (31, 'Hong Kong', 'HK');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (32, 'Hanoi', 'VN');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (33, 'Hyderabad', 'IN');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (34, 'Wuhan', 'CN');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (35, 'Rio de Janeiro', 'BR');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (36, 'Foshan', 'CN');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (37, 'Ahmedabad', 'IN');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (38, 'Baghdad', 'IQ');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (39, 'Singapore', 'SG');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (40, 'Shantou', 'CN');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (41, 'Riyadh', 'SA');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (42, 'Jeddah', 'SA');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (43, 'Santiago', 'CL');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (44, 'Saint Petersburg', 'RU');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (45, 'Qalyubia', 'EG');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (46, 'Chengdu', 'CN');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (47, 'Alexandria', 'EG');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (48, 'Ankara', 'TR');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (49, 'Chongqing', 'CN');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (50, 'Kolkata', 'IN');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (51, 'Xi\'an', 'CN');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (52, 'Surat', 'IN');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (53, 'Johannesburg', 'ZA');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (54, 'Nanjing', 'CN');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (55, 'Dar es Salaam', 'TZ');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (56, 'Yangon', 'MM');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (58, 'Harbin', 'CN');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (59, 'Zhengzhou', 'CN');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (60, 'Suzhou', 'CN');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (61, 'Sydney', 'AU');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (62, 'New Taipei City', 'TW');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (63, 'Los Angeles', 'US');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (64, 'Melbourne', 'AU');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (65, 'Cape Town', 'ZA');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (66, 'Shenyang', 'CN');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (67, 'Yokohama', 'JP');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (68, 'Busan', 'KR');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (69, 'Hangzhou', 'CN');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (70, 'Quanzhou', 'CN');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (71, 'Durban', 'KR');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (72, 'Casablanca', 'MA');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (73, 'Algiers', 'DZ');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (74, 'Berlin', 'DE');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (75, 'Nairobi', 'KE');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (76, 'Hefei', 'CN');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (77, 'Kabul', 'AF');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (78, 'Pyongyang', 'KP');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (79, 'Madrid', 'ES');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (80, 'Ekurhuleni', 'ZA');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (81, 'Pune', 'IN');
INSERT INTO `city` (`id`, `name`, `country_countryCode`) VALUES (82, 'Copenhagen', 'Denmark');

COMMIT;


-- -----------------------------------------------------
-- Data for table `place`
-- -----------------------------------------------------
START TRANSACTION;
USE `TripLight`;
INSERT INTO `place` (`id`, `name`, `url`, `city_id`, `country_countryCode`) VALUES (1, 'Huxinting Teahouse', NULL, 1, 'CN');
INSERT INTO `place` (`id`, `name`, `url`, `city_id`, `country_countryCode`) VALUES (2, 'Rumeli Fortress', NULL, 3, 'TR');
INSERT INTO `place` (`id`, `name`, `url`, `city_id`, `country_countryCode`) VALUES (3, 'Red Square', NULL, 6, 'RU');
INSERT INTO `place` (`id`, `name`, `url`, `city_id`, `country_countryCode`) VALUES (4, 'Gyeongbokgung Palace', NULL, 13, 'KR');
INSERT INTO `place` (`id`, `name`, `url`, `city_id`, `country_countryCode`) VALUES (5, 'Cascada La Chorrera', NULL, 29, 'CO');

COMMIT;


-- -----------------------------------------------------
-- Data for table `post`
-- -----------------------------------------------------
START TRANSACTION;
USE `TripLight`;
INSERT INTO `post` (`id`, `review`, `user_id`, `place_id`, `post_date`) VALUES (1, 'Very nice place with the smell of Chinese history. Must visit place. It\'s a little bit overcrowded...', 2, 1, '06/03/2013');
INSERT INTO `post` (`id`, `review`, `user_id`, `place_id`, `post_date`) VALUES (2, 'Excellent monument on the Bosporus ,built 600 years ago ,fine restaurants nearby and usually favoured as an anchor point', 2, 2, '12/15/2010');
INSERT INTO `post` (`id`, `review`, `user_id`, `place_id`, `post_date`) VALUES (3, 'This is the most popular attraction in Moscow and if you have not been here, it means you have not been in Moscow. It is great for taking pictures and walking, it has a lot of towers, churches, monuments and shops. Lenin\'s tomb was closed when we were there.\n\nThis is the most popular attraction in Moscow and if you have not been here, it means you have not been in Moscow. It is great for taking pictures and walking, it has a lot of towers, churches, monuments and shops. Lenin\'s tomb was closed when we were there.\nThis is the most popular attraction in Moscow and if you have not been here, it means you have not been in Moscow. It is great for taking pictures and walking, it has a lot of towers, churches, monuments and shops. Lenin\'s tomb was closed when we were there.\n\nThis is the most popular attraction in Moscow and if you have not been here, it means you have not been in Moscow. It is great for taking pictures and walking, it has a lot of towers, churches, monuments and shops. Lenin\'s tomb was closed when we were there.', 2, 3, '03/02/2002');
INSERT INTO `post` (`id`, `review`, `user_id`, `place_id`, `post_date`) VALUES (4, 'A massive place to walk around. Lots of history. Lots of photo shots. Wednesday was free entry! It\'s quite close to the hotels. This place should be number one on your sightseeing list!', 3, 4, '09/23/2015');
INSERT INTO `post` (`id`, `review`, `user_id`, `place_id`, `post_date`) VALUES (5, 'The waterfall is incredible! It is a tough hike to get to. It takes about an hour and a half up the mountain to get there. It is slippery and rocky, but well worth it.', 1, 5, '10/29/2001');

COMMIT;

