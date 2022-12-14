/* Populate database with sample data. */

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (1, 'Agumon', 'Feb-3-2020', 0, true, 10.23);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (2, 'Gabumon', 'Nov-15-2018', 2, true, 8);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (4, 'Devimon', 'May-12-2017', 5, true, 11);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (3, 'Pikachu', 'Jan-07-2021', 1, false, 15.04);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (5, 'Charmander', 'Feb-8-2020', 0, false, -11);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (6, 'Plantmon', 'Nov-15-2021', 2, true, -5.7);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (7, 'Squirtle', 'Apr-02-1993', 3, false, -12.13);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (8, 'Angemon', 'Jun-12-2005', 1, true, -45);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (9, 'Boarmon', 'Jun-07-2005', 7, true, -20.4);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (10, 'Blossom', 'Oct-13-1998', 3, true, -17);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (11, 'Ditto', 'May-14-2022', 4, true, -22);

/* owners' table */
INSERT INTO
  owners (full_name, age)
VALUES
  ('Sam Smith', 34),
  ('Jennifer Orwell', 19),
  ('Bob', 45),
  ('Melody Pond', 77),
  ('Dean Winchester', 14),
  ('Jodie Whittaker', 38);

/* species' table */
INSERT INTO
  species (name)
VALUES
  ('Pokemon'),
  ('Digimon');


/* Updating animals' table */
UPDATE animals
SET species_id = species.id
FROM species
WHERE animals.name LIKE '%mon%' AND species.name = 'Digimon';

UPDATE animals
SET species_id = species.id
FROM species
WHERE species_id IS NULL AND species.name = 'Pokemon';

-- owner_id

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name  = 'Sam Smith') WHERE name IN('Agumon'); 
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name  = 'Jennifer Orwell') WHERE name IN('Gabumon' , 'Pikachu'); 
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name  = 'Bob') WHERE name IN('Devimon', 'Plantmon'); 
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name  = 'Melody Pond') WHERE name IN('Charmander', 'Squirtle', 'Blossom'); 
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name  = 'Dean Winchester') WHERE name IN('Angemon' , 'Boarmon');

insert into vets (name, age, date_of_graduation) values ('William Tatcher', 45, 'Apr 4, 1981'), ('Maisy Smith', 26, 'Jan 17, 2019'), ('Stephanie Mendez', 64, 'May 4, 1981'), ('Jack Harkness', 38, 'Jun 8, 2008');

-- Specialties data 
INSERT INTO specializations (species_id, vets_id) SELECT species.id, vets.id FROM species INNER JOIN vets ON species.name = 'Pokemon' AND vets.name = 'William Tatcher';
INSERT INTO specializations (species_id, vets_id) SELECT species.id, vets.id FROM species INNER JOIN vets ON species.name In('Pokemon', 'Digimon') AND vets.name = 'Stephanie Mendez';
INSERT INTO specializations (species_id, vets_id) SELECT species.id, vets.id FROM species INNER JOIN vets ON species.name = 'Digimon' AND vets.name = 'Jack Harkness';

--Visits data
INSERT INTO VISITS (ANIMALS_ID, VETS_ID, DATE_OF_VISIT) SELECT ANIMALS.ID, VETS.ID , '2020-05-24' FROM ANIMALS INNER JOIN VETS ON ANIMALS.NAME = 'Agumon' AND VETS.NAME = 'William Tatcher';
INSERT INTO VISITS (ANIMALS_ID, VETS_ID, DATE_OF_VISIT) SELECT ANIMALS.ID, VETS.ID , '2020-07-22' FROM ANIMALS INNER JOIN VETS ON ANIMALS.NAME = 'Agumon' AND VETS.NAME = 'Stephanie Mendez';

