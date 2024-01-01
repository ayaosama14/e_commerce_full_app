// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
  final Data data;

  CartModel({
    required this.data,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  final List<dynamic> cartItems;
  final int subTotal;
  final int total;

  Data({
    required this.cartItems,
    required this.subTotal,
    required this.total,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        cartItems: List<dynamic>.from(json["cart_items"].map((x) => x)),
        subTotal: json["sub_total"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "cart_items": List<dynamic>.from(cartItems.map((x) => x)),
        "sub_total": subTotal,
        "total": total,
      };
}
