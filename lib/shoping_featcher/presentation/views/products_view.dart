import 'package:e_commerce_app/model/date_model.dart';
import 'package:e_commerce_app/shoping_featcher/domain/cubit/catogery/catogeryCubit.dart';
import 'package:e_commerce_app/shoping_featcher/domain/cubit/catogery/catogeryStates.dart';
import 'package:e_commerce_app/shoping_featcher/presentation/widgets/gridViewProducts.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsView extends StatefulWidget {
  final int index;
  const ProductsView({super.key, required this.index});

  @override
  State<ProductsView> createState() => _OneProductViewState();
}

class _OneProductViewState extends State<ProductsView> {
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
              appBar: AppBar(
                title: const Text('favourte product'),
              ),
              body: SingleChildScrollView(
                // scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GridViewOfAllProducts(
                        model: objModel,
                      ),
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
