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



-- pgjoinsyntax
-- the reason why you want to have a foreign key is because you want to 
-- maintain the integrity of the data 
-- e.g., one cannot add a new note if the user does not exist. 

-- #TODO: CREATE USER TABLE 
CREATE TABLE users (
    userId INTEGER primary key, 
    username VARCHAR(255) not null, 
    pass PASSWORD not null, 
    created timestamp 
)

-- #TODO: CREATE NOTE TABLE
CREATE TABLE notes (
    userId INTEGER references users(userId),
    noteId INTEGER primary key, 
    content VARCHAR(255) not null, 
    created timestamp
)

INSERT INTO users (userId, username, pass)
VALUES (1, 'lesleyUsername', 'lesleyspass');
INSERT INTO users (userId, username, pass)
VALUES (2, 'samUsername', 'samspass');

INSERT INTO notes (userId, noteId, content)
VALUES (1, 1, 'note content 1');
INSERT INTO notes (userId, noteId, content)
VALUES (1, 2, 'note content 2');
INSERT INTO notes (userId, noteId, content)
VALUES (2, 3, 'note content 3');
INSERT INTO notes (userId, noteId, content)
VALUES (2, 4, 'note content 4');

-- #TODO: QUERY FOR ALL NOTES FROM THAT USER, GIVEN USER NAME 


SELECT * FROM notes WHERE username = 'lesleyUsername'; 
SELECT * FROM notes WHERE username = 'samUsername'; 

-- #TODO: QUERY FOR SPECIFIC USER, GIVEN USER NAME

SELECT * FROM users WHERE username = 'lesleyUsername'; 
SELECT * FROM users WHERE username = 'samUsername';