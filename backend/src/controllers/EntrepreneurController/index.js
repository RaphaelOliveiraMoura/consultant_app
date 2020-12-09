const validator = require('./validator');
const Entrepreneur = require('../../repositories/Entrepreneur');

exports.store = [
  validator.store,
  async (req, res) => {
    const entrepreneurAlreadyExists = await Entrepreneur.findByEmail(
      req.body.email
    );

    if (entrepreneurAlreadyExists) {
      return res.status(400).json({ error: 'email_already_exists' });
    }

    await Entrepreneur.create(req.body);
    return res.status(201).send();
  },
];
