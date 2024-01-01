import 'package:e_commerce_app/cubit/counter_cart/cubit_counter_cart.dart';
import 'package:e_commerce_app/cubit/counter_cart/states_counter_cart.dart';
import 'package:e_commerce_app/model/date_model.dart';
import 'package:e_commerce_app/widgets/build_cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class CartView extends StatefulWidget {
  // String nameOfProduct;
  // double priceOfProduct;
  // String imageOfProduct;
  const CartView({
    super.key,
  });
  static List listOfCartProducts = [];
  static addProduct(Datum product) {
    listOfCartProducts.add(product);
    print('list of cart product is$listOfCartProducts');
  }

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCartCubit, CounterCartStates>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Text(' your cart '),
              backgroundColor: const Color.fromARGB(255, 231, 228, 228),
            ),
            body: Padding(
                padding: const EdgeInsets.all(8),
                child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      return buildCartItem(
                          CartView.listOfCartProducts[index].name,
                          CartView.listOfCartProducts[index].price,
                          CartView.listOfCartProducts[index].image,
                          context);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: CartView.listOfCartProducts.length)),
          ),
        );
      },
    );
  }
}
