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

  static final bottomBarProvider =
      StateNotifierProvider<BottomBarProvider, int>(
    (ref) => BottomBarProvider(ref),
  );

  static final ordersProvider =
      StateNotifierProvider<OrdersProvider, OrdersState>(
    (ref) => OrdersProvider(ref),
  );
}
