const Sequelize = require('sequelize');

class RatingConsultant extends Sequelize.Model {
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
    this.belongsTo(models.Consultant, {
      foreignKey: 'consultant_id',
      as: 'consultant',
    });

    this.belongsTo(models.Question, {
      foreignKey: 'question_id',
      as: 'question',
    });
  }
}

module.exports = RatingConsultant;
