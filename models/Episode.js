import DB from './db';

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

  addEpisode() {
    const query = `INSERT INTO episodes (episode_name, episode_number, related_show, related_season, long_description, short_description, featured_image, date_of_publish, last_modified_date, video_fragment_url, users_rating) VALUES ('${this.episodeName}', '${this.episodeNumber}', '${this.relatedShow}', '${this.relatedSeason}', '${this.long}', '${this.short}', '${this.image}', '${this.currentDate}', '${this.currentDate}', '${this.url}', '${this.rating}')`;
    
    this.DBconection();
    this.queryFuncPost(query);
  }

  getEpisode(res) {
    this.DBconection();
    const query = `SELECT * FROM episodes`;
    this.queryFuncGet(query)
      .then(data => res.json(data))
      .catch((err) => console.log(err));
  }
}