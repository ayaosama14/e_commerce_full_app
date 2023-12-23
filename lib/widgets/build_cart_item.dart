import 'package:e_commerce_app/cubit/counter_cart/cubit_counter_cart.dart';
import 'package:e_commerce_app/shared/constant.dart';

import 'package:flutter/material.dart';

Widget buildCartItem(nameOfProduct, priceOfProduct, imageOfProduct, context) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.grey,
        width: 1.0,
      ),
    ),
    margin: const EdgeInsets.all(4),
    padding: const EdgeInsets.all(6),
    height: 143,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 80,
          width: 73,
          color: greyColor,
          child: Image.network(
            imageOfProduct,
          ),
        ),
        wSizedBox,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 50,
                  width: 158,
                  child: Text(
                    nameOfProduct,
                    style: thinTextStyle,
                    maxLines: 2,
                  ),
                ),
                wSizedBox,
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite,
                    size: 29,
                    color: Colors.redAccent,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete,
                    size: 29,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            hSizedBox,
            hSizedBox,
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$priceOfProduct',
                    style: boldTextStyle,
                    maxLines: 2,
                  ),
                  wSizedBox,
                  wSizedBox,
                  wSizedBox,
                  wSizedBox,
                  wSizedBox,
                  wSizedBox,
                  wSizedBox,
                  Container(
                    width: 117,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blueAccent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 36,
                          width: 38,
                          decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: greyColor,
                          ),
                          alignment: Alignment.topCenter,
                          child: IconButton(
                            onPressed: () {
                              CounterCartCubit.get(context).counterMinus(1);
                            },
                            iconSize: 26,
                            icon: const Icon(Icons.minimize_sharp),
                          ),
                        ),
                        SizedBox(
                          width: 38,
                          child: Text(
                            '${CounterCartCubit.get(context).counter}',
                            textAlign: TextAlign.center,
                            style: boldTextStyle,
                          ),
                        ),
                        Container(
                          height: 36,
                          width: 38,
                          decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: greyColor,
                          ),
                          alignment: Alignment.topCenter,
                          child: IconButton(
                            onPressed: () {
                              CounterCartCubit.get(context).counterPlus(1);
                            },
                            iconSize: 26,
                            icon: const Icon(Icons.add),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ],
    ),
  );
}
