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

--*********************************************************--

INSERT INTO vets (name, age, date_of_graduation)
VALUES  ('William Tatcher', 45, 'April 23, 2000'),
        ('Maisy Smith', 26, 'January 17, 2019'),
        ('Stephanie Mendez', 64, 'May 4, 1981'),
        ('Jack Harkness', 38, 'April 8, 2008');


INSERT INTO specializations (species_id, vets_id)
VALUES ( ( SELECT id FROM species WHERE name = 'Pokemon'),
         (SELECT id FROM vets WHERE name = 'William Tatcher')), 
       ( ( SELECT id FROM species WHERE name = 'Digimon' ),
         ( SELECT id FROM vets WHERE name = 'Stephanie Mendez' )), 
       ( ( SELECT id FROM species WHERE name = 'Pokemon'), 
         ( SELECT id FROM vets WHERE name = 'Stephanie Mendez' ) ), 
       ( ( SELECT id FROM species  WHERE name = 'Digimon' ),
        ( SELECT id FROM vets WHERE name = 'Jack Harkness') );



INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
VALUES ( ( SELECT id FROM animals WHERE NAME = 'Agumon'), 
		( SELECT id FROM vets WHERE NAME = 'William Tatcher'),
         'May 24, 2020'),
         ( (SELECT id FROM animals WHERE NAME = 'Agumon'), 
		  ( SELECT id FROM vets WHERE NAME = 'Stephanie Mendez' ),
          'July 22, 2020' ),
         ( ( SELECT id FROM animals WHERE NAME = 'Gabumon' ),
		  ( SELECT id FROM vets WHERE NAME = 'Jack Harkness' ),
          'February 2, 2021' ),
         ( (SELECT id FROM animals  WHERE NAME = 'Pikachu' ),
		  ( SELECT id FROM vets WHERE NAME = 'Maisy Smith'  ),
          'January 5, 2020'),
         ( ( SELECT id FROM animals WHERE NAME = 'Pikachu' ), 
		  ( SELECT id FROM vets  WHERE NAME = 'Maisy Smith' ),
          '2020-03-08' ),
         ( ( SELECT id FROM animals WHERE NAME = 'Pikachu' ), 
		  (SELECT id FROM vets WHERE NAME = 'Maisy Smith' ),
          'May 14, 2020' ),
         ( ( SELECT id FROM animals WHERE NAME = 'Devimon' ), 
		  ( SELECT id FROM vets WHERE NAME = 'Stephanie Mendez' ),
         'May 4, 2021'),
		 ( ( SELECT id FROM animals WHERE NAME = 'Charmander' ), 
		  (SELECT id FROM vets WHERE NAME = 'Jack Harkness' ),
          'February 24, 2021'),( ( SELECT id FROM animals WHERE NAME = 'Plantmon'), 
		 (SELECT id FROM vets WHERE NAME = 'Maisy Smith' ),
          'December 21, 2019'),
         ( ( SELECT id FROM animals WHERE NAME = 'Plantmon' ),
		  ( SELECT id FROM vets WHERE NAME = 'William Tatcher' ),
          'August 10, 2020' ),
         ( ( SELECT id FROM animals WHERE NAME = 'Plantmon' ),
		  ( SELECT id FROM vets  WHERE  NAME = 'Maisy Smith'),
          'April 7, 2021' ),
          ( ( SELECT id FROM animals WHERE NAME = 'Squirtle'),
           ( SELECT id FROM vets WHERE   NAME = 'Stephanie Mendez' ),
          'September 29, 2019' ),
          ( ( SELECT id FROM animals  WHERE NAME = 'Agumon' ), 
          ( SELECT id  FROM vets  WHERE NAME = 'Jack Harkness' ),
          'October 3, 2020' ),
          ( ( SELECT id FROM animals  WHERE NAME = 'Agumon' ),
           ( SELECT id FROM vets  WHERE  NAME = 'Jack Harkness' ),
          'November 4, 2020' ),
          ( ( SELECT id FROM animals WHERE NAME = 'Boarmon' ), 
          ( SELECT id  FROM vets  WHERE  NAME = 'Maisy Smith' ),
         'January 24, 2019' ), 
         ( ( SELECT id FROM animals  WHERE NAME = 'Boarmon' ),
          ( SELECT id FROM vets WHERE  NAME = 'Maisy Smith'  ),
         'May 15, 2019' ),
         ( ( SELECT id FROM animals WHERE NAME = 'Boarmon' ),
          ( SELECT id FROM vets  WHERE  NAME = 'Maisy Smith'  ),
        'February 27, 2019' ),
        ( ( SELECT id  FROM animals  WHERE NAME = 'Boarmon' ), 
        ( SELECT id  FROM vets  WHERE  NAME = 'Maisy Smith'  ),
        'August 3, 2020' ),
         ( ( SELECT id FROM animals WHERE NAME = 'Blossom'  ),
          ( SELECT id FROM vets  WHERE  NAME = 'Stephanie Mendez' ),
        'May 24, 2020' ),
        ( (  SELECT id FROM animals WHERE NAME = 'Blossom' ), 
        (  SELECT id  FROM vets WHERE  NAME = 'William Tatcher'  ),
        'January 11, 2021' );


-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';