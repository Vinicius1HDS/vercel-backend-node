import { pool } from '../db.js';

export default async function handler(req, res) {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET,POST,OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

  if (req.method === 'OPTIONS') {
    return res.status(204).end();
  }

  if (req.method !== 'POST') {
    return res.status(405).json({ error: 'Método não permitido' });
  }

  try {
    const chunks = [];
    for await (const chunk of req) {
      chunks.push(chunk);
    }
    const body = JSON.parse(Buffer.concat(chunks).toString());

    const user_id = body.user_id ?? null;

    let query = '';
    let params = [];

    if (user_id === null) {
      query = 'SELECT * FROM categories WHERE user_id IS NULL';
    } else {
      query = `
        SELECT * FROM categories
        WHERE user_id IS NULL

        UNION

        SELECT * FROM categories
        WHERE user_id = ?
      `;
      params.push(user_id);
    }

    const [rows] = await pool.query(query, params);
    res.status(200).json(rows);

  } catch (err) {
    res.status(500).json({ error: 'Erro ao buscar categorias: ' + err.message });
  }
}
