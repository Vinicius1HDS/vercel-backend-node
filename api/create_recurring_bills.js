import { pool } from '../db.js';

export default async function handler(req, res) {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'POST, OPTIONS');
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

    if (req.methosd === 'OPTIONS') return res.status(204).end();
    if (req.method !== 'POST') return res.status(405).json({ error: "Method not allowed."});

    try {
        const chunks = [];
        for await (const chunk of req) {
            chunks.push(chunk);
        }

        const body = JSON.parse(Buffer.concat(chunks).toString());
        const { user_id, title, due_date, remind_days_before, remind_time, repeat_interval } = body;

        if (!user_id || !title || !due_date) return res.status(400).json({ error: "Required fields are missing." });

        const params = [user_id, title, due_date, remind_days_before, remind_time, repeat_interval];
        const query = `
            INSERT INTO recurring_bills ( user_id, title, due_date, remind_days_before, remind_time, repeat_interval )
            VALUES (?, ?, ?, ?, ?, ?)
            `
        const [rows] = await pool.query(query, params);
        return res.status(201).json({ 
            success: true,
            message: "Recurring bill created successfully." 
        });

    } catch (err) {
        return res.status(500).json({ error: "Error creating recurring bill: " + err.message});
    }
}