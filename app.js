const express = require('express');
const app = express();
const path = require('path');
const PORT = 8045;

const staticPath = path.join(__dirname, '/view');
console.log(staticPath);
app.use(express.static(staticPath));

app.get('/', function (req, res) {
  res.sendFile(staticPath + '/index.html');
});

app.listen(PORT, () => {
  console.log('App is up and running on PORT ', PORT);
});
