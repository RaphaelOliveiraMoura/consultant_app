const express = require('express');

const routes = require('./routes');
const database = require('./database');

async function createServer() {
  const app = express();

  await database.init();

  app.use(express.json());
  app.use(routes);

  return app;
}

module.exports = { createServer };
