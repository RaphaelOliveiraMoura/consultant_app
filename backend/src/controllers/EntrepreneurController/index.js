const validator = require('./validator');
const Entrepreneur = require('../../repositories/Entrepreneur');

exports.store = [
  validator.store,
  async (req, res) => {
    await Entrepreneur.create(req.body);
    return res.status(201).send();
  },
];
