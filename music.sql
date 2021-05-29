-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music;

CREATE TABLE albums
(
  album_id SERIAL PRIMARY KEY,
  album TEXT NOT NULL
);

CREATE TABLE producers
(
  producer_id SERIAL PRIMARY KEY,
  producer TEXT NOT NULL,
  album_id INTEGER REFERENCES albums (album_id)
);

CREATE TABLE artists
(
  artist_id SERIAL PRIMARY KEY, 
  artist TEXT NOT NULL
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  album_id INTEGER REFERENCES albums (album_id)
);

CREATE TABLE song_artists
(
  id SERIAL PRIMARY KEY,
  song_id INTEGER REFERENCES songs (id),
  artist_id INTEGER REFERENCES artists (artist_id)
);
