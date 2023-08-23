const express = require('express');
const server = express();
const mysql = require('mysql2');

require('dotenv').config();
console.log(process.env);

server.get('/', (req, res) => {
  res.send('<h1>Home</h1>');
});

server.get('/login', (req, res) => {
  res.send('<h1>Login</h1>');
});

server.listen(3000, () => {
  console.log('Servidor en funcionamiento en el puerto 3000');
});

// obtener el cliente

// crea la conexión a la base de datos
const connection = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USERNAME,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_DATABASE,
});

//Mensaje de error
connection.connect(function (err) {
  if (err) {
    console.error('Error de conexion: ' + err.stack);
    return;
  }
  console.log('Conectado con el identificador ' + connection.threadId);
});
