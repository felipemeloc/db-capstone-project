-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDM
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDM
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDM` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDM` ;

-- -----------------------------------------------------
-- Table `LittleLemonDM`.`CustomerDetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`CustomerDetails` (
  `idCustomer` INT NOT NULL,
  `Name` VARCHAR(255) NOT NULL,
  `ContactDetails` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idCustomer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Bookings` (
  `idBooking` INT NOT NULL,
  `idCustomer` INT NOT NULL,
  `BookingDate` DATETIME NOT NULL,
  `TableNumber` INT NOT NULL,
  PRIMARY KEY (`idBooking`),
  INDEX `idCustomer_idx` (`idCustomer` ASC) VISIBLE,
  CONSTRAINT `idCustomer`
    FOREIGN KEY (`idCustomer`)
    REFERENCES `LittleLemonDM`.`CustomerDetails` (`idCustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`MenuItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`MenuItems` (
  `idMenuItem` INT NOT NULL,
  `CourseName` VARCHAR(255) NOT NULL,
  `StarterName` VARCHAR(255) NOT NULL,
  `DessertName` VARCHAR(255) NOT NULL,
  `DrinkName` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idMenuItem`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Menu` (
  `idMenu` INT NOT NULL,
  `idMenuItem` INT NOT NULL,
  `MenuName` VARCHAR(255) NOT NULL,
  `Couisine` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idMenu`),
  INDEX `idMenuItem_idx` (`idMenuItem` ASC) VISIBLE,
  CONSTRAINT `idMenuItem`
    FOREIGN KEY (`idMenuItem`)
    REFERENCES `LittleLemonDM`.`MenuItems` (`idMenuItem`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`StaffInformation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`StaffInformation` (
  `idStaff` INT NOT NULL,
  `Name` VARCHAR(255) NOT NULL,
  `Role` VARCHAR(255) NOT NULL,
  `Salary` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`idStaff`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`OrdersDeliveryStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`OrdersDeliveryStatus` (
  `idOrdersDeliveryStatus` INT NOT NULL,
  `Status` VARCHAR(45) NULL,
  `DeliveryDate` DATETIME NULL,
  PRIMARY KEY (`idOrdersDeliveryStatus`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Orders` (
  `idOrder` INT NOT NULL,
  `idBooking` INT NOT NULL,
  `idMenu` INT NOT NULL,
  `idStaff` INT NOT NULL,
  `idOrdersDeliveryStatus` INT NULL,
  `Quantity` DECIMAL(10,2) NOT NULL,
  `TotalCost` DECIMAL(10,2) NOT NULL,
  `OrderDate` DATETIME NOT NULL,
  PRIMARY KEY (`idOrder`),
  INDEX `idBooking_idx` (`idBooking` ASC) VISIBLE,
  INDEX `idMenu_idx` (`idMenu` ASC) VISIBLE,
  INDEX `idStaff_idx` (`idStaff` ASC) VISIBLE,
  INDEX `idOrdersDeliveryStatus_idx` (`idOrdersDeliveryStatus` ASC) VISIBLE,
  CONSTRAINT `idBooking`
    FOREIGN KEY (`idBooking`)
    REFERENCES `LittleLemonDM`.`Bookings` (`idBooking`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idMenu`
    FOREIGN KEY (`idMenu`)
    REFERENCES `LittleLemonDM`.`Menu` (`idMenu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idStaff`
    FOREIGN KEY (`idStaff`)
    REFERENCES `LittleLemonDM`.`StaffInformation` (`idStaff`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idOrdersDeliveryStatus`
    FOREIGN KEY (`idOrdersDeliveryStatus`)
    REFERENCES `LittleLemonDM`.`OrdersDeliveryStatus` (`idOrdersDeliveryStatus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
