import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yum_yard/providers/providers.dart';

class PL {
  static final authProvider = StateNotifierProvider<AuthProvider, AuthState>(
    (ref) => AuthProvider(ref),
  );

  static final signUpProvider =
      StateNotifierProvider<SignupProvider, SignupState>(
    (ref) => SignupProvider(ref),
  );

  static final otpProvider = StateNotifierProvider<OtpProvider, OtpState>(
    (ref) => OtpProvider(ref),
  );
}
