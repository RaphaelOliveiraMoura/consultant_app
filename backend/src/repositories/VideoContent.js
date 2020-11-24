const VideoContent = require('../models/VideoContent');

async function findAll() {
  const videosContent = await VideoContent.findAll({ include: ['consultant'] });
  return videosContent;
}

async function create(videoContent) {
  const result = await VideoContent.create({
    ...videoContent,
    consultant_id: videoContent.consultantId,
  });

  return result;
}

module.exports = {
  findAll,
  create,
};
