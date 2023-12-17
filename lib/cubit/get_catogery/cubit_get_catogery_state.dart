import 'package:e_commerce_app/model/date_model.dart';

abstract class GetCatogeryState {}

class InitStateA extends GetCatogeryState {}

class LoadingCatogeryState extends GetCatogeryState {}

class GetCatogerySussessState extends GetCatogeryState {
  final CatogeryDataModel model;
  GetCatogerySussessState(this.model);
}

class GetCatogeryfailerState extends GetCatogeryState {}
