import 'package:e_commerce_app/cubit/get_catogery/cubit_get_catogery_state.dart';
import 'package:e_commerce_app/model/date_model.dart';

import 'package:e_commerce_app/network/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetCatogeryCubit extends Cubit<GetCatogeryState> {
  GetCatogeryCubit() : super(InitStateA());

  static GetCatogeryCubit get(context) => BlocProvider.of(context);
  static CatogeryDataModel? objectOfModel;

  Future getCatogeryData({required int id}) async {
    await DioEcommerce.getCatogeryData(id: id).then((value) {
      emit(GetCatogerySussessState());

      objectOfModel = CatogeryDataModel.fromJson(value!);
      // print('model status is : $value');
      // print('cubit model data is : ${objectOfModel!.data.data}');
    }).catchError((e) {
      emit(GetCatogeryfailerState());
      // print('getCatogery error :${e.toString()}');
    });
  }

  static Future<String> returnObjectOfModel() async {
    if (objectOfModel != null) {
      // print("returning the model");
      return objectOfModel!.message.toString();
    } else {
      return '';
    }
  }
}
