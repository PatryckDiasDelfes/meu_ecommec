import 'package:flutter/material.dart';

import 'package:skeletonizer/skeletonizer.dart';

import 'package:meu_1_ecommerc/core/theme/app_text_style.dart';
import 'package:meu_1_ecommerc/features/home/models/category_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
    this.isLoading = false,
    this.onTap,
  });

  final Category category;
  final bool isLoading;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,

      child: GestureDetector(
        onTap: onTap,

        child: Container(
          margin: const EdgeInsets.all(5),

          child: Column(
            children: [
              // =========================
              // Imagem
              // =========================
              SizedBox(
                height: 90,
                width: 90,
                child: Image.network(category.imageUrl),
              ),

              // =========================
              // Nome
              // =========================
              Text(category.name, style: AppTextStyle.subTitle),
            ],
          ),
        ),
      ),
    );
  }
}

//Uma observação: você está usando `Image.network()` diretamente. Depois podemos melhorar esse componente para tratar **loading, erro da imagem e `BoxFit`**, mas não mexeria nisso agora se o objetivo é apenas organizar o código.
