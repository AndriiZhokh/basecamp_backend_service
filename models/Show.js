import DB from './db';
import fs from 'fs';

export default class Show extends DB {
  constructor(req) {
    super();
    if(req) {
      this.title = req.body.title;
      this.subtitle = req.body.subtitle;
      this.dateOfStart = req.body.date_of_start;
      this.image = req.file.filename;
      this.long = req.body.long;
      this.short = req.body.short;
      this.priority = req.body.priority;
      this.url = req.body.url;
      this.rating = req.body.rating;
      this.currentDate = new Date().toLocaleString();
      this.url = req.body.url;
      this.rating = req.body.rating;
    }    
  }

//================================================================================================
  addShow() {
    const query = `INSERT INTO shows (title, subtitle, date_of_start, poster_image, long_description, short_description, priority, date_of_publish, last_modified_date, video_fragment_url, users_rating) VALUES ('${this.title}', '${this.subtitle}', '${this.dateOfStart}', '${this.image}', '${this.long}', '${this.short}', '${this.priority}', '${this.currentDate}', '${this.currentDate}', '${this.url}', '${this.rating}')`;
    this.DBconection();
    this.queryFuncPost(query);
  }

//================================================================================================
  getShow(res) {
    this.DBconection();
    const query = `SELECT * FROM shows`;
    this.queryFuncGet(query)
      .then(data => res.json(data))
      .catch((err) => console.log(err));
  }

  getOneShow(id, res) {
    this.DBconection();
    const query = `SELECT * FROM shows WHERE id = '${id}'`;
    this.queryFuncGet(query)
      .then(data => res.json(data))
      .catch(err => console.log(err));
  }

//================================================================================================
  updateShow(req) {
    this.DBconection();
    
    const query2 = `UPDATE shows 
      SET 
        title = '${req.body.title}',
        subtitle = '${req.body.subtitle}',
        date_of_start = '${req.body.dateOfStart}',
        long_description = '${req.body.long}',
        short_description = '${req.body.short}',
        priority = '${req.body.priority}',
        last_modified_date = '${new Date().toLocaleString()}',
        video_fragment_url = '${req.body.url}',
        users_rating = '${req.body.rating}'
      WHERE
        id = '${req.params.id}'`;
    
    if(req.file) {      
      const query1 = `UPDATE shows 
      SET 
        title = '${req.body.title}',
        subtitle = '${req.body.subtitle}',
        date_of_start = '${req.body.dateOfStart}',
        long_description = '${req.body.long}',
        short_description = '${req.body.short}',
        priority = '${req.body.priority}',
        last_modified_date = '${new Date().toLocaleString()}',
        video_fragment_url = '${req.body.url}',
        users_rating = '${req.body.rating}',
        poster_image = '${req.file.filename}'
      WHERE
        id = '${req.params.id}'`;

      const qi = `SELECT poster_image FROM shows WHERE id = '${req.params.id}'`;
    
      this.queryFuncGet(qi)
        .then(data => fs.unlinkSync(`public/images/${data[0].poster_image}`))
        .catch((err) => console.log(err));

      this.queryFuncPost(query1);
      
    } else {
      this.queryFuncPost(query2);
    }    
  }

//================================================================================================
  deleteShow(id, res) {    
    this.DBconection();
    const qi = `SELECT poster_image FROM shows WHERE id = '${id}'`;
    const query = `DELETE FROM shows WHERE id = '${id}'`;        

    this.queryFuncGet(qi)
      .then(data => {
        this.queryFuncGet(query)
          .then(response => {
            res.json({res: `some data`});
            fs.unlinkSync(`public/images/${data[0].poster_image}`);
          })
          .catch(err => res.json({err: `Can't delete Show. This show contains some seasons`}));
      })
      .catch((err) => console.log(err));
  }
}