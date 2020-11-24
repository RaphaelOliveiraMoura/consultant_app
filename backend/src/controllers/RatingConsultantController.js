const RatingQuestion = require('../models/RatingQuestion');
const RatingConsultant = require('../models/RatingConsultant');

exports.index = async (req, res) => {
  const consultantId = req.headers.authorization;

  const questions = await RatingQuestion.findAll();

  const ratings = await Promise.all(
    questions.map(async (question) => {
      const response = await RatingConsultant.findByConsultantAndQuestionId({
        consultantId,
        questionId: question.id,
      });

      const rating = response ? response.rating : 0;

      return { question, rating };
    })
  );

  return res.json(ratings);
};

exports.update = async (req, res) => {
  const consultantId = req.headers.authorization;
  const { questionId, rating } = req.body;

  await RatingConsultant.upsert({
    consultantId,
    questionId,
    rating,
  });

  return res.send();
};
