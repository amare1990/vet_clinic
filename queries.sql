/*Queries that provide answers to the questions from all projects.*/

select * from animals where name like '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
select name from animals where neutered = true and escape_attempts < 3;
select date_of_birth from animals where name='Agumon' or name='Pikachu';
select name, escape_attempts from animals where weight_kg < 10.5;
select * from animals where neutered = true;
select * from animals where name != 'Gabumon';
select * from animals where (weight_kg between 10.4 and 17.3) OR weight_kg = 10.4 OR weight_kg = 17.3;


/* On Query and Update animals table: second milestone of the project */

begin;
update animals
set species = 'unspecified';
select * from animals;
rollback;
select * from animals; /* Species becomes null/empty */


BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE species LIKE '%mon';
select name, species from animals;

UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;
SELECT name, species FROM animals;
COMMIT;
SELECT name, species FROM animals;


BEGIN TRANSACTION;
delete from animals;
select * from animals; /* empty */
ROLLBACK;
select * from animals; /* The previous result */


BEGIN TRANSACTION;
DELETE FROM animals where date_of_birth > '2022-01-01';
SAVEPOINT negativeweight;
update animals
set weight_kg = -1*weight_kg;
select * from animals;  /* Result set where the weight is now -ve */
ROLLBACK to negativeweight; ;
select * from animals;  /* Result set where the weight is now positive, i.e the weight before multiplied by -1 */

update animals
set weight_kg = -1*weight_kg where weight_kg < 0; /* Nothing changed as all weight is greater than 0*/
COMMIT;


/* Write queries to answer the following questions: */
How many animals are there? select count(*) from animals;
How many animals have never tried to escape? select count(*) from animals where escape_attempts = 0;
What is the average weight of animals? select AVG(weight_kg) from animals;
Who escapes the most, neutered or not neutered animals? select neutered, max(escape_attempts) from animals Group by neutered;
What is the minimum and maximum weight of each type of animal? select species, min(weight_kg), max(weight_kg) from animals GROUP BY species;
What is the average number of escape attempts per animal type of those born between 1990 and 2000?
select species, AVG(escape_attempts) from animals where date_of_birth between '1990-01-01' and '2000-12-31' GROUP BY species;




