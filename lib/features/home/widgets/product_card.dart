import 'package:flutter/material.dart';

import 'package:meu_1_ecommerc/core/theme/app_text_style.dart';
import 'package:meu_1_ecommerc/features/home/models/product_model.dart';

import 'package:skeletonizer/skeletonizer.dart';

class productCard extends StatelessWidget {
  const productCard({super.key, required this.product, this.isLoading = false});

  final Product product;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ========================================
          // ÁREA DA IMAGEM
          // ========================================
          Container(
            height: 200,
            width: double.infinity,

            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),

            // ClipRRect faz a imagem respeitar
            // o formato do Container
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),

              child: Image.network(
                product.imageUrl,

                // Mantém a imagem inteira
                // sem cortar
                fit: BoxFit.contain,

                // Fundo branco para deixar
                // o espaço da imagem uniforme
                errorBuilder: (context, error, stackTrace) {
                  return const Center(child: Icon(Icons.image_not_supported));
                },
              ),
            ),
          ),

          const SizedBox(height: 8),

          // ========================================
          // MARCA
          // ========================================
          Text(product.brand, style: AppTextStyle.smallBlack1),

          // ========================================
          // NOME
          // ========================================
          Text(product.name, style: AppTextStyle.subTitle),

          // ========================================
          // PREÇO
          // ========================================
          Text(
            'R\$${product.price.toStringAsFixed(2)}',
            style: AppTextStyle.price,
          ),
        ],
      ),
    );
  }
}
