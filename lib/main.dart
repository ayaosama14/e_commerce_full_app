import 'package:e_commerce_app/Login_featcher/data/shared_pre.dart';
import 'package:e_commerce_app/Login_featcher/domain/cubit/login_cubit.dart';
import 'package:e_commerce_app/cartFeatcher/domain/cubit/cartCubit.dart';
import 'package:e_commerce_app/cubit/change_password/change_password_cubit.dart';
import 'package:e_commerce_app/cubit/counter_cart/cubit_counter_cart.dart';

import 'package:e_commerce_app/NetworkService/dio_helper.dart';
import 'package:e_commerce_app/home_featcher/domain/cubit/banner/bannerCubit.dart';
import 'package:e_commerce_app/register_featcher/domain/cubit/register_cubit.dart';
import 'package:e_commerce_app/shoping_featcher/domain/cubit/catogery/catogeryCubit.dart';
import 'package:e_commerce_app/views/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  DioEcommerce.init();
  await SharedPref.initShared();
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
        create: (BuildContext context) => GetHomeCubitBanner(),
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
