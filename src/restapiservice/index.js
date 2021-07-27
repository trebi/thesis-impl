const keys = require('./keys');

// Express App Setup
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(bodyParser.json());

// Postgres Client Setup
const { Pool } = require('pg');
pgClient = new Pool({
  user: keys.pgUser,
  host: keys.pgHost,
  database: keys.pgDatabase,
  password: keys.pgPassword,
  port: keys.pgPort,
});

// Express route handlers
app.get("/", async (req, res) => {
  res.send("REST API works!");
});

app.get("/date", async (req, res) => {
  const values = pgClient.query("SELECT DATE()");
  res.send(values.rows);
});

app.get("/orders", async (req, res) => {
  const values = await pgClient.query("SELECT * FROM orders");
  res.send(values.rows);
});

app.listen(5000, (err) => {
  console.log("Listening");
});