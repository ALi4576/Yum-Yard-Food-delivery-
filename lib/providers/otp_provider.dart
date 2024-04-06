import 'package:equatable/equatable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OtpProvider extends StateNotifier<OtpState> {
  OtpProvider(
    this.ref,
  ) : super(const OtpState._());

  final Ref ref;

  void resetState() {
    state = const OtpState._();
  }

  void updateState({
    String? otp,
    String? confirmOtp,
  }) {
    state = state.copyWith(
      otp: otp ?? state.otp,
      confirmOtp: confirmOtp ?? state.confirmOtp,
    );
  }

  Future<void> getOtp() async {
    state = state.copyWith(otp: '11111');
  }

  Future<bool> verifyOtp() async {
    return state.otp == state.confirmOtp;
  }
}

class OtpState extends Equatable {
  const OtpState._({
    this.otp = '',
    this.confirmOtp = '',
  });

  OtpState copyWith({
    String? otp,
    String? confirmOtp,
  }) {
    return OtpState._(
      otp: otp ?? this.otp,
      confirmOtp: confirmOtp ?? this.confirmOtp,
    );
  }

  final String otp;
  final String confirmOtp;

  @override
  List<Object?> get props => [
        otp,
        confirmOtp,
      ];
}
