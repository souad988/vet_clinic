/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
   id SERIAL PRIMARY KEY     NOT NULL,
   name           TEXT    NOT NULL,
   date_of_birth            date     NOT NULL,
   escape_attempts      INT NOT NULL,	
   neutered        BOOLEAN NOT NULL,
   weight_kg         REAL
);

ALTER TABLE animals ADD species CHAR(100);

CREATE TABLE owners(
   id  SERIAL PRIMARY KEY     NOT NULL,
   full_name           TEXT    NOT NULL,
   age  NUMERIC
);

ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id INTEGER;
ALTER TABLE animals ADD CONSTRAINT fk_species
      FOREIGN KEY(species_id) 
	  REFERENCES species(id)
	  ON DELETE CASCADE;

ALTER TABLE animals ADD COLUMN owner_id INTEGER;
ALTER TABLE animals ADD CONSTRAINT fk_owner
      FOREIGN KEY(owner_id) 
	  REFERENCES owners(id)
	  ON DELETE CASCADE;     

-- add "join table" for visits

CREATE TABLE vets(
id SERIAL PRIMARY KEY     NOT NULL,
name TEXT,
age NUMERIC,
date_of_graduation date
)

CREATE TABLE specializations(
    species_id INT,
    vets_id INT,
    PRIMARY KEY(species_id, vets_id),
    CONSTRAINT species_fk FOREIGN KEY (species_id) REFERENCES species(id),
    CONSTRAINT vets_fk FOREIGN KEY (vets_id) REFERENCES vets(id)
  );

CREATE TABLE visits(
    animals_id INT,
    vets_id INT,
    id  SERIAL PRIMARY KEY     NOT NULL,
    date_of_visit date,
    CONSTRAINT animals_fk FOREIGN KEY (animals_id) REFERENCES animals(id),
    CONSTRAINT vets_fk FOREIGN KEY (vets_id) REFERENCES vets(id)
  );

