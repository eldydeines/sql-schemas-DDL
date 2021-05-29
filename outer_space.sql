-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space;

CREATE TABLE stars
(
  star_id SERIAL PRIMARY KEY,
  star TEXT NOT NULL,
  galaxy TEXT NOT NULL
);

CREATE TABLE moons
(
  moon_id SERIAL PRIMARY KEY,
  moon TEXT NOT NULL
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  planet TEXT NOT NULL
);

CREATE TABLE orbits
(
  orbit_id SERIAL PRIMARY KEY,
  planet_id INTEGER REFERENCES planets (id),
  orbits_around INTEGER REFERENCES stars (star_id),
  orbital_period_in_years FLOAT NOT NULL
);
