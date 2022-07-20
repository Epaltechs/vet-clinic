/* Database schema to keep the structure of entire database. */

-- Create a table named animals with the specific columns
CREATE TABLE animals (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL
);

-- Add a column species of type string to the animals
ALTER TABLE animals ADD species VARCHAR(70);

-- Create a table named owners with id, full_name, age.
CREATE TABLE owners(
 id INT GENERATED ALWAYS AS IDENTITY,
 full_name VARCHAR(100),
 age INT,
 PRIMARY KEY(id)
);

-- Create a table named species with id, name 
CREATE TABLE species(
 id INT GENERATED ALWAYS AS IDENTITY,
 name VARCHAR(80),
 PRIMARY KEY(id)
);

/*
Modify animals table:
 Remove column species
 Add column species_id which is a foreign key referencing species table
 Add column owner_id which is a foreign key referencing the owners table
*/
ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD COLUMN species_id INT
 REFERENCES species(id)
 ON DELETE CASCADE;
 
ALTER TABLE animals ADD COLUMN owner_id INT
 REFERENCES owners(id)
 ON DELETE CASCADE;
 