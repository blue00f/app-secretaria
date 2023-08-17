const express = require('express');
const server = express();

server.get('/', (req, res) => {
  res.send('<h1>Home</h1>');
});

server.get('/login', (req, res) => {
    res.send('<h1>Login</h1>');
  });

  server.listen(3000, () => {
    console.log('Servidor en funcionamiento en el puerto 3000');
  });