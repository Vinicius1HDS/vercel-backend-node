import { pool } from '../db.js';

export default async function handler(req, res) {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

  if (req.method === 'OPTIONS') return res.status(204).end();
  if (req.method !== 'GET') return res.status(405).json({ error: 'Método não permitido' });

  const { user_id } = req.query;

  if (!user_id) {
    return res.status(400).json({ error: 'user_id é obrigatório' });
  }

  try {
    const [rows] = await pool.query(
      `SELECT 
         t.*, 
         c.category_name AS category_name
       FROM transactions t
       JOIN categories c ON t.category_id = c.id
       WHERE t.user_id = ?`,
      [user_id]
    );

    res.status(200).json(rows);
  } catch (err) {
    res.status(500).json({ error: 'Erro ao buscar transações: ' + err.message });
  }
}
