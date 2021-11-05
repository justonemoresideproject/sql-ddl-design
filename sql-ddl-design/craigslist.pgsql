DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist;

CREATE TABLE regions
(
    id SERIAL PRIMARY KEY,
    region_name TEXT UNIQUE NOT NULL
)

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    preferred_region REFERENCES regions NOT NULL,
    username TEXT UNIQUE NOT NULL
)

-- the location of the posting, the region of the posting
CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    categories REFERENCES categories NOT NULL,
    username REFERENCES users NOT NULL,
    title TEXT NOT NULL,
    locationOfPosting TEXT NOT NULL,
    region REFERENCES regions NOT NULL,
    descrition TEXT
)

CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
)

INSERT INTO categories
(name)
VALUES
('jobs'),
('furniture'),
('clothing');

INSERT INTO regions
(name)
VALUES
('Las Vegas, NV'),
('Joplin, MO'),
('Area 51, NV')
('Dark side of the moon');

INSERT INTO users
(name, preferred_region)
VALUES
('shoe_buyer79', '{2}'),
('not_an_alien1x37', '{3}');

INSERT INTO posts
(categories, username, title, locationOfPosting, region, descrition)
VALUES
('{1}', '{2}', 'Transport to the moon', 'near Area 51', '{1}', 'looking for reliable human ship to transport another human to the moon. Must not have connections to government')