import 'package:dio/dio.dart';
import 'package:e_commerce_app/model/cart_data_model.dart';
import 'package:e_commerce_app/model/date_model.dart';

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
    // await objectdio!.get('https://student.valuxapps.com/api/categories');
    response = await objectdio!
        .get('https://student.valuxapps.com/api/products?category_id=$id');

    return CatogeryDataModel.fromJson(response?.data);

    // return response;
  }

  static Future<CartModel> postDataToCart(int productId) async {
    var token =
        'hNmhyE8y1bxeLleWTiJK7sBxEE7FszONugbCuqu3mojGUiIBZEIvnpMjmuO1mtirlSQfyo';
    response = await objectdio!.post(
      'https://student.valuxapps.com/api/carts',
      data: {
        "product_id": productId,
      },
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
          
        },
      ),
    );
    print('postDataToCart is : $response');
    CartModel.fromJson(response!.data["data"]);
    return CartModel.fromJson(response!.data["data"]);
  }
}
