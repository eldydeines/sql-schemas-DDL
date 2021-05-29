--INITIALISE DATABASE

DROP DATABASE IF EXISTS craigslist_db;

CREATE DATABASE craigslist_db;

\c craigslist_db

-- CREATE TABLES & INSERT ROWS

CREATE TABLE regions
    (reg_id SERIAL PRIMARY KEY, 
    region TEXT NOT NULL, 
    town TEXT);

INSERT INTO regions 
    (region, town)
VALUES
    ('south', 'houston'),
    ('south', 'austin'),
    ('east', 'charlotte'),
    ('east', 'raleigh'),
    ('west','san diego'),
    ('west', 'portland'),
    ('north', 'denver'),
    ('north', 'chicago');

CREATE TABLE users
    (u_id SERIAL PRIMARY KEY,
    username TEXT NOT NULL UNIQUE,
    preference INTEGER REFERENCES regions (reg_id)
    );

INSERT INTO users
    (username, preference)
VALUES
    ('chiqueen', 1),
    ('elphy', 4),
    ('sellerbeware', 2),
    ('garage_owner', 8);


CREATE TABLE posts 
    ( post_id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    descripter TEXT,
    u_id INTEGER REFERENCES users (u_id),
    post_address TEXT, 
    region INTEGER REFERENCES regions (reg_id)
    );

INSERT INTO posts
    (title, u_id, region)
VALUES
    ('Lawn Service', 1, 7),
    ('Wood for Free', 2, 2),
    ('Boxes for Free', 4, 8),
    ('Grass Clippings', 3, 7),
    ('Plumbing Supplies', 2, 8);

CREATE TABLE categories
    (category_id SERIAL PRIMARY KEY,
    category TEXT NOT NULL,
    post_id INTEGER REFERENCES posts (post_id)
    );

INSERT INTO categories
    (category, post_id)
VALUES
   ('lawn', 1),
   ('lawn', 4),
   ('plumbing', 5),
   ('free', 2),
   ('free', 3);
