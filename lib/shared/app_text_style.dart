import 'package:flutter/material.dart';
import 'package:meu_ecommec/shared/app_colors.dart';

class AppTextStyle{

  static const TextStyle title = TextStyle(
    color: AppColors.black,
    fontSize: 28,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
  );

  static const TextStyle subTitle = TextStyle(
    color: AppColors.black,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle buttonLabel = TextStyle(
    color: AppColors.white,
  );

  static const TextStyle smallBlack = TextStyle(
    color: AppColors.black,
  );

}