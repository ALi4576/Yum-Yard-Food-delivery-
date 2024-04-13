import 'package:flutter/material.dart';
import 'package:yum_yard/utils/utils.dart';

class StatusCard extends StatelessWidget {
  const StatusCard({
    super.key,
    required this.status,
  });

  final String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: status == 'Delivered'
            ? AppColors.green
            : status == 'PickedUp'
                ? AppColors.blue
                : AppColors.red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        status,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
