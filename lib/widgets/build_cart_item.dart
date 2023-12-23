import 'package:e_commerce_app/shared/constant.dart';


import 'package:flutter/material.dart';

Widget buildCartItem(nameOfProduct, priceOfProduct, imageOfProduct) {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    '$priceOfProduct',
                    style: boldTextStyle,
                    maxLines: 2,
                  ),
                ),
                // wSizedBox,
                // wSizedBox,
                // wSizedBox,
                // wSizedBox,
                // wSizedBox,
                // wSizedBox,
                // wSizedBox,
                Container(
                  width: 114,
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
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: greyColor,
                        ),
                        alignment: Alignment.topCenter,
                        child: IconButton(
                          onPressed: () {},
                          iconSize: 26,
                          icon: const Icon(Icons.minimize_sharp),
                        ),
                      ),
                      wsSizedBox,
                      SizedBox(
                        width: 24,
                        child: Text(
                          '2',
                          textAlign: TextAlign.center,
                          style: boldTextStyle,
                        ),
                      ),
                      wsSizedBox,
                      Container(
                        height: 36,
                        width: 38,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: greyColor,
                        ),
                        alignment: Alignment.topCenter,
                        child: IconButton(
                          onPressed: () {},
                          iconSize: 26,
                          icon: const Icon(Icons.add),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        )
      ],
    ),
  );
}
