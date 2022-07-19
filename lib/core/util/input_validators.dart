String? emailValidator(String email) {
  RegExp emailRegex = RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  
  if (baseValidator(email) != null) {
    return baseValidator(email);
  }
  if (!emailRegex.hasMatch(email)) {
    return 'Email is not valid';
  }

  return null;
}

String? passwordValidator(String password) {
  if (baseValidator(password) != null) {
    return baseValidator(password);
  }
  if (password.length < 6) {
    return 'Password is too short';
  }

  return null;
}

String? lengthValidator(
  String input,
  {
    String? title,
    int length = 5
  }
) {
  if (baseValidator(input) != null) {
    return baseValidator(input);
  }

  if (input.length < length) {
    return '${title ?? 'This field'} must be at least 5 characters long';
  }

  return null;
}

String? matchValidator(String value1, String value2, {String label = 'Inputs'}) {
  if (value1 != value2) return '$label do not match';

  return null;
}

String? baseValidator(String input) {
  if (input.isEmpty) {
    return 'Field cannot be empty';
  }

  return null;
}