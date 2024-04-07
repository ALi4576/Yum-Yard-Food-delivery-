import 'package:hooks_riverpod/hooks_riverpod.dart';

class BottomBarProvider extends StateNotifier<int> {
  BottomBarProvider(
    this.ref,
  ) : super(0);

  final Ref ref;

  void onUpdate(int index) {
    state = index;
  }
}
