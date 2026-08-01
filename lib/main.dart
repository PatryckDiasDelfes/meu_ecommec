import 'package:flutter/material.dart';
import 'package:meu_ecommec/routes.dart';
import 'page/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      routes: AppRoutes.routes,

      title: 'Flutter Demo',
      initialRoute: LoginPage.route,
    );
  }
}