import 'package:flutter/material.dart';
import 'package:meu_1_ecommerc/core/theme/app_text_style.dart';
import 'package:meu_1_ecommerc/features/home/controller/home_controller.dart';
import 'package:meu_1_ecommerc/features/login/controller/login_controller.dart';
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

    context.read<HomeController>().getCategories();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Consumer<LoginController>(
          builder: (context, loginController, child) {
            return Text(
              'Olá ${loginController.user!.nome}',
              style: AppTextStyle.title,
            );
          },
        ),
      ),

      body: Consumer<HomeController>(
        builder: (context, homeController, child) {
          return Column(
            children: [
              SizedBox(
                height: 108,
                child: switch (homeController.categoriesState) {
                  CategoriesViewState.loading => CircularProgressIndicator(),
                  CategoriesViewState.error => Text(
                    'Problema ao resgatar categoria',
                  ),
                  CategoriesViewState.success => Container(
                    color: Colors.red,
                    width: 100,
                    height: 100,
                  ),
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
