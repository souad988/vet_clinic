/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
   id INT GENERATED ALWAYS AS IDENTITY,
   name           VARCHAR(250),
   date_of_birth            date     NOT NULL,
   escape_attempts      INT NOT NULL,	
   neutered        BOOLEAN NOT NULL,
   weight_kg         REAL,
   PRIMARY KEY(id)	
);

ALTER TABLE animals ADD species VARCHAR(250);

CREATE TABLE owners(
   id INT GENERATED ALWAYS AS IDENTITY,
   full_name       VARCHAR(250),
   age  INT,
   PRIMARY KEY(id)	
);

CREATE TABLE species (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250),
    PRIMARY KEY(id)
  );

ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id INT;
ALTER TABLE animals ADD CONSTRAINT fk_species
      FOREIGN KEY(species_id) 
	  REFERENCES species(id)
	  ON DELETE CASCADE;

ALTER TABLE animals ADD COLUMN owner_id INT;
ALTER TABLE animals ADD CONSTRAINT fk_owner
      FOREIGN KEY(owner_id) 
	  REFERENCES owners(id)
	  ON DELETE CASCADE;     

-- add "join table" for visits

CREATE TABLE vets(
id INT GENERATED ALWAYS AS IDENTITY,
name VARCHAR(250),
age INT,
date_of_graduation date,
PRIMARY KEY(id)
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
    id  INT GENERATED ALWAYS AS IDENTITY,
    date_of_visit date,
    CONSTRAINT animals_fk FOREIGN KEY (animals_id) REFERENCES animals(id),
    CONSTRAINT vets_fk FOREIGN KEY (vets_id) REFERENCES vets(id),
    PRIMARY KEY(id)
  );

ALTER TABLE owners ADD COLUMN email VARCHAR(250);

CREATE INDEX owners_email_asc ON owners(email);

