const Sequelize = require('sequelize');

class VideoContent extends Sequelize.Model {
  static init(sequelize) {
    super.init(
      {
        youtubeUrl: Sequelize.STRING,
        title: Sequelize.STRING,
        description: Sequelize.STRING,
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
  }
}

module.exports = VideoContent;
