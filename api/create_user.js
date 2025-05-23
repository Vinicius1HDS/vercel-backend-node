import { pool } from '../db.js';

export default async function handler(req, res) {
  if (req.method === 'OPTIONS') return res.status(204).end();

  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET,POST,OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

  if (req.method !== 'POST') {
    return res.status(405).json({ error: 'Method not allowed' });
  }

  const { firebase_uid, name, email } = req.body;

  if (!firebase_uid || !name || !email) {
    return res.status(400).json({ success: false, message: 'Dados incompletos' });
  }

  try {
    await pool.query(
      `INSERT INTO users (firebase_uid, name, email)
       VALUES (?, ?, ?)
       ON DUPLICATE KEY UPDATE name = VALUES(name), email = VALUES(email)`,
      [firebase_uid, name, email]
    );

    res.json({ success: true });
  } catch (err) {
    res.status(500).json({ success: false, message: 'Erro interno', detail: err.message });
  }
}
