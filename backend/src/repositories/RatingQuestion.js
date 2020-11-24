const Question = require('../models/Question');

async function findAll() {
  const questions = await Question.findAll();
  return questions;
}

module.exports = { findAll };
