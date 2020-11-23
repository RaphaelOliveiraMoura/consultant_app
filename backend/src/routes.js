const { Router } = require('express');

const ConsultantController = require('./controllers/ConsultantController');
const EntrepreneurController = require('./controllers/EntrepreneurController');
const VideoContentController = require('./controllers/VideoContentController');
const AuthConsultantController = require('./controllers/AuthConsultantController');
const AuthEntrepreneurController = require('./controllers/AuthEntrepreneurController');

const routes = Router();

routes.post('/consultants/auth', AuthConsultantController.store);
routes.post('/entrepreneurs/auth', AuthEntrepreneurController.store);

routes.get('/consultants', ConsultantController.index);
routes.post('/consultants', ConsultantController.store);

routes.post('/entrepreneurs', EntrepreneurController.store);

routes.get('/explorer', VideoContentController.index);
routes.post('/videos', VideoContentController.store);

// list ratings
// rate

module.exports = routes;
