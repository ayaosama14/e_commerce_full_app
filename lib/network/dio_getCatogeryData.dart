 
 import 'package:dio/dio.dart';
import 'package:e_commerce_app/model/date_model.dart';

 class DioEcommerce {
  static Dio? objectdio;
  static Response? response;
  //init dio
  static init() async {
    objectdio = Dio();
 }
 static Future getCatogeryData({int? id}) async {
    // await objectdio!.get('https://student.valuxapps.com/api/categories');
    response = await objectdio!
        .get('https://student.valuxapps.com/api/products?category_id=$id');

    return CatogeryDataModel.fromJson(response?.data);

    // return response;
  } }