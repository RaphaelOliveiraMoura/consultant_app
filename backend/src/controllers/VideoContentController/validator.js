const yup = require('yup');

exports.store = (req, res, next) => {
  const bodySchema = yup.object().shape({
    youtubeUrl: yup.string().required(),
    title: yup.string().required(),
    description: yup.string().required(),
  });

  try {
    bodySchema.validateSync(req.body);
  } catch (error) {
    return res.status(400).json({ error: 'invalid_payload' });
  }

  if (!req.headers.authorization) {
    return res.status(401).json({ error: 'invalid_authorization' });
  }

  return next();
};
