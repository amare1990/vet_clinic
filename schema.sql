/* Database schema to keep the structure of entire database. */

 create table animals (id INT, name varchar(30), date_of_birth date, escape_attempts INT, neutered boolean, weight_kg decimal);


/* Altered the id filed of animals table using the following commands */
/* alter table animals
alter column id add generated always as identity; */

/* Query and update animals tabel -2nd milestone */

ALTER TABLE animals ADD COLUMN species VARCHAR(30);



/* Third milestone-3rd day */
create table owners (id INT GENERATED ALWAYS AS IDENTITY, full_name VARCHAR(40), age INT);

create table species (id INT GENERATED ALWAYS AS IDENTITY, name VARCHAR(30) PRIMARY KEY(id));

alter table animals
alter column id add generated always as identity;

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
add column species_id INT;

/* making species_id as foreign key */
ALTER TABLE animals                                                                         
ADD CONSTRAINT constraint_fk
FOREIGN KEY (species_id) 
REFERENCES species (id) ON DELETE CASCADE; 

ALTER TABLE animals
add column owner_id INT;

ALTER TABLE animals
ADD CONSTRAINT constraint_fk_owner
FOREIGN KEY (owner_id) 
REFERENCES owners (id) ON DELETE CASCADE;



