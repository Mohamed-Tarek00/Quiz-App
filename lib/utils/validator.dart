class AuthValidators {
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      return 'Enter a valid email';
    }
    if (!email.endsWith('@gmail.com')) {
      return 'Please enter a valid email ending with @gmail.com';
    }
    return null;
  }

  static String? validateGender(String? gender) {
    if (gender == null || gender.isEmpty) {
      return "Please select gender";
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }
    if (!RegExp(r'^[A-Z]').hasMatch(password)) {
      return 'Password must start with a capital letter';
    }
    if (password.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
}
