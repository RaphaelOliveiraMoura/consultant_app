const yup = require('yup');

exports.store = (req, res, next) => {
  const bodySchema = yup.object().shape({
    email: yup.string().email().required(),
    password: yup.string().required(),
  });

  try {
    bodySchema.validateSync(req.body);
    return next();
  } catch (error) {
    return res.status(400).json({ error: 'invalid_payload' });
  }
};
