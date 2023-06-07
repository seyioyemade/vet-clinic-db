/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals
WHERE name LIKE '%mon';

SELECT name FROM animals 
WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT name FROM animals
WHERE neutered = '1' AND escape_attempts < 3;

SELECT date_of_birth FROM animals
WHERE name = 'Agumon' OR name = 'Pikachu';

SELECT name, escape_attempts FROM animals
WHERE weight > 10.5;

SELECT * FROM animals
WHERE neutered = '1';

SELECT * FROM animals
WHERE name NOT IN ('Gabumon');

SELECT * FROM animals
WHERE weight >= 10.4 AND weight <= 17.3;

BEGIN;
UPDATE animals
SET species = 'unspecified';
ROLLBACK;

BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';

UPDATE animals 
SET species = 'pokemon'
WHERE species IS NULL;

DELETE FROM animals
WHERE date_of_birth > '2022-01-01';
SAVEPOINT sp1;

UPDATE animals 
SET weight_kg = weight_kg * -1

ROLLBACK TO SAVEPOINT sp1;

UPDATE animals 
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0

COMMIT;

SELECT COUNT(*) FROM animals; 

SELECT COUNT(escape_attempts) FROM animals
WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT neutered,SUM(escape_attempts)
FROM animals
GROUP BY neutered
ORDER BY SUM(escape_attempts) DESC;

SELECT species, MIN(weight_kg), MAX(weight_kg)
FROM animals
GROUP BY species;

SELECT species, AVG(escape_attempts) 
from animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;
