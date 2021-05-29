--INITIALIZE DATABASE

DROP DATABASE IF EXISTS medical_center_db;

CREATE DATABASE medical_center_db;

\c medical_center_db;

-- CREATE TABLES & INSERT DATA

CREATE TABLE med_center 
    (ctr_id SERIAL PRIMARY KEY, 
    building TEXT NOT NULL, 
    floor_num TEXT NOT NULL, 
    department TEXT);

INSERT INTO med_center 
    (building, floor_num, department)
VALUES
    ('McClaire Bldg', 'first', 'general'),
    ('McClaire Bldg', 'second', 'heart'),
    ('McClaire Bldg', 'third', 'lung'),
    ('Hudson Bldg', 'first', 'pediatrics'),
    ('Hudson Bldg', 'second', 'geriatrics'),
    ('Hudson Bldg', 'first', 'gynocologist'),
    ('Harris Hospital', 'first', 'ER'),
    ('Harris Hospital', 'second', 'ICU'),
    ('Harris Hospital', 'third', 'Surgical'),
    ('Harris Hospital', 'fourth', 'Out Patient');

CREATE TABLE doctors 
    (dr_id SERIAL PRIMARY KEY,
    dr_name TEXT NOT NULL,
    license_num VARCHAR(10)
    );

INSERT INTO doctors
    (dr_name, license_num)
VALUES
    ('Eliza Manilla', '00909999IP'),
    ('Jack Hunt', '009097794P'),
    ('Mary Houser', '00908899OP'),
    ('Harry Howser', '00966999MP');


CREATE TABLE patients 
    ( pat_id SERIAL PRIMARY KEY,
    pat_name TEXT NOT NULL,
    insurance TEXT,
    pat_address TEXT
    );

INSERT INTO patients
    (pat_name, insurance, pat_address)
VALUES
    ('Catty Kat', 'Med Ins', '8888 SomeAddress'),
    ('Sherry Shanigan', 'Med Ins', '88 E SomeAddress'),
    ('Joseph Hatter', 'Cad Ins', '8000 SomeAddress'),
    ('Rad Traedon', 'Aid Ins', '9999 SomeAddress');


CREATE TABLE diseases
    (dis_id SERIAL PRIMARY KEY,
    disease TEXT NOT NULL,
    info TEXT,
    symptoms TEXT,
    test TEXT
    );

INSERT INTO diseases
    (disease, info, symptoms, test)
VALUES
    ('heart disease', 'Affects the heart', 'raising heartbeat', 'ekg'),
    ('lung disease', 'Affects the lungs', 'hard breathing', 'o2'),
    ('skin disease', 'Affects the skin', 'rashes', 'sensitivity');

-- CREATE REFERENCE TABLES

CREATE TABLE patient_docs
    (id SERIAL PRIMARY KEY, 
    dr_id INTEGER REFERENCES doctors (dr_id),
    pat_id INTEGER REFERENCES patients (pat_id)
    );

CREATE TABLE dr_appt
    (visit_id SERIAL PRIMARY KEY,
    dr_id INTEGER REFERENCES doctors (dr_id),
    ctr_id INTEGER REFERENCES med_center (ctr_id),
    visit_date DATE
    );

CREATE TABLE patient_visit_disease
    (
       id SERIAL PRIMARY KEY, 
       visit_id INTEGER REFERENCES dr_appt (visit_id),
       pat_id INTEGER REFERENCES patients (pat_id),
       dis_id INTEGER REFERENCES diseases (dis_id)
    );





