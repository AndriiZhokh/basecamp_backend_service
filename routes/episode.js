import express from 'express';
import multer from 'multer';

import Episode from '../models/Episode';
import Helpers from '../helpers/Helpers';

const router = express.Router();

//Add new episode
router.post('/', (req, res) => {
  Helpers.upload(req, res, (err) => {
    if (err) {
      res.json({msg: err});
    } else {
      const episode = new Episode(req);
      episode.addEpisode();
      res.json({msg: 'succses'});
    }
  });
});

//Get all episodes
router.get('/', (req, res) => {
  const episode = new Episode();
  episode.getEpisode(res);
});

//Get episode by id
router.get('/:id', (req, res) => {
  const episode = new Episode();
  episode.getOneEpisode(req.params.id, res);
});

//Update episode by id
router.put('/:id', (req, res) => {
  Helpers.upload(req, res, (err) => {
    if (err) {
      res.json({msg: err});
    } else {
      const episode = new Episode();
      episode.updateEpisode(req);
      res.json({msg: 'succses'});
    }
  });
});

//Change episodes rating by id
router.put('/rating/:id', (req, res) => {
  Helpers.upload(req, res, (err) => {
    if(err) {
      res.json({msg: err});
    } else {
      const episode = new Episode();
      episode.changeRating(req);
    }
  });
});

//Delete season by id
router.delete('/:id', (req, res) => {
  const episode = new Episode();
  episode.deleteEpisode(req.params.id, res);
});

module.exports = router;