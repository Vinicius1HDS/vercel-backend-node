import { pool } from "../db.js";

export default async function handler(req, res) {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET, OPTIONS');
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

    if (req.method === 'OPTIONS') return res.status(204).end();
    if (req.method !== 'GET') return res.status(405).json({ error: "Method not allowed."});

    
    const user_id = req.body;
    if (!user_id) 
        return res.status(400).json({ error: "User ID required." });


    try {


        if (!user_id) {
            return res.status(400).json({ error: "User ID is required." });
        }

        let params = [user_id];

        const query = `
            SELECT * from recurring_bills
            WHERE user_id = ?
            ORDER BY due_date ASC
        `
        const [rows] = await pool.query(query, params);
        res.status(200).json(rows);
        
    } catch (err) {
        res.status(500).json({ error: "Error fetching recurring bills: " + err.message });
    }



}