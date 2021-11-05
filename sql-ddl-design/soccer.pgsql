-- Design a schema for a simple sports league. Your schema should keep track of

-- All of the teams in the league
-- All of the goals scored by every player for each game
-- All of the players in the league and their corresponding teams
-- All of the referees who have been part of each game
-- All of the matches played between teams
-- All of the start and end dates for season that a league has
-- The standings/rankings of each team in the league (This doesn’t have to be its own table if the data can be captured somehow).

DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league;

CREATE TABLE soccer_league
(
    id SERIAL PRIMARY KEY,
    teams REFERENCES teams[],
    season REFERENCES seasons
)

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
)

CREATE TABLE players
(
    id SERIAL PRIMARY KEYS,
    name TEXT NOT NULL,
    team REFERENCES teams
)

CREATE TABLE matches
(
    id SERIAL PRIMARY KEY,
    team_one REFERENCES teams,
    team_two REFERENCES teams
)

CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    scoring_player REFERENCES players,
    scoring_team REFERENCES teams  
)

CREATE TABLE referees
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    games_refereed REFERENCES games
)

CREATE TABLE seasons
(
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
)

INSERT INTO teams
(name)
VALUES
('Liverpool'),
('Man. City'),
('Bayern Munich');

INSERT INTO players
(name, team)
VALUES 
('Mohammad Salah', '{1}'),
('Virgil van Dijk', '{1}'),
('Harvey Elliott', '{1}'),
('Jack Grealish', '{2}'),
('Benjamin Mendy', '{2}'),
('Kevin De Bruyne', '{2}'),
('Rober Lewandowski', '{3}'),
('Lucas Hermandez', '{3}'),
('Thomas Muller', '{3}');

INSERT INTO games
(team_one, team_two)
VALUES
('{1}', '{2}'),
('{3}', '{2}'),
('{2}', '{1}');

INSERT INTO goals
(player, team, vs_team)
VALUES
('{1}', '{1}', '{2}'),
('{1}', '{1}', '{2}'),
('{2}', '{1}', '{2}'),
('{3}', '{1}', '{2}'),
('{4}', '{2}', '{1}'),
('{5}', '{2}', '{1}'),
('{6}', '{2}', '{1}'),
('{7}', '{3}', '{2}'),
('{8}', '{3}', '{2}'),
('{9}', '{3}', '{2}'),
('{9}', '{3}', '{2}');

INSERT INTO referees
(name, games_refereed)
VALUES
('Edvin Jurisevic', '{1}'),
('Edvin Jurisevic', '{2}'),
('Edvin Jurisevic', '{6}'),
('Jair Marruto', '{3}'),
('Jair Marruto', '{9}'),
('Jair Marruto', '{5}'),
('Ismail Elfath', '{4}'),
('Ismail Elfath', '{7}'),
('Ismail Elfath', '{8}');

INSERT INTO seasons
(start_date, end_date)
VALUES
('08-13-2021', '05-22-2022');