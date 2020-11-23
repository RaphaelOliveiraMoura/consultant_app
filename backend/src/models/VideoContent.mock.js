const Consultant = require('./Consultant.mock');

const videoContentList = [];

function findAll() {
  return videoContentList.map((videoContent) => ({
    ...videoContent,
    consultant: Consultant.findById(videoContent.consultantId),
  }));
}

function create(videoContent) {
  videoContentList.push(videoContent);
}

module.exports = {
  videoContentList,
  findAll,
  create,
};
