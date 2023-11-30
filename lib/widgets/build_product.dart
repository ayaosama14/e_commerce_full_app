import 'package:e_commerce_app/cubit/get_catogery/cubit_get_catogery.dart';
import 'package:e_commerce_app/cubit/get_catogery/cubit_get_catogery_state.dart';
import 'package:e_commerce_app/model/date_model.dart';
import 'package:e_commerce_app/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//get product apis

List<Datum>? listOfCatogeryData;
Datum? oneDatumItem;

buildGridCatogory() {
  return SizedBox(
    height: 290,
    child: BlocBuilder<GetCatogeryCubit, GetCatogeryState>(
      builder: (context, state) {
        return FutureBuilder(
          future: GetCatogeryCubit.get(context).getCatogeryData(id: 40),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snap) {
            return ListView.separated(
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  listOfCatogeryData =
                      GetCatogeryCubit.objectOfModel!.data.data;

                  return listOfCatogeryData == null
                      ? const Center(
                          child: CircularProgressIndicator(
                              value: 20.0, backgroundColor: Colors.blueAccent),
                        )
                      : buildOneProductItem(listOfCatogeryData![index]);
                },
                separatorBuilder: (BuildContext context, int item) => wSizedBox,
                itemCount: listOfCatogeryData == null
                    ? 0
                    : listOfCatogeryData!.length);
          },
        );
      },
    ),
  );
}

buildOneProductItem(Datum? oneDatumItem) {
  return Container(
    height: 280,
    width: 160,
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 229, 222, 222),
      borderRadius: BorderRadius.circular(12.0),
    ),
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 140,
              width: 140,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(oneDatumItem!.image),
                ),
              ),
            ),
            Expanded(
              child: Text(oneDatumItem.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: thinTextStyle,
                  textHeightBehavior: const TextHeightBehavior(
                    applyHeightToFirstAscent: true,
                  ),
                  textDirection: TextDirection.rtl),
            ),
            hsSizedBox,
            Text(
              '${oneDatumItem.price}',
              style: thinColorTextStyle,
              textAlign: TextAlign.start,
            ),
            hsSizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '${oneDatumItem.oldPrice}',
                  style: thinTextStyle,
                ),
                wsSizedBox,
                Text(
                  '${oneDatumItem.discount}',
                  style: thinRedColorTextStyle,
                ),
              ],
            )
          ]),
    ),
  );
}





  //  return SizedBox(
  //   // height: 500,
  //   width = double.infinity,
  //   child = GridView.builder(
  //       itemCount: 2,
  //       padding: const EdgeInsets.all(6),
  //       shrinkWrap: false,
  //       scrollDirection: Axis.vertical,
  //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //         crossAxisCount: 2,
  //         childAspectRatio: 0.5,
  //       ),
  //       itemBuilder: (BuildContext context, int index) {
  //         listOfCatogeryData = GetCatogeryCubit.objectOfModel!.data.data;

  //         return buildOneProductItem(listOfCatogeryData![index]);
  //       }),
  // );