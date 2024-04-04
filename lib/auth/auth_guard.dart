import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yum_yard/auth/views/views.dart';
import 'package:yum_yard/main.dart';

class AuthGuard extends ConsumerWidget {
  final Widget Function(BuildContext) builder;

  const AuthGuard({super.key, required this.builder});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAuthenticated =  ref.watch(authProvider).isLoggedIn;

    if (isAuthenticated) {
      return builder(context);
    } else {
      return const Login();
    }
  }
}
