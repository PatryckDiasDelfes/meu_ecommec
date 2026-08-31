import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:meu_1_ecommerc/features/home/controller/home_controller.dart';
import 'package:meu_1_ecommerc/features/home/models/category_model.dart';

import 'package:meu_1_ecommerc/features/home/page/category_page.dart';
import 'package:meu_1_ecommerc/features/home/widgets/category_card.dart';

class CategoryCarousel extends StatelessWidget {
  final HomeController homeController;

  const CategoryCarousel({super.key, required this.homeController});

  @override
  Widget build(BuildContext context) {
    // =========================
    // Loading
    // =========================
    if (homeController.categoriesState == CategoriesViewState.loading &&
        homeController.categories.isEmpty) {
      return CarouselSlider.builder(
        itemCount: 6,

        itemBuilder:
            (BuildContext context, int categoryIndex, int pageViewIndex) {
              // Categoria falsa apenas para o Skeletonizer
              final Category category = Category(
                name: 'Categoria',
                imageUrl: '',
              );

              return CategoryCard(category: category, isLoading: true);
            },

        options: CarouselOptions(
          height: 150,
          viewportFraction: 0.35,
          autoPlay: false,
        ),
      );
    }

    // =========================
    // Categorias reais
    // =========================
    return CarouselSlider.builder(
      itemCount: homeController.categories.length,

      itemBuilder:
          (BuildContext context, int categoryIndex, int pageViewIndex) {
            final Category category = homeController.categories[categoryIndex];

            return CategoryCard(
              category: category,

              // =========================
              // Navegação
              // =========================
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

      // =========================
      // Configurações
      // =========================
      options: CarouselOptions(
        height: 150,
        viewportFraction: 0.35,
        autoPlay: true,
      ),
    );
  }
}

// E atenção: como mudamos a classe de:

// ```dart
// categoryCarousel
// ```

// para:

// ```dart
// CategoryCarousel
// ```

// na `PgHome` você também precisa mudar:

// ```dart
// categoryCarousel(
//   homeController: homeController,
// )
// ```

// para:

// ```dart
// CategoryCarousel(
//   homeController: homeController,
// )
// ```

// Isso deixa a nomenclatura dos seus widgets consistente:

// ```text
// BannerWidget
// BannerCarousel
// CategoryCard
// CategoryCarousel
// ProductSection
// ProductCarousel
// ```

// Esse padrão está bem mais organizado para continuar componentizando o restante do projeto.
