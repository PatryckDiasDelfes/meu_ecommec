import 'package:flutter/material.dart';
import 'package:meu_1_ecommerc/core/routes/routes.dart';
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
        ChangeNotifierProvider(
          create: (context) {
            return LoginController();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return SingUpController();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return HomeController();
          },
        ),
      ],
      builder: (context, child) {
        return MaterialApp(
          routes: AppRoutes.routes,

          initialRoute: LoginPage.route,
          title: 'Flutter Demo',
        );
      },
    );
  }
}
