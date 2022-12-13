/* Database schema to keep the structure of entire database. */

 create table animals (id INT, name varchar(30), date_of_birth date, escape_attempts INT, neutered boolean, weight_kg decimal);


/* Altered the id filed of animals table using the following commands */
/* alter table animals
alter column id add generated always as identity; */

/* Query and update animals tabel -2nd milestone */

ALTER TABLE animals ADD COLUMN species VARCHAR(30);

