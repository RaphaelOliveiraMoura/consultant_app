const consultants = [];

function findAll() {
  return consultants;
}

function findById(id) {
  const findedConsultant = consultants.find(
    (consultant) => consultant.id === id
  );
  return findedConsultant;
}

function findByEmail(email) {
  const findedConsultant = consultants.find(
    (consultant) => consultant.email === email
  );
  return findedConsultant;
}

function create(consultant) {
  consultants.push(consultant);
}

module.exports = {
  consultants,
  findAll,
  findById,
  findByEmail,
  create,
};
