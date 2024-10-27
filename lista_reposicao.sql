DROP DATABASE IF EXISTS lista_reposicao;
CREATE DATABASE lista_reposicao;
USE lista_reposicao;

-- COMANDO PARA DESATIVAR O SAFE MODE
SET SQL_SAFE_UPDATES = 0;

DROP TABLE IF EXISTS Heroi;
CREATE TABLE IF NOT EXISTS Heroi (
  idHeroi INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  endereco VARCHAR(45) NULL,
  nascimento DATE NULL,
  habilidade VARCHAR(45) NULL,
  sexo CHAR(1) NULL,
  email VARCHAR(45) NULL,
  PRIMARY KEY (idHeroi)
);

DROP TABLE IF EXISTS Vilao;
CREATE TABLE IF NOT EXISTS Vilao (
  idVilao INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  num_crimes INT NOT NULL,
  PRIMARY KEY (idVilao)
);

DROP TABLE IF EXISTS Missao;
CREATE TABLE IF NOT EXISTS Missao (
  idMissao INT NOT NULL AUTO_INCREMENT,
  data DATE NOT NULL,
  nome VARCHAR(100) NOT NULL,
  local VARCHAR(45) NULL,
  duracao INT NULL,
  Vilao_idVilao INT NOT NULL,
  PRIMARY KEY (idMissao),
  INDEX fk_Missao_Vilao_idx (Vilao_idVilao ASC),
  CONSTRAINT fk_Missao_Vilao
    FOREIGN KEY (Vilao_idVilao)
    REFERENCES Vilao (idVilao)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

DROP TABLE IF EXISTS Heroi_has_Missao;
CREATE TABLE IF NOT EXISTS Heroi_has_Missao (
  Heroi_idHeroi INT NOT NULL,
  Missao_idMissao INT NOT NULL,
  PRIMARY KEY (Heroi_idHeroi, Missao_idMissao),
  INDEX fk_Heroi_has_Missao_Missao1_idx (Missao_idMissao ASC),
  INDEX fk_Heroi_has_Missao_Heroi1_idx (Heroi_idHeroi ASC),
  CONSTRAINT fk_Heroi_has_Missao_Heroi1
    FOREIGN KEY (Heroi_idHeroi)
    REFERENCES Heroi (idHeroi)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Heroi_has_Missao_Missao1
    FOREIGN KEY (Missao_idMissao)
    REFERENCES Missao (idMissao)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

INSERT INTO Heroi (nome, endereco, nascimento, habilidade, sexo, email) VALUES 
("Super Desinfetante", "Rua IPE, 777", "2004-04-04", "Desinfecção", "M", "superdesinfetante@DCVEL.com"),
("Super Queda Livre", "Rua dos Paraquedistas, 123", "1979-10-31", "Queda Livre", "M", "superquedalivre@DCVEL.com"),
("Mulher Resfriado", "Rua Corona, 1024", "1999-09-19", "Resfriado", "F", "mulherresfriado@DCVEL.com"),
("Mulher Cobaia", "Alameda Científica, 777", "2004-04-04", "Testes Clínicos", "F", "testesclinicos@DCVEL.com"),
("Homem Amnesia", "P. Sherman 42- Wallaby Way- Sydney, 01", "2001-01-01", "Amnésia", "M", "esquecimeuemail@DCVEL.com");

INSERT INTO Vilao (nome, num_crimes) VALUES 
("Espalhador de microbios e contaminantes", 24),
("Senhor Pula Pula", 499),
("General Benzetacil", 3),
("Presidente da comissão de ética", 1),
("Lady anota tudo", 4);

INSERT INTO Missao (data, nome, local, duracao, Vilao_idVilao) VALUES 
("2024-01-01", "Higienizar a Alameda Científica (lembrar de limpar todos os cantinhos)", "Alameda Científica", 24, 1),
("2024-01-02", "Impedir o Senhor Pula Pula de impedir sua queda", "Rua dos paraquedistas", 1, 2),
("2024-01-03", "Contrair Coronavirus", "Rua Corona", 1, 3),
("2024-01-04", "Impedir a votação contra testes de produtos perigosos em grávidas", "Rua IPE, 777", 3, 4),
("2024-01-05", "Marcar uma consulta médica sem saber o próprio RG", "P. Sherman 42- Wallaby Way- Sydney, 01", 1, 5);

INSERT INTO Heroi_has_Missao (Heroi_idHeroi, Missao_idMissao) VALUES 
(1, 1),(1, 2),(1, 3),
(2, 2),(2, 3),(2, 4),
(3, 1),(3, 3),(3, 5),
(4, 2),(4, 4),(4, 5),
(5, 2),(5, 4),(5, 5);



SELECT heroi.nome, vilao.nome, missao.nome FROM Heroi as heroi, Missao as missao, Vilao as vilao, Heroi_has_Missao as has WHERE heroi.idHeroi = has.heroi_idHeroi and vilao.idVilao = missao.Vilao_idVilao and Missao_idMissao = has.Missao_idMissao ;
SELECT heroi.nome, missao.nome, missao.duracao FROM Heroi as heroi, Missao as missao, Heroi_has_Missao as has WHERE heroi.idHeroi = has.heroi_idHeroi and Missao_idMissao = has.Missao_idMissao ;
SELECT missao.nome, heroi.nome, vilao.num_crimes FROM Heroi as heroi, Missao as missao, Vilao as vilao, Heroi_has_Missao as has WHERE heroi.idHeroi = has.heroi_idHeroi and missao.idMissao = has.missao_idMissao and vilao.idVilao = missao.vilao_idVilao;
