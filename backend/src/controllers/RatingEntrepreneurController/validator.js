const yup = require('yup');

exports.index = (req, res, next) => {
  if (req.header.authorization) {
    return res.status(400).json({ error: 'invalid_authorization' });
  }

  return next();
};

exports.update = (req, res, next) => {
  const bodySchema = yup.object().shape({
    questionId: yup.number().required(),
    rating: yup.number().required(),
  });

  try {
    bodySchema.validateSync(req.body);
  } catch (error) {
    return res.status(400).json({ error: 'invalid_payload' });
  }

  if (!req.headers.authorization) {
    return res.status(401).json({ error: 'invalid_authorization' });
  }

  if (req.body.password !== req.body.confirmPassword) {
    return res.status(400).json({ error: 'password_mismatch' });
  }

  return next();
};
