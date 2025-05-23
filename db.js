import mysql from 'mysql2/promise';

export const pool = mysql.createPool({
  host: 'mainline.proxy.rlwy.net',
  user: 'root',
  password: 'VSfhHncvcdMXPrqjVPZrLPbUpavJlhEU', 
  database: 'railway',
  port: 41081,
});