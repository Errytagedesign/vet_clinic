-- Active: 1695416737359@@127.0.0.1@5432@vet_clinic
/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL(10, 2)
);

-- Modify your schema.sql file.
--Add a column species of type string to your animals table.
ALTER TABLE animals
ADD COLUMN species VARCHAR(255)