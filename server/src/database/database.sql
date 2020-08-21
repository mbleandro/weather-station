-- MySQL Script generated by MySQL Workbench
-- qua 19 ago 2020 21:21:51
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema weather-station
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `weather-station` ;

-- -----------------------------------------------------
-- Schema weather-station
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `weather-station` ;
USE `weather-station` ;

-- -----------------------------------------------------
-- Table `weather-station`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `weather-station`.`Users` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `nickname` VARCHAR(50) NOT NULL,
  `password` VARCHAR(50) NOT NULL,
  `createdAt` DATETIME NOT NULL DEFAULT NOW(),
  `updatedAt` DATETIME NOT NULL DEFAULT NOW(),
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nickname_UNIQUE` (`nickname` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `weather-station`.`Stations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `weather-station`.`Stations` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `userId` BIGINT NOT NULL,
  `createdAt` DATETIME NOT NULL DEFAULT NOW(),
  `updatedAt` DATETIME NOT NULL DEFAULT NOW(),
  `lat` FLOAT NULL,
  `lon` FLOAT NULL,
  `accuracy` FLOAT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  INDEX `fk_Stations_Users_idx` (`userId` ASC),
  CONSTRAINT `fk_Stations_Users`
    FOREIGN KEY (`userId`)
    REFERENCES `weather-station`.`Users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `weather-station`.`Values`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `weather-station`.`Values` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `stationId` BIGINT NOT NULL,
  `temperature` FLOAT NOT NULL,
  `createdAt` DATETIME NOT NULL DEFAULT NOW(),
  `updatedAt` DATETIME NOT NULL DEFAULT NOW(),
  PRIMARY KEY (`id`),
  INDEX `fk_Values_Stations1_idx` (`stationId` ASC),
  CONSTRAINT `fk_Values_Stations1`
    FOREIGN KEY (`stationId`)
    REFERENCES `weather-station`.`Stations` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;