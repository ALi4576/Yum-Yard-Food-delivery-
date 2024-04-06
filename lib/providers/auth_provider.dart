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
    String? forgotPasswordPhone,
    String? newPassword,
    String? confirmPassword,
    bool? isNewPasswordVisible,
    bool? isConfirmPasswordVisible,
  }) {
    state = state.copyWith(
      phoneNumber: phoneNumber ?? state.phoneNumber,
      password: password ?? state.password,
      isPasswordVisible: isPasswordVisible ?? state.isPasswordVisible,
      isLoggedIn: isLoggedIn ?? state.isLoggedIn,
      forgotPasswordPhone: forgotPasswordPhone ?? state.forgotPasswordPhone,
      newPassword: newPassword ?? state.newPassword,
      confirmPassword: confirmPassword ?? state.confirmPassword,
      isNewPasswordVisible: isNewPasswordVisible ?? state.isNewPasswordVisible,
      isConfirmPasswordVisible:
          isConfirmPasswordVisible ?? state.isConfirmPasswordVisible,
    );
  }

  Future<void> login() async {
    if (state.password == '' || state.phoneNumber == '') {
      return;
    }
    updateState(isLoggedIn: true);
  }

  Future<bool> forgotPasswordPhone() async {
    return state.forgotPasswordPhone != '';
  }

  Future<bool> resetPassword() async {
    return state.newPassword == state.confirmPassword;
  }
}

class AuthState extends Equatable {
  const AuthState._({
    this.phoneNumber = '',
    this.password = '',
    this.isPasswordVisible = false,
    this.isLoggedIn = false,
    this.forgotPasswordPhone = '',
    this.newPassword = '',
    this.confirmPassword = '',
    this.isNewPasswordVisible = false,
    this.isConfirmPasswordVisible = false,
  });

  AuthState copyWith({
    String? phoneNumber,
    String? password,
    bool? isPasswordVisible,
    bool? isLoggedIn,
    String? forgotPasswordPhone,
    String? newPassword,
    String? confirmPassword,
    bool? isNewPasswordVisible,
    bool? isConfirmPasswordVisible,
  }) {
    return AuthState._(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      forgotPasswordPhone: forgotPasswordPhone ?? this.forgotPasswordPhone,
      newPassword: newPassword ?? this.newPassword,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isNewPasswordVisible: isNewPasswordVisible ?? this.isNewPasswordVisible,
      isConfirmPasswordVisible:
          isConfirmPasswordVisible ?? this.isConfirmPasswordVisible,
    );
  }

  final String phoneNumber;
  final String password;
  final bool isPasswordVisible;
  final bool isLoggedIn;
  final String forgotPasswordPhone;
  final String newPassword;
  final String confirmPassword;
  final bool isNewPasswordVisible;
  final bool isConfirmPasswordVisible;

  @override
  List<Object?> get props => [
        phoneNumber,
        password,
        isPasswordVisible,
        isLoggedIn,
        forgotPasswordPhone,
        newPassword,
        confirmPassword,
        isNewPasswordVisible,
        isConfirmPasswordVisible,
      ];
}
