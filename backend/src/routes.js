const { Router } = require('express');

const ConsultantController = require('./controllers/ConsultantController');
const EntrepreneurController = require('./controllers/EntrepreneurController');
const VideoContentController = require('./controllers/VideoContentController');
const AuthConsultantController = require('./controllers/AuthConsultantController');
const AuthEntrepreneurController = require('./controllers/AuthEntrepreneurController');
const RatingConsultantController = require('./controllers/RatingConsultantController');
const RatingEntrepreneurController = require('./controllers/RatingEntrepreneurController');

const routes = Router();

routes.post('/consultants/auth', AuthConsultantController.store);
routes.post('/entrepreneurs/auth', AuthEntrepreneurController.store);

routes.get('/consultants', ConsultantController.index);
routes.post('/consultants', ConsultantController.store);

routes.post('/entrepreneurs', EntrepreneurController.store);

routes.get('/explorer', VideoContentController.index);
routes.post('/videos', VideoContentController.store);

routes.get('/consultants/ratings', RatingConsultantController.index);
routes.put('/consultants/ratings', RatingConsultantController.update);

routes.get('/entrepreneurs/ratings', RatingEntrepreneurController.index);
routes.put('/entrepreneurs/ratings', RatingEntrepreneurController.update);

module.exports = routes;
