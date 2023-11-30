import 'package:dio/dio.dart';

class HomeRepo {
  static final dio = Dio();

  static Future<Response> getHomeData() async {
    Response response = await dio.get('https://student.valuxapps.com/api/home');
    // print('resopnse from dio is$response');
    return response;
  }
}
