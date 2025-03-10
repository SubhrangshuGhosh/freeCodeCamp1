psql --username=freecodecamp --dbname=postgres

\c universe

CREATE DATABASE space_exploration;

USE space_exploration;

CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    galaxy_type TEXT NOT NULL,
    distance_from_earth NUMERIC NOT NULL,
    has_supermassive_black_hole BOOLEAN NOT NULL
);

CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    galaxy_id INT REFERENCES galaxy(galaxy_id) ON DELETE CASCADE,
    age_in_millions_of_years INT NOT NULL,
    is_main_sequence BOOLEAN NOT NULL
);

CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    star_id INT REFERENCES star(star_id) ON DELETE CASCADE,
    planet_type TEXT NOT NULL,
    has_life BOOLEAN NOT NULL
);


CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    planet_id INT REFERENCES planet(planet_id) ON DELETE CASCADE,
    diameter INT NOT NULL,
    is_spherical BOOLEAN NOT NULL
);




INSERT INTO galaxy (name, galaxy_type, distance_from_earth, has_supermassive_black_hole)
VALUES
    ('Milky Way', 'Spiral', 0, TRUE),
    ('Andromeda', 'Spiral', 2537000, TRUE),
    ('Triangulum', 'Spiral', 3000000, FALSE),
    ('Messier 87', 'Elliptical', 54000000, TRUE),
    ('Whirlpool', 'Spiral', 23000000, FALSE),
    ('Sombrero', 'Elliptical', 29000000, TRUE);


INSERT INTO star (name, galaxy_id, age_in_millions_of_years, is_main_sequence)
VALUES
    ('Sun', 1, 4600, TRUE),
    ('Sirius', 1, 242, TRUE),
    ('Betelgeuse', 1, 8, FALSE),
    ('Alpha Centauri', 1, 5500, TRUE),
    ('Vega', 2, 455, TRUE),
    ('Rigel', 3, 10, FALSE);



INSERT INTO planet (name, star_id, planet_type, has_life)
VALUES
    ('Earth', 1, 'Terrestrial', TRUE),
    ('Mars', 1, 'Terrestrial', FALSE),
    ('Venus', 1, 'Terrestrial', FALSE),
    ('Jupiter', 1, 'Gas Giant', FALSE),
    ('Saturn', 1, 'Gas Giant', FALSE),
    ('Neptune', 1, 'Ice Giant', FALSE),
    ('Proxima b', 4, 'Exoplanet', UNKNOWN),
    ('Gliese 581g', 2, 'Exoplanet', UNKNOWN),
    ('Kepler-22b', 2, 'Exoplanet', UNKNOWN),
    ('HD 209458b', 3, 'Exoplanet', FALSE),
    ('TRAPPIST-1d', 5, 'Exoplanet', TRUE),
    ('LHS 1140b', 6, 'Exoplanet', UNKNOWN);



INSERT INTO moon (name, planet_id, diameter, is_spherical)
VALUES
    ('Moon', 1, 3474, TRUE),
    ('Phobos', 2, 22, FALSE),
    ('Deimos', 2, 12, FALSE),
    ('Io', 4, 3642, TRUE),
    ('Europa', 4, 3121, TRUE),
    ('Ganymede', 4, 5268, TRUE),
    ('Callisto', 4, 4820, TRUE),
    ('Titan', 5, 5150, TRUE),
    ('Enceladus', 5, 504, TRUE),
    ('Mimas', 5, 396, FALSE),
    ('Triton', 6, 2707, TRUE),
    ('Proteus', 6, 420, FALSE),
    ('Nereid', 6, 340, FALSE),
    ('Charon', 7, 1200, TRUE),
    ('Hydra', 7, 51, FALSE),
    ('Kerberos', 7, 19, FALSE),
    ('Kepler Moon 1', 9, 2100, TRUE),
    ('Kepler Moon 2', 9, 2300, TRUE),
    ('Gliese Moon A', 8, 1500, TRUE),
    ('Gliese Moon B', 8, 1400, TRUE);

INSERT INTO asteroid (name, size_km, is_potentially_hazardous, discovered_year, orbit_type) 
VALUES 
    ('Ceres', 939, FALSE, 1801, 'Main Belt'),
    ('Pallas', 512, FALSE, 1802, 'Main Belt'),
    ('Vesta', 525, FALSE, 1807, 'Main Belt'),
    ('Eros', 34, FALSE, 1898, 'Near-Earth'),
    ('Apophis', 0.37, TRUE, 2004, 'Near-Earth'),
    ('Bennu', 0.49, TRUE, 1999, 'Near-Earth'),
    ('Hygiea', 430, FALSE, 1849, 'Main Belt'),
    ('Psyche', 226, FALSE, 1852, 'Main Belt'),
    ('Itokawa', 0.33, FALSE, 1998, 'Near-Earth'),
    ('Ryugu', 0.87, FALSE, 1999, 'Near-Earth');



pg_dump -cC --inserts -U freecodecamp universe > universe.sql


SELECT * FROM galaxy;
SELECT * FROM star;
SELECT * FROM planet;
SELECT * FROM moon;
