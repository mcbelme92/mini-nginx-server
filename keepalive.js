const url = process.env.RENDER_EXTERNAL_URL || "https://mini-nginx-server.onrender.com";

async function keepAlive() {
  try {
    const res = await fetch(url);
    console.log(`[KeepAlive] Ping ${res.status} at ${new Date().toISOString()}`);
  } catch (err) {
    console.error("[KeepAlive] Error:", err.message);
  }
}

// Primer ping inmediato
keepAlive();

// Cada 10 minutos
setInterval(keepAlive, 10 * 60 * 1000);
