import 'package:e_commerce_app/cubit/counter_cart/cubit_counter_cart.dart';
import 'package:e_commerce_app/cubit/counter_cart/states_counter_cart.dart';

import 'package:e_commerce_app/widgets/build_cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class CartView extends StatefulWidget {
  String nameOfProduct;
  double priceOfProduct;
  String imageOfProduct;
  CartView(
      {super.key,
      required this.nameOfProduct,
      required this.priceOfProduct,
      required this.imageOfProduct});

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
              child: Column(
                children: [
                  buildCartItem(widget.nameOfProduct, widget.priceOfProduct,
                      widget.imageOfProduct, context),
                  const Divider(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
