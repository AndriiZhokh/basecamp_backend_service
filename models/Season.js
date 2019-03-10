import DB from './db';
import fs from 'fs';

export default class Season extends DB {
  constructor(req) {
    super();
    if (req) {
      this.seasonName = req.body.seasonName;
      this.seasonNumber = req.body.seasonNumber;
      this.relatedShow = req.body.relatedShow;
      this.long = req.body.long;
      this.short = req.body.short;
      this.image = req.file.filename;
      this.currentDate = new Date().toLocaleString();
      this.url = req.body.url;
      this.rating = req.body.rating;
    }
  }

//================================================================================================
  addSeason() {
    const query = `INSERT INTO seasons (season_name, season_number, related_show, long_description, short_description, featured_image, date_of_publish, last_modified_date, video_fragment_url, users_rating) VALUES ('${this.seasonName}', '${this.seasonNumber}', '${this.relatedShow}', '${escape(this.long)}', '${escape(this.short)}', '${this.image}', '${this.currentDate}', '${this.currentDate}', '${this.url}', '${this.rating}')`;
    
    this.DBconection();
    this.queryFuncPost(query);
  }

//================================================================================================
  getSeason(res) {
    this.DBconection();
    const query = `SELECT * FROM seasons`;
    this.queryFuncGet(query)
      .then(data => res.json(data))
      .catch((err) => console.log(err));
  }

//================================================================================================
  getOneSeason(id, res) {
    this.DBconection();
    const query = `SELECT * FROM seasons WHERE id = '${id}'`;
    this.queryFuncGet(query)
      .then(data => res.json(data))
      .catch(err => console.log(err));
  }

//================================================================================================
  updateSeason(req) {
    this.DBconection();
    
    const query2 = `UPDATE seasons 
      SET 
        season_name = '${req.body.seasonName}',
        season_number = '${req.body.seasonNumber}',
        long_description = '${escape(req.body.long)}',
        short_description = '${escape(req.body.short)}',
        last_modified_date = '${new Date().toLocaleString()}',
        video_fragment_url = '${req.body.url}',
        users_rating = '${req.body.rating}'
      WHERE
        id = '${req.params.id}'`;
    
    if(req.file) {      
      const query1 = `UPDATE seasons 
      SET 
        season_name = '${req.body.seasonName}',
        season_number = '${req.body.seasonNumber}',
        long_description = '${escape(req.body.long)}',
        short_description = '${escape(req.body.short)}',
        last_modified_date = '${new Date().toLocaleString()}',
        video_fragment_url = '${req.body.url}',
        users_rating = '${req.body.rating}',
        featured_image = '${req.file.filename}'
      WHERE
        id = '${req.params.id}'`;

      const qi = `SELECT featured_image FROM seasons WHERE id = '${req.params.id}'`;
    
      this.queryFuncGet(qi)
        .then(data => fs.unlinkSync(`public/images/${data[0].featured_image}`))
        .catch((err) => console.log(err));

      this.queryFuncPost(query1);
      
    } else {
      this.queryFuncPost(query2);
    }    
  }

//================================================================================================
  deleteSeason(id, res) {
    this.DBconection();
    const qi = `SELECT featured_image FROM seasons WHERE id = '${id}'`;
    const query = `DELETE FROM seasons WHERE id = '${id}'`;        

    this.queryFuncGet(qi)
      .then(data => {
        this.queryFuncGet(query)
          .then(response => {
            res.json({res: `some data`});
            fs.unlinkSync(`public/images/${data[0].featured_image}`);
          })
          .catch(err => res.json({err: `Can't delete Season. This show contains some episodes`}));
      })
      .catch((err) => console.log(err));
  }

//================================================================================================
  changeRating(req) {
    this.DBconection();
    const query = `UPDATE seasons SET users_rating = '${req.body.rating}' WHERE id = '${req.params.id}'`;

    console.log(req.body.rating);
    console.log(req.params.id);

    this.queryFuncGet(query)
      .then(data => console.log(data))
      .catch(err => console.log(err + 'err'));
  }
}