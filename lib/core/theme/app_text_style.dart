import 'package:flutter/material.dart';
import 'package:meu_1_ecommerc/core/theme/app_colors.dart';

class AppTextStyle {
  static const TextStyle headingLarge = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle headingMedium = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle headingSmall = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle subTitle = TextStyle(
    color: AppColors.black,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle price = TextStyle(
    color: AppColors.black,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle buttonLabel = TextStyle(color: AppColors.white);

  static const TextStyle smallBlack = TextStyle(color: AppColors.black);
  static const TextStyle smallBlack1 = TextStyle(color: AppColors.gray100);
}
