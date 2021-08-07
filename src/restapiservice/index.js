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
  res.send("REST API is online!");
});

app.get("/orders", async (req, res) => {
  const limit = req.query.limit ?? null;
  const offset = req.query.offset ?? null;

  const values = await pgClient.query("SELECT * FROM public.order LIMIT $1 OFFSET $2", [ limit, offset ]);
  res.send(values.rows);
});

app.get("/order/:id", async (req, res) => {
  const id = req.params.id;

  const values = await pgClient.query("SELECT * FROM public.order WHERE id=$1", [ id ]);
  res.send(values.rows);
});

app.get("/order_items", async (req, res) => {
  const limit = req.query.limit ?? null;
  const offset = req.query.offset ?? null;

  const values = await pgClient.query("SELECT * FROM public.order_item LIMIT $1 OFFSET $2", [ limit, offset ]);
  res.send(values.rows);
});

app.get("/order_item/:id", async (req, res) => {
  const id = req.params.id;

  const values = await pgClient.query("SELECT * FROM public.order_item WHERE id=$1", [ id ]);
  res.send(values.rows);
});

app.get("/shippings", async (req, res) => {
  const limit = req.query.limit ?? null;
  const offset = req.query.offset ?? null;

  const values = await pgClient.query("SELECT * FROM public.shipping LIMIT $1 OFFSET $2", [ limit, offset ]);
  res.send(values.rows);
});

app.get("/shipping/:id", async (req, res) => {
  const id = req.params.id;

  const values = await pgClient.query("SELECT * FROM public.shipping WHERE id=$1", [ id ]);
  res.send(values.rows);
});

app.get("/addresses", async (req, res) => {
  const limit = req.query.limit ?? null;
  const offset = req.query.offset ?? null;

  const values = await pgClient.query("SELECT * FROM public.address LIMIT $1 OFFSET $2", [ limit, offset ]);
  res.send(values.rows);
});

app.get("/address/:id", async (req, res) => {
  const id = req.params.id;

  const values = await pgClient.query("SELECT * FROM public.address WHERE id=$1", [ id ]);
  res.send(values.rows);
});

app.listen(5000, (err) => {
  console.log("Listening");
});