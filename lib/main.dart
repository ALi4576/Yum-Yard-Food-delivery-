import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yum_yard/onboarding/onboarding.dart';
import 'package:yum_yard/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ProviderScope.containerOf(context)

void main() {
  final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const Onboarding();
        },
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
    return MaterialApp.router(
      title: 'Yum Yard',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
