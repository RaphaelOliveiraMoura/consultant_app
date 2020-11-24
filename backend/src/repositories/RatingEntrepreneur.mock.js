const ratings = [];

function findByEntrepreneurAndQuestionId({ entrepreneurId, questionId }) {
  const findedRating = ratings.find(
    (rating) =>
      rating.entrepreneurId === entrepreneurId &&
      rating.questionId === questionId
  );
  return findedRating;
}

function upsert({ entrepreneurId, questionId, rating }) {
  const findedRatingIndex = ratings.findIndex(
    (currentRating) =>
      currentRating.entrepreneurId === entrepreneurId &&
      currentRating.questionId === questionId
  );

  if (findedRatingIndex < 0) {
    return ratings.push({ entrepreneurId, questionId, rating });
  }

  ratings[findedRatingIndex].entrepreneurId = entrepreneurId;
  ratings[findedRatingIndex].questionId = questionId;
  ratings[findedRatingIndex].rating = rating;
}

module.exports = {
  ratings,
  findByEntrepreneurAndQuestionId,
  upsert,
};
