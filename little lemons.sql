-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema litte_lemon_report
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema litte_lemon_report
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `litte_lemon_report` ;
USE `litte_lemon_report` ;

-- -----------------------------------------------------
-- Table `litte_lemon_report`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `litte_lemon_report`.`Customers` (
  `CustomerID` INT NOT NULL AUTO_INCREMENT,
  `Fullname` VARCHAR(45) NULL,
  `ContactNumber` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `litte_lemon_report`.`Address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `litte_lemon_report`.`Address` (
  `AddressID` INT NOT NULL AUTO_INCREMENT,
  `Streets` VARCHAR(45) NULL,
  `PostalCode` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `State` VARCHAR(45) NULL,
  `Country` VARCHAR(45) NULL,
  PRIMARY KEY (`AddressID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `litte_lemon_report`.`Shipping`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `litte_lemon_report`.`Shipping` (
  `ShipID` INT NOT NULL AUTO_INCREMENT,
  `ShipDate` VARCHAR(45) NULL,
  `ShipMode` VARCHAR(45) NULL,
  `ShipCost` VARCHAR(45) NULL,
  `AddressID` INT NOT NULL,
  PRIMARY KEY (`ShipID`),
  INDEX `fk_Shipping_Address1_idx` (`AddressID` ASC) VISIBLE,
  CONSTRAINT `fk_Shipping_Address1`
    FOREIGN KEY (`AddressID`)
    REFERENCES `litte_lemon_report`.`Address` (`AddressID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `litte_lemon_report`.`Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `litte_lemon_report`.`Products` (
  `ProductID` INT NOT NULL AUTO_INCREMENT,
  `ProductName` VARCHAR(45) NULL,
  `Amount` INT NULL,
  `Subcategory` VARCHAR(45) NULL,
  `price` INT NULL,
  PRIMARY KEY (`ProductID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `litte_lemon_report`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `litte_lemon_report`.`Orders` (
  `OrderID` INT NOT NULL AUTO_INCREMENT,
  `CustomerID` INT NOT NULL,
  `DeliveryID` INT NULL,
  `TotalCost` DECIMAL NULL,
  `OrderPeriority` INT NULL,
  `ShipID` INT NOT NULL,
  `ProductID` INT NOT NULL,
  INDEX `fk_table2_Customers_idx` (`CustomerID` ASC) VISIBLE,
  PRIMARY KEY (`OrderID`),
  INDEX `fk_Orders_Shipping1_idx` (`ShipID` ASC) VISIBLE,
  INDEX `fk_Orders_Products1_idx` (`ProductID` ASC) VISIBLE,
  CONSTRAINT `fk_table2_Customers`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `litte_lemon_report`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Shipping1`
    FOREIGN KEY (`ShipID`)
    REFERENCES `litte_lemon_report`.`Shipping` (`ShipID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Products1`
    FOREIGN KEY (`ProductID`)
    REFERENCES `litte_lemon_report`.`Products` (`ProductID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
