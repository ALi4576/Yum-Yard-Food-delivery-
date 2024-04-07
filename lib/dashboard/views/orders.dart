import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yum_yard/providers/providers.dart';
import 'package:yum_yard/utils/utils.dart';
import 'package:yum_yard/widgets/widgets.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      appBar: AppBar(
        title: Text(
          'Your Orders',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.background,
      ),
      child: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _Tab(title: 'Placed', index: 0),
              SizedBox(width: 15),
              _Tab(title: 'Cart', index: 1),
              SizedBox(width: 15),
              _Tab(title: 'History', index: 2),
            ],
          ),
        ],
      ),
    );
  }
}

class _Tab extends ConsumerWidget {
  const _Tab({
    required this.title,
    required this.index,
  });

  final String title;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () => ref.read(PL.ordersProvider.notifier).updateState(
            tabIndex: index,
          ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 6,
        ),
        decoration: BoxDecoration(
          color: ref.watch(PL.ordersProvider).tabIndex == index
              ? AppColors.primary100
              : AppColors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: AppColors.ambient20,
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: ref.watch(PL.ordersProvider).tabIndex == index
                    ? AppColors.white
                    : AppColors.ambient100,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }
}

