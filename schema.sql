/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
   id INT GENERATED ALWAYS AS IDENTITY,
   name           VARCHAR(250),
   date_of_birth            date     NOT NULL,
   escape_attempts      INT NOT NULL,	
   neutered        BOOLEAN NOT NULL,
   weight_kg         REAL
);

ALTER TABLE animals ADD species VARCHAR(250);

CREATE TABLE owners(
   id INT GENERATED ALWAYS AS IDENTITY,
   full_name       VARCHAR(250),
   age  INT
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
