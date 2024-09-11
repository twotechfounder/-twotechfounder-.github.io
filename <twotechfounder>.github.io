html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Link Bypasser</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #141e30, #243b55);
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            text-align: center;
            background: rgba(0, 0, 0, 0.7);
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            width: 400px;
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: none;
            border-radius: 4px;
            outline: none;
            font-size: 16px;
        }
        button {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            background: #1f78ff;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s;
        }
        button:hover {
            background: #0056b3;
        }
        .result {
            margin-top: 20px;
            background: rgba(255, 255, 255, 0.1);
            padding: 10px;
            border-radius: 4px;
            word-wrap: break-word;
            text-align: left;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .result span {
            flex-grow: 1;
        }
        .copy-btn {
            margin-left: 10px;
            padding: 5px 10px;
            border: none;
            border-radius: 4px;
            background: #1f78ff;
            color: #fff;
            cursor: pointer;
            transition: background 0.3s;
        }
        .copy-btn:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Link Bypasser</h2>
        <input type="text" id="linkInput" placeholder="Enter link here">
        <button onclick="bypassLink()">Bypass Link</button>
        <div id="result" class="result"></div>
    </div>
    <script>
        function bypassLink() {
            var link = document.getElementById('linkInput').value;
            var resultDiv = document.getElementById('result');
            if (link) {
                fetch(`https://et.goatbypassers.xyz/api/adlinks/bypass?url=${encodeURIComponent(link)}`)
                    .then(response => response.json())
                    .then(data => {
                        if (data.bypassed) {
                            resultDiv.innerHTML = '<span><strong>Result:</strong> ' + data.bypassed + '</span><button class="copy-btn" onclick="copyToClipboard(\'' + data.bypassed + '\')">Copy</button>';
                        } else {
                            resultDiv.innerHTML = '<strong>error:</strong> failed to bypass the link.';
                        }
                    })
                    .catch(() => {
                        resultDiv.innerHTML = '<strong>Error:</strong> unable to connect to the api.';
                    });
            } else {
                resultDiv.innerHTML = '<strong>error:</strong> please enter a link.';
            }
        }

        function copyToClipboard(text) {
            navigator.clipboard.writeText(text).then(() => {
                alert('link copied to clipboard!');
            }, () => {
                alert('failed to copy');
            });
        }
    </script>
</body>
</html>
