<?php
http_response_code(200);
header("Content-Type: text/html");

$md = $_POST['MD'] ?? '';
$transactionId = $_POST['TransactionId'] ?? '';

echo <<<HTML
<!doctype html>
<html>
  <body>
    <script>
      window.parent.postMessage(
        {
          type: "3DS_CALLBACK",
          md: "{$md}",
          transactionId: "{$transactionId}"
        },
        "*"
      );
    </script>
    OK
  </body>
</html>
HTML;
