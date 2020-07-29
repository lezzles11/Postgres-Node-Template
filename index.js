require("dotenv").config();
const express = require("express");
const cors = require("cors");
const app = express();
app.use(cors());
const db = require("./db");
const create_user_table = `
CREATE TABLE users (
    username VARCHAR(255) primary key,  
    pass VARCHAR(255) not null, 
    created timestamp 
);
`;
const add_user_one = `
INSERT INTO users (username, pass)
VALUES ('lesleyUsername', 'lesleyspass');
`;
const add_user_two = `
INSERT INTO users (username, pass)
VALUES ('samUsername', 'samspass');
`;
const get_users = `
SELECT * FROM users; 
`;
function execute(query) {
  console.log("EXECUTING QUERY\n");
  console.log("CURRENT QUERY: \n" + query + "\n");
  db.query(query, (err, res) => {
    if (err) {
      console.log(err);
    } else {
      console.log(res.rows);
    }
  });
}
// execute(create_user_table);
execute(get_users);

// #TODO: CONTINUE TO GO THROUGH THE TUTORIAL
// #TODO: CREATE USER TABLE

// #TODO: CREATE NOTES TABLE
const create_notes_table = `
CREATE TABLE notes (
    username VARCHAR(255) references users(username),
    noteId INTEGER primary key, 
    content VARCHAR(255) not null, 
    created timestamp
);
`;
// #TODO: ADD USER
// #TODO: ADD NOTE
// #TODO: GET NOTE
// #TODO: GET USER
// #TODO: DELETE NOTE
// #TODO: DELETE USER
// #TODO: EDIT NOTE
// #TODO: EDIT USER

// #TODO: SET UP ROUTES WITH THE QUERY
// #TODO: SET UP WITH POSTMAN
// #TODO:
