import DB from './db';

export default class Show extends DB {
  constructor(req) {
    super();
    this.title = req.body.title;
    this.subtitle = req.body.subtitle;
    this.dateOfStart = req.body.date_of_start;
    this.image = escape(req.file.path);
    this.long = req.body.long;
    this.short = req.body.short;
    this.priority = req.body.priority;
    this.url = req.body.url;
    this.rating = req.body.rating;
    this.currentDate = new Date().toLocaleString();
    this.url = req.body.url;
    this.rating = req.body.rating;
  }

  addShow() {
    const query = `INSERT INTO shows (title, subtitle, date_of_start, poster_image, long_description, short_description, priority, date_of_publish, last_modified_date, video_fragment_url, users_rating) VALUES ('${this.title}', '${this.subtitle}', '${this.dateOfStart}', '${this.image}', '${this.long}', '${this.short}', '${this.priority}', '${this.currentDate}', '${this.currentDate}', '${this.url}', '${this.rating}')`;
    this.DBconection();
    this.queryFuncPost(query);
  }
}