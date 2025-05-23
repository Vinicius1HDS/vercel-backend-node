import { pool } from '../db.js';

export default async function handler(req, res) {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET,POST,OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

  if (req.method === 'OPTIONS') {
    return res.status(204).end();
  }

  if (req.method !== 'POST') {
    return res.status(405).json({ error: 'Method not allowed' });
  }

  try {
    const chunks = [];
    for await (const chunk of req) {
      chunks.push(chunk);
    }
    const body = JSON.parse(Buffer.concat(chunks).toString());

    const { category_name, user_id } = body;

    if (!category_name) {
      return res.status(400).json({ error: 'Nome da categoria é obrigatório.' });
    }

    const [result] = await pool.query(
      'INSERT INTO categories (category_name, user_id) VALUES (?, ?)',
      [category_name, user_id || null]
    );

    res.status(200).json({
      success: true,
      id: result.insertId,
      category_name,
    });

  } catch (err) {
    if (err.code === 'ER_DUP_ENTRY') {
      return res.status(409).json({ error: 'Categoria duplicada' });
    }

    res.status(500).json({ error: 'Erro geral: ' + err.message });
  }
}