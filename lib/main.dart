import 'package:e_commerce_app/cubit/change_password/change_password_cubit.dart';
import 'package:e_commerce_app/cubit/get_catogery/cubit_get_catogery.dart';
import 'package:e_commerce_app/cubit/get_home/get_home_cubit.dart';
import 'package:e_commerce_app/cubit/login/login_cubit.dart';
import 'package:e_commerce_app/cubit/register/register_cubit.dart';

import 'package:e_commerce_app/network/dio_helper.dart';
import 'package:e_commerce_app/views/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  DioEcommerce.init();
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(
        create: (BuildContext context) => ChangePasswordCubit(),
      ),
      BlocProvider(
        create: (BuildContext context) => GetCatogeryCubit(),
      ),
      BlocProvider(
        create: (BuildContext context) => LoginCubit(),
      ),
      BlocProvider(
        create: (BuildContext context) => RegisterCubit(),
      ),
      BlocProvider(
        create: (BuildContext context) => GetHomeCubit(),
      )
    ], child: const MyApp()),
  );
}
