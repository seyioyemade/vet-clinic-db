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

SELECT full_name, name AS animal
FROM owners
JOIN animals
ON owners.id = animals.owner_id
WHERE owners.full_name = 'Melody Pond';

SELECT animals.name AS animal, species.name AS specie
FROM animals
JOIN species
ON animals.species_id = species.id
WHERE species.id = 1;

SELECT full_name, name AS animal
FROM owners
LEFT JOIN animals
ON owners.id = animals.owner_id;

SELECT species.name AS species, COUNT(animals.name)
FROM species
JOIN animals
ON species.id = animals.species_id
GROUP BY species.name;

SELECT full_name, name AS animal
FROM owners
JOIN animals
ON owners.id = animals.owner_id
WHERE animals.owner_id = 2 AND animals.species_id = 2;

SELECT name AS animal
FROM owners
JOIN animals
ON owners.id = animals.owner_id
WHERE animals.owner_id = 5 AND animals.escape_attempts = 0;

SELECT full_name, COUNT(animals.id) AS animal_count
FROM owners
JOIN animals 
ON owners.id = animals.owner_id
GROUP BY full_name
ORDER BY animal_count DESC
LIMIT 1;

SELECT name AS animal
FROM animals
JOIN visits
ON animals.id = visits.animals_id
WHERE date_of_visitation = '2021-01-11';

SELECT name AS animal
FROM animals
JOIN visits
ON animals.id = visits.animals_id
WHERE vets_id = 3;

SELECT vets.name AS vet, species.name AS specie
FROM vets
LEFT JOIN specializations
ON vets.id = specializations.vets_id
LEFT JOIN species
ON specializations.species_id = species.id;

SELECT animals.name AS animal
FROM animals
JOIN visits
ON animals.id = visits.animals_id
WHERE (vets_id = 3) AND (date_of_visitation BETWEEN '2020-04-01' AND '2020-08-30');

SELECT animals.name AS animal, COUNT(vets_id) AS visits
FROM animals
JOIN visits
ON animals.id = visits.animals_id
GROUP BY animals.name
ORDER BY visits DESC
LIMIT 1;

SELECT name AS animal
FROM animals
JOIN visits
ON animals.id = visits.animals_id
WHERE date_of_visitation = '2020-01-05';

SELECT animals.name AS animal, vets.name, date_of_visitation
FROM animals
JOIN visits
ON animals.id = visits.animals_id
JOIN vets
ON visits.vets_id = vets.id
WHERE vets_id = 1 AND date_of_visitation = '2021-01-11';

SELECT COUNT(DISTINCT date_of_visitation) AS visits
FROM visits
JOIN animals
ON visits.animals_id = animals.id
WHERE date_of_visitation IN ('2020-05-24', '2020-07-22', '2020-01-05', '2020-03-08', '2020-05-14', '2021-02-24', '2019-12-21', '2020-08-10', '2021-04-07', '2019-01-24', '2019-05-15', '2020-02-27', '2020-08-03');


SELECT species.name AS specialty
FROM animals
JOIN visits
ON animals.id = visits.animals_id
JOIN species
ON animals.species_id = species.id
WHERE animals.id = 9 AND vets_id = 2
LIMIT 1;

explain analyze SELECT COUNT(*) FROM visits where animal_id = 4
explain analyze SELECT * FROM owners where email = 'owner_18327@mail.com';
explain analyze SELECT * FROM visits where vet_id = 2;
explain analyze SELECT * FROM denomalize_visits where vet_id = 2;

