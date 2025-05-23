import { pool } from '../db.js';

export default async function handler(req, res) {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET,POST,OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');
  
  if (req.method === 'OPTIONS') return res.status(204).end();


  if (req.method !== 'POST') {
    return res.status(405).json({ error: 'Method not allowed' });
  }

  const { firebase_uid } = req.body;

  if (!firebase_uid) {
    return res.status(400).json({ error: 'firebase_uid é obrigatório' });
  }

  try {
    const [rows] = await pool.query(
      'SELECT * FROM users WHERE firebase_uid = ?',
      [firebase_uid]
    );

    if (rows.length === 0) {
      return res.status(404).json({ error: 'Usuário não encontrado' });
    }

    res.json(rows[0]);
  } catch (err) {
    res.status(500).json({ error: 'Erro interno', detail: err.message });
  }
}
