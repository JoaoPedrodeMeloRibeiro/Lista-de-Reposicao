-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Heroi`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Heroi` (
  `idHeroi` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NULL,
  `nascimento` DATE NULL,
  `habilidade` VARCHAR(45) NULL,
  `sexo` CHAR NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`idHeroi`));



-- -----------------------------------------------------
-- Table `mydb`.`Vilao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vilao` (
  `idVilao` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `num_crimes` INT NOT NULL,
  PRIMARY KEY (`idVilao`));



-- -----------------------------------------------------
-- Table `mydb`.`Missao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Missao` (
  `idMissao` INT NOT NULL,
  `data` DATE NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `local` VARCHAR(45) NULL,
  `duracao` INT NULL,
  `Vilao_idVilao` INT NOT NULL,
  PRIMARY KEY (`idMissao`),
  INDEX `fk_Missao_Vilao_idx` (`Vilao_idVilao` ASC) VISIBLE,
  CONSTRAINT `fk_Missao_Vilao`
    FOREIGN KEY (`Vilao_idVilao`)
    REFERENCES `mydb`.`Vilao` (`idVilao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table `mydb`.`Heroi_has_Missao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Heroi_has_Missao` (
  `Heroi_idHeroi` INT NOT NULL,
  `Missao_idMissao` INT NOT NULL,
  PRIMARY KEY (`Heroi_idHeroi`, `Missao_idMissao`),
  INDEX `fk_Heroi_has_Missao_Missao1_idx` (`Missao_idMissao` ASC) VISIBLE,
  INDEX `fk_Heroi_has_Missao_Heroi1_idx` (`Heroi_idHeroi` ASC) VISIBLE,
  CONSTRAINT `fk_Heroi_has_Missao_Heroi1`
    FOREIGN KEY (`Heroi_idHeroi`)
    REFERENCES `mydb`.`Heroi` (`idHeroi`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Heroi_has_Missao_Missao1`
    FOREIGN KEY (`Missao_idMissao`)
    REFERENCES `mydb`.`Missao` (`idMissao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

INSERT INTO Heroi (nome, endereco, nascimento, habilidade, sexo, email) VALUES ("Super Desinfetante", "Rua IPE, 777", "04/04/2004", "Masculino","superdesinfetante@DCVEL.com");
INSERT INTO Heroi (nome, endereco, nascimento, habilidade, sexo, email) VALUES ("Super Queda Livre", "Rua dos Paraquedistas, 123", "31/10/1979", "Masculino","superquedalivre@DCVEL.com");
INSERT INTO Heroi (nome, endereco, nascimento, habilidade, sexo, email) VALUES ("Mulher Resfriado", "Rua Corona, 1024", "19/09/1999", "Feminino","mulherresfriado@DCVEL.com");
INSERT INTO Heroi (nome, endereco, nascimento, habilidade, sexo, email) VALUES ("Mulher Cobaia", "Alameda Científica, 777", "04/04/2004", "Feminino","testesclinicos@DCVEL.com");
INSERT INTO Heroi (nome, endereco, nascimento, habilidade, sexo, email) VALUES ("Homem Amnesia", "P. Sherman 42- Wallaby Way- Sydney, 01", "01/01/2001", "Masculino","esquecimeuemail@DCVEL.com");

INSERT INTO Vilao (nome, num_crimes) VALUES ("Espalhador de microbios e contaminantes (Lorde EMC) ",24);
INSERT INTO Vilao (nome, num_crimes) VALUES ("Senhor Pula Pula",499);
INSERT INTO Vilao (nome, num_crimes) VALUES ("General Benzetacil",3);
INSERT INTO Vilao (nome, num_crimes) VALUES ("Presidente da comissão de ética",1);
INSERT INTO Vilao (nome, num_crimes) VALUES ("Lady anota tudo",4);

INSERT INTO Missao (nome, local, duracao, Vilao_idVilao) VALUES ("Higienizar a Alameda Científica (lembrar de limpar todos os cantinhos)", "Alameda Científica", 24, 1);
INSERT INTO Missao (nome, local, duracao, Vilao_idVilao) VALUES ("Impedir o Senhor Pula Pula de impedir sua queda", "Rua dos paraquedistas",1,2);
INSERT INTO Missao (nome, local, duracao, Vilao_idVilao) VALUES ("Contrair Coronavirus", "Rua Corona", 1, 3);
INSERT INTO Missao (nome, local, duracao, Vilao_idVilao) VALUES ("Impedir a votação contra testes de produtos perigosos em gravidas", "Rua IPE, 777", 3, 4);
INSERT INTO Missao (nome, local, duracao, Vilao_idVilao) VALUES ("Marcar uma consulta médica sem saber o proprio RG", "P. Sherman 42- Wallaby Way- Sydney, 01", 1, 5);

select nome from Heroi;
select nome from Vilao;
select nome from Missai;


