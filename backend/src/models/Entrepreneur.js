const Sequelize = require('sequelize');

class Entrepreneur extends Sequelize.Model {
  static init(sequelize) {
    super.init(
      {
        email: Sequelize.STRING,
        password: Sequelize.STRING,
      },
      { sequelize }
    );

    return this;
  }
}

module.exports = Entrepreneur;
