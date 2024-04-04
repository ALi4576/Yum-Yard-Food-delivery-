import 'package:equatable/equatable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignupProvider extends StateNotifier<SignupState> {
  SignupProvider(
    this.ref,
  ) : super(const SignupState._());

  final Ref ref;

  void resetState() {
    state = const SignupState._();
  }

  void updateState({
    String? phoneNumber,
    String? password,
    bool? isPasswordVisible,
    bool? isConfirmPasswordVisible,
    String? confirmPassword,
  }) {
    state = state.copyWith(
      phoneNumber: phoneNumber ?? state.phoneNumber,
      password: password ?? state.password,
      isPasswordVisible: isPasswordVisible ?? state.isPasswordVisible,
      isConfirmPasswordVisible:
          isConfirmPasswordVisible ?? state.isConfirmPasswordVisible,
      confirmPassword: confirmPassword ?? state.confirmPassword,
    );
  }

  Future<void> signUp() async {
    if (state.password == '' ||
        state.phoneNumber == '' ||
        state.password != state.confirmPassword) {
      return;
    }
    updateState(isConfirmPasswordVisible: true);
  }
}

class SignupState extends Equatable {
  const SignupState._({
    this.phoneNumber = '',
    this.password = '',
    this.confirmPassword = '',
    this.isPasswordVisible = false,
    this.isConfirmPasswordVisible = false,
  });

  SignupState copyWith({
    String? phoneNumber,
    String? password,
    bool? isPasswordVisible,
    bool? isConfirmPasswordVisible,
    String? confirmPassword,
  }) {
    return SignupState._(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isConfirmPasswordVisible:
          isConfirmPasswordVisible ?? this.isConfirmPasswordVisible,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }

  final String phoneNumber;
  final String password;
  final String confirmPassword;
  final bool isPasswordVisible;
  final bool isConfirmPasswordVisible;

  @override
  List<Object?> get props => [
        phoneNumber,
        password,
        confirmPassword,
        isPasswordVisible,
        isConfirmPasswordVisible,
      ];
}
