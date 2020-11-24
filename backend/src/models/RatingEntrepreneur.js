const Sequelize = require('sequelize');

class RatingEntrepreneur extends Sequelize.Model {
  static init(sequelize) {
    super.init(
      {
        rating: Sequelize.INTEGER,
      },
      { sequelize }
    );

    return this;
  }

  static associate(models) {
    this.belongsTo(models.Entrepreneur, {
      foreignKey: 'entrepreneur_id',
      as: 'entrepreneur',
    });

    this.belongsTo(models.Question, {
      foreignKey: 'question_id',
      as: 'question',
    });
  }
}

module.exports = RatingEntrepreneur;
