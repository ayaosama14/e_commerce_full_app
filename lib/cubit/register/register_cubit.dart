import 'package:dio/dio.dart';
import 'package:e_commerce_app/cubit/register/register_state.dart';
import 'package:e_commerce_app/network/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(InitStateR());

  static RegisterCubit get(context) => BlocProvider.of(context);
  Response? responseRegisterValue;
  postRegisterData(String name, String phone, String email, String password) {
    DioEcommerce.postRegisterData(name, phone, email, password).then((value) {
      // print(value);
      responseRegisterValue = value;
      emit(PostRegisterSucessState());
    }).catchError((error) {
      // print('error from postLoginData is: $error');
      emit(PostRegisterFailerState());
    });
  }
}
