const Sequelize = require('sequelize');

class Question extends Sequelize.Model {
  static init(sequelize) {
    super.init(
      {
        title: Sequelize.INTEGER,
      },
      { sequelize }
    );

    return this;
  }
}

module.exports = Question;
