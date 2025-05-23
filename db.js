import mysql from 'mysql2/promise';

export const pool = mysql.createPool({
  host: 'sql207.infinityfree.com',
  user: 'if0_39053680_finances_db',
  password: 'if0_39053680',
  database: 'o0dZovWJQpt',
});