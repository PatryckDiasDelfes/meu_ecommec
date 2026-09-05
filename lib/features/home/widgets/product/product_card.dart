import 'package:flutter/material.dart';

import 'package:skeletonizer/skeletonizer.dart';

import 'package:meu_1_ecommerc/core/theme/app_text_style.dart';
import 'package:meu_1_ecommerc/features/home/models/product_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    this.isLoading = false,
    this.onTap,
  });

  final Product product;
  final bool isLoading;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,

      child: GestureDetector(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // =========================
            // Área da imagem
            // =========================
            Container(
              height: 200,
              width: double.infinity,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),

              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),

                child: Image.network(
                  product.imageUrl,

                  // Mantém a imagem inteira sem cortar
                  fit: BoxFit.contain,

                  // Exibe um ícone caso a imagem falhe
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(child: Icon(Icons.image_not_supported));
                  },
                ),
              ),
            ),

            const SizedBox(height: 8),

            // =========================
            // Marca
            // =========================
            Text(product.brand, style: AppTextStyle.smallBlack1),

            // =========================
            // Nome
            // =========================
            Text(product.name, style: AppTextStyle.subTitle),

            // =========================
            // Preço
            // =========================
            Text(
              'R\$${product.price.toStringAsFixed(2)}',
              style: AppTextStyle.price,
            ),
          ],
        ),
      ),
    );
  }
}
