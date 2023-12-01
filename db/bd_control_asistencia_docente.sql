-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema bd_control_asistencia_docente
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bd_control_asistencia_docente
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bd_control_asistencia_docente` DEFAULT CHARACTER SET utf8 ;
USE `bd_control_asistencia_docente` ;

-- -----------------------------------------------------
-- Table `bd_control_asistencia_docente`.`cargos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_control_asistencia_docente`.`cargos` (
  `id_cargo` INT NOT NULL AUTO_INCREMENT,
  `tipo_de_cargo` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_cargo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_control_asistencia_docente`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_control_asistencia_docente`.`usuarios` (
  `id_usuario` INT NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `clave` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE INDEX `uq_usuario` (`nombre` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_control_asistencia_docente`.`personales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_control_asistencia_docente`.`personales` (
  `id_personal` INT NOT NULL AUTO_INCREMENT,
  `cargo_id` INT NOT NULL,
  `usuario_id` INT NULL,
  `nombre` VARCHAR(30) NOT NULL,
  `apellido` VARCHAR(30) NOT NULL,
  `documento` VARCHAR(8) NOT NULL,
  `ficha_censal` VARCHAR(6) NULL,
  `estado` TINYINT NOT NULL,
  PRIMARY KEY (`id_personal`),
  INDEX `fk_cargo` (`cargo_id` ASC) VISIBLE,
  INDEX `fk_usuario` (`usuario_id` ASC) INVISIBLE,
  CONSTRAINT `fk_cargo`
    FOREIGN KEY (`cargo_id`)
    REFERENCES `bd_control_asistencia_docente`.`cargos` (`id_cargo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `bd_control_asistencia_docente`.`usuarios` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_control_asistencia_docente`.`planilla_asistencia_personal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_control_asistencia_docente`.`planilla_asistencia_personal` (
  `id_planilla_asistencia_personal` INT NOT NULL AUTO_INCREMENT,
  `personal_id` INT NOT NULL,
  `fecha_hora_entrada` DATETIME NOT NULL,
  `fecha_hora_salida` DATETIME NOT NULL,
  `observacion` VARCHAR(255) NULL,
  PRIMARY KEY (`id_planilla_asistencia_personal`),
  INDEX `fk_personal` (`personal_id` ASC) VISIBLE,
  CONSTRAINT `fk_personal`
    FOREIGN KEY (`personal_id`)
    REFERENCES `bd_control_asistencia_docente`.`personales` (`id_personal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_control_asistencia_docente`.`cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_control_asistencia_docente`.`cursos` (
  `id_curso` INT NOT NULL AUTO_INCREMENT,
  `anio` INT NOT NULL,
  `division` INT NOT NULL,
  `turno` VARCHAR(20) NOT NULL,
  `especialidad` VARCHAR(30) NOT NULL,
  `estado` TINYINT NOT NULL,
  PRIMARY KEY (`id_curso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_control_asistencia_docente`.`horas_modulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_control_asistencia_docente`.`horas_modulo` (
  `id_horas_modulo` INT NOT NULL AUTO_INCREMENT,
  `cantidad_horas` INT NOT NULL,
  PRIMARY KEY (`id_horas_modulo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_control_asistencia_docente`.`materias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_control_asistencia_docente`.`materias` (
  `id_materia` INT NOT NULL AUTO_INCREMENT,
  `curso_id` INT NOT NULL,
  `horas_modulo_id` INT NOT NULL,
  `nombre` VARCHAR(80) NOT NULL,
  `estado` TINYINT NOT NULL,
  PRIMARY KEY (`id_materia`),
  INDEX `fk_curso` (`curso_id` ASC) INVISIBLE,
  INDEX `fk_horas_modulo_materia` (`horas_modulo_id` ASC) VISIBLE,
  CONSTRAINT `fk_curso`
    FOREIGN KEY (`curso_id`)
    REFERENCES `bd_control_asistencia_docente`.`cursos` (`id_curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_horas_modulo_materia`
    FOREIGN KEY (`horas_modulo_id`)
    REFERENCES `bd_control_asistencia_docente`.`horas_modulo` (`id_horas_modulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_control_asistencia_docente`.`docentes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_control_asistencia_docente`.`docentes` (
  `id_docente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(30) NOT NULL,
  `apellido` VARCHAR(30) NOT NULL,
  `documento` VARCHAR(8) NOT NULL,
  `ficha_censal` VARCHAR(6) NULL,
  `estado` TINYINT NOT NULL,
  PRIMARY KEY (`id_docente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_control_asistencia_docente`.`formaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_control_asistencia_docente`.`formaciones` (
  `id_formacion` INT NOT NULL AUTO_INCREMENT,
  `tipo_de_formacion` VARCHAR(80) NOT NULL,
  `observaciones` VARCHAR(255) NULL,
  PRIMARY KEY (`id_formacion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_control_asistencia_docente`.`situacion_revista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_control_asistencia_docente`.`situacion_revista` (
  `id_situacion_revista` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_situacion_revista`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_control_asistencia_docente`.`legajos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_control_asistencia_docente`.`legajos` (
  `id_legajo` INT NOT NULL AUTO_INCREMENT,
  `docente_id` INT NOT NULL,
  `formacion_id` INT NOT NULL,
  `materia_id` INT NOT NULL,
  `situacion_revista_id` INT NOT NULL,
  PRIMARY KEY (`id_legajo`),
  INDEX `fk_formacion` (`formacion_id` ASC) INVISIBLE,
  INDEX `fk_materia` (`materia_id` ASC) VISIBLE,
  INDEX `fk_situacion_revista` (`situacion_revista_id` ASC) VISIBLE,
  INDEX `fk_docente` (`docente_id` ASC) VISIBLE,
  CONSTRAINT `fk_formacion`
    FOREIGN KEY (`formacion_id`)
    REFERENCES `bd_control_asistencia_docente`.`formaciones` (`id_formacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_materia`
    FOREIGN KEY (`materia_id`)
    REFERENCES `bd_control_asistencia_docente`.`materias` (`id_materia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_situacion_revista`
    FOREIGN KEY (`situacion_revista_id`)
    REFERENCES `bd_control_asistencia_docente`.`situacion_revista` (`id_situacion_revista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_docente`
    FOREIGN KEY (`docente_id`)
    REFERENCES `bd_control_asistencia_docente`.`docentes` (`id_docente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_control_asistencia_docente`.`planilla_asistencia_docente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_control_asistencia_docente`.`planilla_asistencia_docente` (
  `id_planilla_asistencia_docente` INT NOT NULL AUTO_INCREMENT,
  `legajo_id` INT NOT NULL,
  `horas_modulo_id` INT NOT NULL,
  `fecha_hora_entrada` DATETIME NOT NULL,
  `fecha_hora_salida` DATETIME NOT NULL,
  `observacion` VARCHAR(255) NULL,
  PRIMARY KEY (`id_planilla_asistencia_docente`),
  INDEX `fk_legajo` (`legajo_id` ASC) VISIBLE,
  INDEX `fk_horas_modulo` (`horas_modulo_id` ASC) VISIBLE,
  CONSTRAINT `fk_legajo`
    FOREIGN KEY (`legajo_id`)
    REFERENCES `bd_control_asistencia_docente`.`legajos` (`id_legajo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_horas_modulo`
    FOREIGN KEY (`horas_modulo_id`)
    REFERENCES `bd_control_asistencia_docente`.`horas_modulo` (`id_horas_modulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
