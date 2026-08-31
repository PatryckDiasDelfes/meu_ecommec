import 'package:flutter/widgets.dart';
import 'package:meu_1_ecommerc/features/home/models/category_model.dart';

import 'package:meu_1_ecommerc/features/home/page/category_page.dart';
import 'package:meu_1_ecommerc/features/home/page/home_page.dart';
import 'package:meu_1_ecommerc/features/recover/forgot_page.dart';
import 'package:meu_1_ecommerc/features/login/page/login_page.dart';
import 'package:meu_1_ecommerc/features/singup/page/singup_page.dart';

class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    LoginPage.route: (context) => LoginPage(),

    SingupPage.route: (context) => SingupPage(),

    ForgotPage.route: (context) => ForgotPage(),

    PgHome.route: (context) => PgHome(),

    // A categoria será recebida pelos arguments
    CategoryPage.route: (context) {
      final category = ModalRoute.of(context)!.settings.arguments;

      return CategoryPage(category: category as Category);
    },
  };
}
