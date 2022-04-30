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


--What animals belong to Melody Pond?
SELECT full_name,name FROM owners
INNER JOIN animals ON animals.owner_id = owners.id WHERE full_name = 'Melody Pond'

-- List of all animals that are pokemon (their type is Pokemon).
SELECT animals.name FROM animals INNER JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon'
-- List all owners and their animals, remember to include those that don't own any animal.
SELECT full_name,name FROM animals FULL JOIN owners ON animals.owner_id= owners.id

-- How many animals are there per species?
CREATE VIEW summer AS
SELECT species_id,count(*)as count FROM animals GROUP BY species_id;
SELECT name , count FROM summer INNER JOIN species AS sp ON summer.species_id = sp.id

-- List all Digimon owned by Jennifer Orwell.
SELECT owners.full_name, animals.name FROM animals JOIN owners ON animals.owner_id = owners.id JOIN species ON animals.species_id=species.id
WHERE owners.full_name = 'Jennifer Orwell' AND species.name= 'Digimon'

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT owners.full_name ,animals.name, animals.escape_attempts FROM animals JOIN owners ON animals.owner_id = owners.id 
WHERE owners.id='Dean Winchester' AND animals.escape_attempts= 0
-- Who owns the most animals?
SELECT full_name, COUNT(*) FROM animals JOIN owners ON animals.owner_id = owners.id GROUP BY owners.full_name ORDER BY count DESC;