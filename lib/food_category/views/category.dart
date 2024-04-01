import 'package:flutter/material.dart';
import 'package:yum_yard/fake_db/fake_db.dart';
import 'package:yum_yard/utils/utils.dart';
import 'package:yum_yard/widgets/widgets.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Wrapper(
        appBar: AppBar(
          title: Text(
            'Browse category',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          centerTitle: true,
          backgroundColor: AppColors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Wrap(
            alignment: WrapAlignment.spaceEvenly,
            spacing: 12,
            runSpacing: 20,
            children: (categories['categories'] ?? [])
                .map(
                  (category) => CategoryTile(category: category),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

