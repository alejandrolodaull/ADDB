-- MySQL Script generated by MySQL Workbench
-- lun 17 dic 2018 22:32:12 WET
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`vivero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`vivero` (
  `coordenadas` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`coordenadas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`zona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`zona` (
  `nombre` VARCHAR(45) NOT NULL,
  `coordenadas_v` VARCHAR(45) NOT NULL,
  `productividad` INT(4) NULL,
  PRIMARY KEY (`nombre`, `coordenadas_v`),
  INDEX `fk_zona_vivero_idx` (`coordenadas_v` ASC),
  CONSTRAINT `fk_zona_vivero`
    FOREIGN KEY (`coordenadas_v`)
    REFERENCES `mydb`.`vivero` (`coordenadas`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`producto` (
  `codigo` INT NOT NULL,
  `stock` INT NOT NULL,
  `precio` DECIMAL NOT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`empleado` (
  `dni` VARCHAR(20) NOT NULL,
  `Fecha_ini` DATE NOT NULL,
  `css` VARCHAR(40) NOT NULL,
  `sueldo` DECIMAL NOT NULL,
  `nombre_z` VARCHAR(45) NOT NULL,
  `coordenadas_v` VARCHAR(45) NOT NULL,
  `ventas` INT NULL,
  `fecha_fin` DATE NULL,
  PRIMARY KEY (`dni`, `Fecha_ini`),
  INDEX `Zona_idx` (`nombre_z` ASC, `coordenadas_v` ASC),
  UNIQUE INDEX `css_UNIQUE` (`css` ASC),
  CONSTRAINT `Zona`
    FOREIGN KEY (`nombre_z` , `coordenadas_v`)
    REFERENCES `mydb`.`zona` (`nombre` , `coordenadas_v`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cliente` (
  `dni` VARCHAR(20) NOT NULL,
  `cod_cliente` INT NOT NULL,
  `total_mensual` INT NOT NULL,
  `bonificacion` INT NULL,
  PRIMARY KEY (`dni`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`producto_zona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`producto_zona` (
  `codigo` INT NOT NULL,
  `coordenadas_v` VARCHAR(45) NOT NULL,
  `nombre_z` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codigo`, `coordenadas_v`),
  INDEX `fk_zona_idx` (`nombre_z` ASC, `coordenadas_v` ASC),
  CONSTRAINT `fk_producto`
    FOREIGN KEY (`codigo`)
    REFERENCES `mydb`.`producto` (`codigo`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_zona`
    FOREIGN KEY (`nombre_z` , `coordenadas_v`)
    REFERENCES `mydb`.`zona` (`nombre` , `coordenadas_v`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cliente_producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cliente_producto` (
  `dni_cliente` VARCHAR(20) NOT NULL,
  `fecha` DATETIME NOT NULL,
  `codigo` INT NOT NULL,
  `dni_empleado` VARCHAR(45) NOT NULL,
  `fecha_ini_empleado` DATE NOT NULL,
  PRIMARY KEY (`dni_cliente`, `fecha`),
  INDEX `fk_producto_idx` (`codigo` ASC),
  INDEX `fk_empleado_idx` (`dni_empleado` ASC, `fecha_ini_empleado` ASC),
  CONSTRAINT `fk_cliente`
    FOREIGN KEY (`dni_cliente`)
    REFERENCES `mydb`.`cliente` (`dni`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_producto`
    FOREIGN KEY (`codigo`)
    REFERENCES `mydb`.`producto` (`codigo`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_empleado`
    FOREIGN KEY (`dni_empleado` , `fecha_ini_empleado`)
    REFERENCES `mydb`.`empleado` (`dni` , `Fecha_ini`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `mydb`.`vivero`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`vivero` (`coordenadas`, `nombre`) VALUES ('(2,2)', 'Guamasa');
INSERT INTO `mydb`.`vivero` (`coordenadas`, `nombre`) VALUES ('(1,2)', 'Santa Cruz');
INSERT INTO `mydb`.`vivero` (`coordenadas`, `nombre`) VALUES ('(1,1)', 'La Laguna');
INSERT INTO `mydb`.`vivero` (`coordenadas`, `nombre`) VALUES ('(3,3)', 'Tacoronte');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`zona`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`zona` (`nombre`, `coordenadas_v`, `productividad`) VALUES ('exterior', '(1,1)', );
INSERT INTO `mydb`.`zona` (`nombre`, `coordenadas_v`, `productividad`) VALUES ('interior', '(1,1)', );
INSERT INTO `mydb`.`zona` (`nombre`, `coordenadas_v`, `productividad`) VALUES ('exterior', '(3,3)', );
INSERT INTO `mydb`.`zona` (`nombre`, `coordenadas_v`, `productividad`) VALUES ('interior', '(3,3)', );

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`producto`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`producto` (`codigo`, `stock`, `precio`) VALUES (1, 20, 27,56);
INSERT INTO `mydb`.`producto` (`codigo`, `stock`, `precio`) VALUES (2, 40, 12,8);
INSERT INTO `mydb`.`producto` (`codigo`, `stock`, `precio`) VALUES (3, 6, 3,99);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`empleado`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`empleado` (`dni`, `Fecha_ini`, `css`, `sueldo`, `nombre_z`, `coordenadas_v`, `ventas`, `fecha_fin`) VALUES ('515', '1/1/2017', '123', 1000, 'exterior', '(3,3)', 45, '1/1/2018');
INSERT INTO `mydb`.`empleado` (`dni`, `Fecha_ini`, `css`, `sueldo`, `nombre_z`, `coordenadas_v`, `ventas`, `fecha_fin`) VALUES ('516', '1/6/2017', '124', 1000, 'interior', '(3,3)', 13, '31/12/2018');
INSERT INTO `mydb`.`empleado` (`dni`, `Fecha_ini`, `css`, `sueldo`, `nombre_z`, `coordenadas_v`, `ventas`, `fecha_fin`) VALUES ('517', '1/2/2018', '125', 1000, 'interior', '(1,1)', 46, '1/8/2018');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`cliente`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`cliente` (`dni`, `cod_cliente`, `total_mensual`, `bonificacion`) VALUES ('511', 11, 25,13, NULL);
INSERT INTO `mydb`.`cliente` (`dni`, `cod_cliente`, `total_mensual`, `bonificacion`) VALUES ('512', 12, 12,45, NULL);
INSERT INTO `mydb`.`cliente` (`dni`, `cod_cliente`, `total_mensual`, `bonificacion`) VALUES ('513', 13, 2,00, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`producto_zona`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`producto_zona` (`codigo`, `coordenadas_v`, `nombre_z`) VALUES (1, '(3,3)', 'interior');
INSERT INTO `mydb`.`producto_zona` (`codigo`, `coordenadas_v`, `nombre_z`) VALUES (2, '(3,3)', 'exterior');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`cliente_producto`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`cliente_producto` (`dni_cliente`, `fecha`, `codigo`, `dni_empleado`, `fecha_ini_empleado`) VALUES ('511', '2017-12-31 23:30:00', 1, '515', '1/1/2017');
INSERT INTO `mydb`.`cliente_producto` (`dni_cliente`, `fecha`, `codigo`, `dni_empleado`, `fecha_ini_empleado`) VALUES ('511', '2017-12-31 23:59:59', 1, '515', '1/1/2017');

COMMIT;

