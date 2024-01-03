import 'package:e_commerce_app/Login_featcher/presentation/view/login_view.dart';
import 'package:e_commerce_app/home_featcher/presentation/views/home_view.dart';
import 'package:e_commerce_app/register_featcher/presentation/view/registerView.dart';


import 'package:flutter/widgets.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    'initRoute': (BuildContext context) => const RegisterView(),
    'secondRoute': (BuildContext context) => const LoginView(),
    'thirdRoute': (BuildContext context) => HomeView(
          productId: 40,
        ),
  };
}
