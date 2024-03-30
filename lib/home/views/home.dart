import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yum_yard/fake_db/fake_db.dart';
import 'package:yum_yard/utils/utils.dart';
import 'package:yum_yard/widgets/widgets.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Wrapper(
        safeArea: false,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: AppColors.white,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.black.withOpacity(0.7),
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
        child: Column(
          children: [
            Container(
              height: 240,
              padding: const EdgeInsets.only(
                top: 60,
                left: 15,
                right: 15,
                bottom: 10,
              ),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xfff3949a), Color(0xffeb4d57)],
                  stops: [0.2, 0.8],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _CurrentLocation(),
                  const SizedBox(height: 15),
                  Text(
                    'Good ${DateTime.now().getTimeOfDay()}, ${user['name'].toString().split(' ').first} 👋',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.white,
                        ),
                  ),
                  Text(
                    'Are you ready to place your order?',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 15),
                  TextInput(
                    style: Theme.of(context).textTheme.bodyMedium,
                    decoration: InputDecoration(
                      hintText: 'Breakfast, Burger, Taco, Cappuccino, Coffee',
                      hintStyle:
                          Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: AppColors.gray60,
                              ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: AppColors.black,
                      ),
                      filled: true,
                      fillColor: AppColors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  _Categories(),
                  SizedBox(height: 20),
                  Headings(
                    title: 'Deals',
                  ),
                  SizedBox(height: 15),
                  SizedBox(height: 20),
                  Headings(
                    title: 'Ready to Eat',
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Categories extends StatelessWidget {
  const _Categories();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Headings(
          title: 'Browse Categories',
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:
              (categories['categories'] ?? []).sublist(0, 4).map((category) {
            return Column(
              children: [
                ImageTile(
                  image: category['image'] as String? ?? '',
                ),
                const SizedBox(height: 5),
                Text(
                  category['name'] as String? ?? '',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.black,
                      ),
                ),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _CurrentLocation extends StatelessWidget {
  const _CurrentLocation();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            context.push('/${Routes.home}/${Routes.searchLocation}');
          },
          child: Container(
            height: 40,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: AppColors.black.withOpacity(0.7),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                    '3891 Ranchview Dr. Richardson, California 62639',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.black.withOpacity(0.7),
                        ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: AppColors.black.withOpacity(0.7),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
            color: AppColors.white,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.favorite_outline,
            color: AppColors.black.withOpacity(0.7),
          ),
        ),
      ],
    );
  }
}
