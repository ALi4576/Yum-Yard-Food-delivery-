import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yum_yard/providers/providers.dart';
import 'package:yum_yard/utils/utils.dart';
import 'package:yum_yard/widgets/widgets.dart';

class ResetPassword extends ConsumerWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: PopScope(
        canPop: false,
        child: Wrapper(
          appBar: AppBar(
            title: Text(
              'Reset password',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.white,
          ),
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
                      ref
                          .read(PL.authProvider.notifier)
                          .resetPassword()
                          .then((value) {
                        if (value) {
                          context.go('/${Routes.login}');
                        }
                      });
                    },
                    child: Text(
                      'Confirm',
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
            children: [
              const SizedBox(height: 20),
              Image.asset(
                'assets/keys.png',
                height: 200,
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Your new password',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: TextInput(
                  onChanged: (value) {
                    ref.read(PL.authProvider.notifier).updateState(
                          newPassword: value,
                        );
                  },
                  obscureText: !ref.watch(PL.authProvider).isNewPasswordVisible,
                  suffixIcon: InkWell(
                    onTap: () {
                      ref.read(PL.authProvider.notifier).updateState(
                            isNewPasswordVisible:
                                !ref.read(PL.authProvider).isNewPasswordVisible,
                          );
                    },
                    child: Icon(
                      ref.watch(PL.authProvider).isNewPasswordVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: AppColors.gray80,
                    ),
                  ),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.gray80,
                        fontWeight: FontWeight.w800,
                      ),
                  hintText: 'Enter your new password',
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
                    'Confirm password',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: TextInput(
                  onChanged: (value) {
                    ref.read(PL.authProvider.notifier).updateState(
                          confirmPassword: value,
                        );
                  },
                  obscureText:
                      !ref.watch(PL.authProvider).isConfirmPasswordVisible,
                  suffixIcon: InkWell(
                    onTap: () {
                      ref.read(PL.authProvider.notifier).updateState(
                            isConfirmPasswordVisible: !ref
                                .read(PL.authProvider)
                                .isConfirmPasswordVisible,
                          );
                    },
                    child: Icon(
                      ref.watch(PL.authProvider).isConfirmPasswordVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: AppColors.gray80,
                    ),
                  ),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.gray80,
                        fontWeight: FontWeight.w800,
                      ),
                  hintText: 'Confirm password',
                  hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.gray80,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
