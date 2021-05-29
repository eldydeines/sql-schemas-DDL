-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

-- Improve this schema by removing redundancy in data 

CREATE TABLE passengers
(
  passenger_id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE airlines 
(
  airline_id SERIAL PRIMARY KEY,
  airline TEXT NOT NULL UNIQUE
);

CREATE TABLE destinations
(
  dest_id SERIAL PRIMARY KEY,
  city TEXT NOT NULL,
  county TEXT NOT NULL
);

CREATE TABLE flights
(
  flight_id SERIAL PRIMARY KEY,
  airline_id INTEGER REFERENCES airlines (airline_id),
  destination INTEGER REFERENCES destinations (dest_id),
  arrival INTEGER REFERENCES destinations (dest_id),
  departs TIMESTAMP NOT NULL,
  arrives TIMESTAMP NOT NULL
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  passenger_id INTEGER REFERENCES passengers (passenger_id),
  seat TEXT NOT NULL,
  flight_id INTEGER REFERENCES flights (flight_id)
);
