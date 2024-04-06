import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yum_yard/providers/providers_list.dart';
import 'package:yum_yard/utils/utils.dart';
import 'package:yum_yard/widgets/widgets.dart';

class Login extends ConsumerWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Wrapper(
        bottomNavigationBar: SizedBox(
          height: 100,
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Divider(
                color: AppColors.gray40,
                thickness: 2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ActionButton(
                  onPressed: () {
                    ref.read(PL.authProvider.notifier).login().then((value) {
                      if (ref.read(PL.authProvider).isLoggedIn) {
                        Routes.clearAndNavigate(context, '/${Routes.home}');
                      }
                    });
                  },
                  child: Text(
                    'Login',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(height: 30),
            DecoratedBox(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.1),
                    blurRadius: 20,
                    spreadRadius: 5,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: SvgPicture.asset(
                'assets/login_image.svg',
                height: 220,
              ),
            ),
            const Spacer(),
            Text(
              'Let\'s get started',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.primary100,
                  ),
            ),
            const SizedBox(height: 10),
            Text(
              'Login and start ordering food now!',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Your phone number',
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              child: TextInput(
                keyboardType: TextInputType.phone,
                onChanged: (value) {
                  ref
                      .read(PL.authProvider.notifier)
                      .updateState(phoneNumber: value);
                },
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.gray80,
                      fontWeight: FontWeight.w800,
                    ),
                hintText: 'Enter your phone number',
                hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.gray80,
                    ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Your password',
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              child: TextInput(
                onChanged: (value) {
                  ref.read(PL.authProvider.notifier).updateState(password: value);
                },
                suffixIcon: InkWell(
                  onTap: () {
                    ref.read(PL.authProvider.notifier).updateState(
                          isPasswordVisible:
                              !ref.read(PL.authProvider).isPasswordVisible,
                        );
                  },
                  child: Icon(
                    ref.watch(PL.authProvider).isPasswordVisible
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: AppColors.gray80,
                  ),
                ),
                obscureText: !ref.watch(PL.authProvider).isPasswordVisible,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.gray80,
                      fontWeight: FontWeight.w800,
                    ),
                hintText: 'Enter your password',
                hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.gray80,
                    ),
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: InkWell(
                  onTap: () {
                    context.go('/${Routes.forgotPassword}');
                  },
                  child: Text(
                    'Forgot password?',
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.primary100,
                        ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: InkWell(
                onTap: () {
                  context.go('/${Routes.signup}');
                },
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Don\'t have an account? ',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.gray80,
                        ),
                    children: [
                      TextSpan(
                        text: 'Sign up',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppColors.secondary100,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
