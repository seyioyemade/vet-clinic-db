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