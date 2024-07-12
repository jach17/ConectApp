const express = require('express');
const routes = require('./routes')

const app = express();
const PORT = 3000;


app.use(express.json());
app.use('/api/v1/', routes)


app.listen(PORT, () => {
  console.log(`API Gateway running on port ${PORT}`);
});
