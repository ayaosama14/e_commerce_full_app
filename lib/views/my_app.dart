import 'package:e_commerce_app/Login_featcher/presentation/view/login_view.dart';
import 'package:e_commerce_app/scr/config/routes/routes.dart';
import 'package:e_commerce_app/scr/config/themes/app_theme.dart';
import 'package:e_commerce_app/scr/core/utilits/app_strings.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.projectName,
      theme: apptheme(),
      routes: Routes.routes,
      home: const LoginView(),
    );
  }
}
