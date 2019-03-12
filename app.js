import express from 'express';
import multer from 'multer';
import path from 'path';
import { serverPort } from './config/config.json';

//Init app
const app = express();

//Init public image folder
app.use(express.static('public'));

//Init routes
app.use('/show', require('./routes/show'));
app.use('/season', require('./routes/season'));
app.use('/episode', require('./routes/episode'));

//Start listening server
const server = app.listen(serverPort, () => {
  console.log(`Server is running on port - ${serverPort}`);
});