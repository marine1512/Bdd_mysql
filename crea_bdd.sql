DROP DATABASE IF EXISTS Tifosi; 
-- CREATE DATABASE IF NOT EXISTS Tifosi;
CREATE DATABASE Tifosi;

USE Tifosi;

DROP TABLE IF EXISTS client;
CREATE TABLE client (
    id_client INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nom_client VARCHAR(45) NOT NULL,
    age INT,
    cp_client INT
);

DROP TABLE IF EXISTS menu;
CREATE TABLE menu (
    id_menu INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nom_menu VARCHAR(45) NOT NULL,
    prix_menu FLOAT NOT NULL,
    fk_id_focaccia INT NOT NULL
    -- Relation entre menu et focaccia: est contitué (ONE TO MANY)
    -- FOREIGN KEY (fk_id_focaccia) REFERENCES focaccia(id_focaccia)
);

-- Relation entre client et menu : paye (MANY TO MANY)
DROP TABLE IF EXISTS paye;
CREATE TABLE paye (
    id_paye INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    fk_id_client INT NOT NULL,
    fk_id_menu INT NOT NULL,
    jour DATE NOT NULL,
    FOREIGN KEY (fk_id_client) REFERENCES client(id_client),
    FOREIGN KEY (fk_id_menu) REFERENCES menu(id_menu)
);

-- Relation entre boisson et marque : appartient (ONE TO MANY)
DROP TABLE IF EXISTS marque;
CREATE TABLE marque (
    id_marque INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nom_marque VARCHAR(45) NOT NULL
);

DROP TABLE IF EXISTS boisson;
CREATE TABLE boisson (
    id_boisson INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nom_boisson VARCHAR(45) NOT NULL,
    fk_id_marque INT NOT NULL,
    FOREIGN KEY (fk_id_marque) REFERENCES marque(id_marque)  
);

-- Relation entre menu et boisson : contient (MANY TO MANY)
DROP TABLE IF EXISTS contient;
CREATE TABLE contient (
    id_contient INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    fk_id_menu INT NOT NULL,
    fk_id_boisson INT NOT NULL,
    FOREIGN KEY (fk_id_menu) REFERENCES menu(id_menu),
    FOREIGN KEY (fk_id_boisson) REFERENCES boisson(id_boisson)
);

DROP TABLE IF EXISTS focaccia;
CREATE TABLE focaccia (
    id_focaccia INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nom_focaccia VARCHAR(45) NOT NULL,
    prix_focaccia FLOAT NOT NULL
    -- est contitué - menu : MANY TO ONE
    -- achete - client : MANY TO MANY = table
    -- comprend - ingredient : MANY TO MANY - table
);

-- Relation entre client et focaccia : achete (MANY TO MANY)
DROP TABLE IF EXISTS achete;
CREATE TABLE achete (
    id_achete INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    fk_id_client INT NOT NULL,
    fk_id_focaccia INT NOT NULL,
    FOREIGN KEY (fk_id_client) REFERENCES client(id_client),
    FOREIGN KEY (fk_id_focaccia) REFERENCES focaccia(id_focaccia) 
);

DROP TABLE IF EXISTS ingredient;
CREATE TABLE ingredient (
    id_ingredient INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nom_ingredient VARCHAR(45) NOT NULL
);

-- Relation entre focaccia et ingredient : comprend (MANY TO MANY)
DROP TABLE IF EXISTS comprend;
CREATE TABLE comprend (
    id_comprend INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    fk_id_focaccia INT NOT NULL,
    fk_id_ingredient INT NOT NULL,
    FOREIGN KEY (fk_id_focaccia) REFERENCES focaccia(id_focaccia),
    FOREIGN KEY (fk_id_ingredient) REFERENCES ingredient(id_ingredient) 
);


ALTER TABLE menu
ADD FOREIGN KEY (fk_id_focaccia) REFERENCES focaccia(id_focaccia);

