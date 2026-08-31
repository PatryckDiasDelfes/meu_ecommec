import 'package:flutter/material.dart';

import 'package:meu_1_ecommerc/core/theme/app_text_style.dart';
import 'package:meu_1_ecommerc/features/home/models/category_model.dart';

import 'package:skeletonizer/skeletonizer.dart';

class categoryCard extends StatelessWidget {
  const categoryCard({
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
              SizedBox(
                height: 90,
                width: 90,

                child: Image.network(category.imageUrl),
              ),

              Text(category.name, style: AppTextStyle.subTitle),
            ],
          ),
        ),
      ),
    );
  }
}
