const Consultant = require('../models/Consultant');

exports.store = async (req, res) => {
  await Consultant.create(req.body);
  return res.status(201).send();
};
