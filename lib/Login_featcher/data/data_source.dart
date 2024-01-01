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
}
