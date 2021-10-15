DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors
(
    id SERIAL PRIMARY KEY,
    last_name TEXT NOT NULL,
    patients_id REFERENCES patients[]
)

CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    doctors REFERENCES doctors[],
    diseases REFERENCES diseases[]
)

CREATE TABLE diseases
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
)

INSERT INTO diseases 
(disease_name)
VALUES
('chicken pox'),
('whooping cough'),
('flu');

INSERT INTO patients
(first_name, last_name, doctors, diseases)
VALUES
('John', 'Smith', '{1}', '{1, 2}'),
('Jane', 'Smith', '{1}', '{2}');

INSERT INTO doctors
(last_name, patients_id)
VALUES
('Thomas', '{1}'),
('Thomas', '{1}');

