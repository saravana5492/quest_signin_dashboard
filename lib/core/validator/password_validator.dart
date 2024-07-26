String? isValidPassword(String? value) {
  if (value == null || value.trim().isEmpty) {
    return "Password is required.";
  }

  return null;
}
