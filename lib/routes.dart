import 'package:flutter/widgets.dart';
import 'package:meu_1_ecommerc/features/page/forgot_page.dart';
import 'package:meu_1_ecommerc/features/page/login_page.dart';
import 'package:meu_1_ecommerc/features/page/pg_tast.dart';
import 'package:meu_1_ecommerc/features/page/singup_page.dart';

class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    LoginPage.route: (context) => LoginPage(),
    SingupPage.route: (context) => SingupPage(),
    Testpagina.route: (context) => Testpagina(),
    ForgotPage.route: (context) => ForgotPage(),
  };
}
