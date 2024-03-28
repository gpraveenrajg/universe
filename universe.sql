-- Create the universe database
CREATE DATABASE universe;

-- Connect to the universe database
\c universe;

-- Create the galaxy table
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    size INT NOT NULL,
    classification TEXT,
    has_black_hole BOOLEAN NOT NULL
);

-- Create the star table
CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    galaxy_id INT REFERENCES galaxy(galaxy_id),
    spectral_class VARCHAR(10) NOT NULL,
    luminosity NUMERIC,
    is_supernova BOOLEAN NOT NULL
);

-- Create the planet table
CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    star_id INT REFERENCES star(star_id),
    radius INT NOT NULL,
    mass NUMERIC NOT NULL,
    has_atmosphere BOOLEAN NOT NULL
);

-- Create the moon table
CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    planet_id INT REFERENCES planet(planet_id),
    diameter INT NOT NULL,
    is_inhabited BOOLEAN NOT NULL,
    has_water BOOLEAN NOT NULL
);

-- Add data to the tables (insert data as required by the tasks)

-- Galaxy table
INSERT INTO galaxy (name, size, classification, has_black_hole) VALUES
('Milky Way', 100000, 'Spiral', TRUE),
('Andromeda', 120000, 'Spiral', FALSE),
('Messier 87', 50000, 'Elliptical', TRUE),
('Centaurus A', 40000, 'Elliptical', FALSE),
('Triangulum', 60000, 'Spiral', FALSE),
('Sombrero', 30000, 'Lenticular', FALSE);

-- Star table
INSERT INTO star (name, galaxy_id, spectral_class, luminosity, is_supernova) VALUES
('Sun', 1, 'G2V', 1.0, FALSE),
('Sirius', 1, 'A1V', 25.4, FALSE),
('Alpha Centauri A', 1, 'G2V', 1.5, FALSE),
('Betelgeuse', 2, 'M1Ia', 90000, TRUE),
('Vega', 1, 'A0V', 37, FALSE),
('Arcturus', 4, 'K1.5III', 170, FALSE);

-- Planet table
INSERT INTO planet (name, star_id, radius, mass, has_atmosphere) VALUES
('Earth', 1, 6371, 5.97, TRUE),
('Mars', 1, 3389, 0.642, TRUE),
('Jupiter', 1, 69911, 1898, TRUE),
('Saturn', 1, 58232, 568, TRUE),
('Uranus', 1, 25362, 86.8, TRUE),
('Neptune', 1, 24622, 102, TRUE),
('Mercury', 1, 2439, 0.330, FALSE),
('Venus', 1, 6052, 4.87, TRUE),
('Kepler-10b', 6, 15600, 4.56, TRUE),
('WASP-12b', 6, 15000, 1.41, TRUE),
('PSR B1257+12 A', 3, 8500, 0.05, TRUE),
('TRAPPIST-1d', 5, 5000, 0.297, TRUE);

-- Moon table
INSERT INTO moon (name, planet_id, diameter, is_inhabited, has_water) VALUES
('Moon', 1, 3474, FALSE, TRUE),
('Phobos', 2, 22.2, FALSE, FALSE),
('Deimos', 2, 12.4, FALSE, FALSE),
('Io', 3, 3637, FALSE, TRUE),
('Europa', 3, 3122, FALSE, TRUE),
('Ganymede', 3, 5262, FALSE, TRUE),
('Callisto', 3, 4821, FALSE, TRUE),
('Titan', 4, 5150, FALSE, TRUE),
('Enceladus', 4, 504, FALSE, TRUE),
('Triton', 5, 2706, FALSE, TRUE),
('Ariel', 6, 1158, FALSE, FALSE),
('Umbriel', 6, 1169, FALSE, FALSE),
('Charon', 7, 1212, FALSE, TRUE),
('Proteus', 8, 420, FALSE, FALSE),
('Kepler-10b b', 9, 850, FALSE, FALSE),
('WASP-12b b', 10, 1200, FALSE, FALSE),
('PSR B1257+12 B', 11, 480, FALSE, FALSE),
('TRAPPIST-1b', 12, 1060, FALSE, TRUE),
('TRAPPIST-1c', 12, 1220, FALSE, TRUE),
('TRAPPIST-1d', 12, 680, FALSE, TRUE),
('TRAPPIST-1e', 12, 890, FALSE, TRUE),
('TRAPPIST-1f', 12, 980, FALSE, TRUE),
('TRAPPIST-1g', 12, 1050, FALSE, TRUE),
('TRAPPIST-1h', 12, 790, FALSE, TRUE);

CREATE TABLE constellation (
    constellation_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    abbreviation VARCHAR(10) NOT NULL UNIQUE,
    region VARCHAR(100),
    brightest_star VARCHAR(100),
    visible_season TEXT,
    visible_latitudes TEXT
);
INSERT INTO constellation (name, abbreviation, region, brightest_star, visible_season, visible_latitudes)
VALUES ('Orion', 'Ori', 'Northern Hemisphere', 'Rigel', 'Winter', '85°N to 75°S');

INSERT INTO constellation (name, abbreviation, region, brightest_star, visible_season, visible_latitudes)
VALUES ('Scorpius', 'Sco', 'Southern Hemisphere', 'Antares', 'Summer', '40°S to 90°S');

INSERT INTO constellation (name, abbreviation, region, brightest_star, visible_season, visible_latitudes)
VALUES ('Ursa Major', 'UMa', 'Northern Hemisphere', 'Dubhe', 'Spring', '90°N to 30°S');
