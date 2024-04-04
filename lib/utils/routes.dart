import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yum_yard/auth/auth.dart';
import 'package:yum_yard/food_category/food_category.dart';
import 'package:yum_yard/home/views/views.dart';
import 'package:yum_yard/location/location.dart';
import 'package:yum_yard/onboarding/onboarding.dart';

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
  static const String selectFromMapDest =
      '/$home/$searchLocation/$selectFromMap';
  static const String foodCategory = 'food-category';

  static void clearAndNavigate(BuildContext context, String path) {
    while (context.canPop() == true) {
      context.pop();
    }
    context.pushReplacement(path);
  }

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: Routes.defaultPage,
        builder: (BuildContext context, GoRouterState state) {
          return const Onboarding();
        },
        routes: <RouteBase>[
          GoRoute(
            path: Routes.login,
            builder: (BuildContext context, GoRouterState state) {
              return const Login();
            },
          ),
          GoRoute(
            path: Routes.signup,
            builder: (BuildContext context, GoRouterState state) {
              return const Signup();
            },
            routes: [
              GoRoute(
                path: Routes.otp,
                builder: (BuildContext context, GoRouterState state) {
                  return const Otp(
                    isSignup: true,
                  );
                },
              ),
            ],
          ),
          GoRoute(
            path: Routes.forgotPassword,
            builder: (BuildContext context, GoRouterState state) {
              return const ForgotPassword();
            },
            routes: [
              GoRoute(
                path: Routes.otp,
                builder: (BuildContext context, GoRouterState state) {
                  return const Otp(
                    isSignup: false,
                  );
                },
                routes: [
                  GoRoute(
                    path: Routes.resetPassword,
                    builder: (BuildContext context, GoRouterState state) {
                      return const ResetPassword();
                    },
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: Routes.home,
            builder: (BuildContext context, GoRouterState state) {
              return AuthGuard(
                builder: (context) => const Home(),
              );
            },
            routes: [
              GoRoute(
                path: Routes.searchLocation,
                builder: (BuildContext context, GoRouterState state) {
                  return AuthGuard(
                    builder: (context) => const SearchLocation(),
                  );
                },
                routes: [
                  GoRoute(
                    path: Routes.selectFromMap,
                    builder: (BuildContext context, GoRouterState state) {
                      return AuthGuard(
                        builder: (context) => const ChooseFromMap(),
                      );
                    },
                  ),
                ],
              ),
              GoRoute(
                path: Routes.foodCategory,
                builder: (BuildContext context, GoRouterState state) {
                  return const Category();
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
