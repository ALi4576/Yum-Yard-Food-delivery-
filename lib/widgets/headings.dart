import 'package:flutter/material.dart';
import 'package:yum_yard/utils/utils.dart';

class Headings extends StatelessWidget {
  const Headings({
    super.key,
    required this.title,
    this.showAll = true,
    this.onTap,
  });

  final String title;
  final bool showAll;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.black,
              ),
        ),
        if (showAll)
          InkWell(
            onTap: () {
              onTap?.call();
            },
            child: Row(
              children: [
                Text(
                  'See All',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.primary,
                      ),
                ),
                const SizedBox(width: 5),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: AppColors.primary,
                ),
              ],
            ),
          ),
      ],
    );
  }
}
