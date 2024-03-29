import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
  static const String searchLocation = 'search-location';
  static const String selectFromMap = 'select-from-map';
  static const String selectFromMapDest = '/$searchLocation/$selectFromMap';

  static void clearAndNavigate(BuildContext context, String path) {
    while (context.canPop() == true) {
      context.pop();
    }
    context.pushReplacement(path);
  }
}
