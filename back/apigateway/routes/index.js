const express = require("express")
const axios = require('axios');
const { services } = require('./registry.json');
const router = express.Router()

router.use('*', (req, res) => {
    console.log("Original url: " + req.originalUrl);
    const [ , , , service, ...pathParts] = req.originalUrl.split('/');
    const path = pathParts.join('/');

    console.log("Path to request: " + pathParts);
    console.log("Service to request: " + service);
    
    const serviceConfig = services[service];
    if (!serviceConfig) {
        console.log("Service: "+ serviceConfig);
        return res.status(404).send({ message: 'Service not found' });
    } 

    axios({
        method: req.method,
        url: `${serviceConfig.url}${path}`,
        headers: req.headers,
        data: req.body,
    })
    .then(response => {
        res.send(response.data);
    })
    .catch(error => {
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
