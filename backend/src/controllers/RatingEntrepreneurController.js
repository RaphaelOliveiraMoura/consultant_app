const RatingQuestion = require('../models/RatingQuestion');
const RatingEntrepreneur = require('../models/RatingEntrepreneur');

exports.index = async (req, res) => {
  const entrepreneurId = req.headers.authorization;

  const questions = await RatingQuestion.findAll();

  const ratings = await Promise.all(
    questions.map(async (question) => {
      const response = await RatingEntrepreneur.findByEntrepreneurAndQuestionId(
        {
          entrepreneurId,
          questionId: question.id,
        }
      );

      const rating = response ? response.rating : 0;

      return { question, rating };
    })
  );

  return res.json(ratings);
};

exports.update = async (req, res) => {
  const entrepreneurId = req.headers.authorization;
  const { questionId, rating } = req.body;

  await RatingEntrepreneur.upsert({
    entrepreneurId,
    questionId,
    rating,
  });

  return res.send();
};
