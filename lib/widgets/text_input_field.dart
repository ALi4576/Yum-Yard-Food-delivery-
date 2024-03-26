import 'package:flutter/material.dart';
import 'package:yum_yard/utils/utils.dart';

class TextInput extends TextField {
  TextInput({
    super.key,
    super.style,
    super.onChanged,
    TextStyle? hintStyle,
    String? hintText,
    TextInputType super.keyboardType = TextInputType.text,
    InputDecoration? decoration,
    Widget? suffixIcon,
  }) : super(
          cursorColor: AppColors.secondary80,
          cursorHeight: 20,
          decoration: decoration ?? InputDecoration(
            suffixIcon: suffixIcon,
            hintStyle: hintStyle,
            hintText: hintText,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.gray,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.secondary80,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.gray,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.gray80,
              ),
            ),
          ),
        );
}
