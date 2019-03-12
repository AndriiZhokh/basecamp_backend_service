import express from 'express';
import multer from 'multer';

import Show from '../models/Show';
import Helpers from '../helpers/Helpers';

const router = express.Router();

//Add new show
router.post('/', (req, res) => {
  Helpers.upload(req, res, (err) => {
    if(err) {
      res.json({msg: 'err'});
    } else {
      const show = new Show(req);
      show.addShow();
      res.json({msg: 'success'})
    }
  });
});

//Get all shows
router.get('/', (req, res) => {
  const show = new Show();
  const data = show.getShow(res);
});

//Get show by id
router.get('/:id', (req, res) => {
  const show = new Show();
  show.getOneShow(req.params.id, res);
});

//Update show by id
router.put('/:id', (req, res) => {
  Helpers.upload(req, res, (err) => {
    if(err) {
      res.json({msg: err});
    } else {
      const show = new Show();
      show.updateShow(req);
      res.json({response: 'succses'})
    }
  });
});

//Change shows rating by id
router.put('/rating/:id', (req, res) => {
  Helpers.upload(req, res, (err) => {
    if(err) {
      res.json({msg: err});
    } else {
      const show = new Show();
      show.changeRating(req);
    }
  });
});

//Delete show by id
router.delete('/:id', (req, res) => {
  const show = new Show();
  show.deleteShow(req.params.id, res);
});

module.exports = router;