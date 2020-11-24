const yup = require('yup');

exports.store = (req, res, next) => {
  const bodySchema = yup.object().shape({
    specialization: yup.string().required(),
    name: yup.string().required(),
    email: yup.string().email().required(),
    password: yup.string().required(),
    confirmPassword: yup.string().required(),
  });

  try {
    bodySchema.validateSync(req.body);
  } catch (error) {
    return res.status(400).json({ error: 'invalid_payload' });
  }

  if (req.body.password !== req.body.confirmPassword) {
    return res.status(400).json({ error: 'password_mismatch' });
  }

  return next();
};
