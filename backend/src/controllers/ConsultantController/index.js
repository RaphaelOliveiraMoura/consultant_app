const validator = require('./validator');
const Consultant = require('../../repositories/Consultant');

exports.index = async (_req, res) => {
  const consultants = await Consultant.findAll();
  return res.status(200).json(consultants);
};

exports.store = [
  validator.store,
  async (req, res) => {
    const consultantAlreadyExists = await Consultant.findByEmail(
      req.body.email
    );

    if (consultantAlreadyExists) {
      return res.status(400).json({ error: 'email_already_exists' });
    }

    await Consultant.create(req.body);
    return res.status(201).send();
  },
];
