import 'package:flutter/material.dart';
import 'package:yum_yard/utils/utils.dart';

class ImageTile extends StatelessWidget {
  const ImageTile({
    super.key,
    required this.image,
    this.height = 60,
    this.width = 80,
  });

  final String image;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        image,
        height: height,
        width: width,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.primary,
              ),
            ),
            child: const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) => Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppColors.primary,
            ),
          ),
          child: const Center(
            child: Icon(
              Icons.error_outline,
              color: AppColors.primary,
            ),
          ),
        ),
      ),
    );
  }
}
