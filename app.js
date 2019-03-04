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

//=========Show routes================
app.post('/show', (req, res) => {
  upload(req, res, (err) => {
    if (err) {
      res.json({msg: err});
    } else {
      const show = new Show(req);
      show.addShow();
      res.json({test: 'test'});
    }
  });
});

app.get('/shows', (req, res) => {
  console.log('!!!!');
  const show = new Show();
  const data = show.getShow(res);
});

app.get('/show/:id', (req, res) => {
  const show = new Show();
  show.getOneShow(req.params.id, res);
});

app.put('/show/:id', (req, res) => {
  upload(req, res, (err) => {
    if(err) {
      res.json({msg: err});
    } else {
      const show = new Show();
      show.updateShow(req);
      res.json({response: 'succses'})
    }
  });
});

app.delete('/show/:id', (req, res) => {
  const show = new Show();
  show.deleteShow(req.params.id, res);
});

//=========Season routes================
app.post('/season', (req, res) => {
  upload(req, res, (err) => {
    if (err) {
      res.json({msg: err});
    } else {
      const season = new Season(req);
      season.addSeason();
      res.json({response: 'succses'});
    }
  });
});

app.get('/seasons', (req, res) => {
  const season = new Season();
  season.getSeason(res);
});

app.get('/season/:id', (req, res) => {
  const season = new Season();
  season.getOneSeason(req.params.id, res);
});

app.put('/season/:id', (req, res) => {
  upload(req, res, (err) => {
    if (err) {
      res.json({msg: err});
    } else {
      const season = new Season();
      season.updateSeason(req);
      res.json({response: 'succses'});
    }
  });
});

app.delete('/season/:id', (req, res) => {
  const season = new Season();
  season.deleteSeason(req.params.id, res);
});

//=========Episode routes================
app.post('/episode', (req, res) => {
  upload(req, res, (err) => {
    if (err) {
      res.json({msg: err});
    } else {
      const episode = new Episode(req);
      episode.addEpisode();
      res.json({response: 'succses'});
    }
  });
});

app.get('/episodes', (req, res) => {
  const episode = new Episode();
  episode.getEpisode(res);
});

app.get('/episode/:id', (req, res) => {
  const episode = new Episode();
  episode.getOneEpisode(req.params.id, res);
});

app.put('/episode/:id', (req, res) => {
  upload(req, res, (err) => {
    if (err) {
      res.json({msg: err});
    } else {
      const episode = new Episode();
      episode.updateEpisode(req);
      res.json({response: 'succses'});
    }
  });
});

app.delete('/episode/:id', (req, res) => {
  const episode = new Episode();
  episode.deleteEpisode(req.params.id, res);
});

const server = app.listen(serverPort, () => {
  console.log(`Server is running on port - ${serverPort}`);
});