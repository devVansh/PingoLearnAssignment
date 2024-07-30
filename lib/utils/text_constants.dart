class TextConstants {
  TextConstants._();
  static const String appName = 'Comments';
  static const String alreadyAccount = 'Already have an account? ';
  static const String newHere = 'New Here? ';
  static const String login = 'Login';
  static const String signUp = 'Signup';
  static const String name = 'Name';
  static const String email = 'Email';
  static const String password = 'Password';

  //Validations
  static const String emptyName = 'Name is required';
  static const String minNameLength = 'Name must be at least 3 characters long';
  static const String emailRegex =
      r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
  static const String emptyEmail = 'Email is required';
  static const String invalidEmail = 'Enter a valid email address';
  static const String emptyPassword = 'Password is required';
  static const String minPassword =
      'Password must be between 8 and 15 characters long';
  static const String minOneCapitalLetter =
      'Password must contain at least one capital letter';
  static const String minOneNumber =
      'Password must contain at least one number';
  static const String minOneSpecialCharacter =
      'Password must contain at least one special character';
  static const String emailAlreadyInUse = 'This email is already registered.';
  static const String genericError = 'An error occurred. Please try again.';

//Informative Messages

  static const String registrationInProgress = 'Setting up your account';
  static const String registrationSuccess =
      'You have been registered successfully';
  static const String loginInProgress = 'Login in progress...';
  static const String loginSuccess = 'Login successful!';
  static const String userNotFound = 'No user found with this email.';
  static const String wrongPassword = 'Incorrect password. Please try again.';
  static const String logoutDesc = 'You are successfully logged out';
  static const String fetchingComments = 'Fetching Comments...';
  static const String confirmLogout = 'Logout Confirmation';
  static const String confirmLogoutDesc = 'Are you sure you want to logout?';
  static const String cancel = 'Cancel';
  static const String logout = 'Logout';

  //Firebase
  static const String userCollection = 'user';
  static const String isMasked = 'isMasked';
}
