import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:meu_1_ecommerc/features/home/controller/home_controller.dart';
import 'package:meu_1_ecommerc/features/home/models/product_model.dart';
import 'package:meu_1_ecommerc/features/home/widgets/product_card.dart';

class ProductCarousel extends StatelessWidget {
  final HomeController homeController;

  const ProductCarousel({super.key, required this.homeController});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      // =========================
      // Produtos
      // =========================
      itemCount: homeController.products.length,

      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        final Product product = homeController.products[itemIndex];

        return ProductCard(
          product: product,

          // Durante o carregamento, ativa o Skeletonizer
          isLoading: homeController.productsState == ProductsViewState.loading,
        );
      },

      // =========================
      // Configurações
      // =========================
      options: CarouselOptions(
        height: 300,
        viewportFraction: 0.6,
        autoPlay: true,
      ),
    );
  }
}
