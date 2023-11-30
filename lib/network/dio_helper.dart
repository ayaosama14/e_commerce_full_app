import 'package:dio/dio.dart';

class DioEcommerce {
  static Dio? objectdio;
  static Response? response;
  //init dio
  static init() async {
    objectdio = Dio();
  }

  //post login
  static Future<Response?> postLoginData(String email, String password) async {
    response = (await objectdio!.post('https://student.valuxapps.com/api/login',
        data: {"email": email, "password": password}));
    // print('response is $response');
    return response;
  }

  //post login
  static Future<Response?> postRegisterData(
      String name, String phone, String email, String password) async {
    response = (await objectdio!
        .post('https://student.valuxapps.com/api/register', data: {
      "name": name,
      "phone": phone,
      "email": email,
      "password": password
    }));
    // print('response is $response');
    return response; 
  }

  static Future getCatogeryData({int? id}) async {
    response = await objectdio!
        .get('https://student.valuxapps.com/api/products?category_id=$id');

    return response!.data;

    // return response;
  }
}
