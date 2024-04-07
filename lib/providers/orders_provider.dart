import 'package:equatable/equatable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OrdersProvider extends StateNotifier<OrdersState> {
  OrdersProvider(
    this.ref,
  ) : super(const OrdersState._());

  final Ref ref;

  void resetState() {
    state = const OrdersState._();
  }

  void updateState({
    int? tabIndex,
  }) {
    state = state.copyWith(
      tabIndex: tabIndex ?? state.tabIndex,
    );
  }

  Future<void> getOrders() async {}
}

class OrdersState extends Equatable {
  const OrdersState._({
    this.tabIndex = 0,
  });

  OrdersState copyWith({
    int? tabIndex,
  }) {
    return OrdersState._(
      tabIndex: tabIndex ?? this.tabIndex,
    );
  }

  final int tabIndex;

  @override
  List<Object?> get props => [
        tabIndex,
      ];
}
