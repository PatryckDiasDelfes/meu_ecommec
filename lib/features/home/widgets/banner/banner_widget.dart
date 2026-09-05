import 'package:flutter/material.dart';

import 'package:meu_1_ecommerc/core/theme/app_colors.dart';
import 'package:meu_1_ecommerc/core/theme/app_text_style.dart';

class BannerWidget extends StatelessWidget {
  final String label;
  final String imagePath;

  const BannerWidget({super.key, required this.label, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      // =========================
      // Dimensões
      // =========================
      height: 136,
      width: 340,

      // =========================
      // Decoração
      // =========================
      decoration: BoxDecoration(
        color: AppColors.gray,
        borderRadius: BorderRadius.circular(8),
      ),

      // =========================
      // Conteúdo
      // =========================
      child: ClipRRect(
        borderRadius: BorderRadius.circular(7),
        child: Row(
          children: [
            // =========================
            // Texto
            // =========================
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(label, style: AppTextStyle.headingSmall),
                ),
              ),
            ),

            // =========================
            // Imagem
            // =========================
            Expanded(flex: 4, child: Image.asset(imagePath, fit: BoxFit.cover)),
          ],
        ),
      ),
    );
  }
}
