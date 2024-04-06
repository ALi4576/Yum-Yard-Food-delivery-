import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yum_yard/providers/providers_list.dart';
import 'package:yum_yard/utils/utils.dart';
import 'package:yum_yard/widgets/widgets.dart';

class ForgotPassword extends ConsumerWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Wrapper(
        appBar: AppBar(
          title: Text(
            'Forgot Password',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
            ),
            onPressed: () {
              context.go('/${Routes.login}');
            },
          ),
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
                        .watch(PL.authProvider.notifier)
                        .forgotPasswordPhone()
                        .then((value) {
                      if (value) {
                        context.go(Routes.otpForgetPasswordRoute);
                      }
                    });
                  },
                  child: Text(
                    'Send Otp',
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
                      .updateState(forgotPasswordPhone: value);
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
          ],
        ),
      ),
    );
  }
}
