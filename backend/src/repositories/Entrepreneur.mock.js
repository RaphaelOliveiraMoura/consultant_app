const entrepreneurs = [];

function create(entrepreneur) {
  entrepreneurs.push(entrepreneur);
}

function findByEmail(email) {
  const findedEntrepreneur = entrepreneurs.find(
    (entrepreneur) => entrepreneur.email === email
  );
  return findedEntrepreneur;
}

module.exports = {
  entrepreneurs,
  create,
  findByEmail,
};
