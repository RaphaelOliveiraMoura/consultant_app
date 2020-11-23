const { Router } = require('express');

const ConsultantController = require('./controllers/ConsultantController');
const EntrepreneurController = require('./controllers/EntrepreneurController');
const VideoContentController = require('./controllers/VideoContentController');

const routes = Router();

routes.post('/consultants', ConsultantController.store);
routes.post('/entrepreneurs', EntrepreneurController.store);
routes.get('/explorer', VideoContentController.index);

module.exports = routes;
