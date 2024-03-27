class Routes {
  static const String home = '/';
  static const String login = 'login';
  static const String otp = 'otp';
  static const String otpForgetPasswordRoute = '/$forgotPassword/$otp';
  static const String otpResetPasswordRoute =
      '/$forgotPassword/$otp/$resetPassword';
  static const String signup = 'signup';
  static const String signupOtp = '/$signup/$otp';
  static const String forgotPassword = 'forgot-password';
  static const String resetPassword = 'reset-password';
}
