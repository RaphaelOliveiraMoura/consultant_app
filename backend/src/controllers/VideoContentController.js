const VideoContent = require('../models/VideoContent');

exports.index = async (_req, res) => {
  const videoContentList = await VideoContent.listAll();
  return res.status(200).send(videoContentList);
};
