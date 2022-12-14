/* Populate database with sample data. */

insert into animals(name, date_of_birth, escape_attempts, neutered, weight_kg) 
values('Agumon', '2020/01/03', 0, false, 10.23);
insert into animals(name, date_of_birth, escape_attempts, neutered, weight_kg) 
values('Gabumon', '2018/11/15', 2, true, 8);
insert into animals(name, date_of_birth, escape_attempts, neutered, weight_kg) 
values('Pikachu', '2021/01/07', 1, false, 15.04);
insert into animals(name, date_of_birth, escape_attempts, neutered, weight_kg) 
values('Devimon', '2017/05/12', 5, true, 11);


/* In the query and update branch -second milestone of the project */

insert into animals(name, date_of_birth, escape_attempts, neutered, weight_kg, species)
values('Charmander', '2020-02-8', 0, false, 11, null);

insert into animals(name, date_of_birth, escape_attempts, neutered, weight_kg, species) 
values('Plantmon', '2021-11-15', 2, true, 5.7, null);


insert into animals(name, date_of_birth, escape_attempts, neutered, weight_kg, species) 
values('Squirtle', '1993-04-02', 3, false, 12.13, null);

insert into animals(name, date_of_birth, escape_attempts, neutered, weight_kg, species) 
values('Angemon', '2005-06-12', 1, true,45, null);

insert into animals(name, date_of_birth, escape_attempts, neutered, weight_kg, species)
values('Boarmon', '2005-06-07', 7, true, 20.4, null);

insert into animals(name, date_of_birth, escape_attempts, neutered, weight_kg, species) 
values('Blossom', '1998-10-13', 3, true, 17, null);

insert into animals(name, date_of_birth, escape_attempts, neutered, weight_kg, species) 
values('Ditto', '2022-05-14', 4, true, 22, null);


/* Third milestone-3rd day */

/*  Inserting data into owners table */
INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);

/*  Inserting data into owners table */
INSERT INTO species (name) values ('Pokemon'), ('Digimon');

UPDATE animals set species_id = 2 where name like '%mon';
UPDATE animals set species_id = 1 where species_id IS NULL;

UPDATE animals
set owner_id = 1 where name = 'Agumon';
UPDATE animals 
set owner_id =2 where name = 'Gabumon' OR name = 'Pikachu';
UPDATE animals
set owner_id = 3 where name = 'Devimon' OR name = 'Plantmon';
UPDATE animals
set owner_id = 4 where name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';
UPDATE animals
set owner_id = 5 where name = 'Angemon' OR name = 'Boarmon';



