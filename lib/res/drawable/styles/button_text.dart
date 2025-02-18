import 'package:flutter/material.dart';
import '../colors/app_colors.dart';
import '../values/dimensions.dart';

final active = ButtonStyle(
  elevation: const WidgetStatePropertyAll(Dimensions.padding_10),
  backgroundColor: WidgetStatePropertyAll(AppColors.appColor),
  shape: WidgetStatePropertyAll(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(Dimensions.radius_12),
    ),
  ),
);
