const Sequelize = require('sequelize');

class Consultant extends Sequelize.Model {
  static init(sequelize) {
    super.init(
      {
        specialization: Sequelize.STRING,
        name: Sequelize.STRING,
        email: Sequelize.STRING,
        password: Sequelize.STRING,
      },
      { sequelize }
    );

    return this;
  }
}

module.exports = Consultant;
