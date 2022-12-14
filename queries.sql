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

/* Third milestone-3rd day */
What animals belong to Melody Pond?
select animals.name from animals join owners on owners.id = animals.owner_id where owners.full_name = 'Melody Pond';

List of all animals that are pokemon (their type is Pokemon).
SELECT animals.name from animals JOIN species ON species.id = animals.species_id where species.name = 'Pokemon';

List all owners and their animals, remember to include those that don't own any animal.
SELECT owners.full_name, animals.name from owners LEFT JOIN animals ON animals.owner_id = owners.id;

How many animals are there per species?
SELECT species.name, COUNT(species.name) FROM species JOIN animals ON animals.species_id = species.id GROUP BY species.name;

List all Digimon owned by Jennifer Orwell.
SELECT animals.name FROM animals JOIN owners ON owners.id = animals.owner_id
JOIN species ON species.id = animals.species_id
WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';

List all animals owned by Dean Winchester that haven't tried to escape.
SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

Who owns the most animals?
SELECT owners.full_name, COUNT(animals.name) FROM animals JOIN owners ON owners.id = animals.owner_id
GROUP BY owners.full_name ORDER BY COUNT(animals.name)
DESC LIMIT 1;



/* 4th milestone - 4th day" */
Who was the last animal seen by William Tatcher?
SELECT animals.name FROM animals JOIN visits ON animals.id = visits.animal_id JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'William Tatcher' ORDER BY date_of_visit DESC LIMIT 1;

How many different animals did Stephanie Mendez see?
SELECT COUNT(DISTINCT animals.name) FROM  animals JOIN visits ON animals.id = visits.animal_id
JOIN vets ON vets.id = visits.vet_id 
WHERE vets.name = 'Stephanie Mendez';

List all vets and their specialties, including vets with no specialties.
SELECT vets.name, species.name AS "Specialization" FROM vets LEFT JOIN specializations ON vets.id = specializations.vet_id
JOIN species ON species.id = specializations.species_id;

List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animals.name FROM animals JOIN visits ON animals.id = visits.animal_id JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'Stephanie Mendez' AND (visits.date_of_visit BETWEEN DATE '2020-04-01' AND DATE '2020-08-30'); 


What animal has the most visits to vets?
SELECT animals.name, COUNT(visits.animal_id) FROM animals JOIN visits ON animals.id = visits.animal_id 
GROUP BY animals.name ORDER BY COUNT(visits.animal_id) DESC LIMIT 1;

Who was Maisy Smith's first visit?
select animals.name from animals join visits on visits.animal_id = animals.id join vets on vets.id = visits.vet_id
where vets.name = 'Maisy Smith' ORDER bY visits.date_of_visit ASC limit 1;

Details for most recent visit: animal information, vet information, and date of visit.
SELECT animals.name, vets.name, visits.date_of_visit FROM animals
JOIN visits ON visits.animal_id = animals.id
JOIN vets ON vets.id = visits.vet_id ORDER bY visits.date_of_visit
DESC LIMIT 1;

How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(visits.animal_id) FROM animals JOIN visits ON visits.animal_id = animals.id
JOIN vets ON vets.id = visits.vet_id
JOIN species spa ON spa.id = animals.species_id
JOIN specializations ON specializations.vet_id = vets.id
JOIN species spsp ON specializations.species_id = spsp.id
WHERE spa.name != spsp.name;

What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT vets.name, species.name, COUNT (species.name) FROM vets
JOIN visits ON visits.vet_id = vets.id
JOIN animals ON animals.id = visits.animal_id
JOIN species ON animals.species_id = species.id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name, vets.name
ORDER BY COUNT(species.name) ASC LIMIT 1;


