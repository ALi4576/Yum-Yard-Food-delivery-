import 'package:equatable/equatable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yum_yard/fake_db/fake_db.dart';

class OrdersProvider extends StateNotifier<OrdersState> {
  OrdersProvider(
    this.ref,
  ) : super(const OrdersState._()){
    getPlacedOrders();
    getCart();
    getOrderHistory();
  }

  final Ref ref;

  void resetState() {
    state = const OrdersState._();
  }

  void updateState({
    int? tabIndex,
    List<Map<String, dynamic>>? placedOrders,
    List<Map<String, dynamic>>? cart,
    List<Map<String, dynamic>>? orderHistory,
  }) {
    state = state.copyWith(
      tabIndex: tabIndex ?? state.tabIndex,
      placedOrders: placedOrders ?? state.placedOrders,
      cart: cart ?? state.cart,
      orderHistory: orderHistory ?? state.orderHistory,
    );
  }

  Future<void> getPlacedOrders() async {
    updateState(placedOrders: placedOrders);
  }

  Future<void> getCart() async {
    updateState(cart: cart);
  }

  Future<void> getOrderHistory() async {
    updateState(orderHistory: orderHistory);
  }
}

class OrdersState extends Equatable {
  const OrdersState._({
    this.tabIndex = 0,
    this.placedOrders = const [],
    this.cart = const [],
    this.orderHistory = const [],
  });

  OrdersState copyWith({
    int? tabIndex,
    List<Map<String, dynamic>>? placedOrders,
    List<Map<String, dynamic>>? cart,
    List<Map<String, dynamic>>? orderHistory,
  }) {
    return OrdersState._(
      tabIndex: tabIndex ?? this.tabIndex,
      placedOrders: placedOrders ?? this.placedOrders,
      cart: cart ?? this.cart,
      orderHistory: orderHistory ?? this.orderHistory,
    );
  }

  final int tabIndex;
  final List<Map<String, dynamic>> placedOrders;
  final List<Map<String, dynamic>> cart;
  final List<Map<String, dynamic>> orderHistory;

  @override
  List<Object?> get props => [
        tabIndex,
        placedOrders,
        cart,
        orderHistory,
      ];
}
