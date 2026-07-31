import 'package:flutter/material.dart';
import 'page/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ALTERADO: remove a faixa DEBUG
      debugShowCheckedModeBanner: false,

      // ALTERADO: define a LoginPage como tela inicial
      home: const LoginPage(),
    );
  }
}