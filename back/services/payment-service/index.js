const express = require('express');

const PORT = 3002;
const app = express();

app.use(express.json());

app.get('/all', async (req, res) => {
  res.json("Get users from api payment");
});

app.listen(PORT, () => {
  console.log(`Payment Service running on port ${PORT}`);
});