import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yum_yard/utils/utils.dart';
import 'package:yum_yard/widgets/widgets.dart';

class ChooseFromMap extends StatelessWidget {
  const ChooseFromMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Stack(
        children: [
          Positioned(
            left: 20,
            child: InkWell(
              child: Container(
                padding: const EdgeInsets.fromLTRB(6, 10, 10, 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
              ),
              onTap: () {
                context.pop();
              },
            ),
          ),
          Center(
            child: InkWell(
              onTap: () {},
              child: const Icon(
                Icons.location_on,
                size: 40,
                color: Colors.red,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListTile(
                  tileColor: AppColors.white,
                  leading: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary100,
                    ),
                    child: const Icon(
                      Icons.location_on,
                      color: AppColors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 20,
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      'Location',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  subtitle: Text(
                    'Address',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.gray60,
                        ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ActionButton(
                onPressed: () {},
                child: Text(
                  'Confirm location',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
