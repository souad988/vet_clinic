/* Populate database with sample data. */

INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Agumon','2020-02-03',0,'true',10.23);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Gabumon','2018-11-15',2,'true',8);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Pikachu','2021-01-07',1,'false',15.04);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Devimon','2017-05-12',5,'true',11);

INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Charmander','2020-02-08',0,'false',-11);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Plantmon','2021-11-15',2,'true',-5.7);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Squirtle','1993-04-02',3,'true',-12.13);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Angemon','2005-06-12',1,'true',-45);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Boarmon','2005-06-07',7,'true',20.4);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Blossom','1998-10-13',3,'true',17);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Ditto','2022-05-14',4,'true',22);

UPDATE animals SET species = 'unspecified';

BEGIN;

UPDATE animals 
SET species = 'unspecified';

ROLLBACK;
SELECT * From animals;

BEGIN;

UPDATE animals 
SET species = 'digimon'
WHERE name LIKE '%mon'
;
--Update column and commit
UPDATE animals 
SET species = 'pokemon'
WHERE species IS NULL
;
COMMIT;

SELECT * From animals;

--Delete all rows and rollback

BEGIN;
DELETE FROM animals;
ROLLBACK;

--Delete all animals born after Jan 1st, 2022.

BEGIN;
DELETE FROM animals WHERE date_of_birth>'2022-01-01';

-- 


--Delete all animals born after Jan 1st, 2022.
BEGIN;
DELETE FROM animals WHERE date_of_birth>'2022-01-01';
SAVEPOINT rm_young;
--Update all animals' weight to be their weight multiplied by -1.
UPDATE animals SET weight_kg = weight_kg * -1;
--Rollback to the savepoint
ROLLBACK TO SAVEPOINT rm_young;
--Update all animals' weights that are negative to be their weight multiplied by -1.
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0; 
--Commit transaction
COMMIT;

--INSERT VALUES INTO OWNERS
 INSERT INTO owners (full_name,age) VALUES ('Sam Smith',34),
 ('Jennifer Orwell',19),('Bob',45),('Melody Pond',77),
 ('Dean Winchester',14),('Jodie Whittaker',38);

 --INSERT INTO SPECIES
INSERT INTO species (name) VALUES ('Pokemon'),('Digimon');

--Modify your inserted animals so it includes the species_id value:If the name ends in "mon" it will be Digimon All other animals are Pokemon
UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Digimon') WHERE name Like '%mon';
UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Pokemon') WHERE name NOT Like '%mon';

--Modify your inserted animals to include owner information (owner_id)
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith') WHERE name = 'Agumon';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name IN ('Gabumon','Pikachu');
UPDATE animals SET owner_id = 
(SELECT id FROM owners WHERE full_name = 'Bob') WHERE name IN ('Devimon','Plantmon');

 UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond')
WHERE name IN ('Charmander','Squirtle','Blossom');
 
 UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
WHERE name IN ('Angemon','Boarmon');