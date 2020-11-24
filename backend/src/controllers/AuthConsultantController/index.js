const validator = require('./validator');
const Consultant = require('../../repositories/Consultant');

exports.store = [
  validator.store,
  async (req, res) => {
    const { email, password } = req.body;

    const findedConsultant = await Consultant.findByEmail(email);

    if (!findedConsultant) {
      return res.status(401).json({ error: 'user_not_found' });
    }

    if (findedConsultant.password !== password) {
      return res.status(401).json({ error: 'invalid_password' });
    }

    return res.json(findedConsultant);
  },
];
