const ratings = [];

function findByConsultantAndQuestionId({ consultantId, questionId }) {
  const findedRating = ratings.find(
    (rating) =>
      rating.consultantId === consultantId && rating.questionId === questionId
  );
  return findedRating;
}

function upsert({ consultantId, questionId, rating }) {
  const findedRatingIndex = ratings.findIndex(
    (currentRating) =>
      currentRating.consultantId === consultantId &&
      currentRating.questionId === questionId
  );

  if (findedRatingIndex < 0) {
    return ratings.push({ consultantId, questionId, rating });
  }

  ratings[findedRatingIndex].consultantId = consultantId;
  ratings[findedRatingIndex].questionId = questionId;
  ratings[findedRatingIndex].rating = rating;
}

module.exports = {
  ratings,
  findByConsultantAndQuestionId,
  upsert,
};
