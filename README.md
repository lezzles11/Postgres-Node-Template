# Postgres Node Template :rocket:

## Purpose :dark_sunglasses:

The purpose of this repository is to practice using postgres with node.

### User Stories :telescope:

1. Users will be able to look through the various examples and understand how postgres works with node.
2. Users will be able to identify the key steps in creating such a template.

### Vocabulary

| Done? | Word    |                                  What it means                                   | How it fits / When to use |
| ----- | ------- | :------------------------------------------------------------------------------: | :-----------------------: |
|       | Pooling | Pool of connections and caching those connections so that it can be reused again |                           |

## Sprint :athletic_shoe:

| Done? | Component                                            | Priority | Estimated Time | Actual Time |
| ----- | ---------------------------------------------------- | :------: | :------------: | :---------: |
| x     | Creating this checklist                              |    H     |    30 mins     |   30mins    |
| x     | Skim through documentation of required packages      |    H     |      1 hr      |   15 mins   |
| x     | Set up postgres                                      |    H     |    30 mins     |   15 mins   |
| x     | Create UML Diagram                                   |          |                |             |
| x     | Create table user                                    |          |                |             |
| x     | Create table notes                                   |          |                |             |
| x     | Can create table                                     |          |                |             |
| x     | Can post to table                                    |          |                |             |
| x     | Can edit table                                       |          |                |             |
| x     | Can delete from table                                |          |                |             |
| x     | Set up express server                                |          |                |             |
| x     | Understand how to collect data from frontend express |          |                |             |
|       | How to input that data from frontend to backend      |          |                |             |
|       | CRUD Operations from frontend to backend             |          |                |             |

[Example](https://github.com/hnasr/javascript_playground/blob/master/express-postgres/newserver.js)

### Set up postgres

![UML](https://www.dropbox.com/s/cwsgbxtlhurkgux/_ERD%20with%20colored%20entities%20example%20%28UML%20notation%29.png?raw=1)

```
// npm install --save pg

const pg = require("pg");
var config = {
  user: "postgres",
  database: "postgres",
  password: "",
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

```

Querying for Data

- Remember to make your query an object (that would minimize vulnerabilities to your program)

```
const query = {
  text: 'INSERT INTO users(name, email) VALUES($1, $2)',
  values: ['brianc', 'brian.m.carlson@gmail.com'],
}
// callback
client.query(query, (err, res) => {
  if (err) {
    console.log(err.stack)
  } else {
    console.log(res.rows[0])
  }
})
// promise
client
  .query(query)
  .then(res => console.log(res.rows[0]))
  .catch(e => console.error(e.stack))

```

- Or run it as a function

```

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
```

### Collecting data from frontend to backend

![How Express Works](https://www.dropbox.com/s/oaky3r5p7tuji5s/Express%20and%20Frontend.png?raw=1)

#TODO: How does the data from frontend pass to the database in the backend?

## Issues and Resolutions :flashlight:

**ERROR**: :gear:
**RESOLUTION**: :key:

| Issue                | Where it occurs | Possible solution | Actual solution |
| -------------------- | :-------------: | :---------------: | :-------------: |
| Creating a checklist |        H        |       2hrs        |     2.5hrs      |

#### What is one thing that I learned from doing this project? :books:

- Better understand how express works with front end
- Diagrams are awesome

#### Credits :recycle:

- [cors](https://expressjs.com/en/resources/middleware/cors.html)
- [dotenv](https://github.com/motdotla/dotenv)
- [pg](https://node-postgres.com/)
- [express](https://expressjs.com/)
- [nodemon](https://nodemon.io/)
- [Jest](https://jestjs.io/)
- [body-parser](https://github.com/expressjs/body-parser)
- [morgan](https://www.npmjs.com/package/morgan)
- [express-promise-router](https://github.com/express-promise-router/express-promise-router)

#### Contributing :round_pushpin:

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
Not sure how? Learn [Github](https://www.youtube.com/watch?v=3RjQznt-8kE&list=PL4cUxeGkcC9goXbgTDQ0n_4TBzOO0ocPR)
Please make sure to update tests as appropriate.

#### License :memo:

[MIT](https://choosealicense.com/licenses/mit/)
