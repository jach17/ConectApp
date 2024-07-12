const express = require("express")
const axios = require('axios');
const { services } = require('./registry.json');
const router = express.Router()

router.all('*', (req, res) => {
    console.log("Original url: " + req.originalUrl);
    const [ , , , service, ...pathParts] = req.originalUrl.split('/');
    const path = pathParts.join('/');
    const serviceConfig = services[service];

    console.log("Path to request: " + pathParts);
    console.log("Service to request: " + service);
    console.log("Url to send: "+ `${serviceConfig.url}${path}`);
    console.log("Method: " + req.method);
    console.log("Headers: " + JSON.stringify(req.headers));
    console.log("Body: " + JSON.stringify(req.body));
    if (!serviceConfig) {
        console.log("Service: "+ serviceConfig);
        return res.status(404).send({ message: 'Service not found' });
    } 

    axios({
        method: req.method,
        url: `${serviceConfig.url}${path}`,
        data: req.body
    })
    .then(response => {
        console.log("Respondio");
        res.send(response.data);
    })
    .catch(error => {
        console.log("Error de algo: " + error);
        if (error.response) {
        res.status(error.response.status).send(error.response.data);
        } else if (error.request) {
        res.status(500).send({ message: 'No response received from the service' });
        } else {
        res.status(500).send({ message: 'Internal Server Error' });
        }
    });
});



module.exports = router
