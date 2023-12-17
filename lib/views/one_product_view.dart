import 'package:e_commerce_app/cubit/get_catogery/cubit_get_catogery.dart';
import 'package:e_commerce_app/cubit/get_catogery/cubit_get_catogery_state.dart';
import 'package:e_commerce_app/model/date_model.dart';

import 'package:e_commerce_app/widgets/build_product.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OneProductView extends StatefulWidget {
  final int index;
  const OneProductView({super.key, required this.index});

  @override
  State<OneProductView> createState() => _OneProductViewState();
}

class _OneProductViewState extends State<OneProductView> {
  @override
  void initState() {
    super.initState();
    GetCatogeryCubit.get(context).getCatogeryData(id: widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCatogeryCubit, GetCatogeryState>(
      builder: (context, state) {
        if (state is GetCatogerySussessState) {
          CatogeryDataModel objModel = state.model;
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(title: const Text('favourte product')),
              body: SingleChildScrollView(
                // scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildGridCatogory(context, objModel),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        if (state is LoadingCatogeryState) {
          return const Scaffold(
            body: SizedBox(
              height: 300,
              child: Center(
                child: CircularProgressIndicator(
                    value: 20.0, backgroundColor: Colors.blueAccent),
              ),
            ),
          );
        }
        if (state is GetCatogeryfailerState) {
          return const Scaffold(
            body: SizedBox(
              height: 300,
              child: Center(
                child: Text(
                  'Date is not here yet ...',
                  style: TextStyle(fontSize: 28),
                ),
              ),
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
