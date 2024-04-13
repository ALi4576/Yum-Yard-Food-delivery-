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
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _Tab(title: 'Placed', index: 0),
              SizedBox(width: 15),
              _Tab(title: 'Cart', index: 1),
              SizedBox(width: 15),
              _Tab(title: 'History', index: 2),
            ],
          ),
          Consumer(
            builder: (context, ref, child) {
              switch (ref.watch(PL.ordersProvider).tabIndex) {
                case 0:
                  return const PlacedOrders();
                // case 1:
                //   return const Cart();
                // case 2:
                //   return const OrderHistory();
                default:
                  return const SizedBox();
              }
            },
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

class PlacedOrders extends ConsumerWidget {
  const PlacedOrders({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final placedOrders = ref.watch(PL.ordersProvider).placedOrders;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        children: placedOrders.map((order) {
          return _OrderItem(
            order: order,
          );
        }).toList(),
      ),
    );
  }
}

class _OrderItem extends StatelessWidget {
  const _OrderItem({
    required this.order,
  });

  final Map<String, dynamic> order;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageTile(
            height: 80,
            width: 100,
            image: order['image'] as String? ?? '',
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                order['name'] as String? ?? '',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.black,
                    ),
              ),
              Text(
                'items: ${order['quantity']}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.gray80,
                    ),
              ),
              const SizedBox(height: 5),
              Text(
                (order['currency'] as Map)['symbol'] + order['price']
                        as String? ??
                    '',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.green,
                    ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              SizedBox(
                width: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.watch_later_outlined,
                      color: AppColors.gray,
                      size: 16,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      order['eta'],
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.black,
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              StatusCard(status: order['status']),
            ],
          ),
        ],
      ),
    );
  }
}
