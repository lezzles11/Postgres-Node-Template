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
    username VARCHAR(255) primary key,  
    pass VARCHAR(255) not null, 
    created timestamp 
);

-- #TODO: CREATE NOTE TABLE
CREATE TABLE notes (
    username VARCHAR(255) references users(username),
    noteId INTEGER primary key, 
    content VARCHAR(255) not null, 
    created timestamp
);

INSERT INTO users (username, pass)
VALUES ('lesleyUsername', 'lesleyspass');
INSERT INTO users (username, pass)
VALUES ('samUsername', 'samspass');

SELECT * FROM users; 
INSERT INTO notes (username, noteId, content)
VALUES ('lesleyUsername', 1, 'note content 1');
INSERT INTO notes (username, noteId, content)
VALUES ('lesleyUsername', 2, 'note content 2');
INSERT INTO notes (username, noteId, content)
VALUES ('samUsername', 3, 'note content 3');
INSERT INTO notes (username, noteId, content)
VALUES ('samUsername', 4, 'note content 4');

-- #TODO: QUERY FOR ALL NOTES FROM THAT USER, GIVEN USER NAME 
SELECT * FROM notes WHERE username = 'lesleyUsername';  

-- #TODO: QUERY FOR SPECIFIC USER, GIVEN USER NAME
SELECT * FROM notes WHERE username = 'samUsername';

-- update notes 
UPDATE notes 
SET content = 'new content 3'
WHERE noteId = 3; 

SELECT * FROM notes; 

UPDATE notes 
SET content = 'new content 2'
WHERE noteId = 2;


-- delete command works 
DELETE FROM notes WHERE noteId = 1; 
DELETE FROM notes WHERE noteId = 2; 
DELETE FROM notes WHERE username = 'lesleyUsername';