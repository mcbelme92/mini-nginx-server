const express = require("express");
const app = express();

app.use(express.urlencoded({ extended: true }));

app.post("/node/3ds-return", (req, res) => {
  res.set("Content-Type", "text/html");
  res.send(`
    <html>
      <body>
        <script>
          window.parent.postMessage(
            { type: "3DS_CALLBACK", source: "NODE" },
            "*"
          );
        </script>
      </body>
    </html>
  `);
});

app.listen(3000, () => console.log("Node running on 3000"));
