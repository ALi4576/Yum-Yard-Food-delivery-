import 'package:flutter/material.dart';
import 'package:yum_yard/utils/utils.dart';
import 'package:yum_yard/widgets/widgets.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    super.key,
    required this.category,
  });

  final Map<String, dynamic> category;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ImageTile(
          image: category['image'] as String? ?? '',
          height: 70,
          width: 90,
        ),
        const SizedBox(height: 5),
        Text(
          category['name'] as String? ?? '',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.black,
              ),
        ),
      ],
    );
  }
}
