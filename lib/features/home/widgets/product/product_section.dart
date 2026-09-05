import 'package:flutter/material.dart';

import 'package:meu_1_ecommerc/features/home/controller/home_controller.dart';
import 'package:meu_1_ecommerc/features/home/models/product_model.dart';
import 'package:meu_1_ecommerc/features/home/widgets/product/product_carousel.dart';

import 'package:meu_1_ecommerc/shared/exeptions/section_title.dart';

class ProductSection extends StatelessWidget {
  const ProductSection({
    super.key,
    required this.homeController,
    this.onProductTap,
  });
  final HomeController homeController;
  final void Function(Product product)? onProductTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      // =========================
      // Conteúdo
      // =========================
      children: [
        // =========================
        // Loading
        // =========================
        if (homeController.productsState == ProductsViewState.loading)
          ProductCarousel(
            homeController: homeController,
            onProductTap: onProductTap,
          ),

        // =========================
        // Error
        // =========================
        if (homeController.productsState == ProductsViewState.error)
          const Text('Foda, deu B.O ai'),

        // =========================
        // Success
        // =========================
        if (homeController.productsState == ProductsViewState.success)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitle(label: 'Produtos'),

              const SizedBox(height: 20),

              ProductCarousel(
                homeController: homeController,
                onProductTap: onProductTap,
              ),
            ],
          ),
      ],
    );
  }
}
