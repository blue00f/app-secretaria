import express from 'express';
import { createConnection } from 'mysql2';
import 'dotenv/config';

const app = express();
const PORT = process.env.PORT ?? 1234;

app.get('/', (req, res) => {
  res.send('<h1>HOLA Q TAL</h1>');
});

app.get('/login', (req, res) => {
  res.send('<h1>Login</h1>');
});

const connection = createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USERNAME,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_DATABASE,
});

connection.connect(function (err) {
  if (err) {
    console.error('Error de conexion: ' + err.stack);
    return;
  }
  console.log('Conectado con el identificador ' + connection.threadId);
});

app.listen(PORT, () => {
  console.log(`servidor en funcionamiento en http://localhost:${PORT}`);
});
