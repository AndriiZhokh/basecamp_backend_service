import express from 'express';
import multer from 'multer';
import path from 'path';
import { serverPort } from './config/config.json';

import Show from './models/Show';
import Season from './models/Season';
import Episode from './models/Episode';
import DB from './models/db';

//Set Storage Engine
const storage = multer.diskStorage({
  destination: 'public/images/',
  filename: (req, file, cb) => {
    cb(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname))
  }
});

//Init upload
const upload = multer({
  storage: storage,
  fileFilter: (req, file, cb) => {
    checkFileType(file, cb)
  }
}).single('image');

//Check File Type
const checkFileType = (file, cb) => {
  const filetypes = /jpeg|jpg|png|gif/;
  const extname = filetypes.test(path.extname(file.originalname).toLowerCase());
  const mimetype = filetypes.test(file.mimetype);

  if (mimetype && extname) {
    return cb(null, true)
  } else {
    cb('Error: Images only')
  }
}

//Init app
const app = express();
app.use(express.static('public'));

app.get('/show', (req, res) => {
  console.log('!!!!');
  const show = new Show();
  const data = show.getShow(res);
});

app.post('/show', (req, res) => {
  upload(req, res, (err) => {
    if (err) {
      res.json({msg: err})
    } else {
      console.log(typeof req.file.path);
      const show = new Show(req);
      show.addShow();
      res.json({test: 'test'});
    }
  });
});

const server = app.listen(serverPort, () => {
  console.log(`Server is running on port - ${serverPort}`);
});