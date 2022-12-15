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


/* Fourth milestone of the project */
INSERT INTO vets (name, age, date_of_graduation) values('William Tatcher', 45, date '2000-04-23'),
('Maisy Smith', 26, date '2019-01-17' ),
('Stephanie Mendez', 64, date '1981-05-04'),
('Jack Harkness', 38, date '2008-06-08');

INSERT INTO specializations VALUES (1, 1), (3, 1), (3, 2), (4, 2);

INSERT INTO visits VALUES (1, 1, DATE '2020-05-24'),
(1, 3, DATE '2020-07-22'),
(2, 4, DATE '2021-02-02'),
(3, 2, DATE '2020-01-05'),
(3, 2, DATE '2020-03-08'),
(3, 2, DATE '2020-05-20'),
(4, 3, DATE '2021-05-04'),
(5, 4, DATE '2021-02-21'),
(6, 2, DATE '2019-12-21'),
(6, 1, DATE '2020-08-10'),
(6, 2, DATE '2021-04-7'),
(7, 3, DATE '2019-09-29'),
(8, 4, DATE '2020-10-03'),
(8, 4, DATE '2020-11-04'),
(9, 2, DATE '2019-01-24'),
(9, 2, DATE '2019-05-15'),
(9, 2, DATE '2020-02-27'),
(9, 2, DATE '2020-08-03'),
(10, 3, DATE '2020-05-24'),
(10, 1, DATE '2021-01-11');