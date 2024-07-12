const express = require('express');

const PORT = 3001;
const app = express();

app.use(express.json());

app.get('/', async (req, res) => {
  res.json("Get users from api users");
});

app.post('/', async (req, res) => {
  console.log("Llegó" + JSON.stringify(req.body));
  res.json("User created");
});

app.get('/otro/:id', async (req, res) => {
  res.json("Get users from api users - otro con id" + req.params.id);
});

app.use((req, res, next) => {
  res.status(404).send({ message: 'Not Found' });
});


app.listen(PORT, () => {
  console.log(`User Service running on port ${PORT}`);
});