SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `Bike_Showroom` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `Bike_Showroom` ;

-- -----------------------------------------------------
-- Table `Bike_Showroom`.`Admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Bike_Showroom`.`Admin` (
  `User_ID` VARCHAR(45) NOT NULL,
  `User_passwd` VARCHAR(30) NOT NULL,
  `Record_num` INT ZEROFILL NOT NULL,
  PRIMARY KEY (`User_ID`),
  UNIQUE INDEX `User_ID_UNIQUE` (`User_ID` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Bike_Showroom`.`Expenses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Bike_Showroom`.`Expenses` (
  `Model_num` INT UNSIGNED NOT NULL,
  `Cost` DOUBLE UNSIGNED NOT NULL,
  `Tax` DOUBLE NOT NULL,
  `Insurance` DOUBLE NULL,
  `Special_offers` DOUBLE NULL DEFAULT '0',
  `Servicing_details` DOUBLE NULL,
  `Total_Cost_of_Bike` DOUBLE NOT NULL,
  PRIMARY KEY (`Model_num`, `Cost`, `Tax`, `Total_Cost_of_Bike`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Bike_Showroom`.`Feedback`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Bike_Showroom`.`Feedback` (
  `fb_ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Age` INT NOT NULL,
  `Bike_name` VARCHAR(20) NOT NULL,
  `Question1` VARCHAR(45) NULL,
  `Question2` VARCHAR(45) NULL,
  `Question3` VARCHAR(45) NULL,
  `comments` VARCHAR(200) NULL,
  PRIMARY KEY (`fb_ID`, `Name`, `Age`, `Bike_name`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Bike_Showroom`.`Suggest`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Bike_Showroom`.`Suggest` (
  `Suggest_pattern` VARCHAR(30) NOT NULL,
  `Model_num1` INT NOT NULL,
  PRIMARY KEY (`Suggest_pattern`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Bike_Showroom`.`Bike_model`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Bike_Showroom`.`Bike_model` (
  `Model_num` INT UNSIGNED NOT NULL,
  `Bike_variation` VARCHAR(20) NOT NULL,
  `Bike_model` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Model_num`, `Bike_model`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Bike_Showroom`.`Engine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Bike_Showroom`.`Engine` (
  `Model_num` INT UNSIGNED NOT NULL,
  `Engine_type` VARCHAR(45) NULL,
  `Displacement` VARCHAR(45) NULL,
  `Max_net_power` VARCHAR(45) NULL,
  `Max_net_torque` VARCHAR(45) NULL,
  PRIMARY KEY (`Model_num`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Bike_Showroom`.`Gallery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Bike_Showroom`.`Gallery` (
  `Model_num` INT UNSIGNED NOT NULL,
  `Pic_ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `photopath` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`Pic_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Bike_Showroom`.`Compare`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Bike_Showroom`.`Compare` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Bike_Showroom`.`Vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Bike_Showroom`.`Vehicle` (
  `Model_num` INT UNSIGNED NOT NULL,
  `wheelBase` INT NULL,
  `length*height*width` VARCHAR(45) NULL,
  `groundClearance` VARCHAR(45) NULL,
  `VehicleKerbWeight` VARCHAR(45) NULL,
  PRIMARY KEY (`Model_num`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Bike_Showroom`.`Suspension`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Bike_Showroom`.`Suspension` (
  `Model_num` INT NOT NULL,
  `Front` VARCHAR(45) NULL,
  `Rear` VARCHAR(45) NULL,
  PRIMARY KEY (`Model_num`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Bike_Showroom`.`Brakes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Bike_Showroom`.`Brakes` (
  `Model_num` INT NOT NULL,
  `Front/Rear` VARCHAR(45) NULL,
  `Brake_type` VARCHAR(45) NULL,
  `Brake_size` VARCHAR(45) NULL,
  PRIMARY KEY (`Model_num`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Bike_Showroom`.`Tyre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Bike_Showroom`.`Tyre` (
  `Model_num` INT UNSIGNED NOT NULL,
  `Front` VARCHAR(45) NOT NULL,
  `Rear` VARCHAR(45) NULL,
  PRIMARY KEY (`Model_num`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Bike_Showroom`.`Fuel_Tank`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Bike_Showroom`.`Fuel_Tank` (
  `Model_num` INT UNSIGNED NOT NULL,
  `Total_litres` VARCHAR(45) NULL,
  PRIMARY KEY (`Model_num`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Bike_Showroom`.`Electricals`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Bike_Showroom`.`Electricals` (
  `Model_num` INT UNSIGNED NOT NULL,
  `Head_lamp` VARCHAR(45) NULL,
  `System` VARCHAR(45) NULL,
  `Battery` VARCHAR(45) NULL,
  PRIMARY KEY (`Model_num`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `Bike_Showroom`.`Admin`
-- -----------------------------------------------------
START TRANSACTION;
USE `Bike_Showroom`;
INSERT INTO `Bike_Showroom`.`Admin` (`User_ID`, `User_passwd`, `Record_num`) VALUES ('123', 'nopass', 2);
INSERT INTO `Bike_Showroom`.`Admin` (`User_ID`, `User_passwd`, `Record_num`) VALUES ('456', 'pass', 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Bike_Showroom`.`Expenses`
-- -----------------------------------------------------
START TRANSACTION;
USE `Bike_Showroom`;
INSERT INTO `Bike_Showroom`.`Expenses` (`Model_num`, `Cost`, `Tax`, `Insurance`, `Special_offers`, `Servicing_details`, `Total_Cost_of_Bike`) VALUES (001, 50000, 5000, 2500, NULL, NULL, 57500);
INSERT INTO `Bike_Showroom`.`Expenses` (`Model_num`, `Cost`, `Tax`, `Insurance`, `Special_offers`, `Servicing_details`, `Total_Cost_of_Bike`) VALUES (011, 45000, 4000, 2500, NULL, NULL, 51500);
INSERT INTO `Bike_Showroom`.`Expenses` (`Model_num`, `Cost`, `Tax`, `Insurance`, `Special_offers`, `Servicing_details`, `Total_Cost_of_Bike`) VALUES (012, 35000, 3500, 2500, NULL, NULL, 41000);
INSERT INTO `Bike_Showroom`.`Expenses` (`Model_num`, `Cost`, `Tax`, `Insurance`, `Special_offers`, `Servicing_details`, `Total_Cost_of_Bike`) VALUES (013, 33000, 3300, 2500, NULL, NULL, 38800);
INSERT INTO `Bike_Showroom`.`Expenses` (`Model_num`, `Cost`, `Tax`, `Insurance`, `Special_offers`, `Servicing_details`, `Total_Cost_of_Bike`) VALUES (014, 31000, 3500, 2500, NULL, NULL, 37000);
INSERT INTO `Bike_Showroom`.`Expenses` (`Model_num`, `Cost`, `Tax`, `Insurance`, `Special_offers`, `Servicing_details`, `Total_Cost_of_Bike`) VALUES (015, 45900, 4000, 3500, NULL, NULL, 53400);
INSERT INTO `Bike_Showroom`.`Expenses` (`Model_num`, `Cost`, `Tax`, `Insurance`, `Special_offers`, `Servicing_details`, `Total_Cost_of_Bike`) VALUES (021, 50000, 5000, 4000, NULL, NULL, 59000);
INSERT INTO `Bike_Showroom`.`Expenses` (`Model_num`, `Cost`, `Tax`, `Insurance`, `Special_offers`, `Servicing_details`, `Total_Cost_of_Bike`) VALUES (022, 47000, 4700, 3500, NULL, NULL, 55200);
INSERT INTO `Bike_Showroom`.`Expenses` (`Model_num`, `Cost`, `Tax`, `Insurance`, `Special_offers`, `Servicing_details`, `Total_Cost_of_Bike`) VALUES (023, 60000, 5000, 3000, NULL, NULL, 68000);
INSERT INTO `Bike_Showroom`.`Expenses` (`Model_num`, `Cost`, `Tax`, `Insurance`, `Special_offers`, `Servicing_details`, `Total_Cost_of_Bike`) VALUES (024, 70500, 5000, 3200, NULL, NULL, 78700);
INSERT INTO `Bike_Showroom`.`Expenses` (`Model_num`, `Cost`, `Tax`, `Insurance`, `Special_offers`, `Servicing_details`, `Total_Cost_of_Bike`) VALUES (025, 64000, 4500, 3000, NULL, NULL, 71500);
INSERT INTO `Bike_Showroom`.`Expenses` (`Model_num`, `Cost`, `Tax`, `Insurance`, `Special_offers`, `Servicing_details`, `Total_Cost_of_Bike`) VALUES (031, 41000, 4100, 2700, NULL, NULL, 47800);
INSERT INTO `Bike_Showroom`.`Expenses` (`Model_num`, `Cost`, `Tax`, `Insurance`, `Special_offers`, `Servicing_details`, `Total_Cost_of_Bike`) VALUES (041, 89000, 7800, 4000, NULL, NULL, 100800);
INSERT INTO `Bike_Showroom`.`Expenses` (`Model_num`, `Cost`, `Tax`, `Insurance`, `Special_offers`, `Servicing_details`, `Total_Cost_of_Bike`) VALUES (042, 150000, 11000, 7000, NULL, NULL, 168000);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Bike_Showroom`.`Suggest`
-- -----------------------------------------------------
START TRANSACTION;
USE `Bike_Showroom`;
INSERT INTO `Bike_Showroom`.`Suggest` (`Suggest_pattern`, `Model_num1`) VALUES ('AAAAA', 015);
INSERT INTO `Bike_Showroom`.`Suggest` (`Suggest_pattern`, `Model_num1`) VALUES ('AABAA', 015);
INSERT INTO `Bike_Showroom`.`Suggest` (`Suggest_pattern`, `Model_num1`) VALUES ('AACAA', 015);
INSERT INTO `Bike_Showroom`.`Suggest` (`Suggest_pattern`, `Model_num1`) VALUES ('ABAAA', 001);
INSERT INTO `Bike_Showroom`.`Suggest` (`Suggest_pattern`, `Model_num1`) VALUES ('ABBAA', 014);
INSERT INTO `Bike_Showroom`.`Suggest` (`Suggest_pattern`, `Model_num1`) VALUES ('ABCAA', 013);
INSERT INTO `Bike_Showroom`.`Suggest` (`Suggest_pattern`, `Model_num1`) VALUES ('ACAAA', 012);
INSERT INTO `Bike_Showroom`.`Suggest` (`Suggest_pattern`, `Model_num1`) VALUES ('ACBAA', 041);
INSERT INTO `Bike_Showroom`.`Suggest` (`Suggest_pattern`, `Model_num1`) VALUES ('ACCAA', 011);
INSERT INTO `Bike_Showroom`.`Suggest` (`Suggest_pattern`, `Model_num1`) VALUES ('BAAAA', 013);
INSERT INTO `Bike_Showroom`.`Suggest` (`Suggest_pattern`, `Model_num1`) VALUES ('BABAA', 021);
INSERT INTO `Bike_Showroom`.`Suggest` (`Suggest_pattern`, `Model_num1`) VALUES ('BACAA', 024);
INSERT INTO `Bike_Showroom`.`Suggest` (`Suggest_pattern`, `Model_num1`) VALUES ('BBAAA', 013);
INSERT INTO `Bike_Showroom`.`Suggest` (`Suggest_pattern`, `Model_num1`) VALUES ('BBBAA', 014);
INSERT INTO `Bike_Showroom`.`Suggest` (`Suggest_pattern`, `Model_num1`) VALUES ('BBCAA', 013);
INSERT INTO `Bike_Showroom`.`Suggest` (`Suggest_pattern`, `Model_num1`) VALUES ('BCAAA', 042);
INSERT INTO `Bike_Showroom`.`Suggest` (`Suggest_pattern`, `Model_num1`) VALUES ('BCBAA', 041);
INSERT INTO `Bike_Showroom`.`Suggest` (`Suggest_pattern`, `Model_num1`) VALUES ('BCCAA', 011);
INSERT INTO `Bike_Showroom`.`Suggest` (`Suggest_pattern`, `Model_num1`) VALUES ('CAAAA', 015);
INSERT INTO `Bike_Showroom`.`Suggest` (`Suggest_pattern`, `Model_num1`) VALUES ('CABAA', 022);
INSERT INTO `Bike_Showroom`.`Suggest` (`Suggest_pattern`, `Model_num1`) VALUES ('CACAA', 015);
INSERT INTO `Bike_Showroom`.`Suggest` (`Suggest_pattern`, `Model_num1`) VALUES ('CBAAA', 013);
INSERT INTO `Bike_Showroom`.`Suggest` (`Suggest_pattern`, `Model_num1`) VALUES ('CBBAA', 015);
INSERT INTO `Bike_Showroom`.`Suggest` (`Suggest_pattern`, `Model_num1`) VALUES ('CBCAA', 013);
INSERT INTO `Bike_Showroom`.`Suggest` (`Suggest_pattern`, `Model_num1`) VALUES ('CCAAA', 011);
INSERT INTO `Bike_Showroom`.`Suggest` (`Suggest_pattern`, `Model_num1`) VALUES ('CCBAA', 022);
INSERT INTO `Bike_Showroom`.`Suggest` (`Suggest_pattern`, `Model_num1`) VALUES ('CCCAA', 011);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Bike_Showroom`.`Bike_model`
-- -----------------------------------------------------
START TRANSACTION;
USE `Bike_Showroom`;
INSERT INTO `Bike_Showroom`.`Bike_model` (`Model_num`, `Bike_variation`, `Bike_model`) VALUES (001, 'AVENGER', '220 DTS-i');
INSERT INTO `Bike_Showroom`.`Bike_model` (`Model_num`, `Bike_variation`, `Bike_model`) VALUES (011, 'PULSAR', '200 NS');
INSERT INTO `Bike_Showroom`.`Bike_model` (`Model_num`, `Bike_variation`, `Bike_model`) VALUES (012, 'PULSAR', '220');
INSERT INTO `Bike_Showroom`.`Bike_model` (`Model_num`, `Bike_variation`, `Bike_model`) VALUES (013, 'PULSAR', '180');
INSERT INTO `Bike_Showroom`.`Bike_model` (`Model_num`, `Bike_variation`, `Bike_model`) VALUES (014, 'PULSAR', '150');
INSERT INTO `Bike_Showroom`.`Bike_model` (`Model_num`, `Bike_variation`, `Bike_model`) VALUES (015, 'PULSAR', '135 LS');
INSERT INTO `Bike_Showroom`.`Bike_model` (`Model_num`, `Bike_variation`, `Bike_model`) VALUES (021, 'DISCOVER', '125 ST');
INSERT INTO `Bike_Showroom`.`Bike_model` (`Model_num`, `Bike_variation`, `Bike_model`) VALUES (022, 'DISCOVER', '125 T');
INSERT INTO `Bike_Showroom`.`Bike_model` (`Model_num`, `Bike_variation`, `Bike_model`) VALUES (023, 'DISCOVER', '100 T');
INSERT INTO `Bike_Showroom`.`Bike_model` (`Model_num`, `Bike_variation`, `Bike_model`) VALUES (024, 'DISCOVER', '125');
INSERT INTO `Bike_Showroom`.`Bike_model` (`Model_num`, `Bike_variation`, `Bike_model`) VALUES (025, 'DISCOVER', '100');
INSERT INTO `Bike_Showroom`.`Bike_model` (`Model_num`, `Bike_variation`, `Bike_model`) VALUES (031, 'PLATINA', '100');
INSERT INTO `Bike_Showroom`.`Bike_model` (`Model_num`, `Bike_variation`, `Bike_model`) VALUES (041, 'NINJA', '650R');
INSERT INTO `Bike_Showroom`.`Bike_model` (`Model_num`, `Bike_variation`, `Bike_model`) VALUES (042, 'NINJA', '300');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Bike_Showroom`.`Engine`
-- -----------------------------------------------------
START TRANSACTION;
USE `Bike_Showroom`;
INSERT INTO `Bike_Showroom`.`Engine` (`Model_num`, `Engine_type`, `Displacement`, `Max_net_power`, `Max_net_torque`) VALUES (001, '4-stroke, single cylinder, DTS-i, air cooled with oil-cooler', '219.89 cc', '19.03 @ 8400 (Ps @ RPM)', '17.5 @ 7000 (Nm @ RPM)');
INSERT INTO `Bike_Showroom`.`Engine` (`Model_num`, `Engine_type`, `Displacement`, `Max_net_power`, `Max_net_torque`) VALUES (011, '4 - stroke, SOHC - 4V - Liquid Cooled, single cylinder', '199.5 cc', '23.52 @ 9500 (Ps @ RPM)', '18.3 @ 8000 (Nm @ RPM)');
INSERT INTO `Bike_Showroom`.`Engine` (`Model_num`, `Engine_type`, `Displacement`, `Max_net_power`, `Max_net_torque`) VALUES (012, '4-stroke, DTS-i, oil cooled, single cylinder', '220 cc', '21.05 @ 8500 (Ps @ RPM)', '19.12 @ 7000 (Nm @ RPM)');
INSERT INTO `Bike_Showroom`.`Engine` (`Model_num`, `Engine_type`, `Displacement`, `Max_net_power`, `Max_net_torque`) VALUES (013, '4-stroke, DTS-i, air cooled, single cylinder', '178.6 cc', '17.02 @ 8500 (Ps @ RPM)', '14.22 @ 6500 (Nm @ RPM)');
INSERT INTO `Bike_Showroom`.`Engine` (`Model_num`, `Engine_type`, `Displacement`, `Max_net_power`, `Max_net_torque`) VALUES (014, '4-stroke, DTS-i, air cooled, single cylinder', '149 cc', '15.06 @ 9000 (Ps @ RPM)', '12.5 @ 6500 (Nm @ RPM)');
INSERT INTO `Bike_Showroom`.`Engine` (`Model_num`, `Engine_type`, `Displacement`, `Max_net_power`, `Max_net_torque`) VALUES (015, '4-stroke, DTS-i, air cooled. 4-valve single cylinder', '134.66 cc', '13.56 @ 9000 (Ps @ RPM)', '11.4 @ 7500 (Nm @ RPM)');
INSERT INTO `Bike_Showroom`.`Engine` (`Model_num`, `Engine_type`, `Displacement`, `Max_net_power`, `Max_net_torque`) VALUES (021, '4 Valve Twin Spark Air Cooled', '124.6 cc', '13 Ps @ 9000 rpm', '1.1 kgm @ 7000 rpm');
INSERT INTO `Bike_Showroom`.`Engine` (`Model_num`, `Engine_type`, `Displacement`, `Max_net_power`, `Max_net_torque`) VALUES (022, 'Single cyl, 4-Valve, DTS-i', '124.6 cc', '12.5 ps @ 9000 rpm', '10.8 Nm @ 6500 rpm');
INSERT INTO `Bike_Showroom`.`Engine` (`Model_num`, `Engine_type`, `Displacement`, `Max_net_power`, `Max_net_torque`) VALUES (023, '4-Valve-DTS-i', '102 cc', '10.2 Ps @9000 rpm', '9.2 Nm @ 6500 rpm');
INSERT INTO `Bike_Showroom`.`Engine` (`Model_num`, `Engine_type`, `Displacement`, `Max_net_power`, `Max_net_torque`) VALUES (024, 'DTS-i, 4-stroke, Natural air cooled', '124.6 cc', '11 ps @ 8000 rpm', '10.8 nm @ 5500 rpm');
INSERT INTO `Bike_Showroom`.`Engine` (`Model_num`, `Engine_type`, `Displacement`, `Max_net_power`, `Max_net_torque`) VALUES (025, 'Single cylinder, 4 stroke, air cooled', '94.38 cc', '7.7 @ 7500 (Ps @ RPM)', '7.85 @ 5000 (Nm @ RPM)');
INSERT INTO `Bike_Showroom`.`Engine` (`Model_num`, `Engine_type`, `Displacement`, `Max_net_power`, `Max_net_torque`) VALUES (031, '4 Stroke, natural air cooled', '99.27cc', '6.03Kw 8.2bhp @ 7500rpm', '8.05 Nm @ 4500rpm');
INSERT INTO `Bike_Showroom`.`Engine` (`Model_num`, `Engine_type`, `Displacement`, `Max_net_power`, `Max_net_torque`) VALUES (041, 'Four - stroke, DDHC 8 Valve, Parallel Twin (BSIII)', '649 cc', '72.1 Ps @ 8500 RPM', '64 Nm @ 7000 RPM');
INSERT INTO `Bike_Showroom`.`Engine` (`Model_num`, `Engine_type`, `Displacement`, `Max_net_power`, `Max_net_torque`) VALUES (042, 'Liquid-cooled, 4-stroke Parallel Twin', '296 cc', '39 Ps @ 11,000 rpm', '27.0 Nm @ 10,000 rpm');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Bike_Showroom`.`Gallery`
-- -----------------------------------------------------
START TRANSACTION;
USE `Bike_Showroom`;
INSERT INTO `Bike_Showroom`.`Gallery` (`Model_num`, `Pic_ID`, `photopath`) VALUES (001, 0001, './BAJAJ/av_black.jpg');
INSERT INTO `Bike_Showroom`.`Gallery` (`Model_num`, `Pic_ID`, `photopath`) VALUES (001, 0002, './BAJAJ/av_blue.jpg');
INSERT INTO `Bike_Showroom`.`Gallery` (`Model_num`, `Pic_ID`, `photopath`) VALUES (001, 0003, './BAJAJ/av_red.jpg');
INSERT INTO `Bike_Showroom`.`Gallery` (`Model_num`, `Pic_ID`, `photopath`) VALUES (011, 0004, './BAJAJ/pulsar-200ns-color-black.jpg');
INSERT INTO `Bike_Showroom`.`Gallery` (`Model_num`, `Pic_ID`, `photopath`) VALUES (011, 0005, './BAJAJ/pulsar-200ns-color-blue.jpg');
INSERT INTO `Bike_Showroom`.`Gallery` (`Model_num`, `Pic_ID`, `photopath`) VALUES (011, 0006, './BAJAJ/pulsar-200ns-color-red.jpg');
INSERT INTO `Bike_Showroom`.`Gallery` (`Model_num`, `Pic_ID`, `photopath`) VALUES (011, 0007, './BAJAJ/pulsar-200ns-color-yellow.jpg');
INSERT INTO `Bike_Showroom`.`Gallery` (`Model_num`, `Pic_ID`, `photopath`) VALUES (012, 0008, './BAJAJ/pulsar-220f-color-black.jpg');
INSERT INTO `Bike_Showroom`.`Gallery` (`Model_num`, `Pic_ID`, `photopath`) VALUES (012, 0009, './BAJAJ/pulsar-220f-color-blue.jpg');
INSERT INTO `Bike_Showroom`.`Gallery` (`Model_num`, `Pic_ID`, `photopath`) VALUES (012, 0010, './BAJAJ/pulsar-220f-color-red.jpg');
INSERT INTO `Bike_Showroom`.`Gallery` (`Model_num`, `Pic_ID`, `photopath`) VALUES (013, 0011, './BAJAJ/pulsar-180-color-black.jpg');
INSERT INTO `Bike_Showroom`.`Gallery` (`Model_num`, `Pic_ID`, `photopath`) VALUES (013, 0012, './BAJAJ/pulsar-180-color-blue.jpg');
INSERT INTO `Bike_Showroom`.`Gallery` (`Model_num`, `Pic_ID`, `photopath`) VALUES (013, 0013, './BAJAJ/pulsar-180-color-red.jpg');
INSERT INTO `Bike_Showroom`.`Gallery` (`Model_num`, `Pic_ID`, `photopath`) VALUES (014, 0014, './BAJAJ/pulsar-150-color-black.jpg');
INSERT INTO `Bike_Showroom`.`Gallery` (`Model_num`, `Pic_ID`, `photopath`) VALUES (014, 0015, './BAJAJ/pulsar-150-color-blue.jpg');
INSERT INTO `Bike_Showroom`.`Gallery` (`Model_num`, `Pic_ID`, `photopath`) VALUES (014, 0016, './BAJAJ/pulsar-150-color-red.jpg');
INSERT INTO `Bike_Showroom`.`Gallery` (`Model_num`, `Pic_ID`, `photopath`) VALUES (015, 0017, './BAJAJ/pulsar-135-color-black.jpg');
INSERT INTO `Bike_Showroom`.`Gallery` (`Model_num`, `Pic_ID`, `photopath`) VALUES (015, 0018, './BAJAJ/pulsar-135-color-blue.jpg');
INSERT INTO `Bike_Showroom`.`Gallery` (`Model_num`, `Pic_ID`, `photopath`) VALUES (015, 0019, './BAJAJ/pulsar-135-color-red.jpg');
INSERT INTO `Bike_Showroom`.`Gallery` (`Model_num`, `Pic_ID`, `photopath`) VALUES (021, 0020, './BAJAJ/Discover 125 ST-blue.jpg');
INSERT INTO `Bike_Showroom`.`Gallery` (`Model_num`, `Pic_ID`, `photopath`) VALUES (021, 0021, './BAJAJ/Discover 125 ST-blue-black.jpg');
INSERT INTO `Bike_Showroom`.`Gallery` (`Model_num`, `Pic_ID`, `photopath`) VALUES (021, 0022, './BAJAJ/Discover 125 ST-red.jpg');
INSERT INTO `Bike_Showroom`.`Gallery` (`Model_num`, `Pic_ID`, `photopath`) VALUES (021, 0023, './BAJAJ/Discover 125 ST-red-black.jpg');
INSERT INTO `Bike_Showroom`.`Gallery` (`Model_num`, `Pic_ID`, `photopath`) VALUES (022, 0024, './BAJAJ/Discover 125 T-blue.jpg');
INSERT INTO `Bike_Showroom`.`Gallery` (`Model_num`, `Pic_ID`, `photopath`) VALUES (022, 0025, './BAJAJ/Discover 125 T-blue-black.jpg');
INSERT INTO `Bike_Showroom`.`Gallery` (`Model_num`, `Pic_ID`, `photopath`) VALUES (022, 0026, './BAJAJ/Discover 125 T-red.jpg');
INSERT INTO `Bike_Showroom`.`Gallery` (`Model_num`, `Pic_ID`, `photopath`) VALUES (022, 0027, './BAJAJ/Discover 125 T-red-black.jpg');
INSERT INTO `Bike_Showroom`.`Gallery` (`Model_num`, `Pic_ID`, `photopath`) VALUES (023, 0028, './BAJAJ/Discover 100 T-blue.jpg');
INSERT INTO `Bike_Showroom`.`Gallery` (`Model_num`, `Pic_ID`, `photopath`) VALUES (023, 0029, './BAJAJ/Discover 100 T-blue-black.jpg');
INSERT INTO `Bike_Showroom`.`Gallery` (`Model_num`, `Pic_ID`, `photopath`) VALUES (023, 0030, './BAJAJ/Discover 100 T-red.jpg');
INSERT INTO `Bike_Showroom`.`Gallery` (`Model_num`, `Pic_ID`, `photopath`) VALUES (023, 0031, './BAJAJ/Discover 100 T-red-black.jpg');
INSERT INTO `Bike_Showroom`.`Gallery` (`Model_num`, `Pic_ID`, `photopath`) VALUES (024, 0032, './BAJAJ/Discover 125_blueblack.png');
INSERT INTO `Bike_Showroom`.`Gallery` (`Model_num`, `Pic_ID`, `photopath`) VALUES (024, 0033, './BAJAJ/Discover 125_color_goldgreen.jpg');
INSERT INTO `Bike_Showroom`.`Gallery` (`Model_num`, `Pic_ID`, `photopath`) VALUES (024, 0034, './BAJAJ/Discover 125_color_redvoilet.jpg');
INSERT INTO `Bike_Showroom`.`Gallery` (`Model_num`, `Pic_ID`, `photopath`) VALUES (024, 0035, './BAJAJ/Discover 125_redblack.png');
INSERT INTO `Bike_Showroom`.`Gallery` (`Model_num`, `Pic_ID`, `photopath`) VALUES (025, 0036, './BAJAJ/Discover 100-color-blackblue.jpg');
INSERT INTO `Bike_Showroom`.`Gallery` (`Model_num`, `Pic_ID`, `photopath`) VALUES (025, 0037, './BAJAJ/Discover 100-color-blackgreen.jpg');
INSERT INTO `Bike_Showroom`.`Gallery` (`Model_num`, `Pic_ID`, `photopath`) VALUES (025, 0038, './BAJAJ/Discover 100-color-blackred.jpg');
INSERT INTO `Bike_Showroom`.`Gallery` (`Model_num`, `Pic_ID`, `photopath`) VALUES (025, 0039, './BAJAJ/Discover 100-color-red.jpg');
INSERT INTO `Bike_Showroom`.`Gallery` (`Model_num`, `Pic_ID`, `photopath`) VALUES (031, 0040, './BAJAJ/platina100_colors_blchrome.jpg');
INSERT INTO `Bike_Showroom`.`Gallery` (`Model_num`, `Pic_ID`, `photopath`) VALUES (031, 0041, './BAJAJ/platina100_colors_blmaroon.jpg');
INSERT INTO `Bike_Showroom`.`Gallery` (`Model_num`, `Pic_ID`, `photopath`) VALUES (031, 0042, './BAJAJ/platina100_colors_cockred.jpg');
INSERT INTO `Bike_Showroom`.`Gallery` (`Model_num`, `Pic_ID`, `photopath`) VALUES (041, 0043, './BAJAJ/ninja-650r.jpg');
INSERT INTO `Bike_Showroom`.`Gallery` (`Model_num`, `Pic_ID`, `photopath`) VALUES (042, 0044, './BAJAJ/Ninja-300.jpg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Bike_Showroom`.`Vehicle`
-- -----------------------------------------------------
START TRANSACTION;
USE `Bike_Showroom`;
INSERT INTO `Bike_Showroom`.`Vehicle` (`Model_num`, `wheelBase`, `length*height*width`, `groundClearance`, `VehicleKerbWeight`) VALUES (001, 1475 mm, NULL, '169 mm', '154.5 kg');
INSERT INTO `Bike_Showroom`.`Vehicle` (`Model_num`, `wheelBase`, `length*height*width`, `groundClearance`, `VehicleKerbWeight`) VALUES (011, 1363 mm, '2017 mm x 1075 mm x 804 mm', '169 mm', '145 kg');
INSERT INTO `Bike_Showroom`.`Vehicle` (`Model_num`, `wheelBase`, `length*height*width`, `groundClearance`, `VehicleKerbWeight`) VALUES (012, 1350 mm, '2035mm x 1165 mm x 750 mm', '165 mm', '150 kg');
INSERT INTO `Bike_Showroom`.`Vehicle` (`Model_num`, `wheelBase`, `length*height*width`, `groundClearance`, `VehicleKerbWeight`) VALUES (013, 1345 mm, '2035 mm x 1115 mm x 765mm', '165 mm', '145 kg');
INSERT INTO `Bike_Showroom`.`Vehicle` (`Model_num`, `wheelBase`, `length*height*width`, `groundClearance`, `VehicleKerbWeight`) VALUES (014, 1320 mm, '2055 mm x 1060 mm x 755 mm', '165 mm', '144 kg');
INSERT INTO `Bike_Showroom`.`Vehicle` (`Model_num`, `wheelBase`, `length*height*width`, `groundClearance`, `VehicleKerbWeight`) VALUES (015, 1325 mm, '1995 mm x 1045 mm x 765 mm', '165 mm', '121 kg');
INSERT INTO `Bike_Showroom`.`Vehicle` (`Model_num`, `wheelBase`, `length*height*width`, `groundClearance`, `VehicleKerbWeight`) VALUES (021, 1305 mm, NULL, '170 mm', '124.5 kg');
INSERT INTO `Bike_Showroom`.`Vehicle` (`Model_num`, `wheelBase`, `length*height*width`, `groundClearance`, `VehicleKerbWeight`) VALUES (022, 1305 mm, '2035 mm x 1070 mm x 714 mm', '165 mm', '124.7 kg');
INSERT INTO `Bike_Showroom`.`Vehicle` (`Model_num`, `wheelBase`, `length*height*width`, `groundClearance`, `VehicleKerbWeight`) VALUES (023, 1305 mm, '2038 mm x 1070 mm x 714 mm', '165 mm', '121 kg');
INSERT INTO `Bike_Showroom`.`Vehicle` (`Model_num`, `wheelBase`, `length*height*width`, `groundClearance`, `VehicleKerbWeight`) VALUES (024, 1305 mm, NULL, '165 mm', '118.5 Kg');
INSERT INTO `Bike_Showroom`.`Vehicle` (`Model_num`, `wheelBase`, `length*height*width`, `groundClearance`, `VehicleKerbWeight`) VALUES (025, 1305 mm, '2040 mm x 1087 mm x 760 mm', '162 mm', '115 kg');
INSERT INTO `Bike_Showroom`.`Vehicle` (`Model_num`, `wheelBase`, `length*height*width`, `groundClearance`, `VehicleKerbWeight`) VALUES (031, 1275 mm, '1990 mm x 1090 mm x 770 mm', NULL, '113 kg');
INSERT INTO `Bike_Showroom`.`Vehicle` (`Model_num`, `wheelBase`, `length*height*width`, `groundClearance`, `VehicleKerbWeight`) VALUES (041, 1410 mm, '2110 mm x 1180 mm x 770 mm', '130 mm', '211 kg');
INSERT INTO `Bike_Showroom`.`Vehicle` (`Model_num`, `wheelBase`, `length*height*width`, `groundClearance`, `VehicleKerbWeight`) VALUES (042, 1405 mm, '2,015 mm x 1110 mm x 715 mm', '140 mm', '172 kg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Bike_Showroom`.`Suspension`
-- -----------------------------------------------------
START TRANSACTION;
USE `Bike_Showroom`;
INSERT INTO `Bike_Showroom`.`Suspension` (`Model_num`, `Front`, `Rear`) VALUES (001, 'Telescopic', 'Hydraulic Shock Absorber');
INSERT INTO `Bike_Showroom`.`Suspension` (`Model_num`, `Front`, `Rear`) VALUES (011, 'Telescopic Front Fork with Anti-friction Bush', 'Mono suspension with nitrox');
INSERT INTO `Bike_Showroom`.`Suspension` (`Model_num`, `Front`, `Rear`) VALUES (012, 'Telescopic, with anti-friction bush', '5 way adjustable, Nitrox shock absorber');
INSERT INTO `Bike_Showroom`.`Suspension` (`Model_num`, `Front`, `Rear`) VALUES (013, 'Telescopic, with anti-friction bush', '5 way adjustable, Nitrox shock absorber');
INSERT INTO `Bike_Showroom`.`Suspension` (`Model_num`, `Front`, `Rear`) VALUES (014, 'Telescopic, with anti-friction bush', '5 way adjustable, Nitrox shock absorber');
INSERT INTO `Bike_Showroom`.`Suspension` (`Model_num`, `Front`, `Rear`) VALUES (015, 'Telescopic, with anti-friction bush', '5 way adjustable, Nitrox shock absorber');
INSERT INTO `Bike_Showroom`.`Suspension` (`Model_num`, `Front`, `Rear`) VALUES (021, 'Telescopic Fork with Anti-friction DU Bush', 'Nitrox Monoshock with gas canister');
INSERT INTO `Bike_Showroom`.`Suspension` (`Model_num`, `Front`, `Rear`) VALUES (022, 'Telescopic (130 mm)', 'Nitrox Twin (110 mm)');
INSERT INTO `Bike_Showroom`.`Suspension` (`Model_num`, `Front`, `Rear`) VALUES (023, 'Telescopic, 130 mm fork travel', 'Twin shocks, Nitrox(Gas filled),110 mm rear wheel travel');
INSERT INTO `Bike_Showroom`.`Suspension` (`Model_num`, `Front`, `Rear`) VALUES (024, 'Telescopic, 130 mm fork travel', 'Nitrox Gas filled, 110 mm rear wheel travel');
INSERT INTO `Bike_Showroom`.`Suspension` (`Model_num`, `Front`, `Rear`) VALUES (025, 'Telescopic, wheel travel 130 mm', 'Nitrox, wheel travel 110 mm');
INSERT INTO `Bike_Showroom`.`Suspension` (`Model_num`, `Front`, `Rear`) VALUES (031, 'Hydraulic, Telescopic Type, 125mm travel', 'Hydraulic, Telescopic Type, 125mm travel');
INSERT INTO `Bike_Showroom`.`Suspension` (`Model_num`, `Front`, `Rear`) VALUES (041, '41 mm Telescopic Fork ', 'Single offset laydown Shock with 7 - step adjustable');
INSERT INTO `Bike_Showroom`.`Suspension` (`Model_num`, `Front`, `Rear`) VALUES (042, '37 mm Telescopic Fork', 'Bottom-Link Uni-Trak with gas-charged shock and 5-way adjustable preload');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Bike_Showroom`.`Brakes`
-- -----------------------------------------------------
START TRANSACTION;
USE `Bike_Showroom`;
INSERT INTO `Bike_Showroom`.`Brakes` (`Model_num`, `Front/Rear`, `Brake_type`, `Brake_size`) VALUES (001, 'Front', 'Disc', 'Dia. 260 mm');
INSERT INTO `Bike_Showroom`.`Brakes` (`Model_num`, `Front/Rear`, `Brake_type`, `Brake_size`) VALUES (001, 'Rear', 'Drum', 'Dia. 130 mm');
INSERT INTO `Bike_Showroom`.`Brakes` (`Model_num`, `Front/Rear`, `Brake_type`, `Brake_size`) VALUES (011, 'Front', 'Petal Disc with floating caliper', 'Dia 280 mm');
INSERT INTO `Bike_Showroom`.`Brakes` (`Model_num`, `Front/Rear`, `Brake_type`, `Brake_size`) VALUES (011, 'Rear', 'Petal Disc with floating caliper', 'Dia 280 mm ');
INSERT INTO `Bike_Showroom`.`Brakes` (`Model_num`, `Front/Rear`, `Brake_type`, `Brake_size`) VALUES (012, 'Front', 'Disc', '260 mm');
INSERT INTO `Bike_Showroom`.`Brakes` (`Model_num`, `Front/Rear`, `Brake_type`, `Brake_size`) VALUES (012, 'Rear', 'Disc', '230 mm');
INSERT INTO `Bike_Showroom`.`Brakes` (`Model_num`, `Front/Rear`, `Brake_type`, `Brake_size`) VALUES (013, 'Front', 'Disc', '260 mm');
INSERT INTO `Bike_Showroom`.`Brakes` (`Model_num`, `Front/Rear`, `Brake_type`, `Brake_size`) VALUES (013, 'Rear', 'Drum', '130 mm');
INSERT INTO `Bike_Showroom`.`Brakes` (`Model_num`, `Front/Rear`, `Brake_type`, `Brake_size`) VALUES (014, 'Front', 'Disc', '240 mm');
INSERT INTO `Bike_Showroom`.`Brakes` (`Model_num`, `Front/Rear`, `Brake_type`, `Brake_size`) VALUES (014, 'Rear', 'Drum', '130 mm');
INSERT INTO `Bike_Showroom`.`Brakes` (`Model_num`, `Front/Rear`, `Brake_type`, `Brake_size`) VALUES (015, 'Front', 'Disc', '240 mm');
INSERT INTO `Bike_Showroom`.`Brakes` (`Model_num`, `Front/Rear`, `Brake_type`, `Brake_size`) VALUES (015, 'Rear', 'Drum', '130 mm');
INSERT INTO `Bike_Showroom`.`Brakes` (`Model_num`, `Front/Rear`, `Brake_type`, `Brake_size`) VALUES (021, 'Front', 'Petal Disc', '200 mm');
INSERT INTO `Bike_Showroom`.`Brakes` (`Model_num`, `Front/Rear`, `Brake_type`, `Brake_size`) VALUES (021, 'Rear', 'Drum', '130 mm');
INSERT INTO `Bike_Showroom`.`Brakes` (`Model_num`, `Front/Rear`, `Brake_type`, `Brake_size`) VALUES (022, 'Front', 'Petal disc (opt) /  Drum', '200 mm/130 mm');
INSERT INTO `Bike_Showroom`.`Brakes` (`Model_num`, `Front/Rear`, `Brake_type`, `Brake_size`) VALUES (022, 'Rear', 'Drum', '130 mm');
INSERT INTO `Bike_Showroom`.`Brakes` (`Model_num`, `Front/Rear`, `Brake_type`, `Brake_size`) VALUES (023, 'Front', 'Drum', '130 mm');
INSERT INTO `Bike_Showroom`.`Brakes` (`Model_num`, `Front/Rear`, `Brake_type`, `Brake_size`) VALUES (023, 'Rear', 'Drum', '110 mm');
INSERT INTO `Bike_Showroom`.`Brakes` (`Model_num`, `Front/Rear`, `Brake_type`, `Brake_size`) VALUES (024, 'Front', 'Disc/ Drum', '200 mm/130 mm ');
INSERT INTO `Bike_Showroom`.`Brakes` (`Model_num`, `Front/Rear`, `Brake_type`, `Brake_size`) VALUES (024, 'Rear', 'Drum', '130 mm');
INSERT INTO `Bike_Showroom`.`Brakes` (`Model_num`, `Front/Rear`, `Brake_type`, `Brake_size`) VALUES (025, 'Front', 'Drum', '130 mm');
INSERT INTO `Bike_Showroom`.`Brakes` (`Model_num`, `Front/Rear`, `Brake_type`, `Brake_size`) VALUES (025, 'Rear', 'Drum', '110 mm');
INSERT INTO `Bike_Showroom`.`Brakes` (`Model_num`, `Front/Rear`, `Brake_type`, `Brake_size`) VALUES (031, 'Front', NULL, NULL);
INSERT INTO `Bike_Showroom`.`Brakes` (`Model_num`, `Front/Rear`, `Brake_type`, `Brake_size`) VALUES (031, 'Rear', NULL, NULL);
INSERT INTO `Bike_Showroom`.`Brakes` (`Model_num`, `Front/Rear`, `Brake_type`, `Brake_size`) VALUES (041, 'Front', 'Tripe Petal disc with two - piston calipers', 'Dual 300 mm');
INSERT INTO `Bike_Showroom`.`Brakes` (`Model_num`, `Front/Rear`, `Brake_type`, `Brake_size`) VALUES (041, 'Rear', 'Petal disc with single piston caliper', 'Single 220 mm');
INSERT INTO `Bike_Showroom`.`Brakes` (`Model_num`, `Front/Rear`, `Brake_type`, `Brake_size`) VALUES (042, 'Front', 'Petal disc with single balanced actuation dual-piston', 'Single 290 mm');
INSERT INTO `Bike_Showroom`.`Brakes` (`Model_num`, `Front/Rear`, `Brake_type`, `Brake_size`) VALUES (042, 'Rear', 'Petal disc with Dual-piston', 'Single 220 mm');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Bike_Showroom`.`Tyre`
-- -----------------------------------------------------
START TRANSACTION;
USE `Bike_Showroom`;
INSERT INTO `Bike_Showroom`.`Tyre` (`Model_num`, `Front`, `Rear`) VALUES (001, 'Tubetype Unidirectional - 90 / 90 x 17\"', 'Tubetype Unidirectional - 130 / 90 x 15\"');
INSERT INTO `Bike_Showroom`.`Tyre` (`Model_num`, `Front`, `Rear`) VALUES (011, '100/80 - 17 - Tubeless', '130/70 - 17 - Tubeless');
INSERT INTO `Bike_Showroom`.`Tyre` (`Model_num`, `Front`, `Rear`) VALUES (012, '90/90 - 17 - Tubeless', '120/80 - 17 - Tubeless');
INSERT INTO `Bike_Showroom`.`Tyre` (`Model_num`, `Front`, `Rear`) VALUES (013, '90/90 - 17 - Tubeless', '120/80 - 17 - Tubeless');
INSERT INTO `Bike_Showroom`.`Tyre` (`Model_num`, `Front`, `Rear`) VALUES (014, '2.75 - 17', '100 / 90 - 17');
INSERT INTO `Bike_Showroom`.`Tyre` (`Model_num`, `Front`, `Rear`) VALUES (015, '2.75 - 17', '100 / 90 - 17');
INSERT INTO `Bike_Showroom`.`Tyre` (`Model_num`, `Front`, `Rear`) VALUES (021, 'New design alloy / 2.75 X 17” 41P Tubed', 'New design alloy / 3.00 X 17” 50P Tubed');
INSERT INTO `Bike_Showroom`.`Tyre` (`Model_num`, `Front`, `Rear`) VALUES (022, '2.75 x 17, 41P', '3.00 x 17, 50P');
INSERT INTO `Bike_Showroom`.`Tyre` (`Model_num`, `Front`, `Rear`) VALUES (023, 'New design alloy / 2.75 X 17” 41P Tubed', '3.00X17,50P,bidirectional');
INSERT INTO `Bike_Showroom`.`Tyre` (`Model_num`, `Front`, `Rear`) VALUES (024, '2.75 x 17\"', '3.00 x 17\"');
INSERT INTO `Bike_Showroom`.`Tyre` (`Model_num`, `Front`, `Rear`) VALUES (025, '2.75 X 17\" (Unidirectional)', '3.00 X 17\" (Unidirectional)');
INSERT INTO `Bike_Showroom`.`Tyre` (`Model_num`, `Front`, `Rear`) VALUES (031, '2.75*17\", 41 P', '3.00*17\", 50 P');
INSERT INTO `Bike_Showroom`.`Tyre` (`Model_num`, `Front`, `Rear`) VALUES (041, 'Size 120 / 70-17 ZRI7M / C (58W)', 'Size 160 / 60 - 17 ZRI7M / C (69W)');
INSERT INTO `Bike_Showroom`.`Tyre` (`Model_num`, `Front`, `Rear`) VALUES (042, 'Size 110/ 70-17 M/C (54W)', 'Size 140 / 70 - 17 M / C (66S)');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Bike_Showroom`.`Fuel_Tank`
-- -----------------------------------------------------
START TRANSACTION;
USE `Bike_Showroom`;
INSERT INTO `Bike_Showroom`.`Fuel_Tank` (`Model_num`, `Total_litres`) VALUES (001, '14 litres full (3.4 litres reserve)');
INSERT INTO `Bike_Showroom`.`Fuel_Tank` (`Model_num`, `Total_litres`) VALUES (011, '12 litres');
INSERT INTO `Bike_Showroom`.`Fuel_Tank` (`Model_num`, `Total_litres`) VALUES (012, '15 litres');
INSERT INTO `Bike_Showroom`.`Fuel_Tank` (`Model_num`, `Total_litres`) VALUES (013, '15 litres');
INSERT INTO `Bike_Showroom`.`Fuel_Tank` (`Model_num`, `Total_litres`) VALUES (014, '15 litres');
INSERT INTO `Bike_Showroom`.`Fuel_Tank` (`Model_num`, `Total_litres`) VALUES (015, '8 litres');
INSERT INTO `Bike_Showroom`.`Fuel_Tank` (`Model_num`, `Total_litres`) VALUES (021, '10 litres');
INSERT INTO `Bike_Showroom`.`Fuel_Tank` (`Model_num`, `Total_litres`) VALUES (022, '10 litres full (3.5 litres reserve)');
INSERT INTO `Bike_Showroom`.`Fuel_Tank` (`Model_num`, `Total_litres`) VALUES (023, '10 litres full (3.5 litres reserve)');
INSERT INTO `Bike_Showroom`.`Fuel_Tank` (`Model_num`, `Total_litres`) VALUES (024, '8 litre full(2.3 litres, usable reserve 1.5 litres)');
INSERT INTO `Bike_Showroom`.`Fuel_Tank` (`Model_num`, `Total_litres`) VALUES (025, '8 litres full (2.3 litres reserve)');
INSERT INTO `Bike_Showroom`.`Fuel_Tank` (`Model_num`, `Total_litres`) VALUES (031, '13 litres (Reserve : 2 litres)');
INSERT INTO `Bike_Showroom`.`Fuel_Tank` (`Model_num`, `Total_litres`) VALUES (041, '16 litres');
INSERT INTO `Bike_Showroom`.`Fuel_Tank` (`Model_num`, `Total_litres`) VALUES (042, '17 litres');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Bike_Showroom`.`Electricals`
-- -----------------------------------------------------
START TRANSACTION;
USE `Bike_Showroom`;
INSERT INTO `Bike_Showroom`.`Electricals` (`Model_num`, `Head_lamp`, `System`, `Battery`) VALUES (001, '60 / 55W', NULL, '12V, 9Ah');
INSERT INTO `Bike_Showroom`.`Electricals` (`Model_num`, `Head_lamp`, `System`, `Battery`) VALUES (011, 'H4 Bulb 55/60 W Bulb with 2 Pilot Lamps', '12V Full DC MF', NULL);
INSERT INTO `Bike_Showroom`.`Electricals` (`Model_num`, `Head_lamp`, `System`, `Battery`) VALUES (012, 'Low - projector lamp 55w, High - Ellipsodial lamp 55w', '12 V Full DC', NULL);
INSERT INTO `Bike_Showroom`.`Electricals` (`Model_num`, `Head_lamp`, `System`, `Battery`) VALUES (013, '35/35 W with 2 pilot lamps', '12 V Full DC', NULL);
INSERT INTO `Bike_Showroom`.`Electricals` (`Model_num`, `Head_lamp`, `System`, `Battery`) VALUES (014, '35/35 W with 2 pilot lamps', '12 V Full DC', NULL);
INSERT INTO `Bike_Showroom`.`Electricals` (`Model_num`, `Head_lamp`, `System`, `Battery`) VALUES (015, '35/35 W with 2 pilot lamps', '12 V Full DC', NULL);
INSERT INTO `Bike_Showroom`.`Electricals` (`Model_num`, `Head_lamp`, `System`, `Battery`) VALUES (021, 'HS1 35/35W', 'DC Ignition', 'Low Maintenance Battery');
INSERT INTO `Bike_Showroom`.`Electricals` (`Model_num`, `Head_lamp`, `System`, `Battery`) VALUES (022, 'DC(flicker-free)', NULL, 'Low Maintenance Battery');
INSERT INTO `Bike_Showroom`.`Electricals` (`Model_num`, `Head_lamp`, `System`, `Battery`) VALUES (023, 'DC(flicker-free)', NULL, 'Low Maintenance Battery');
INSERT INTO `Bike_Showroom`.`Electricals` (`Model_num`, `Head_lamp`, `System`, `Battery`) VALUES (024, '169 mm12 V, 35/35 W', NULL, 'Low Maintenance Battery');
INSERT INTO `Bike_Showroom`.`Electricals` (`Model_num`, `Head_lamp`, `System`, `Battery`) VALUES (025, '35 / 35 W', NULL, 'Low Maintenance Battery');
INSERT INTO `Bike_Showroom`.`Electricals` (`Model_num`, `Head_lamp`, `System`, `Battery`) VALUES (031, '12V, 35W/35W (HS1)', '12V AC+DC', NULL);
INSERT INTO `Bike_Showroom`.`Electricals` (`Model_num`, `Head_lamp`, `System`, `Battery`) VALUES (041, NULL, NULL, NULL);
INSERT INTO `Bike_Showroom`.`Electricals` (`Model_num`, `Head_lamp`, `System`, `Battery`) VALUES (042, NULL, NULL, NULL);

COMMIT;

