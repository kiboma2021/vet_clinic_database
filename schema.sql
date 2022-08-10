/* vet_clinic database. */

CREATE TABLE animals(
    id INT PRIMARY KEY NOT NULL,
    name CHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL
);

ALTER TABLE animals ADD species VARCHAR(255);