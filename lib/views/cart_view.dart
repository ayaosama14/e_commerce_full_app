import 'package:e_commerce_app/cubit/counter_cart/cubit_counter_cart.dart';
import 'package:e_commerce_app/cubit/counter_cart/states_counter_cart.dart';
import 'package:e_commerce_app/cubit/get_cart/cubit_post_data.dart';
import 'package:e_commerce_app/cubit/get_cart/state_get_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class CartView extends StatefulWidget {
  int productId;
  CartView({super.key, required this.productId});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  void initState() {
    CartCubit.get(context).postDataToCart(widget.productId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartStates>(
      builder: (context, state) {
        return BlocBuilder<CounterCartCubit, CounterCartStates>(
          builder: (context, state) {
            return SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  title: const Text(' your cart '),
                  backgroundColor: const Color.fromARGB(255, 231, 228, 228),
                ),
                // body: Padding(
                //     padding: const EdgeInsets.all(8),
                //     child: ListView.separated(
                //         itemBuilder: (BuildContext context, int index) {
                //           return buildCartItem(
                //             CartCubit.get(context).cartModel.data.cartItems
                //               context);
                //         },
                //         separatorBuilder: (BuildContext context, int index) {
                //           return const SizedBox(
                //             height: 10,
                //           );
                //         },
                //         itemCount: CartView.listOfCartProducts.length)),
              ),
            );
          },
        );
      },
    );
  }
}
