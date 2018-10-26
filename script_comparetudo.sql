-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema comparetudo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema comparetudo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `comparetudo` DEFAULT CHARACTER SET utf8 ;
USE `comparetudo` ;

-- -----------------------------------------------------
-- Table `comparetudo`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `comparetudo`.`categorias` (
  `categoria_id` INT NOT NULL AUTO_INCREMENT,
  `categoria_nome` VARCHAR(45) NOT NULL,
  `categoria_data_criacao` DATETIME NOT NULL DEFAULT now(),
  `categoria_data_atualizacao` DATETIME NOT NULL DEFAULT now(),
  PRIMARY KEY (`categoria_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comparetudo`.`sub_categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `comparetudo`.`sub_categorias` (
  `sub_categoria_id` INT NOT NULL AUTO_INCREMENT,
  `sub_categoria_nome` VARCHAR(45) NOT NULL,
  `sub_categoria_data_criacao` DATETIME NOT NULL DEFAULT now(),
  `sub_categoria_data_atualizacao` DATETIME NOT NULL DEFAULT now(),
  `categorias_categoria_id` INT NOT NULL,
  PRIMARY KEY (`sub_categoria_id`),
  CONSTRAINT `fk_sub_categorias_categorias1`
    FOREIGN KEY (`categorias_categoria_id`)
    REFERENCES `comparetudo`.`categorias` (`categoria_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comparetudo`.`produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `comparetudo`.`produtos` (
  `produto_id` INT NOT NULL AUTO_INCREMENT,
  `produto_nome` VARCHAR(500) NOT NULL,
  `produto_data_criacao` DATETIME NOT NULL DEFAULT now(),
  `produto_data_atualizacao` DATETIME NOT NULL DEFAULT now(),
  `sub_categorias_sub_categoria_id` INT NOT NULL,
  PRIMARY KEY (`produto_id`),  
  CONSTRAINT `fk_produtos_sub_categorias1`
    FOREIGN KEY (`sub_categorias_sub_categoria_id`)
    REFERENCES `comparetudo`.`sub_categorias` (`sub_categoria_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comparetudo`.`atributos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `comparetudo`.`atributos` (
  `atributo_id` INT NOT NULL AUTO_INCREMENT,
  `atributo_nome` VARCHAR(80) NOT NULL,  
  `atributo_data_criacao` DATETIME NOT NULL DEFAULT now(),
  `atributo_data_atualizacao` DATETIME NOT NULL DEFAULT now(),
  `atributo_desativado` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`atributo_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comparetudo`.`produtos_atributos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `comparetudo`.`produtos_atributos` (
  `produtos_produto_id` INT NOT NULL,
  `atributos_atributo_id` INT NOT NULL,
  `produto_atributo_valor` VARCHAR(250) NOT NULL,
  CONSTRAINT `fk_produtos_atributos_produtos1`
    FOREIGN KEY (`produtos_produto_id`)
    REFERENCES `comparetudo`.`produtos` (`produto_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produtos_atributos_atributos1`
    FOREIGN KEY (`atributos_atributo_id`)
    REFERENCES `comparetudo`.`atributos` (`atributo_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comparetudo`.`niveis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `comparetudo`.`niveis` (
  `nivel_id` INT NOT NULL AUTO_INCREMENT,
  `nivel_nome` VARCHAR(45) NOT NULL,
  `nivel_data_criacao` DATETIME NOT NULL DEFAULT now(),
  `nivel_data_atualizacao` DATETIME NOT NULL DEFAULT now(),
  PRIMARY KEY (`nivel_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comparetudo`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `comparetudo`.`usuarios` (
  `usuario_id` INT NOT NULL AUTO_INCREMENT,
  `usuario_nome` VARCHAR(150) NOT NULL,
  `usuario_email` VARCHAR(80) NOT NULL,
  `usuario_senha` VARCHAR(150) NOT NULL,
  `usuario_data_criacao` DATETIME NOT NULL DEFAULT now(),
  `usuario_data_atualizacao` DATETIME NOT NULL DEFAULT now(),
  `niveis_nivel_id` INT NOT NULL,
  PRIMARY KEY (`usuario_id`),  
  CONSTRAINT `fk_usuarios_niveis1`
    FOREIGN KEY (`niveis_nivel_id`)
    REFERENCES `comparetudo`.`niveis` (`nivel_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

insert into niveis(nivel_nome) values("Administrador");
insert into niveis(nivel_nome) values("Usuário");

insert into usuarios(usuario_nome, usuario_email, usuario_senha, niveis_nivel_id) values('Administrador', 'admin@comparetudo.info', md5('admin123'), 1);
insert into usuarios(usuario_nome, usuario_email, usuario_senha, niveis_nivel_id) values('Usuário Teste', 'user_teste@comparetudo.info', md5('123'), 2);

insert into categorias(categoria_nome) values("Video-Games");
insert into sub_categorias(sub_categoria_nome, categorias_categoria_id) values('Playstation 1',1);
insert into sub_categorias(sub_categoria_nome, categorias_categoria_id) values('Playstation 2',1);
insert into sub_categorias(sub_categoria_nome, categorias_categoria_id) values('Playstation 3',1);
insert into sub_categorias(sub_categoria_nome, categorias_categoria_id) values('Playstation 4',1);

insert into categorias(categoria_nome) values("Computadores");
insert into sub_categorias(sub_categoria_nome, categorias_categoria_id) values('Processadores',2);
insert into sub_categorias(sub_categoria_nome, categorias_categoria_id) values('HDs',2);

insert into produtos(produto_nome, sub_categorias_sub_categoria_id) values('Read Dead Redemption II',4);
insert into produtos(produto_nome, sub_categorias_sub_categoria_id) values('GTA V',4);
insert into produtos(produto_nome, sub_categorias_sub_categoria_id) values('Processador Intel I7 8700K',5);
insert into produtos(produto_nome, sub_categorias_sub_categoria_id) values('Processador Intel I5 7700K',5);
insert into produtos(produto_nome, sub_categorias_sub_categoria_id) values('HD 1Tb Seagate 7200rpm',6);
insert into produtos(produto_nome, sub_categorias_sub_categoria_id) values('HD 500Gb Seagate 7200rpm',6);

insert into atributos(atributo_nome) values('Data de Lançamento');
insert into atributos(atributo_nome) values('Tamanho');
insert into atributos(atributo_nome) values('Velocidade');
insert into atributos(atributo_nome) values('Aceleração');
insert into atributos(atributo_nome) values('Cor');
insert into atributos(atributo_nome) values('Altura');
insert into atributos(atributo_nome) values('Potência');
insert into atributos(atributo_nome) values('Classificação');
insert into atributos(atributo_nome) values('Estilo');
insert into atributos(atributo_nome) values('Tempo de Duração');
insert into atributos(atributo_nome) values('Número de Jogadores');
insert into atributos(atributo_nome) values('Multiplayer');

insert into produtos_atributos(produtos_produto_id, atributos_atributo_id, produto_atributo_valor) values(1,8,'2018-10-26');
insert into produtos_atributos(produtos_produto_id, atributos_atributo_id, produto_atributo_valor) values(1,12,'Não');
insert into produtos_atributos(produtos_produto_id, atributos_atributo_id, produto_atributo_valor) values(1,11,'1');
insert into produtos_atributos(produtos_produto_id, atributos_atributo_id, produto_atributo_valor) values(1,10,'1');
insert into produtos_atributos(produtos_produto_id, atributos_atributo_id, produto_atributo_valor) values(2,8,'2013-09-13');
insert into produtos_atributos(produtos_produto_id, atributos_atributo_id, produto_atributo_valor) values(2,12,'Sim');
insert into produtos_atributos(produtos_produto_id, atributos_atributo_id, produto_atributo_valor) values(2,11,'1');

select p.produto_nome
	 , a.atributo_nome
     , pa.produto_atributo_valor
from produtos p
inner join produtos_atributos pa on p.produto_id = pa.produtos_produto_id
inner join atributos a on pa.atributos_atributo_id = a.atributo_id
order by p.produto_nome ASC
       , a.atributo_nome ASC;