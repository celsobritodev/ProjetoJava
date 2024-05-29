-- MySQL Script generated by MySQL Workbench
-- Tue May 28 18:49:09 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema aulajava
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema aulajava
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `aulajava` DEFAULT CHARACTER SET utf8 ;
USE `aulajava` ;

-- -----------------------------------------------------
-- Table `aulajava`.`menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulajava`.`menu` (
  `idMenu` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `link` VARCHAR(100) NOT NULL,
  `icone` VARCHAR(45) NULL,
  `exibir` INT NOT NULL,
  PRIMARY KEY (`idMenu`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aulajava`.`perfil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulajava`.`perfil` (
  `idPerfil` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPerfil`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aulajava`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulajava`.`usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `login` VARCHAR(10) NOT NULL,
  `senha` VARCHAR(10) NOT NULL,
  `status` INT NOT NULL,
  `idPerfil` INT NOT NULL,
  PRIMARY KEY (`idUsuario`),
  INDEX `fk_usuario_perfil1_idx` (`idPerfil` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_perfil1`
    FOREIGN KEY (`idPerfil`)
    REFERENCES `aulajava`.`perfil` (`idPerfil`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aulajava`.`menu_perfil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulajava`.`menu_perfil` (
  `idMenu` INT NOT NULL,
  `idPerfil` INT NOT NULL,
  PRIMARY KEY (`idMenu`, `idPerfil`),
  INDEX `fk_menu_has_perfil_perfil1_idx` (`idPerfil` ASC) VISIBLE,
  CONSTRAINT `fk_menu_has_perfil_menu`
    FOREIGN KEY (`idMenu`)
    REFERENCES `aulajava`.`menu` (`idMenu`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_menu_has_perfil_perfil1`
    FOREIGN KEY (`idPerfil`)
    REFERENCES `aulajava`.`perfil` (`idPerfil`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aulajava`.`produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulajava`.`produto` (
  `idProduto` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `qtd` INT NOT NULL,
  `valor` DOUBLE NOT NULL,
  PRIMARY KEY (`idProduto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aulajava`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulajava`.`cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `nomeRazao` VARCHAR(45) NOT NULL,
  `cpfCnpj` VARCHAR(45) NOT NULL,
  `rgIe` VARCHAR(45) NOT NULL,
  `dataNascAbertura` DATE NOT NULL,
  `tipo` INT NOT NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aulajava`.`venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulajava`.`venda` (
  `idVenda` INT NOT NULL AUTO_INCREMENT,
  `dataVenda` DATE NOT NULL,
  `valorTotal` DOUBLE NOT NULL,
  `idCliente` INT NOT NULL,
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`idVenda`),
  INDEX `fk_venda_cliente1_idx` (`idCliente` ASC) VISIBLE,
  INDEX `fk_venda_usuario1_idx` (`idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_venda_cliente1`
    FOREIGN KEY (`idCliente`)
    REFERENCES `aulajava`.`cliente` (`idCliente`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_venda_usuario1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `aulajava`.`usuario` (`idUsuario`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aulajava`.`venda_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulajava`.`venda_produto` (
  `idVenda` INT NOT NULL,
  `idProduto` INT NOT NULL,
  `qtdVendida` INT NOT NULL,
  `valor` DOUBLE NOT NULL,
  PRIMARY KEY (`idVenda`, `idProduto`),
  INDEX `fk_venda_has_produto_produto1_idx` (`idProduto` ASC) VISIBLE,
  INDEX `fk_venda_has_produto_venda1_idx` (`idVenda` ASC) VISIBLE,
  CONSTRAINT `fk_venda_has_produto_venda1`
    FOREIGN KEY (`idVenda`)
    REFERENCES `aulajava`.`venda` (`idVenda`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_venda_has_produto_produto1`
    FOREIGN KEY (`idProduto`)
    REFERENCES `aulajava`.`produto` (`idProduto`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
