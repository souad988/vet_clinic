/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
   id INT PRIMARY KEY     NOT NULL,
   name           TEXT    NOT NULL,
   date_of_birth            INT     NOT NULL,
   escape_attempts      INT NOT NULL,	
   neutered        BOOLEAN NOT NULL,
   weight_kg         REAL
);