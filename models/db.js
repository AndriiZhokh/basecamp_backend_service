import mysql from 'mysql';
import config from '../config/config.json'
import Show from './Show.js';

export default class DB {
  constructor() {
    this.connection = mysql.createConnection({
      host: config.db.host,
      user: config.db.user,
      password: config.db.password,
      database: config.db.database 
    });
  }

  DBconection() {
    this.connection.connect((err) => {
      if(err) {
        throw err;
      } else {
        console.log(`Connected to database - ${config.db.database}`);
      }
    });
  }

  queryFuncPost(q) {
      this.connection.query(q, (err, result) => {
        if(err) {
          reject();
        } else {
          console.log('1 record inserted');
        }
      });
  }

  queryFuncGet(q) {
    return new Promise ((resolve, reject) => {
      this.connection.query(q, (err, result) => {
        if(err) {
          reject(err);
        } else {
          resolve(result);
        }
      });
    });
  }
}