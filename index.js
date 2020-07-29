// npm install --save pg

const pg = require("pg");
var config = {
  user: "postgres",
  database: "postgres",
  password: "orange",
  host: "localhost",
  post: 5432,
  max: 10,
  idleTimeoutMillis: 30000,
};
var client = new pg.Client(config);
client.connect();

// client.query initiates the query
// query (SELECT * FROM pizza)
// call back (function (err, results))
// if error, console log error
// Otherwise, log the rows to the console
client.query("SELECT * FROM pizza", function (err, results) {
  if (err) {
    console.log(err);
  }
  console.log(results.rows);
});
