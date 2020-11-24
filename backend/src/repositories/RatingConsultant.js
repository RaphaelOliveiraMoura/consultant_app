const RatingConsultant = require('../models/RatingConsultant');

async function findByConsultantAndQuestionId({
  consultantId: consultant_id,
  questionId: question_id,
}) {
  const rating = await RatingConsultant.findOne({
    where: { consultant_id, question_id },
  });

  return rating;
}

async function upsert({
  consultantId: consultant_id,
  questionId: question_id,
  rating,
}) {
  const ratingConsultant = await RatingConsultant.findOne({
    where: { consultant_id, question_id },
  });

  if (!ratingConsultant) {
    const createResult = await RatingConsultant.create({
      rating,
      consultant_id,
      question_id,
    });

    return createResult;
  }

  const updateResult = await RatingConsultant.update(
    { rating },
    { where: { consultant_id, question_id } }
  );

  return updateResult;
}

module.exports = {
  findByConsultantAndQuestionId,
  upsert,
};
