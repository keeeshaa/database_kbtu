
-- 1. 
CREATE DATABASE lab2;

-- 2. 
CREATE TABLE countries (
    country_id INT PRIMARY KEY AUTO_INCREMENT,
    country_name VARCHAR(255),
    region_id INT,
    population INT
);

-- 3. 
INSERT INTO countries (country_name, region_id, population)
VALUES ('France', 1, 67000000);

-- 4. 
INSERT INTO countries (country_id, country_name)
VALUES (2, 'Germany');

-- 5. 
INSERT INTO countries (country_name, region_id, population)
VALUES ('Italy', NULL, 60000000);

-- 6. 
INSERT INTO countries (country_name, region_id, population)
VALUES 
('Spain', 2, 47000000),
('Portugal', 2, 10000000),
('Greece', 3, 10400000);

-- 7. 
ALTER TABLE countries
MODIFY country_name VARCHAR(255) DEFAULT 'Kazakhstan';

-- 8.
INSERT INTO countries (region_id, population)
VALUES (4, 19000000);

-- 9.
INSERT INTO countries () VALUES ();

-- 10. 
CREATE TABLE countries_new LIKE countries;

-- 11. 
INSERT INTO countries_new SELECT * FROM countries;

-- 12. 
UPDATE countries
SET region_id = 1
WHERE region_id IS NULL;

-- 13. 
SELECT country_name, population * 1.10 AS "New Population"
FROM countries;

-- 14. 
DELETE FROM countries
WHERE population < 100000;

-- 15. 
DELETE FROM countries_new
WHERE country_id IN (SELECT country_id FROM countries)
RETURNING *;

-- 16. 
DELETE FROM countries
RETURNING *;
