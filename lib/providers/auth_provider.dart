import 'package:equatable/equatable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthProvider extends StateNotifier<AuthState> {
  AuthProvider(
    this.ref,
  ) : super(const AuthState._());

  final Ref ref;

  void resetState() {
    state = const AuthState._();
  }

  void updateState({
    String? phoneNumber,
    String? password,
    bool? isPasswordVisible,
    bool? isLoggedIn,
  }) {
    state = state.copyWith(
      phoneNumber: phoneNumber ?? state.phoneNumber,
      password: password ?? state.password,
      isPasswordVisible: isPasswordVisible ?? state.isPasswordVisible,
      isLoggedIn: isLoggedIn ?? state.isLoggedIn,
    );
  }

  Future<void> login() async {
    if (state.password == '' || state.phoneNumber == '') {
      return;
    }
    updateState(isLoggedIn: true);
  }
}

class AuthState extends Equatable {
  const AuthState._({
    this.phoneNumber = '',
    this.password = '',
    this.isPasswordVisible = false,
    this.isLoggedIn = false,
  });

  AuthState copyWith({
    String? phoneNumber,
    String? password,
    bool? isPasswordVisible,
    bool? isLoggedIn,
  }) {
    return AuthState._(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    );
  }

  final String phoneNumber;
  final String password;
  final bool isPasswordVisible;
  final bool isLoggedIn;

  @override
  List<Object?> get props => [
        phoneNumber,
        password,
        isPasswordVisible,
        isLoggedIn,
      ];
}
