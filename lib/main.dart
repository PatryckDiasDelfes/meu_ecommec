import 'package:flutter/material.dart';
import 'package:meu_1_ecommerc/core/routes/routes.dart';
import 'package:meu_1_ecommerc/features/cart/controller/cart_controller.dart';
import 'package:meu_1_ecommerc/features/home/controller/home_controller.dart';
import 'package:meu_1_ecommerc/features/login/controller/login_controller.dart';
import 'package:meu_1_ecommerc/features/singup/controller/singup_controller.dart';
import 'package:provider/provider.dart';

import 'features/login/page/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // =========================
        // LOGIN
        // =========================
        ChangeNotifierProvider(
          create: (context) {
            return LoginController();
          },
        ),

        // =========================
        // CADASTRO
        // =========================
        ChangeNotifierProvider(
          create: (context) {
            return SingUpController();
          },
        ),

        // =========================
        // HOME
        // =========================
        ChangeNotifierProvider(
          create: (context) {
            return HomeController();
          },
        ),

        // =========================
        // CARRINHO
        // =========================
        ChangeNotifierProvider(
          create: (context) {
            return CartController();
          },
        ),
      ],

      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          debugShowMaterialGrid: false,

          routes: AppRoutes.routes,

          initialRoute: LoginPage.route,

          title: 'Flutter Demo',
        );
      },
    );
  }
}
