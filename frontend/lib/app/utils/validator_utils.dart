isRequired(String requiredMessage) {
  return (value) {
    if (value == null || value.isEmpty) {
      return requiredMessage;
    }
  };
}
