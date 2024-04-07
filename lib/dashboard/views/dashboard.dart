import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yum_yard/dashboard/views/views.dart';
import 'package:yum_yard/providers/providers.dart';
import 'package:yum_yard/utils/utils.dart';

class Dashboard extends ConsumerWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: IndexedStack(
          index: ref.watch(PL.bottomBarProvider),
          children: const [
            Home(),
            SizedBox(),
            SizedBox(),
            SizedBox(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: ref.watch(PL.bottomBarProvider),
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: AppColors.white,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.ambient80,
          onTap: (value) =>
              ref.read(PL.bottomBarProvider.notifier).onUpdate(value),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_bag_outlined,
              ),
              label: 'Orders',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications_none_outlined,
              ),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
              ),
              label: 'Me',
            ),
          ],
        ),
      ),
    );
  }
}
