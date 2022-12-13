/*Queries that provide answers to the questions from all projects.*/

select * from animals where name like '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
select name from animals where neutered = true and escape_attempts < 3;
select date_of_birth from animals where name='Agumon' or name='Pikachu';
select name, escape_attempts from animals where weight_kg < 10.5;
select * from animals where neutered = true;
select * from animals where name != 'Gabumon';
select * from animals where (weight_kg between 10.4 and 17.3) OR weight_kg = 10.4 OR weight_kg = 17.3;

/* On Query and Update animals table: second milestone */

BEGIN TRANSACTION;
update animals
set species='pokemon' where species is null;
COMMIT;


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




