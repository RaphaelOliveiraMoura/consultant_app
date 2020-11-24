const validator = require('./validator');
const Entrepreneur = require('../../models/Entrepreneur');

exports.store = [
  validator.store,
  async (req, res) => {
    const { email, password } = req.body;

    const findedEntrepreneur = await Entrepreneur.findByEmail(email);

    if (!findedEntrepreneur) {
      return res.status(401).json({ error: 'user_not_found' });
    }

    if (findedEntrepreneur.password !== password) {
      return res.status(401).json({ error: 'invalid_password' });
    }

    return res.json(findedEntrepreneur);
  },
];
