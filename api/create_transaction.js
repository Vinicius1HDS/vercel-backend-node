import { pool } from "../db.js";

export default async function handler(req, res) {
  res.setHeader("Access-Control-Allow-Origin", "*");
  res.setHeader("Access-Control-Allow-Methods", "POST, OPTIONS");
  res.setHeader("Access-Control-Allow-Headers", "Content-Type");

  if (req.method === "OPTIONS") return res.status(204).end();
  if (req.method !== "POST")
    return res.status(405).json({ error: "Método não permitido" });

  try {
    const chunks = [];
    for await (const chunk of req) chunks.push(chunk);
    const data = JSON.parse(Buffer.concat(chunks).toString());

    if (!Array.isArray(data)) {
      return res.status(400).json({ error: "Esperado um array de transações" });
    }

    let inserted = 0;
    
    for (const tx of data) {
      if (
        !tx.description ||
        !tx.amount ||
        !tx.user_id ||
        !tx.category_id ||
        !tx.type ||
        !tx.date
      )
      continue;
      
      await pool.query(
        `INSERT INTO transactions (description, amount, user_id, category_id, type, date)
        VALUES (?, ?, ?, ?, ?, ?)`,
        [
          tx.description,
          tx.amount,
          tx.user_id,
          tx.category_id,
          tx.type,
          tx.date,
        ]
      );
      
      inserted++;
    
    }

    res
      .status(200)
      .json({
        success: true,
        message: `${inserted} transações inseridas com sucesso`,
      });
  } catch (err) {
    res
      .status(500)
      .json({ error: "Erro ao inserir transações: " + err.message });
  }
}
