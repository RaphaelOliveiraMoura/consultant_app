const { Sequelize } = require('sequelize');

const Consultant = require('../models/Consultant');
const Entrepreneur = require('../models/Entrepreneur');
const Question = require('../models/Question');
const RatingConsultant = require('../models/RatingConsultant');
const RatingEntrepreneur = require('../models/RatingEntrepreneur');
const VideoContent = require('../models/VideoContent');

const models = [
  Consultant,
  Entrepreneur,
  Question,
  RatingConsultant,
  RatingEntrepreneur,
  VideoContent,
];

const sequelize = new Sequelize({
  dialect: 'sqlite',
  storage: 'database.sqlite',
  define: {
    timestamps: true,
    underscored: true,
    underscoredAll: true,
  },
});

async function init() {
  models.map((model) => model.init(sequelize));
  models.map((model) => model.associate && model.associate(sequelize.models));

  await sequelize.sync();
}

module.exports = { sequelize, init };
