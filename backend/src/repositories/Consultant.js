const Consultant = require('../models/Consultant');

async function findAll() {
  const consultants = await Consultant.findAll();
  return consultants;
}

async function findById(id) {
  const consultant = await Consultant.findByPk(id);
  return consultant;
}

async function findByEmail(email) {
  const consultant = await Consultant.findOne({ where: { email } });
  return consultant;
}

async function create(consultant) {
  const result = await Consultant.create(consultant);
  return result;
}

module.exports = {
  findAll,
  findById,
  findByEmail,
  create,
};
