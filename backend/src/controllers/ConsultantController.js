const Consultant = require('../models/Consultant');

exports.index = async (req, res) => {
  const consultants = await Consultant.findAll();
  return res.status(200).json(consultants);
};

exports.store = async (req, res) => {
  await Consultant.create(req.body);
  return res.status(201).send();
};
