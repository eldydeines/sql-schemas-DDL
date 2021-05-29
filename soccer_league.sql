--INITIALISE DATABASE

DROP DATABASE IF EXISTS league_db;

CREATE DATABASE league_db;

\c league_db

-- CREATE TABLES

CREATE TABLE teams
    (tm_id SERIAL PRIMARY KEY, 
    team TEXT NOT NULL UNIQUE, 
    current_rank INTEGER 
    );

INSERT INTO teams 
    (team, current_rank)
VALUES
    ('Cougars', 1),
    ('Squirrels', 3),
    ('Zebras', 4),
    ('Horses', 2);

CREATE TABLE players
    (pl_id SERIAL PRIMARY KEY,
    player TEXT NOT NULL,
    team_id INTEGER REFERENCES teams (tm_id)
    );

INSERT INTO players
    (player, team_id)
VALUES
    ('Eliza Manilla', 1),
    ('Jack Hunt', 1),
    ('Mary Houser', 2),
    ('Harry Howser', 2),
    ('Josh Harmon', 3),
    ('Domingo Tre', 3),
    ('Earl Gray', 4),
    ('Chris Laslow', 4);

CREATE TABLE seasons
    ( season_id SERIAL PRIMARY KEY,
    start_of_season DATE,
    end_of_season DATE
    );

INSERT INTO seasons
    (start_of_season, end_of_season)
VALUES
    ('2020-05-01', '2020-09-30'),
    ('2021-05-01', '2020-08-31');


CREATE TABLE referees
    (ref_id SERIAL PRIMARY KEY,
    referee TEXT NOT NULL
    );

INSERT INTO referees
    (referee)
VALUES
    ('Joe Homey'),
    ('Krissy Marney'),
    ('Lori Frame');


CREATE TABLE match
    (match_id SERIAL PRIMARY KEY, 
    winner INTEGER REFERENCES teams (tm_id),
    loser INTEGER REFERENCES teams (tm_id), 
    winner_score INTEGER, 
    loser_score INTEGER, 
    ref_id INTEGER REFERENCES referees (ref_id),
    season_id INTEGER REFERENCES seasons (season_id)
    );

INSERT INTO match
    (winner, loser, winner_score, loser_score, ref_id, season_id)
VALUES
    (1, 2, 3, 2, 1, 1),
    (2, 3, 4, 3, 3, 1),
    (3, 4, 3, 1, 2, 1),
    (4, 1, 3, 0, 1, 2);

CREATE TABLE goals
(
    id SERIAL PRIMARY KEY, 
    player_id INTEGER REFERENCES players (pl_id),
    match_id INTEGER REFERENCES match (match_id),
    time_of_goal TIMESTAMP NOT NULL
)


