import 'package:e_commerce_app/Login_featcher/data/shared_pre.dart';
import 'package:e_commerce_app/Login_featcher/domain/cubit/login_cubit.dart';
import 'package:e_commerce_app/cubit/change_password/change_password_cubit.dart';
import 'package:e_commerce_app/cubit/counter_cart/cubit_counter_cart.dart';
import 'package:e_commerce_app/cubit/get_cart/cubit_post_data.dart';
import 'package:e_commerce_app/cubit/get_catogery/cubit_get_catogery.dart';
import 'package:e_commerce_app/cubit/get_home/get_home_cubit.dart';

import 'package:e_commerce_app/network/dio_helper.dart';
import 'package:e_commerce_app/register_featcher/domain/cubit/register_cubit.dart';
import 'package:e_commerce_app/views/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  DioEcommerce.init();
  SharedPref.initShared();
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
      ),
      BlocProvider(
        create: (BuildContext context) => CounterCartCubit(),
      ),
      BlocProvider(
        create: (BuildContext context) => CartCubit(),
      )
    ], child: const MyApp()),
  );
}
