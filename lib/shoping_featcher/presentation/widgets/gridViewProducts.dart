import 'package:e_commerce_app/model/date_model.dart';
import 'package:e_commerce_app/shoping_featcher/presentation/helperMethods/build_one_product.dart';

import 'package:flutter/material.dart';

//get product apis
// ignore: must_be_immutable
class GridViewOfAllProducts extends StatelessWidget {
  List<Datum>? listOfCatogeryData;
  Datum? oneDatumItem;
  CatogeryDataModel? model;
  GridViewOfAllProducts({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: MediaQuery.of(context).size.height,
      child: GridView.builder(
          // physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // number of items in each row
            mainAxisSpacing: 7, // spacing between rows
            crossAxisSpacing: 6,
            // spacing between columns
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 1.5),
          ),
          itemCount:
              listOfCatogeryData == null ? 12 : listOfCatogeryData!.length,
          itemBuilder: (BuildContext _, int index) {
            listOfCatogeryData = model?.data.data;

            return buildOneProductItem(listOfCatogeryData![index], context);
          }),
    );
  }
}
