const RatingEntrepreneur = require('../models/RatingEntrepreneur');

async function findByEntrepreneurAndQuestionId({
  entrepreneurId: entrepreneur_id,
  questionId: question_id,
}) {
  const entrepreneur = await RatingEntrepreneur.findOne({
    where: { entrepreneur_id, question_id },
  });

  return entrepreneur;
}

async function upsert({
  entrepreneurId: entrepreneur_id,
  questionId: question_id,
  rating,
}) {
  const ratingEntrepreneur = await RatingEntrepreneur.findOne({
    where: { entrepreneur_id, question_id },
  });

  if (!ratingEntrepreneur) {
    const createResult = await RatingEntrepreneur.create({
      rating,
      entrepreneur_id,
      question_id,
    });

    return createResult;
  }

  const updateResult = await RatingEntrepreneur.update(
    { rating },
    { where: { entrepreneur_id, question_id } }
  );

  return updateResult;
}

module.exports = {
  findByEntrepreneurAndQuestionId,
  upsert,
};
