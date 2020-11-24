const validator = require('./validator');
const VideoContent = require('../../repositories/VideoContent');

exports.index = async (_req, res) => {
  const videoContentList = await VideoContent.findAll();
  return res.status(200).send(videoContentList);
};

exports.store = [
  validator.store,
  async (req, res) => {
    const consultantId = req.headers.authorization;
    const videoContent = { ...req.body, consultantId };

    await VideoContent.create(videoContent);

    res.status(201).send();
  },
];
