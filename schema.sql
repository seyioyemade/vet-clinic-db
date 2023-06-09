/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
id int PRIMARY KEY NOT NULL,
name varchar(40) NOT NULL,
date_of_birth date NOT NULL,
escape_attempts int,
neutered bit,
weight_kg decimal
);

ALTER TABLE animals
ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY;

ALTER TABLE animals
ADD COLUMN species varchar(40);


CREATE TABLE owners(
id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
full_name varchar(40) NOT NULL,
age int
);

CREATE TABLE species(
id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
name varchar(40)
);

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD species_id int;

ALTER TABLE animals
ADD CONSTRAINT fk_species
FOREIGN KEY (species_id)
REFERENCES species(id);

ALTER TABLE animals
ADD owner_id int;

ALTER TABLE animals
ADD CONSTRAINT fk_owner
FOREIGN KEY (owner_id)
REFERENCES owners(id);

CREATE TABLE vets(
id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
name varchar(40) NOT NULL,
age int,
date_of_graduation date
);

CREATE TABLE specializations (
  species_id INT,
  vets_id INT,
  CONSTRAINT fk_species
  FOREIGN KEY (species_id) REFERENCES species(id),
  CONSTRAINT fk_vets
  FOREIGN KEY (vets_id) REFERENCES vets(id)
);

CREATE TABLE visits (
  animals_id INT,
  vets_id INT,
  CONSTRAINT fk_animals
  FOREIGN KEY (animals_id) REFERENCES animals(id),
  CONSTRAINT fk_vets
  FOREIGN KEY (vets_id) REFERENCES vets(id)
);

ALTER TABLE visits
ADD CONSTRAINT pk_visits PRIMARY KEY (animals_id, vets_id);

ALTER TABLE visits
ADD COLUMN date_of_visitation date;


ALTER TABLE owners ADD COLUMN email VARCHAR(120);

DROP table visits;

CREATE TABLE visits(
  id INT GENERATED ALWAYS AS IDENTITY,
  animal_id INT REFERENCES animals(id),
  vet_id INT REFERENCES vets(id),
  date_of_visit DATE,
  PRIMARY KEY(id)
);

CREATE INDEX email_desc ON owners(email DESC);

CREATE INDEX animal_id_asc ON visits(animal_id ASC);

Create Table denomalize_visits (
  id INT,
  animal_id INT,
  vet_id INT,
  date_of_visit DATE,
  PRIMARY KEY(id)
);


