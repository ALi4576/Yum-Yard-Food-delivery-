import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const String defaultPage = '/';
  static const String login = 'login';
  static const String otp = 'otp';
  static const String otpForgetPasswordRoute = '/$forgotPassword/$otp';
  static const String otpResetPasswordRoute =
      '/$forgotPassword/$otp/$resetPassword';
  static const String signup = 'signup';
  static const String signupOtp = '/$signup/$otp';
  static const String forgotPassword = 'forgot-password';
  static const String resetPassword = 'reset-password';
  static const String home = 'home';
  static const String searchLocation = 'search-location';
  static const String selectFromMap = 'select-from-map';
  static const String selectFromMapDest = '/$home/$searchLocation/$selectFromMap';
  static const String foodCategory = 'food-category';

  static void clearAndNavigate(BuildContext context, String path) {
    while (context.canPop() == true) {
      context.pop();
    }
    context.pushReplacement(path);
  }
}
