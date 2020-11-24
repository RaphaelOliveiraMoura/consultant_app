/* eslint-disable no-console */
const app = require('./src/app');

app
  .createServer()
  .then((server) =>
    server.listen(3333, () => console.log('🚀 Application running...'))
  )
  .catch((err) => console.log('❌ Error initing application', err));
