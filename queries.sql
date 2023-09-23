/*Queries that provide answers to the questions from all projects.*/ -- Find all animals whose name ends in "mon".

SELECT *
FROM animals
WHERE name LIKE '%mon';

-- List the name of all animals born between 2016 and 2019.

SELECT name
FROM animals
WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

-- List the name of all animals that are neutered and have less than 3 escape attempts.

SELECT name
FROM animals
WHERE neutered = true
     AND escape_attempts < 3;

-- List the date of birth of all animals named either "Agumon" or "Pikachu".

SELECT date_of_birth
FROM animals
WHERE name IN ('Agumon',
               'Pikachu');

-- List name and escape attempts of animals that weigh more than 10.5kg.

SELECT name,
       escape_attempts
FROM animals
WHERE weight_kg > 10.5;

-- Find all animals that are neutered.

SELECT *
FROM animals
WHERE neutered = true;

-- Find all animals not named Gabumon.

SELECT *
FROM animals
WHERE name <> 'Gabumon';

-- Find all animals with a weight between 10.4kg and 17.3kg (inclusive).

SELECT *
FROM animals
WHERE weight_kg BETWEEN 10.4 AND 17.3;

---------------Change species and ROLLBAKC the CHANGES-------------------
 BEGIN;


UPDATE animals
SET species = 'unspecified'
SELECT *
FROM animals;


ROLLBACK;


SELECT *
FROM animals;

--------- Update the table and Commit the transaction...........
 BEGIN;


UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';


SELECT *
FROM animals
WHERE name LIKE '%mon';


UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;


SELECT *
FROM animals
WHERE species = 'pokemon';


COMMIT ---------------DELETE  animals table and ROLLBACK---------
 BEGIN;


DELETE
FROM animals;


ROLLBACK;


SELECT *
FROM animals;

-------Set SAVEPOINT------
 BEGIN;


DELETE
FROM animals
WHERE date_of_birth > '2022-01-01';

SAVEPOINT my_savepoint;


UPDATE animals
SET weight_kg= weight_kg *-1;


ROLLBACK TO my_savepoint;


UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;


COMMIT;

---------------Queries Changes-------------

SELECT COUNT(*) AS animal_count
FROM animals;


SELECT COUNT(*) AS no_escape_count
FROM animals
WHERE escape_attempts = 0;


SELECT AVG(weight_kg) AS average_weight
FROM animals;


SELECT name,
       escape_attempts
FROM animals
WHERE escape_attempts =
          (SELECT MAX(escape_attempts)
           FROM animals);


SELECT species,
       MIN(weight_kg) AS min_weight,
       MAX(weight_kg) AS max_weight
FROM animals
GROUP BY species;


SELECT species,
       AVG(escape_attempts) AS average_escape_attempts
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;


COMMIT;


SELECT *
FROM animals;


SELECT *
FROM animals;