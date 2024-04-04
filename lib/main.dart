import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:yum_yard/auth/auth.dart';
import 'package:yum_yard/food_category/food_category.dart';
import 'package:yum_yard/home/home.dart';
import 'package:yum_yard/location/location.dart';
import 'package:yum_yard/onboarding/onboarding.dart';
import 'package:yum_yard/providers/providers.dart';
import 'package:yum_yard/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ProviderScope.containerOf(context)

final authProvider = StateNotifierProvider<AuthProvider, AuthState>(
  (ref) => AuthProvider(ref),
);

final signUpProvider = StateNotifierProvider<SignupProvider, SignupState>(
  (ref) => SignupProvider(ref),
);

void main() {
  final GoRouter router = GoRouter(
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
                  return  AuthGuard(
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

  runApp(
    ProviderScope(
      child: App(router: router),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key, required this.router});

  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.background,
    ));

    return MaterialApp.router(
      title: 'Yum Yard',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
