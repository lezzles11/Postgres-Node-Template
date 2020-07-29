-- https://sp.postgresqltutorial.com/wp-content/uploads/2018/03/PostgreSQL-Cheat-Sheet.pdf

-- start postgres
-- sudo service  postgresql start

-- login 

-- create database
-- createdb <dbname> 

-- go into specific database
-- psql <dbname> 

-- check all users 
-- \du 

-- list all tables 
-- \dt 
-- list databases
-- \list 

CREATE TABLE students (
    id SERIAL primary key,
    name VARCHAR(255) not null,
    grade INTEGER,
    gender BOOLEAN,
    sport VARCHAR(255)
   );

INSERT INTO students (name, grade, gender, sport) 
VALUES (‘John’, 12,  True, ‘Football’);

DELETE FROM students WHERE grade = 13;

UPDATE students SET grade = 13 WHERE grade = 12;

SELECT * FROM students; 

SELECT * FROM students WHERE sport = ‘Football’ AND grade > 12;

SELECT * FROM students WHERE sport = ‘Hockey’ OR gender = False;
SELECT * FROM students WHERE sport = ‘Hockey’ OR gender = False AND grade < 13;
DROP TABLE students; 