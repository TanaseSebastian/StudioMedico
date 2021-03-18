DROP DATABASE if exists studiomedico;
CREATE DATABASE STUDIOMEDICO;
USE STUDIOMEDICO;
CREATE TABLE DIPARTIMENTI (
  codDipartimenti int NOT NULL AUTO_INCREMENT,
  piano int NOT NULL,
  phone varchar(45) NOT NULL,
  nome varchar(45) NOT NULL,
  PRIMARY KEY (codDipartimenti)
);
CREATE TABLE UTENTI (
  CF char(16) NOT NULL unique,
  NOME varchar(50) NOT NULL,
  COGNOME varchar(50) NOT NULL,
  USERNAME varchar(50) NOT NULL unique,
  EMAIL varchar(50) NOT NULL unique,
  PHONE char(10) NOT NULL,
  PSW varchar(128) NOT NULL,
  AMMINISTRATORE char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (CF)
);

CREATE TABLE DOTTORI (
  codDottore int NOT NULL AUTO_INCREMENT,
  nome varchar(45) NOT NULL,
  cognome varchar(45) NOT NULL,
  phone varchar(45) NOT NULL,
  email varchar(45) NOT NULL,
  codDipartimento int NOT NULL,
  PRIMARY KEY (codDottore),
  KEY codDipartimento_idx (codDipartimento),
  CONSTRAINT codDipartimento FOREIGN KEY (codDipartimento) REFERENCES DIPARTIMENTI (codDipartimenti) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE PRENOTAZIONI (
  codPrenotazione int NOT NULL AUTO_INCREMENT,
  dateTime datetime NOT NULL,
  commento varchar(45) DEFAULT NULL,
  tipo varchar(45) NOT NULL,
  codFisc char(16) NOT NULL,
  codDottore int NOT NULL,
  PRIMARY KEY (codPrenotazione),
  KEY CF_idx (codFisc),
  KEY codDottore_idx (codDottore),
  CONSTRAINT CF FOREIGN KEY (codFisc) REFERENCES UTENTI (CF) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT codDottore FOREIGN KEY (codDottore) REFERENCES DOTTORI (codDottore) ON DELETE CASCADE ON UPDATE CASCADE
) ;

insert into utenti values("TNSHSGTRHGST543S","Sebastian","Tanase","Tanase_Sebastian","sebastiantanase18@gmail.com","3490596202",md5("pippo"),"Y");
-- select * from utenti WHERE USERNAME="Reppo";
-- delete from utenti where cf="GJGHGDFJTNFTREJT";
insert into utenti(CF,NOME,COGNOME,USERNAME,EMAIL,PHONE,PSW) values("GJGHGDFJTNFTREJT","Samuele", "Restino", "Reppo","reppo@gmail.com","3422222234",md5("Reppo2021"));
-- select * from dipartimenti;
insert into dipartimenti(Nome,Piano,Phone) values("Cardiologia","1 Piano","0833212121"),("Neurologia","2 Piano","0833212122"),("Epatologia","3 Piano","0833212123"),("Pediatria","4 Piano","0833212124"),("Oculistica","5 Piano","0833212125");
insert into dottori(NOME,COGNOME,PHONE,EMAIL,codDipartimento) values("Mario","Rossi","3290987654","mariorossi@medilab.it",1),("Luigi","Bianchi","3290987644","luigibianchi@medilab.it",2),("Giuseppe","Verdi","3290987600","giuseppeverdi@medilab.it",3),("Francesco","Alemanno","3290987699","francescoalemanno@medilab.it",4),("Matteo","Toma","3290987688","matteotoma@medilab.it",5);
-- select * from dottori;