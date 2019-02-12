import express from 'express';
import bodyParser from 'body-parser';
import cors from 'cors';
import fileUpload from 'express-fileupload';

import { serverPort } from './config/config.json'
import * as db from './models/db';

db.DBconection();
const app = express();
app.use(fileUpload());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
  extended: true
}));

app.get('/users', (req, res) => {
  db.showAll().then(data => res.json(data))
              .catch(() => console.log('error'));
});

app.post('/show', (req, res) => {  
  console.log(`data from client - ${JSON.stringify(req.body)}`);
});

app.post('/upload', (req, res) => {
  console.log(req.files.file.name);
  /* let uploadFile = req.files.file;
  const fileName = req.files.file.name;
  uploadFile.mv(`${__dirname}/public/images/${fileName}`, 
  function(err) {
    if(err) {
      return res.status(500).send(err);
    }
    res.json({
      file: `public/${req.files.file.name}`
    });
  }) */
});

const server = app.listen(serverPort, () => {
  console.log(`Server is running on port - ${serverPort}`);
});