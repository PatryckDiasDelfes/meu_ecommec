import 'package:flutter/material.dart';
import 'package:meu_1_ecommerc/core/theme/app_text_style.dart';
import 'package:meu_1_ecommerc/features/home/controller/home_controller.dart';
import 'package:meu_1_ecommerc/features/home/widgets/banner_carousel.dart';
import 'package:meu_1_ecommerc/features/home/widgets/category_carousel.dart';
import 'package:meu_1_ecommerc/features/home/widgets/product_section.dart';
import 'package:meu_1_ecommerc/features/login/controller/login_controller.dart';
import 'package:meu_1_ecommerc/shared/exeptions/section_title.dart';
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

        actions: [
          IconButton(
            onPressed: () {
              final homeController = context.read<HomeController>();

              homeController.getCategories();
              homeController.getProducts();
            },
            icon: const Icon(Icons.refresh),
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
                    SectionTitle(label: 'Categoria'),

                    CategoryCarousel(homeController: homeController),
                  ],
                ),

                // =========================
                // Protudo
                // =========================
                Container(
                  child: ProductSection(homeController: homeController),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
