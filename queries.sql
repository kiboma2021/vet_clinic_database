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