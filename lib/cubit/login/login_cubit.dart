import 'package:dio/dio.dart';
import 'package:e_commerce_app/cubit/login/login_states.dart';
import 'package:e_commerce_app/network/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit():super(InitStateL());
  static LoginCubit get(context) => BlocProvider.of(context);

  Response? responseloginValue;

  postLoginData(String email, String password) {
    DioEcommerce.postLoginData(email, password).then((value) {
      // print(value);
      responseloginValue = value;
      emit(PostLoginDataSucessState());
    }).catchError((error) {
      // print('error from postLoginData is: $error');
      emit(PostLoginDataFailerState());
    });
  }
}