INSERT INTO VISITS (ANIMALS_ID, VETS_ID, DATE_OF_VISIT) SELECT ANIMALS.ID, VETS.ID , '2021-02-02' FROM ANIMALS INNER JOIN VETS ON ANIMALS.NAME = 'Gabumon' AND VETS.NAME = 'Jack Harkness';
INSERT INTO VISITS (ANIMALS_ID, VETS_ID, DATE_OF_VISIT) SELECT ANIMALS.ID, VETS.ID , '2020-01-05' FROM ANIMALS INNER JOIN VETS ON ANIMALS.NAME = 'Pikachu' AND VETS.NAME = 'Maisy Smith';
INSERT INTO VISITS (ANIMALS_ID, VETS_ID, DATE_OF_VISIT) SELECT ANIMALS.ID, VETS.ID , '2020-03-08' FROM ANIMALS INNER JOIN VETS ON ANIMALS.NAME = 'Pikachu' AND VETS.NAME = 'Maisy Smith';
INSERT INTO VISITS (ANIMALS_ID, VETS_ID, DATE_OF_VISIT) SELECT ANIMALS.ID, VETS.ID , '2020-05-14' FROM ANIMALS INNER JOIN VETS ON ANIMALS.NAME = 'Pikachu' AND VETS.NAME = 'Maisy Smith';
INSERT INTO VISITS (ANIMALS_ID, VETS_ID, DATE_OF_VISIT) SELECT ANIMALS.ID, VETS.ID , '2021-05-04' FROM ANIMALS INNER JOIN VETS ON ANIMALS.NAME = 'Devimon' AND VETS.NAME = 'Stephanie Mendez';
INSERT INTO VISITS (ANIMALS_ID, VETS_ID, DATE_OF_VISIT) SELECT ANIMALS.ID, VETS.ID , '2021-02-24' FROM ANIMALS INNER JOIN VETS ON ANIMALS.NAME = 'Charmander' AND VETS.NAME = 'Jack Harkness';
INSERT INTO VISITS (ANIMALS_ID, VETS_ID, DATE_OF_VISIT) SELECT ANIMALS.ID, VETS.ID , '2019-12-21' FROM ANIMALS INNER JOIN VETS ON ANIMALS.NAME = 'Plantmon' AND VETS.NAME = 'Maisy Smith';
INSERT INTO VISITS (ANIMALS_ID, VETS_ID, DATE_OF_VISIT) SELECT ANIMALS.ID, VETS.ID , '2020-08-10' FROM ANIMALS INNER JOIN VETS ON ANIMALS.NAME = 'Plantmon' AND VETS.NAME = 'William Tatcher';
INSERT INTO VISITS (ANIMALS_ID, VETS_ID, DATE_OF_VISIT) SELECT ANIMALS.ID, VETS.ID , '2021-04-07' FROM ANIMALS INNER JOIN VETS ON ANIMALS.NAME = 'Plantmon' AND VETS.NAME = 'Maisy Smith';
INSERT INTO VISITS (ANIMALS_ID, VETS_ID, DATE_OF_VISIT) SELECT ANIMALS.ID, VETS.ID , '2019-09-29' FROM ANIMALS INNER JOIN VETS ON ANIMALS.NAME = 'Squirtle' AND VETS.NAME = 'Stephanie Mendez';
INSERT INTO VISITS (ANIMALS_ID, VETS_ID, DATE_OF_VISIT) SELECT ANIMALS.ID, VETS.ID , '2020-10-03' FROM ANIMALS INNER JOIN VETS ON ANIMALS.NAME = 'Angemon' AND VETS.NAME = 'Jack Harkness';
INSERT INTO VISITS (ANIMALS_ID, VETS_ID, DATE_OF_VISIT) SELECT ANIMALS.ID, VETS.ID , '2020-11-04' FROM ANIMALS INNER JOIN VETS ON ANIMALS.NAME = 'Angemon' AND VETS.NAME = 'Jack Harkness';
INSERT INTO VISITS (ANIMALS_ID, VETS_ID, DATE_OF_VISIT) SELECT ANIMALS.ID, VETS.ID , '2019-01-24' FROM ANIMALS INNER JOIN VETS ON ANIMALS.NAME = 'Boarmon' AND VETS.NAME = 'Maisy Smith';
INSERT INTO VISITS (ANIMALS_ID, VETS_ID, DATE_OF_VISIT) SELECT ANIMALS.ID, VETS.ID , '2019-05-15' FROM ANIMALS INNER JOIN VETS ON ANIMALS.NAME = 'Boarmon' AND VETS.NAME = 'Maisy Smith';
INSERT INTO VISITS (ANIMALS_ID, VETS_ID, DATE_OF_VISIT) SELECT ANIMALS.ID, VETS.ID , '2020-02-27' FROM ANIMALS INNER JOIN VETS ON ANIMALS.NAME = 'Boarmon' AND VETS.NAME = 'Maisy Smith';
INSERT INTO VISITS (ANIMALS_ID, VETS_ID, DATE_OF_VISIT) SELECT ANIMALS.ID, VETS.ID , '2020-08-03' FROM ANIMALS INNER JOIN VETS ON ANIMALS.NAME = 'Boarmon' AND VETS.NAME = 'Maisy Smith';
INSERT INTO VISITS (ANIMALS_ID, VETS_ID, DATE_OF_VISIT) SELECT ANIMALS.ID, VETS.ID , '2020-05-24' FROM ANIMALS INNER JOIN VETS ON ANIMALS.NAME = 'Blossom' AND VETS.NAME = 'Stephanie Mendez';
INSERT INTO VISITS (ANIMALS_ID, VETS_ID, DATE_OF_VISIT) SELECT ANIMALS.ID, VETS.ID , '2021-01-11' FROM ANIMALS INNER JOIN VETS ON ANIMALS.NAME = 'Blossom' AND VETS.NAME = 'William Tatcher';
