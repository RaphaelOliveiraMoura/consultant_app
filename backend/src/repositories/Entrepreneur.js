const Entrepreneur = require('../models/Entrepreneur');

async function create(entrepreneur) {
  const result = await Entrepreneur.create(entrepreneur);
  return result;
}

async function findByEmail(email) {
  const entrepreneur = await Entrepreneur.findOne({ where: { email } });
  return entrepreneur;
}

module.exports = {
  create,
  findByEmail,
};
