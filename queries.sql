/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN 'Jan-01-2016'AND 'Dec-31-2019';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <=17.3;

-- TRANSACTION FOR UPDATING SPECIES COLUMN WITH UNSPECIFIED and ROLLBACK

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;

-- rollback to previous state
ROLLBACK;
SELECT * FROM animals;

-- update species to digimon
BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species is NULL;
COMMIT;
SELECT * FROM animals;

-- delete animals table
BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

-- Delete all animals born after Jan 1st, 2022.
BEGIN;
DELETE FROM animals WHERE date_of_birth > 'Jan-01-2022';
SAVEPOINT ANIMALS_AFTER_JAN;
SELECT * FROM animals;

-- Update all animals' weight to be their weight multiplied by -1.
UPDATE animals SET weight_kg = weight_kg * -1;
SELECT * FROM animals;
ROLLBACK TO ANIMALS_AFTER_JAN;
SELECT * FROM animals;

-- Update all animals' weights that are negative to be their weight multiplied by -1
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
SELECT * FROM animals;
COMMIT;
SELECT * FROM animals;

-- queries for animals table
SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;
SELECT SPECIES, MIN(WEIGHT_KG) , MAX(WEIGHT_KG) FROM ANIMALS GROUP BY SPECIES;
SELECT SPECIES, AVG(ESCAPE_ATTEMPTS) FROM ANIMALS WHERE DATE_OF_BIRTH BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY SPECIES;

SELECT name FROM animals INNER JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';
SELECT animals.name FROM animals INNER JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';
SELECT owners.full_name, animals.name FROM animals RIGHT JOIN owners ON animals.owner_id = owners.id;
SELECT species.name, COUNT(*) FROM animals JOIN species ON animals.species_id = species.id GROUP BY species.name;
SELECT animals.name FROM animals INNER JOIN species ON animals.species_id = species.id INNER JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';
SELECT animals.name FROM animals INNER JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;
SELECT owners.full_name, Count(*) AS value_occurence FROM animals INNER JOIN owners ON animals.owner_id = owners.id GROUP BY owners.full_name ORDER BY value_occurence DESC LIMIT 1;

-- advanced query multiple tables
SELECT animals.name FROM animals INNER JOIN visits ON animals.id = visits.animals_id INNER JOIN vets ON vets.id = animals.id WHERE vets.name = 'William Tatcher' ORDER BY visits.DATE_OF_VISIT DESC LIMIT 1;
SELECT COUNT(*) FROM VETS INNER JOIN VISITS ON VETS.ID = VISITS.VETS_ID WHERE VETS.NAME = 'Stephanie Mendez';
SELECT VETS.NAME, SPECIES.NAME FROM VETS LEFT JOIN specializations ON VETS.ID = specializations.VETS_ID LEFT JOIN SPECIES ON specializations.SPECIES_ID = SPECIES.ID;
SELECT ANIMALS.NAME FROM ANIMALS INNER JOIN VISITS ON ANIMALS.ID = VISITS.ANIMALS_ID INNER JOIN VETS ON VETS.ID = VISITS.VETS_ID WHERE VETS.NAME = 'Stephanie Mendez' AND DATE_OF_VISIT BETWEEN '2020-04-01' AND '2020-08-30';
SELECT ANIMALS.NAME, COUNT(VISITS.*) FROM ANIMALS INNER JOIN VISITS ON ANIMALS.ID = VISITS.ANIMALS_ID GROUP BY ANIMALS.NAME ORDER BY COUNT DESC LIMIT 1;
SELECT ANIMALS.NAME, VISITS.DATE_OF_VISIT FROM ANIMALS INNER JOIN VISITS ON VISITS.ANIMALS_ID = ANIMALS.ID INNER JOIN VETS ON VETS.ID = VISITS.VETS_ID WHERE VETS.NAME = 'Maisy Smith' ORDER BY VISITS.DATE_OF_VISIT LIMIT 1;
SELECT ANIMALS.NAME AS ANIMAL_NAME, ANIMALS.DATE_OF_BIRTH, ANIMALS.WEIGHT_KG, VETS.NAME AS VETS_NAME, VETS.AGE, VISITS.DATE_OF_VISIT FROM ANIMALS INNER JOIN  VISITS ON VISITS.ANIMALS_ID = ANIMALS.ID INNER JOIN VETS ON VETS.ID = VISITS.VETS_ID ORDER BY VISITS.DATE_OF_VISIT DESC LIMIT 1;
SELECT COUNT(*) FROM ANIMALS INNER JOIN VISITS ON VISITS.ANIMALS_ID = ANIMALS.ID INNER JOIN VETS ON VETS.ID = VISITS.VETS_ID WHERE ANIMALS.SPECIES_ID NOT IN(SELECT SPECIES_ID FROM specializations WHERE VETS_ID = VETS.ID);
SELECT SPECIES.NAME FROM ANIMALS INNER JOIN VISITS ON VISITS.ANIMALS_ID = ANIMALS.ID INNER JOIN VETS ON VETS.ID = VISITS.VETS_ID INNER JOIN SPECIES ON  SPECIES.ID = ANIMALS.SPECIES_ID WHERE VETS.NAME = 'Maisy Smith' GROUP BY SPECIES.NAME ORDER BY COUNT(VISITS.*) DESC  LIMIT 1;
