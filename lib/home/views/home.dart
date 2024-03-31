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
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: 180,
                toolbarHeight: 0,
                pinned: true,
                backgroundColor: AppColors.primary100,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
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
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: AppColors.white,
                                  ),
                        ),
                        Text(
                          'Are you ready to place your order?',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(height: 15),
                        TextInput(
                          style: Theme.of(context).textTheme.bodyMedium,
                          decoration: InputDecoration(
                            hintText:
                                'Breakfast, Burger, Taco, Cappuccino, Coffee',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
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
                ),
              ),
            ];
          },
          body: const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  _Categories(),
                  SizedBox(height: 20),
                  _Deals(),
                  SizedBox(height: 20),
                  _FeaturedProducts(),
                ],
              ),
            ),
          ),
        
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: AppColors.white,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.ambient80,
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

class _FeaturedProducts extends StatelessWidget {
  const _FeaturedProducts();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Headings(
          title: 'Ready to Eat',
        ),
        const SizedBox(height: 15),
        Column(
          children: (featuredProducts).map(
            (product) {
              return product['featured'] == true
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ImageTile(
                            height: 80,
                            width: 100,
                            image: product['image'] as String? ?? '',
                          ),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product['name'] as String? ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: AppColors.black,
                                    ),
                              ),
                              Text(
                                product['category'] as String? ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: AppColors.gray80,
                                    ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  Text(
                                    (product['currency'] as Map)['symbol'] +
                                            product['price'] as String? ??
                                        '',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          color: AppColors.green,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          Container(
                            height: 30,
                            width: 50,
                            decoration: BoxDecoration(
                              color: AppColors.ambient20,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(Icons.star, color: AppColors.yellow),
                                Text(
                                  product['rating'].toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: AppColors.black,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container();
            },
          ).toList(),
        ),
      ],
    );
  }
}

class _Deals extends StatelessWidget {
  const _Deals();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Headings(
          title: 'Deals',
        ),
        const SizedBox(height: 15),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: (discountProducts).map((product) {
              return product['featured'] == true
                  ? Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              ImageTile(
                                image: product['image'] as String? ?? '',
                                height: 80,
                                width: 100,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                product['name'] as String? ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: AppColors.black,
                                    ),
                              ),
                              SizedBox(
                                width: 100,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      (product['currency'] as Map)['symbol'] +
                                              product['price'] as String? ??
                                          '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            color: AppColors.ambient,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                    ),
                                    Text(
                                      (product['currency'] as Map)['symbol'] +
                                          (product['discount'] as Map)['value']
                                              .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            color: AppColors.primary,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                (product['discount'] as Map)['title']
                                        as String? ??
                                    '',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: AppColors.white,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container();
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class _Categories extends StatelessWidget {
  const _Categories();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Headings(
          title: 'Browse Categories',
        ),
        const SizedBox(height: 15),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children:
                (categories['categories'] ?? []).sublist(0, 4).map((category) {
              return category['featured'] == true
                  ? Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Column(
                        children: [
                          ImageTile(
                            image: category['image'] as String? ?? '',
                          ),
                          const SizedBox(height: 5),
                          Text(
                            category['name'] as String? ?? '',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: AppColors.black,
                                    ),
                          ),
                        ],
                      ),
                    )
                  : Container();
            }).toList(),
          ),
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
