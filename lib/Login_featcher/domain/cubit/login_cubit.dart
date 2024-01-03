import 'package:dio/dio.dart';
import 'package:e_commerce_app/Login_featcher/data/shared_pre.dart';
import 'package:e_commerce_app/Login_featcher/domain/cubit/login_states.dart';
import 'package:e_commerce_app/NetworkService/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitStateL());
  static LoginCubit get(context) => BlocProvider.of(context);

  Response? responseloginValue;

  postLoginData(String email, String password) {
    DioEcommerce.postLoginData(email, password).then((value) {
      // print(value);
      responseloginValue = value;

      print('response login Value is ');
      print(responseloginValue);
      emit(PostLoginDataSucessState());
      var token = responseloginValue!.data['data']['token'];
      SharedPref.setToken(token);
      print(token);
    }).catchError((error) {
      // print('error from postLoginData is: $error');
      emit(PostLoginDataFailerState());
    });
  }
}
