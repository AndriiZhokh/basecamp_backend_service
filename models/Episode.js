import DB from './db';
import fs from 'fs';

export default class Episode extends DB {
  constructor(req) {
    super();
    if (req) {
      this.episodeName = req.body.episodeName;
      this.episodeNumber = req.body.episodeNumber;
      this.relatedShow = req.body.relatedShow;
      this.relatedSeason = req.body.relatedSeason;
      this.long = req.body.long;
      this.short = req.body.short;
      this.image = req.file.filename;
      this.currentDate = new Date().toLocaleString();
      this.url = req.body.url;
      this.rating = req.body.rating;
    }
  }

//=======================================================================================================
  addEpisode() {
    const query = `INSERT INTO episodes (episode_name, episode_number, related_show, related_season, long_description, short_description, featured_image, date_of_publish, last_modified_date, video_fragment_url, users_rating) VALUES ('${this.episodeName}', '${this.episodeNumber}', '${this.relatedShow}', '${this.relatedSeason}', '${this.long}', '${this.short}', '${this.image}', '${this.currentDate}', '${this.currentDate}', '${this.url}', '${this.rating}')`;
    
    this.DBconection();
    this.queryFuncPost(query);
  }

//=======================================================================================================
  getEpisode(res) {
    this.DBconection();
    const query = `SELECT * FROM episodes`;
    this.queryFuncGet(query)
      .then(data => res.json(data))
      .catch((err) => console.log(err));
  }

//=======================================================================================================
getOneEpisode(id, res) {
  this.DBconection();
  const query = `SELECT * FROM episodes WHERE id = '${id}'`;
  this.queryFuncGet(query)
    .then(data => res.json(data))
    .catch(err => console.log(err));
}

//=======================================================================================================
  updateEpisode(req) {
    this.DBconection();
    
    const query2 = `UPDATE episodes 
      SET 
        episode_name = '${req.body.episodeName}',
        episode_number = '${req.body.episodeNumber}',
        long_description = '${req.body.long}',
        short_description = '${req.body.short}',
        last_modified_date = '${new Date().toLocaleString()}',
        video_fragment_url = '${req.body.url}',
        users_rating = '${req.body.rating}'
      WHERE
        id = '${req.params.id}'`;
    
    if(req.file) {      
      const query1 = `UPDATE episodes 
      SET 
        episode_name = '${req.body.episodeName}',
        episode_number = '${req.body.episodeNumber}',
        long_description = '${req.body.long}',
        short_description = '${req.body.short}',
        last_modified_date = '${new Date().toLocaleString()}',
        video_fragment_url = '${req.body.url}',
        users_rating = '${req.body.rating}',
        featured_image = '${req.file.filename}'
      WHERE
        id = '${req.params.id}'`;

      const qi = `SELECT featured_image FROM episodes WHERE id = '${req.params.id}'`;
    
      this.queryFuncGet(qi)
        .then(data => fs.unlinkSync(`public/images/${data[0].featured_image}`))
        .catch((err) => console.log(err));

      this.queryFuncPost(query1);
      
    } else {
      this.queryFuncPost(query2);
    }    
  }

//=======================================================================================================
  deleteEpisode(id, res) {
    this.DBconection();
    const qi = `SELECT featured_image FROM episodes WHERE id = '${id}'`;
    const query = `DELETE FROM episodes WHERE id = '${id}'`;        

    this.queryFuncGet(qi)
      .then(data => {
        this.queryFuncGet(query)
          .then(response => {
            res.json({res: `some data`});
            fs.unlinkSync(`public/images/${data[0].featured_image}`);
          })
          .catch(err => {
            console.log(err);
            res.json({err: `Can't delete Season. This show contains some episodes`})
          });
      })
      .catch((err) => console.log(err));
  }
}