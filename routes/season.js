import express from 'express';
import multer from 'multer';

import Season from '../models/Season';
import Helpers from '../helpers/Helpers';

const router = express.Router();

//Add new season
router.post('/', (req, res) => {
  Helpers.upload(req, res, (err) => {
    if (err) {
      res.json({msg: err});
    } else {
      const season = new Season(req);
      season.addSeason();
      res.json({msg: 'succses'});
    }
  });
});

//Get all seasons
router.get('/', (req, res) => {
  const season = new Season();
  season.getSeason(res);
});

//Get season by id
router.get('/:id', (req, res) => {
  const season = new Season();
  season.getOneSeason(req.params.id, res);
});

//Update season by id
router.put('/:id', (req, res) => {
  Helpers.upload(req, res, (err) => {
    if (err) {
      res.json({msg: err});
    } else {
      const season = new Season();
      season.updateSeason(req);
      res.json({msg: 'succsess'});
    }
  });
});

//Change seasons rating by id
router.put('/rating/:id', (req, res) => {
  Helpers.upload(req, res, (err) => {
    if(err) {
      res.json({msg: err});
    } else {
      const season = new Season();
      season.changeRating(req);
    }
  });
});

//Delete season by id
router.delete('/:id', (req, res) => {
  const season = new Season();
  season.deleteSeason(req.params.id, res);
});

module.exports = router;