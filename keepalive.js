const fetch = require('node-fetch');


const url = process.env.RENDER_EXTERNAL_URL || "https://mini-nginx-server.onrender.com";

setInterval(() => {
  fetch(url)
    .then(() => console.log(`[KeepAlive] Ping sent at ${new Date().toISOString()}`))
    .catch(err => console.error("[KeepAlive] Error:", err.message));
}, 10 * 60 * 1000);