const express = require("express");
const cors = require("cors");
const KalenderJawa = require("@kalenderjawa/pustaka");

const app = express();
const port = 3000;

app.use(cors());
app.use(express.json());

// API untuk mencari weton
app.get("/api/weton/:tanggal", async (req, res) => {
    const { tanggal } = req.params;
    try {
        const result = await KalenderJawa.cariWeton(tanggal);
        res.json({ tanggal, weton: result });
    } catch (error) {
        res.status(500).json({ error: "Gagal menghitung weton." });
    }
});

// Jalankan server
app.listen(port, () => {
    console.log(`Server berjalan di http://localhost:${port}`);
});
