import 'package:e_commerce_app/cubit/get_catogery/cubit_get_catogery.dart';
import 'package:e_commerce_app/cubit/get_catogery/cubit_get_catogery_state.dart';

import 'package:e_commerce_app/widgets/build_product.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OneProductView extends StatelessWidget {
  const OneProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCatogeryCubit, GetCatogeryState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(title: const Text('favourte product')),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (State is LoadingCatogeryState)
                      const SizedBox(
                        height: 300,
                        child: Center(
                          child: CircularProgressIndicator(
                              value: 20.0, backgroundColor: Colors.blueAccent),
                        ),
                      ),
                    buildGridCatogory(context),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
