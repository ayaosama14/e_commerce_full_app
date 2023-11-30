import 'package:e_commerce_app/cubit/change_password/chane_pass_states.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordCubit extends Cubit<States> {
  ChangePasswordCubit() : super(InitState());
  static ChangePasswordCubit get(context) => BlocProvider.of(context);
  bool isSecure = true;

  changeSecurePassword({required bool isSecure}) {
    isSecure = !isSecure;
    emit(ChangeSecurePasswordState());
  }
}
