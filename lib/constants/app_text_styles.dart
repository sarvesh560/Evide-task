import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const title = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  static const subtitle = TextStyle(
    fontSize: 16,
    color: AppColors.grey,
  );

  static const appBarTitle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static const chipText = TextStyle(
    fontSize: 14,
    color: AppColors.primary,
    fontWeight: FontWeight.w600,
  );

  static const heroTitle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
    shadows: [Shadow(blurRadius: 8, color: Colors.black54)],
  );
}
