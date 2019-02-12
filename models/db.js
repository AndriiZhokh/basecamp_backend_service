import mysql from 'mysql';

import config from '../config/config.json'

const connection = mysql.createConnection({
  host: config.db.host,
  user: config.db.user,
  password: config.db.password,
  database: config.db.database
});

const ADD_SHOW = "INSERT INTO test (title, date_of, priority, datetime_test) VALUES ('sometitle', '2019-02-09', '5', '2019-02-09 21:34:34')";
const selectAll = "SELECT * from test";

export function DBconection() {
  connection.connect((err) => {
    if(err) {
      throw err;
    } else {
      console.log(`Connected to database - ${config.db.database}`);
    }
  });
}

export function addToTest() {
  connection.query(ADD_SHOW, (err, result) => {
    if(err) {
      console.log(err)
    } else {
      console.log('1 record inserted');
    }      
  });
}

export function showAll() {
  return new Promise ((resolve, reject) => {
    connection.query(selectAll, (err, result) => {
      if(err) {
        reject();
      } else {
        resolve(result);
      }
    });
  });
}