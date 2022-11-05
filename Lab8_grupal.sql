-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Lab8
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Lab8
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Lab8` DEFAULT CHARACTER SET utf8 ;
USE `Lab8` ;

-- -----------------------------------------------------
-- Table `Lab8`.`claseheroe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lab8`.`claseheroe` (
  `idclase` INT NOT NULL,
  `clase` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idclase`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Lab8`.`elemento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lab8`.`elemento` (
  `idelemento` INT NOT NULL AUTO_INCREMENT,
  `elemento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idelemento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Lab8`.`genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lab8`.`genero` (
  `idgenero` INT NOT NULL,
  `genero` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`idgenero`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Lab8`.`heroes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lab8`.`heroes` (
  `idHeroes` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(10) NOT NULL,
  `edad` INT NOT NULL,
  `nivel` INT NOT NULL,
  `puntosDeExperiencia` DOUBLE NOT NULL,
  `pareja` INT NULL DEFAULT NULL,
  `genero_idgenero` INT NOT NULL,
  `claseHeroe_idclase` INT NOT NULL,
  `ataque` INT NOT NULL,
  PRIMARY KEY (`idHeroes`),
  INDEX `fk_Heroes_Heroes1_idx` (`pareja` ASC) VISIBLE,
  INDEX `fk_Heroes_genero1_idx` (`genero_idgenero` ASC) VISIBLE,
  INDEX `fk_Heroes_claseHeroe1_idx` (`claseHeroe_idclase` ASC) VISIBLE,
  CONSTRAINT `fk_Heroes_claseHeroe1`
    FOREIGN KEY (`claseHeroe_idclase`)
    REFERENCES `Lab8`.`claseheroe` (`idclase`),
  CONSTRAINT `fk_Heroes_genero1`
    FOREIGN KEY (`genero_idgenero`)
    REFERENCES `Lab8`.`genero` (`idgenero`),
  CONSTRAINT `fk_Heroes_Heroes1`
    FOREIGN KEY (`pareja`)
    REFERENCES `Lab8`.`heroes` (`idHeroes`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Lab8`.`objeto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lab8`.`objeto` (
  `idobjeto` INT NOT NULL AUTO_INCREMENT,
  `objeto` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `peso` DECIMAL NOT NULL,
  PRIMARY KEY (`idobjeto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Lab8`.`inventario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lab8`.`inventario` (
  `idinventario` INT NOT NULL,
  `cantidad` INT NOT NULL,
  `objeto_idobjeto` INT NOT NULL,
  `heroes_idHeroes` INT NOT NULL,
  PRIMARY KEY (`idinventario`),
  INDEX `fk_inventario_objeto1_idx` (`objeto_idobjeto` ASC) VISIBLE,
  INDEX `fk_inventario_heroes1_idx` (`heroes_idHeroes` ASC) VISIBLE,
  CONSTRAINT `fk_inventario_objeto1`
    FOREIGN KEY (`objeto_idobjeto`)
    REFERENCES `Lab8`.`objeto` (`idobjeto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventario_heroes1`
    FOREIGN KEY (`heroes_idHeroes`)
    REFERENCES `Lab8`.`heroes` (`idHeroes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Lab8`.`clase_enemigos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lab8`.`clase_enemigos` (
  `idclase_enemigos` INT NOT NULL,
  `clase_enemigos` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idclase_enemigos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Lab8`.`enemigos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lab8`.`enemigos` (
  `idenemigos` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `ataque` INT NOT NULL,
  `exp_x_derrota` INT NOT NULL,
  `genero_idgenero` INT NOT NULL,
  `objeto_idobjeto` INT NOT NULL,
  `clase_enemigos_idclase_enemigos` INT NOT NULL,
  `probabilidad_x_objeto` INT NOT NULL,
  PRIMARY KEY (`idenemigos`),
  INDEX `fk_enemigos_genero1_idx` (`genero_idgenero` ASC) VISIBLE,
  INDEX `fk_enemigos_objeto1_idx` (`objeto_idobjeto` ASC) VISIBLE,
  INDEX `fk_enemigos_clase_enemigos1_idx` (`clase_enemigos_idclase_enemigos` ASC) VISIBLE,
  CONSTRAINT `fk_enemigos_genero1`
    FOREIGN KEY (`genero_idgenero`)
    REFERENCES `Lab8`.`genero` (`idgenero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_enemigos_objeto1`
    FOREIGN KEY (`objeto_idobjeto`)
    REFERENCES `Lab8`.`objeto` (`idobjeto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_enemigos_clase_enemigos1`
    FOREIGN KEY (`clase_enemigos_idclase_enemigos`)
    REFERENCES `Lab8`.`clase_enemigos` (`idclase_enemigos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Lab8`.`clase_enemigos_has_elemento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lab8`.`clase_enemigos_has_elemento` (
  `clase_enemigos_idclase_enemigos` INT NOT NULL,
  `elemento_idelemento` INT NOT NULL,
  `probabilidad_de_daño` DECIMAL NOT NULL,
  PRIMARY KEY (`clase_enemigos_idclase_enemigos`, `elemento_idelemento`),
  INDEX `fk_clase_enemigos_has_elemento_elemento1_idx` (`elemento_idelemento` ASC) VISIBLE,
  INDEX `fk_clase_enemigos_has_elemento_clase_enemigos1_idx` (`clase_enemigos_idclase_enemigos` ASC) VISIBLE,
  CONSTRAINT `fk_clase_enemigos_has_elemento_clase_enemigos1`
    FOREIGN KEY (`clase_enemigos_idclase_enemigos`)
    REFERENCES `Lab8`.`clase_enemigos` (`idclase_enemigos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_clase_enemigos_has_elemento_elemento1`
    FOREIGN KEY (`elemento_idelemento`)
    REFERENCES `Lab8`.`elemento` (`idelemento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Lab8`.`hechizos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lab8`.`hechizos` (
  `idhechizos` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(15) NOT NULL,
  `potencia` INT NOT NULL,
  `precisión` INT NOT NULL,
  `nivel_aprendizaje` INT NULL,
  `hechizos_idhechizos` INT NULL,
  `elemento_idelemento` INT NOT NULL,
  PRIMARY KEY (`idhechizos`),
  INDEX `fk_hechizos_hechizos1_idx` (`hechizos_idhechizos` ASC) VISIBLE,
  INDEX `fk_hechizos_elemento1_idx` (`elemento_idelemento` ASC) VISIBLE,
  CONSTRAINT `fk_hechizos_hechizos1`
    FOREIGN KEY (`hechizos_idhechizos`)
    REFERENCES `Lab8`.`hechizos` (`idhechizos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_hechizos_elemento1`
    FOREIGN KEY (`elemento_idelemento`)
    REFERENCES `Lab8`.`elemento` (`idelemento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Lab8`.`heroes_has_heroes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lab8`.`heroes_has_heroes` (
  `heroes_idHeroes` INT NOT NULL,
  `heroes_idHeroes1` INT NOT NULL,
  PRIMARY KEY (`heroes_idHeroes`, `heroes_idHeroes1`),
  INDEX `fk_heroes_has_heroes_heroes2_idx` (`heroes_idHeroes1` ASC) VISIBLE,
  INDEX `fk_heroes_has_heroes_heroes1_idx` (`heroes_idHeroes` ASC) VISIBLE,
  CONSTRAINT `fk_heroes_has_heroes_heroes1`
    FOREIGN KEY (`heroes_idHeroes`)
    REFERENCES `Lab8`.`heroes` (`idHeroes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_heroes_has_heroes_heroes2`
    FOREIGN KEY (`heroes_idHeroes1`)
    REFERENCES `Lab8`.`heroes` (`idHeroes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
