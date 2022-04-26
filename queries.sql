/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';

SELECT name FROM animals WHERE date_of_birth >= date '2016-01-01' AND date_of_birth <= date '2019-12-31';

SELECT name FROM animals WHERE escape_attempts >= 3 AND neutered IS TRUE;

SELECT date_of_birth FROM animals WHERE name ='Agumon' OR name='Pikachu';

SELECT name,escape_attempts FROM animals WHERE weight_kg >=10.5;

SELECT * FROM animals WHERE neutered IS TRUE;

SELECT * FROM animals WHERE name<>'Gabumon';

SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;


--How many animals are there?
SELECT count(*) FROM animals;
--How many animals have never tried to escape?
SELECT count(*) FROM animals WHERE escape_attempts > 0;
--What is the average weight of animals?
SELECT AVG(weight_kg) FROM animals;
--Who escapes the most, neutered or not neutered animals?
SELECT neutered,AVG(escape_attempts) FROM animals GROUP BY neutered;
--What is the minimum and maximum weight of each type of animal?
SELECT species,min(weight_kg),max(weight_kg) FROM animals GROUP BY species;
--What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species,AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-01-31' GROUP BY species ; 