import 'package:flutter/material.dart';
import 'package:meu_1_ecommerc/core/theme/app_text_style.dart';
import 'package:meu_1_ecommerc/features/cart/page/cart_page.dart';
import 'package:meu_1_ecommerc/features/home/controller/home_controller.dart';
import 'package:meu_1_ecommerc/features/home/models/product_model.dart';
import 'package:meu_1_ecommerc/features/home/page/category_page.dart';
import 'package:meu_1_ecommerc/features/home/widgets/banner/banner_carousel.dart';
import 'package:meu_1_ecommerc/features/home/widgets/category/category_carousel.dart';
import 'package:meu_1_ecommerc/features/home/widgets/product/product_section.dart';
import 'package:meu_1_ecommerc/features/login/controller/login_controller.dart';
import 'package:meu_1_ecommerc/shared/widget/app_modal.dart';
import 'package:provider/provider.dart';

class PgHome extends StatefulWidget {
  const PgHome({super.key});

  static String route = '/home';

  @override
  State<PgHome> createState() => _PgHomeState();
}

class _PgHomeState extends State<PgHome> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeController>().getCategories();
      context.read<HomeController>().getProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // =========================
      // APP BAR
      // =========================
      appBar: AppBar(
        title: Consumer<LoginController>(
          builder: (context, loginController, child) {
            return Row(
              children: [
                Text(
                  'Olá, ${loginController.user!.nome}.',
                  style: AppTextStyle.headingLarge,
                ),
              ],
            );
          },
        ),

        // =========================
        // Carrinho
        // =========================
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, CartPage.route);
            },
            icon: const Icon(Icons.add_shopping_cart_outlined),
          ),
        ],
      ),

      // =========================
      // BODY
      // =========================
      body: Consumer<HomeController>(
        builder: (context, homeController, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                // =========================
                // Banner
                // =========================
                BannerCarousel(),

                SizedBox(height: 10),

                // =========================
                // Categoria
                // =========================
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Categoria'),
                        IconButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              CategoryPage.route,
                              arguments: null,
                            );
                          },
                          icon: const Icon(Icons.filter_list),
                        ),
                      ],
                    ),

                    CategoryCarousel(homeController: homeController),
                  ],
                ),

                // =========================
                // Protudo
                // =========================
                ProductSection(
                  homeController: homeController,

                  onProductTap: (Product product) {
                    print('PRODUTO CLICADO: ${product.name}');
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,

                      builder: (context) {
                        return AppModal(
                          brand: product.brand,
                          name: product.name,
                          imageUrl: product.imageUrl,
                          description: product.description,
                          price: product.price,
                          category: product.category,
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
