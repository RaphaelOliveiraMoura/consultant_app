String emailRegex =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

isRequired(String requiredMessage) {
  return (value) {
    if (value == null || value.isEmpty) {
      return requiredMessage;
    }
  };
}

validateEmail(value) {
  if (value == null || value.isEmpty) {
    return 'O campo de email é obrigatório';
  }

  if (!RegExp(emailRegex).hasMatch(value)) {
    return 'Digite um email válido';
  }
}
