/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/ my_planning /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE my_planning;

DROP TABLE IF EXISTS adresse;
CREATE TABLE `adresse` (
  `ID_Adresse` varchar(50) NOT NULL,
  `Numero_rue` varchar(50) NOT NULL,
  `Ville` varchar(50) DEFAULT NULL,
  `CodePostal` int DEFAULT NULL,
  PRIMARY KEY (`ID_Adresse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS amis;
CREATE TABLE `amis` (
  `Num_Telephone` int NOT NULL,
  `Nom` varchar(50) DEFAULT NULL,
  `Prenom` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Num_Telephone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS budget;
CREATE TABLE `budget` (
  `IDTransaction` varchar(50) NOT NULL,
  `SommeCiblé` varchar(50) NOT NULL,
  PRIMARY KEY (`IDTransaction`),
  KEY `SommeCiblé` (`SommeCiblé`),
  CONSTRAINT `budget_ibfk_1` FOREIGN KEY (`SommeCiblé`) REFERENCES `cagnotte` (`SommeCiblé`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS cagnotte;
CREATE TABLE `cagnotte` (
  `SommeCiblé` varchar(50) NOT NULL,
  `Ressources` int DEFAULT NULL,
  `Nom` varchar(50) NOT NULL,
  PRIMARY KEY (`SommeCiblé`),
  KEY `Nom` (`Nom`),
  CONSTRAINT `cagnotte_ibfk_1` FOREIGN KEY (`Nom`) REFERENCES `objectif` (`Nom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS calendrier;
CREATE TABLE `calendrier` (
  `ID_Event` int NOT NULL,
  `Nom` varchar(50) DEFAULT NULL,
  `Date_` datetime DEFAULT NULL,
  `Heure` time DEFAULT NULL,
  PRIMARY KEY (`ID_Event`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS etudiant;
CREATE TABLE `etudiant` (
  `Num_Telephone` varchar(50) NOT NULL,
  `Nom` varchar(50) DEFAULT NULL,
  `Prenom` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Num_Telephone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS evenement;
CREATE TABLE `evenement` (
  `ID_Event` varchar(50) NOT NULL,
  `Nom` varchar(50) NOT NULL,
  `Prix` int DEFAULT NULL,
  `Proposition_date` datetime DEFAULT NULL,
  `ID_Event_1` int DEFAULT NULL,
  `Nom_1` varchar(50) NOT NULL,
  `ID_Adresse` varchar(50) NOT NULL,
  `IDTransaction` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_Event`),
  UNIQUE KEY `IDTransaction` (`IDTransaction`),
  KEY `ID_Event_1` (`ID_Event_1`),
  KEY `Nom_1` (`Nom_1`),
  KEY `ID_Adresse` (`ID_Adresse`),
  CONSTRAINT `evenement_ibfk_1` FOREIGN KEY (`ID_Event_1`) REFERENCES `calendrier` (`ID_Event`),
  CONSTRAINT `evenement_ibfk_2` FOREIGN KEY (`Nom_1`) REFERENCES `loisirs` (`Nom`),
  CONSTRAINT `evenement_ibfk_3` FOREIGN KEY (`ID_Adresse`) REFERENCES `adresse` (`ID_Adresse`),
  CONSTRAINT `evenement_ibfk_4` FOREIGN KEY (`IDTransaction`) REFERENCES `budget` (`IDTransaction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS loisirs;
CREATE TABLE `loisirs` (
  `Nom` varchar(50) NOT NULL,
  PRIMARY KEY (`Nom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS objectif;
CREATE TABLE `objectif` (
  `Nom` varchar(50) NOT NULL,
  `Description` varchar(50) DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `Somme_ciblée` int DEFAULT NULL,
  `Date_definition` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Nom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS reseauxsociaux;
CREATE TABLE `reseauxsociaux` (
  `Num_Telephone` int NOT NULL,
  `Facebook` varchar(50) DEFAULT NULL,
  `Instagram` varchar(50) DEFAULT NULL,
  `Twitter` varchar(50) DEFAULT NULL,
  `Snapchat` varchar(50) DEFAULT NULL,
  `Num_Telephone_1` int NOT NULL,
  PRIMARY KEY (`Num_Telephone`),
  KEY `Num_Telephone_1` (`Num_Telephone_1`),
  CONSTRAINT `reseauxsociaux_ibfk_1` FOREIGN KEY (`Num_Telephone_1`) REFERENCES `amis` (`Num_Telephone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS seancerevisions;
CREATE TABLE `seancerevisions` (
  `ID_Event` varchar(50) NOT NULL,
  `Matière` varchar(50) NOT NULL,
  `Deadline` datetime DEFAULT NULL,
  `TravailAFaire` varchar(50) DEFAULT NULL,
  `IDTransaction` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_Event`),
  UNIQUE KEY `IDTransaction` (`IDTransaction`),
  CONSTRAINT `seancerevisions_ibfk_1` FOREIGN KEY (`IDTransaction`) REFERENCES `budget` (`IDTransaction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO amis(Num_Telephone,Nom,Prenom) VALUES(620210000,'Annichiarico','Gianlucca'),(620210001,'Raoul','Lisa'),(620210002,'Essid','Yasmine'),(620210003,'Qwetch','Rose'),(620210004,'Escuel','Mike'),(620210005,'Perrier','Gaston'),(620210006,'Cappuccino','Laetitia'),(620210007,'Soung','Sam'),(620210008,'Cloud','Ike'),(620210009,'Diez','Sancho');




INSERT INTO etudiant(Num_Telephone,Nom,Prenom) VALUES('620210000','Annichiarico','Gianlucca'),('620210001','Raoul','Lisa'),('620210002','Essid','Yasmine'),('620210010','Cena','John'),('620210011','Monkey D','Luffy'),('620210012','Perrez','Alexa'),('620210013','Dit','Siri'),('620210014','Ok','Google'),('620210015','Uzumaki','Naruto'),('620210016','Efrei','Hiboux');


INSERT INTO loisirs(Nom) VALUES('Basketball'),('Cinéma'),('Cyclisme'),('Equitation'),('Football'),('Handball'),('Jeux Videos'),('Lecture'),('Musées'),('Natation');

