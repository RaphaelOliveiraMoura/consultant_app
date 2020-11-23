const Entrepreneur = require('../models/Entrepreneur');

exports.store = async (req, res) => {
  await Entrepreneur.create(req.body);
  return res.status(201).send();
};
