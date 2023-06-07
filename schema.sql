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