import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:meu_1_ecommerc/features/home/controller/home_controller.dart';
import 'package:meu_1_ecommerc/features/home/models/category_model.dart';

import 'package:meu_1_ecommerc/features/home/page/category_page.dart';
import 'package:meu_1_ecommerc/features/home/widgets/category_card.dart';

class categoryCarousel extends StatelessWidget {
  final HomeController homeController;

  const categoryCarousel({super.key, required this.homeController});

  @override
  Widget build(BuildContext context) {
    // =========================================================
    // LOADING
    // =========================================================

    if (homeController.categoriesState == CategoriesViewState.loading &&
        homeController.categories.isEmpty) {
      return CarouselSlider.builder(
        itemCount: 6,

        itemBuilder:
            (BuildContext context, int categorieIndex, int pageViewIndex) {
              // Categoria falsa apenas para o Skeletonizer
              final Category category = Category(
                name: 'Categoria',
                imageUrl: '',
              );

              return categoryCard(category: category, isLoading: true);
            },

        options: CarouselOptions(
          height: 150,
          viewportFraction: 0.35,
          autoPlay: false,
        ),
      );
    }

    // =========================================================
    // CATEGORIAS REAIS
    // =========================================================

    return CarouselSlider.builder(
      itemCount: homeController.categories.length,

      itemBuilder:
          (BuildContext context, int categorieIndex, int pageViewIndex) {
            final Category category = homeController.categories[categorieIndex];

            return categoryCard(
              category: category,

              onTap: () {
                print('Cliquei em ${category.name}');

                Navigator.pushNamed(
                  context,
                  CategoryPage.route,
                  arguments: category,
                );
              },

              // Durante o reload, ativa o Skeletonizer
              isLoading:
                  homeController.categoriesState == CategoriesViewState.loading,
            );
          },

      options: CarouselOptions(
        height: 150,
        viewportFraction: 0.35,
        autoPlay: true,
      ),
    );
  }
}
