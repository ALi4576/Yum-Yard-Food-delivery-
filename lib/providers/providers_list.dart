import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yum_yard/providers/providers.dart';

class ProvidersList {
  final authProvider = StateNotifierProvider<AuthProvider, AuthState>(
    (ref) => AuthProvider(ref),
  );

  final signUpProvider = StateNotifierProvider<SignupProvider, SignupState>(
    (ref) => SignupProvider(ref),
  );
}
