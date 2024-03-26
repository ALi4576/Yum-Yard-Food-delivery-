import 'package:flutter/material.dart';
import 'package:yum_yard/utils/utils.dart';

class ActionButton extends ElevatedButton {
  ActionButton({
    super.key,
    required super.onPressed,
    super.child,
    ButtonStyle? style,
  }) : super(
          style: style ??
              ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary100,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                minimumSize: const Size(double.infinity, 0),
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
              ),
        );
}
