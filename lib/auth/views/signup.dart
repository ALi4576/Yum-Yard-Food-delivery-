import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:yum_yard/utils/utils.dart';
import 'package:yum_yard/widgets/widgets.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
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
                    context.go(Routes.signupOtp);
                  },
                  child: Text(
                    'Continue',
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
            const SizedBox(height: 20),
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
                height: 200,
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
              'Create account to start ordering',
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
                onChanged: (value) {},
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
                onChanged: (value) {},
                suffixIcon: InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.visibility,
                    color: AppColors.gray80,
                  ),
                ),
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
                onChanged: (value) {},
                suffixIcon: InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.visibility,
                    color: AppColors.gray80,
                  ),
                ),
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
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: InkWell(
                onTap: () {
                  context.go('/${Routes.login}');
                },
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Already have an account? ',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.gray80,
                        ),
                    children: [
                      TextSpan(
                        text: 'Login',
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'By pressing “Continue”, you are agreeing to our ',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.gray80,
                      ),
                  children: [
                    TextSpan(
                      text: 'Terms and Conditions',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.primary100,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
