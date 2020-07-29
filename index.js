require("dotenv").config();

// npm install --save pg
const { Pool, Client } = require("pg");
var config = {
  user: "postgres",
  database: process.env.DB_USER,
  password: process.env.DB_PASS,
  host: "localhost",
  post: 5432,
  max: 10,
  idleTimeoutMillis: 30000,
};

const pool = new Pool(config);
pool.query("SELECT * FROM pizza", (err, res) => {
  // console.log("\nPool Query\n");
  //console.log(err, res);
  pool.end();
});
const client = new Client(config);
client.connect();

// client.query initiates the query
// query (SELECT * FROM pizza)
// call back (function (err, results))
// if error, console log error
// Otherwise, log the rows to the console
// client.query("SELECT * FROM pizza", function (err, results) {
//   if (err) {
//     console.log(err);
//   }
//   console.log("\nClient Query\n");
//   console.log(results.rows);
// });

function getPizza(name) {
  var client = new Client(config);
  client.connect();
  var query = "SELECT * FROM pizza WHERE pizza_name = $1;";

  console.log("Running get pizza function here!");
  client.query(query, [name], function (err, results) {
    if (err) {
      console.log(err);
    }
    console.log(results.rows);
  });
}
getPizza("Pineapple");

// #TODO: CONTINUE TO GO THROUGH THE TUTORIAL
// #TODO: IDEALLY BE ABLE TO ADD, EDIT, DELETE AND GET
// #TODO: SET UP ROUTES WITH THE QUERY
// #TODO: SET UP WITH POSTMAN
// #TODO:
