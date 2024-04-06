import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:yum_yard/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ProviderScope.containerOf(context)

void main() {
  runApp(
    ProviderScope(
      child: App(router: Routes.router),
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
