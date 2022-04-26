/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';

SELECT name FROM animals WHERE date_of_birth >= date '2016-01-01' AND date_of_birth <= date '2019-12-31';

SELECT name FROM animals WHERE escape_attempts >= 3 AND neutered IS TRUE;

SELECT date_of_birth FROM animals WHERE name ='Agumon' OR name='Pikachu';

SELECT name,escape_attempts FROM animals WHERE weight_kg >=10.5;

SELECT * FROM animals WHERE neutered IS TRUE;

SELECT * FROM animals WHERE name<>'Gabumon';

SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;
