import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yum_yard/providers/providers.dart';
import 'package:yum_yard/utils/utils.dart';
import 'package:yum_yard/widgets/widgets.dart';

class Otp extends ConsumerWidget {
  const Otp({super.key, required this.isSignup});

  final bool isSignup;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(PL.otpProvider.notifier).getOtp();
    });

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Wrapper(
        appBar: AppBar(
          title: Text(
            'OTP verification',
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
              if (isSignup) {
                context.go('/${Routes.signup}');
              } else {
                context.go('/${Routes.forgotPassword}');
              }
            },
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text:
                      'Please enter the 5-digit-OTP we\'ve sent to your phone number: ',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.gray80,
                      ),
                  children: [
                    TextSpan(
                      text: '(+36) 123 456 789',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.primary100,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              OtpTextField(
                autoFocus: true,
                textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                numberOfFields: 5,
                fieldWidth: 60,
                fieldHeight: 60,
                contentPadding: const EdgeInsets.all(12),
                borderColor: AppColors.primary100,
                focusedBorderColor: AppColors.primary100,
                disabledBorderColor: AppColors.gray80,
                borderRadius: BorderRadius.circular(12),
                filled: true,
                fillColor: AppColors.primary40,
                showFieldAsBox: true,
                onSubmit: (String verificationCode) {
                  ref
                      .read(PL.otpProvider.notifier)
                      .updateState(confirmOtp: verificationCode);
                  ref.watch(PL.otpProvider.notifier).verifyOtp().then((value) {
                    if (value) {
                      if (isSignup) {
                        Routes.clearAndNavigate(
                          context,
                          '/${Routes.home}/${Routes.searchLocation}',
                        );
                      } else {
                        context.go(Routes.otpResetPasswordRoute);
                      }
                    }
                  });
                },
              ),
              const SizedBox(height: 5),
              TextButton(
                onPressed: () {
                  ref.read(PL.otpProvider.notifier).getOtp();
                },
                child: Text(
                  'Resend OTP',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.primary100,
                        fontWeight: FontWeight.w600,
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
