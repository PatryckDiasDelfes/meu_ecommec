import 'package:flutter/widgets.dart';
import 'package:meu_1_ecommerc/page/login_page.dart';
import 'package:meu_1_ecommerc/page/singup_page.dart';

class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    LoginPage.route: (context) => LoginPage(),
      SingupPage.route: (context) => SingupPage(),

  };

}