require("dotenv").config();
const express = require("express");
const cors = require("cors");
const app = express();
app.use(cors());
const db = require("./db");
const bodyParser = require("body-parser");

const hbs = require("express-handlebars");
const { response } = require("express");
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(cors());

// Configure for HBS
app.engine(
  "hbs",
  hbs({
    extname: ".hbs",
    defaultLayout: "main",
    layoutsDir: __dirname + "/views/layouts",
  })
);
app.set("view engine", "hbs");

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

const create_notes_table = `
CREATE TABLE notes (
    username VARCHAR(255) references users(username),
    noteId INTEGER primary key, 
    content VARCHAR(255) not null, 
    created timestamp
);
`;
const get_notes = `
SELECT * FROM notes; 
`;

// Pass in the query as a parameter, then execute it
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
//execute(get_notes);

function addNote(username, noteid, content) {
  let string = `INSERT INTO notes (username, noteId, content) VALUES ('${username}', '${noteid}', '${content}');`;
  return string;
}

let allnotes = execute(get_notes);

// #TODO: SET UP ROUTES WITH THE QUERY

// #TODO: collect data from frontend
// #TODO: and then pass the data into the function and then send to backend

app.get("/", (req, res) => {
  return res.redirect("/form_get");
});
app.get("/form_get", (req, res) => {
  return res.render("form_get");
});

app.get("/submit_get", (req, res) => {
  return res.send(req.query);
});

app.get("/form_post", (req, res) => {
  return res.render("form_post");
});

app.post("/submit_post", (req, res) => {
  return res.send(req.body);
});
app.listen(3000, () => {
  console.log("app listening on 3000");
});
// #TODO: SET UP WITH POSTMAN
